<?php

class ModelCatalogProduct extends Model {

    public function updateViewed($product_id) {
        $this->db->query("UPDATE " . DB_PREFIX . "product SET viewed = (viewed + 1) WHERE product_id = '" . (int) $product_id . "'");
    }

    public function getProduct($product_id) {

        $query = $this->db->query("SELECT DISTINCT *, pd.name AS name,p.image, m.name AS manufacturer, (SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int) $this->config->get('config_customer_group_id') . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int) $this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special, (SELECT points FROM " . DB_PREFIX . "product_reward pr WHERE pr.product_id = p.product_id AND customer_group_id = '" . (int) $this->config->get('config_customer_group_id') . "') AS reward, (SELECT ss.name FROM " . DB_PREFIX . "stock_status ss WHERE ss.stock_status_id = p.stock_status_id AND ss.language_id = '" . (int) $this->config->get('config_language_id') . "') AS stock_status, (SELECT wcd.unit FROM " . DB_PREFIX . "weight_class_description wcd WHERE p.weight_class_id = wcd.weight_class_id AND wcd.language_id = '" . (int) $this->config->get('config_language_id') . "') AS weight_class, (SELECT lcd.unit FROM " . DB_PREFIX . "length_class_description lcd WHERE p.length_class_id = lcd.length_class_id AND lcd.language_id = '" . (int) $this->config->get('config_language_id') . "') AS length_class, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating, (SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r2 WHERE r2.product_id = p.product_id AND r2.status = '1' GROUP BY r2.product_id) AS reviews, p.sort_order FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) LEFT JOIN " . DB_PREFIX . "manufacturer m ON (p.manufacturer_id = m.manufacturer_id) INNER JOIN `shipping_method_lc` AS sm 
    ON p.`product_id` = sm.`product_id`  WHERE p.product_id = '" . (int) $product_id . "' AND pd.language_id = '" . (int) $this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int) $this->config->get('config_store_id') . "'");
        if ($query->num_rows) {
            return array(
                'product_id' => $query->row['product_id'],
                'name' => $query->row['name'],
                'description' => $query->row['description'],
                'meta_title' => $query->row['meta_title'],
                'meta_description' => $query->row['meta_description'],
                'meta_keyword' => $query->row['meta_keyword'],
                'tag' => $query->row['tag'],
                'model' => $query->row['model'],
                'sku' => $query->row['sku'],
                'upc' => $query->row['upc'],
                'ean' => $query->row['ean'],
                'jan' => $query->row['jan'],
                'isbn' => $query->row['isbn'],
                'mpn' => $query->row['mpn'],
                'location' => $query->row['location'],
                'quantity' => $query->row['quantity'],
                'stock_status' => $query->row['stock_status'],
                'image' => $query->row['image'],
                'manufacturer_id' => $query->row['manufacturer_id'],
                'manufacturer' => $query->row['manufacturer'],
                'price' => ($query->row['discount'] ? $query->row['discount'] : $query->row['price']),
                'special' => $query->row['special'],
                'reward' => $query->row['reward'],
                'points' => $query->row['points'],
                'tax_class_id' => $query->row['tax_class_id'],
                'date_available' => $query->row['date_available'],
                'weight' => $query->row['weight'],
                'weight_class_id' => $query->row['weight_class_id'],
                'length' => $query->row['length'],
                'width' => $query->row['width'],
                'height' => $query->row['height'],
                'length_class_id' => $query->row['length_class_id'],
                'subtract' => $query->row['subtract'],
                'rating' => round($query->row['rating']),
                'reviews' => $query->row['reviews'] ? $query->row['reviews'] : 0,
                'minimum' => $query->row['minimum'],
                'sort_order' => $query->row['sort_order'],
                'status' => $query->row['status'],
                'date_added' => $query->row['date_added'],
                'date_modified' => $query->row['date_modified'],
                'listing_type' => $query->row['listing_type'],
                'require_shipping_method' => $query->row['require_shipping_method'],
                'buyer_pay_or_free_shipping' => $query->row['buyer_pay_or_free_shipping'],
                'own_shipping_price' => $query->row['own_shipping_price'],
                'radius' => $query->row['radius'],
                'vendor_id' => $query->row['vendor_id'],
                'product_condition' => $query->row['product_condition'],
            );
        } else {
            return false;
        }
    }

    public function getProducts($data = array()) {

        $sql = '';
        if ($data['filter_name'] == 'saleoffs') {
            $sql = "SELECT product_id from oc_product where listing_type = 3";
        } else {

            $res = "";
            $sql = "SELECT p.quantity,p.product_id,p.listing_type,p.product_condition, sm.*, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id  AND r1.status = '1' GROUP BY r1.product_id) AS rating, (SELECT price FROM " . DB_PREFIX . "product_discount pd2 WHERE pd2.product_id = p.product_id AND pd2.customer_group_id = '" . (int) $this->config->get('config_customer_group_id') . "' AND pd2.quantity = '1' AND ((pd2.date_start = '0000-00-00' OR pd2.date_start < NOW()) AND (pd2.date_end = '0000-00-00' OR pd2.date_end > NOW())) ORDER BY pd2.priority ASC, pd2.price ASC LIMIT 1) AS discount, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int) $this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special";

            if (!empty($data['filter_category_id'])) {
                if (!empty($data['filter_sub_category'])) {
                    $sql .= " FROM " . DB_PREFIX . "category_path cp LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (cp.category_id = p2c.category_id)";
                } else {

                    $sql .= " FROM " . DB_PREFIX . "product_to_category p2c";
                }

                if (!empty($data['filter_filter'])) {

                    $sql .= " LEFT JOIN " . DB_PREFIX . "product_filter pf ON (p2c.product_id = pf.product_id) LEFT JOIN " . DB_PREFIX . "product p ON (pf.product_id = p.product_id)";
                } else {

                    $sql .= " LEFT JOIN " . DB_PREFIX . "product p ON (p2c.product_id = p.product_id)";
                }
            } else {
                $sql .= " FROM " . DB_PREFIX . "product p";
            }
            // for tier price start
//            if (!empty($data['quantity'])) {
//                if ($data['quantity'] > 1) {
//
//                    $res = 'INNER JOIN `oc_product_discount` ON `p`.`product_id` = `oc_product_discount`.`product_id`';
//                } else {
//                    $res = '';
//                }
//            }
//            $sql .= " LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id)INNER JOIN `shipping_method_lc` AS sm ON p.`product_id`=sm.`product_id` $res  WHERE pd.language_id = '" . (int) $this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int) $this->config->get('config_store_id') . "'";
            //end for tier price start
            $sql .= " LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) INNER JOIN `shipping_method_lc` AS sm ON p.`product_id`=sm.`product_id` WHERE pd.language_id = '" . (int) $this->config->get('config_language_id') . "' AND p.status = '1'  AND p.date_available <= NOW() AND p2s.store_id = '" . (int) $this->config->get('config_store_id') . "'";

            //                Asif panga start
            if (!empty($data['location'])) {
                $loc = $data['location'];
                $sql .= "AND `p`.`location` = '" . $loc . "'";
            }
            if (!empty($data['price'])) {
                $price = $data['price'];
                $price = explode('-', $price);
                $to = $price[0];
                $from = $price[1];
                if (empty($from)) {
                    $sql .= "AND `p`.`price`>='" . $to . "'";
                } else {
                    $sql .= "AND `p`.`price` BETWEEN '$to' AND '$from'";
                }
            }
            //for tier price
//            if (!empty($data['quantity'])) {
//                $quatity = $data['quantity'];
//
//                if ($quatity > 1) {
//
//
//                    $sql .= "AND `oc_product_discount`.`quantity` = '" . $quatity . "'";
//                } else {
//
//                    $sql.="";
//                }
//            }
            //end for tier price
            //asif panga end
            if (!empty($data['filter_category_id'])) {
                if (!empty($data['filter_sub_category'])) {
                    $sql .= " AND cp.path_id = '" . (int) $data['filter_category_id'] . "'";
                } else {
                    $sql .= " AND p2c.category_id = '" . (int) $data['filter_category_id'] . "'";
                }

                if (!empty($data['filter_filter'])) {
                    $implode = array();
                    $filters = explode(',', $data['filter_filter']);

                    foreach ($filters as $filter_id) {
                        $implode[] = (int) $filter_id;
                    }

                    $sql .= " AND pf.filter_id IN (" . implode(',', $implode) . ")";
                }
            }
            if (!empty($data['filter_name']) || !empty($data['filter_tag'])) {
                $sql .= " AND (";

                if (!empty($data['filter_name'])) {
                    $implode = array();

                    $words = explode(' ', trim(preg_replace('/\s+/', ' ', $data['filter_name'])));

                    foreach ($words as $word) {
                        $implode[] = "pd.name LIKE '%" . $this->db->escape($word) . "%'";
                    }

                    if ($implode) {
                        $sql .= " " . implode(" OR ", $implode) . "";
                    }

                    if (!empty($data['filter_description'])) {
                        $sql .= " OR pd.description LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
                    }
                }
                if (!empty($data['filter_name']) && !empty($data['filter_tag'])) {
                    $sql .= " OR ";
                }
                if (!empty($data['filter_tag'])) {
                    $sql .= "pd.tag LIKE '%" . $this->db->escape($data['filter_tag']) . "%'";
                }
                if (!empty($data['filter_name'])) {
                    $sql .= " OR LCASE(p.model) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
                    $sql .= " OR LCASE(p.sku) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
                    $sql .= " OR LCASE(p.upc) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
                    $sql .= " OR LCASE(p.ean) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
                    $sql .= " OR LCASE(p.jan) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
                    $sql .= " OR LCASE(p.isbn) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
                    $sql .= " OR LCASE(p.mpn) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
                }

                $sql .= ")";
            }

            if (!empty($data['filter_manufacturer_id'])) {
                $sql .= " AND p.manufacturer_id = '" . (int) $data['filter_manufacturer_id'] . "'";
            }
            $sql .= " GROUP BY p.product_id";
            $sort_data = array(
                'pd.name',
                'p.model',
                'p.quantity',
                'p.price',
                'rating',
                'p.sort_order',
                'p.date_added'
            );
            if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
                if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') {
                    $sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
                } elseif ($data['sort'] == 'p.price') {
                    $sql .= " ORDER BY (CASE WHEN special IS NOT NULL THEN special WHEN discount IS NOT NULL THEN discount ELSE p.price END)";
                } else {
                    $sql .= " ORDER BY " . $data['sort'];
                }
            } else {

                //  $sql .= " ORDER BY p.listing_type ";
                $sql .= " ORDER BY p.listing_type DESC , p.`quantity`  ";
            }

            if (isset($data['order']) && ($data['order'] == 'DESC')) {
                $sql .= " DESC, LCASE(pd.name) DESC";
            } else if (isset($data['order']) && ($data['order'] == 'ASC')) {
                $sql .= " ASC, LCASE(pd.name) ASC";
            } else {
                $sql .= " DESC, LCASE(pd.name) ASC";
            }

            if (isset($data['start']) || isset($data['limit'])) {
                if ($data['start'] < 0) {
                    $data['start'] = 0;
                }

                if ($data['limit'] < 1) {
                    $data['limit'] = 20;
                }

                $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
            }
        }

        $product_data = array();

        $query = $this->db->query($sql);

        foreach ($query->rows as $result) {
            $product_data[$result['product_id']] = $this->getProduct($result['product_id']);
        }
        return $product_data;
    }

    public function getProductSpecials($data = array()) {
        $sql = "SELECT DISTINCT ps.product_id, (SELECT AVG(rating) FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = ps.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating FROM " . DB_PREFIX . "product_special ps LEFT JOIN " . DB_PREFIX . "product p ON (ps.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int) $this->config->get('config_store_id') . "' AND ps.customer_group_id = '" . (int) $this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) GROUP BY ps.product_id";

        $sort_data = array(
            'pd.name',
            'p.model',
            'ps.price',
            'rating',
            'p.sort_order'
        );
        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') {
                $sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
            } else {
                $sql .= " ORDER BY " . $data['sort'];
            }
        } else {
            $sql .= " ORDER BY p.sort_order";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC, LCASE(pd.name) DESC";
        } else {
            $sql .= " ASC, LCASE(pd.name) ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int) $data['start'] . "," . (int) $data['limit'];
        }

        $product_data = array();

        $query = $this->db->query($sql);

        foreach ($query->rows as $result) {
            $product_data[$result['product_id']] = $this->getProduct($result['product_id']);
        }

        return $product_data;
    }

    public function getLatestProducts($limit) {
        $product_data = $this->cache->get('product.latest.' . (int) $this->config->get('config_language_id') . '.' . (int) $this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int) $limit);

        if (!$product_data) {
            $query = $this->db->query("SELECT p.product_id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int) $this->config->get('config_store_id') . "' ORDER BY p.date_added DESC LIMIT " . (int) $limit);

            foreach ($query->rows as $result) {
                $product_data[$result['product_id']] = $this->getProduct($result['product_id']);
            }

            $this->cache->set('product.latest.' . (int) $this->config->get('config_language_id') . '.' . (int) $this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int) $limit, $product_data);
        }
        return $product_data;
    }

    public function getPopularProducts($limit) {
        $product_data = array();
        $query = $this->db->query("SELECT p.product_id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int) $this->config->get('config_store_id') . "' ORDER BY p.viewed DESC, p.date_added DESC LIMIT " . (int) $limit);
        foreach ($query->rows as $result) {
            $product_data[$result['product_id']] = $this->getProduct($result['product_id']);
        }
        return $product_data;
    }

    public function getBestSellerProducts($limit) {
        $product_data = $this->cache->get('product.bestseller.' . (int) $this->config->get('config_language_id') . '.' . (int) $this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int) $limit);
        if (!$product_data) {
            $product_data = array();
            $query = $this->db->query("SELECT op.product_id, SUM(op.quantity) AS total FROM " . DB_PREFIX . "order_product op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id) LEFT JOIN `" . DB_PREFIX . "product` p ON (op.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE o.order_status_id > '0' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int) $this->config->get('config_store_id') . "' GROUP BY op.product_id ORDER BY total DESC LIMIT " . (int) $limit);
            foreach ($query->rows as $result) {
                $product_data[$result['product_id']] = $this->getProduct($result['product_id']);
            }

            $this->cache->set('product.bestseller.' . (int) $this->config->get('config_language_id') . '.' . (int) $this->config->get('config_store_id') . '.' . $this->config->get('config_customer_group_id') . '.' . (int) $limit, $product_data);
        }
        return $product_data;
    }

    public function getProductAttributes($product_id) {
        $product_attribute_group_data = array();
        $product_attribute_group_query = $this->db->query("SELECT ag.attribute_group_id, agd.name FROM " . DB_PREFIX . "product_attribute pa LEFT JOIN " . DB_PREFIX . "attribute a ON (pa.attribute_id = a.attribute_id) LEFT JOIN " . DB_PREFIX . "attribute_group ag ON (a.attribute_group_id = ag.attribute_group_id) LEFT JOIN " . DB_PREFIX . "attribute_group_description agd ON (ag.attribute_group_id = agd.attribute_group_id) WHERE pa.product_id = '" . (int) $product_id . "' AND agd.language_id = '" . (int) $this->config->get('config_language_id') . "' GROUP BY ag.attribute_group_id ORDER BY ag.sort_order, agd.name");
        foreach ($product_attribute_group_query->rows as $product_attribute_group) {
            $product_attribute_data = array();
            $product_attribute_query = $this->db->query("SELECT a.attribute_id, ad.name, pa.text FROM " . DB_PREFIX . "product_attribute pa LEFT JOIN " . DB_PREFIX . "attribute a ON (pa.attribute_id = a.attribute_id) LEFT JOIN " . DB_PREFIX . "attribute_description ad ON (a.attribute_id = ad.attribute_id) WHERE pa.product_id = '" . (int) $product_id . "' AND a.attribute_group_id = '" . (int) $product_attribute_group['attribute_group_id'] . "' AND ad.language_id = '" . (int) $this->config->get('config_language_id') . "' AND pa.language_id = '" . (int) $this->config->get('config_language_id') . "' ORDER BY a.sort_order, ad.name");

            foreach ($product_attribute_query->rows as $product_attribute) {
                $product_attribute_data[] = array(
                    'attribute_id' => $product_attribute['attribute_id'],
                    'name' => $product_attribute['name'],
                    'text' => $product_attribute['text']
                );
            }

            $product_attribute_group_data[] = array(
                'attribute_group_id' => $product_attribute_group['attribute_group_id'],
                'name' => $product_attribute_group['name'],
                'attribute' => $product_attribute_data
            );
        }

        return $product_attribute_group_data;
    }

    public function getProductOptions($product_id) {
        $product_option_data = array();

        $product_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_id = '" . (int) $product_id . "' AND od.language_id = '" . (int) $this->config->get('config_language_id') . "' ORDER BY o.sort_order");

        foreach ($product_option_query->rows as $product_option) {
            $product_option_value_data = array();

            $product_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_id = '" . (int) $product_id . "' AND pov.product_option_id = '" . (int) $product_option['product_option_id'] . "' AND ovd.language_id = '" . (int) $this->config->get('config_language_id') . "' ORDER BY ov.sort_order");
            foreach ($product_option_value_query->rows as $product_option_value) {
                $product_option_value_data[] = array(
                    'product_option_value_id' => $product_option_value['product_option_value_id'],
                    'option_value_id' => $product_option_value['option_value_id'],
                    'name' => $product_option_value['name'],
                    'image' => $product_option_value['image'],
                    'quantity' => $product_option_value['quantity'],
                    'subtract' => $product_option_value['subtract'],
                    'price' => $product_option_value['price'],
                    'price_prefix' => $product_option_value['price_prefix'],
                    'weight' => $product_option_value['weight'],
                    'weight_prefix' => $product_option_value['weight_prefix']
                );
            }

            $product_option_data[] = array(
                'product_option_id' => $product_option['product_option_id'],
                'product_option_value' => $product_option_value_data,
                'option_id' => $product_option['option_id'],
                'name' => $product_option['name'],
                'type' => $product_option['type'],
                'value' => $product_option['value'],
                'required' => $product_option['required']
            );
        }

        return $product_option_data;
    }

    public function getProductDiscounts($product_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int) $product_id . "' AND customer_group_id = '" . (int) $this->config->get('config_customer_group_id') . "' AND quantity > 1 AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY quantity ASC, priority ASC, price ASC");

        return $query->rows;
    }

    public function getdicountedunitprice($product_id, $search_quantity)
    {
        
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int) $product_id . "' ORDER BY quantity ASC, priority ASC, price ASC");
    $disQuantities = $query->rows;
    $maxPrice = 0;
    if(sizeof($disQuantities) > 0)
    {
        if ($search_quantity >= 1 && $search_quantity < $disQuantities[0]['quantity'])
        {
                    $query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product WHERE product_id = '" . (int) $product_id ."'");
            $maxPrice = $query->row['price'];
        }
        for($increment1 = 0; $increment1 < sizeof($disQuantities); $increment1++)
        {
            if ($increment1 == (sizeof($disQuantities) - 1))
                {
                    if ($search_quantity >= $disQuantities[$increment1]['quantity'])
                    {
                        $maxPrice = $disQuantities[$increment1]['price'];
                        $maxPrice_exploded = explode(',', $maxPrice);
                        if (!empty($maxPrice_exploded[1]))
                        {
                            $maxPrice = $maxPrice_exploded[0] . $maxPrice_exploded[1];
                        }
                        else
                        {
                            $maxPrice = $maxPrice;
                        }   
                        $maxPrice_exploded_again = explode('$', $maxPrice);
                        if (!empty($maxPrice_exploded_again[1]))
                        {
                            $maxPrice = $maxPrice_exploded_again[1];
                        }
                        else
                        {
                            $maxPrice = $maxPrice_exploded_again[0];
                        }
                    }
            } else {
                if ($search_quantity >= $disQuantities[$increment1]['quantity'] && $search_quantity < $disQuantities[$increment1 + 1]['quantity']) {
                    $maxPrice = $disQuantities[$increment1]['price'];
                    $maxPrice_exploded = explode(',', $maxPrice);
                    if (!empty($maxPrice_exploded[1])) {
                        $maxPrice = $maxPrice_exploded[0] . $maxPrice_exploded[1];
                    } else {
                        $maxPrice = $maxPrice;
                    }
                    $maxPrice_exploded_again = explode('$', $maxPrice);
                    if (!empty($maxPrice_exploded_again[1])) {
                        $maxPrice = $maxPrice_exploded_again[1];
                    } else {
                        $maxPrice = $maxPrice_exploded_again[0];
                    }
                }
            }
        }
        
    }
    else
    {
        $query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product WHERE product_id = '" . (int) $product_id ."'");
        $maxPrice = $query->row['price'];
    }
    return $maxPrice;
    }

    public function getProductImages($product_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int) $product_id . "' ORDER BY sort_order ASC");

        return $query->rows;
    }

    public function getProductRelated($product_id) {
        $product_data = array();



//        
//        SELECT DISTINCT cd.`name` AS cd_name,cd.`category_id`,pd.`product_id`,pd.`name` FROM `oc_category_description` cd INNER JOIN oc_product_to_category p2c ON cd.`category_id`=p2c.`category_id`
//INNER JOIN `oc_product_description` pd ON p2c.`product_id`=pd.`product_id`  WHERE pd.`name` LIKE '%test%' OR cd.`name` LIKE '%test%' GROUP BY p2c.`category_id`

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_related pr LEFT JOIN " . DB_PREFIX . "product p ON (pr.related_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE pr.product_id = '" . (int) $product_id . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int) $this->config->get('config_store_id') . "'");

        foreach ($query->rows as $result) {
            $product_data[$result['related_id']] = $this->getProduct($result['related_id']);
        }

        return $product_data;
    }

    public function getProductLayoutId($product_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int) $product_id . "' AND store_id = '" . (int) $this->config->get('config_store_id') . "'");

        if ($query->num_rows) {
            return $query->row['layout_id'];
        } else {
            return 0;
        }
    }

    public function getCategories($product_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int) $product_id . "'");

        return $query->rows;
    }

    public function getTotalProducts($data = array()) {


        $res = "";

        if (!empty($data["filter_name"]) && $data["filter_name"] == 'saleoffs') {

            $sql = "SELECT COUNT(DISTINCT product_id) AS total FROM `oc_product`  WHERE listing_type='3'";
//            $query = $this->db->query($sql);
//           
//           return $query->row['total'];
        } else {
            $sql = "SELECT COUNT(DISTINCT p.product_id) AS total";

            if (!empty($data['filter_category_id'])) {
                if (!empty($data['filter_sub_category'])) {
                    $sql .= " FROM " . DB_PREFIX . "category_path cp LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (cp.category_id = p2c.category_id)";
                } else {

                    $sql .= " FROM " . DB_PREFIX . "product_to_category p2c";
                }

                if (!empty($data['filter_filter'])) {
                    $sql .= " LEFT JOIN " . DB_PREFIX . "product_filter pf ON (p2c.product_id = pf.product_id) LEFT JOIN " . DB_PREFIX . "product p ON (pf.product_id = p.product_id)";
                } else {
                    $sql .= " LEFT JOIN " . DB_PREFIX . "product p ON (p2c.product_id = p.product_id)";
                }
            } else {
                $sql .= " FROM " . DB_PREFIX . "product p";
            }


            // if (!empty($data['quantity'])) {
            // if ($data['quantity'] > 1) {
            // $res = 'INNER JOIN `oc_product_discount` ON `p`.`product_id` = `oc_product_discount`.`product_id`';
            // } else {
            // $res = '';
            // }
            // }
            if (!empty($data['price'])) {
                $pric = explode('-', $data['price']);
                $price = "AND p.price BETWEEN $pric[0] AND $pric[1]";
            } else {
                $price = "";
            }

            $sql .= " LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id)  INNER JOIN `shipping_method_lc` AS sm 
    ON p.`product_id` = sm.`product_id`  WHERE pd.language_id = '" . (int) $this->config->get('config_language_id') . "' $price AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int) $this->config->get('config_store_id') . "'";
            // if (!empty($data['quantity'])) {
            // $quatity = $data['quantity'];
            // if ($quatity > 1) {
            // $sql .= "AND `oc_product_discount`.`quantity` = '" . $quatity . "'";
            // } else {
            // $sql.="";
            // }
            // }
            if (!empty($data['filter_category_id'])) {
                if (!empty($data['filter_sub_category'])) {
                    $sql .= " AND cp.path_id = '" . (int) $data['filter_category_id'] . "'";
                } else {
                    $sql .= " AND p2c.category_id = '" . (int) $data['filter_category_id'] . "'";
                }

                if (!empty($data['filter_filter'])) {
                    $implode = array();

                    $filters = explode(',', $data['filter_filter']);

                    foreach ($filters as $filter_id) {
                        $implode[] = (int) $filter_id;
                    }

                    $sql .= " AND pf.filter_id IN (" . implode(',', $implode) . ")";
                }
            }

            if (!empty($data['filter_name']) || !empty($data['filter_tag'])) {
                $sql .= " AND (";

                if (!empty($data['filter_name'])) {
                    $implode = array();

                    $words = explode(' ', trim(preg_replace('/\s+/', ' ', $data['filter_name'])));

                    foreach ($words as $word) {
                        $implode[] = "pd.name LIKE '%" . $this->db->escape($word) . "%'";
                    }

                    if ($implode) {
                        $sql .= " " . implode(" AND ", $implode) . "";
                    }

                    if (!empty($data['filter_description'])) {
                        $sql .= " OR pd.description LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
                    }
                }

                if (!empty($data['filter_name']) && !empty($data['filter_tag'])) {
                    $sql .= " OR ";
                }

                if (!empty($data['filter_tag'])) {
                    $sql .= "pd.tag LIKE '%" . $this->db->escape(utf8_strtolower($data['filter_tag'])) . "%'";
                }

                if (!empty($data['filter_name'])) {
                    $sql .= " OR LCASE(p.model) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
                    $sql .= " OR LCASE(p.sku) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
                    $sql .= " OR LCASE(p.upc) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
                    $sql .= " OR LCASE(p.ean) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
                    $sql .= " OR LCASE(p.jan) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
                    $sql .= " OR LCASE(p.isbn) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
                    $sql .= " OR LCASE(p.mpn) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
                }

                $sql .= ")";
            }

            if (!empty($data['filter_manufacturer_id'])) {
                $sql .= " AND p.manufacturer_id = '" . (int) $data['filter_manufacturer_id'] . "'";
            }
        }

        $query = $this->db->query($sql);
        return $query->row['total'];
    }

    public function getProfile($product_id, $recurring_id) {
        return $this->db->query("SELECT * FROM `" . DB_PREFIX . "recurring` `p` JOIN `" . DB_PREFIX . "product_recurring` `pp` ON `pp`.`recurring_id` = `p`.`recurring_id` AND `pp`.`product_id` = " . (int) $product_id . " WHERE `pp`.`recurring_id` = " . (int) $recurring_id . " AND `status` = 1 AND `pp`.`customer_group_id` = " . (int) $this->config->get('config_customer_group_id'))->row;
    }

    public function getProfiles($product_id) {
        return $this->db->query("SELECT `pd`.* FROM `" . DB_PREFIX . "product_recurring` `pp` JOIN `" . DB_PREFIX . "recurring_description` `pd` ON `pd`.`language_id` = " . (int) $this->config->get('config_language_id') . " AND `pd`.`recurring_id` = `pp`.`recurring_id` JOIN `" . DB_PREFIX . "recurring` `p` ON `p`.`recurring_id` = `pd`.`recurring_id` WHERE `product_id` = " . (int) $product_id . " AND `status` = 1 AND `customer_group_id` = " . (int) $this->config->get('config_customer_group_id') . " ORDER BY `sort_order` ASC")->rows;
    }

    public function getTotalProductSpecials() {
        $query = $this->db->query("SELECT COUNT(DISTINCT ps.product_id) AS total FROM " . DB_PREFIX . "product_special ps LEFT JOIN " . DB_PREFIX . "product p ON (ps.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int) $this->config->get('config_store_id') . "' AND ps.customer_group_id = '" . (int) $this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW()))");
        if (isset($query->row['total'])) {
            return $query->row['total'];
        } else {
            return 0;
        }
    }

    public function getRelatedSearch($search) {


        if (!empty($search)) {
//            $query = $this->db->query("SELECT 
//  COUNT(*)AS tt,cd.`name` as cateory_name,pd.`name`,c.`category_id`
//FROM
//  oc_category c 
//  INNER JOIN oc_product p 
//    ON c.category_id = p.`product_id` 
//    INNER JOIN oc_product_to_category p2c ON p2c.`category_id`=c.`category_id`
//    INNER JOIN oc_category_description cd ON cd.`category_id`=p2c.`category_id`
//    INNER JOIN oc_product_description pd ON pd.`product_id`=p2c.`product_id`
//    
//    
// WHERE pd.`name` LIKE '$search%'   OR pd.`description` LIKE '%$search%'    
//    
//    GROUP BY p2c.`category_id`
//    ORDER BY tt DESC
//     LIMIT 10 ;");
            
            
            
            $query = $this->db->query("SELECT 
  pd.product_id ,p2c.`category_id`,cd.name,COUNT(cd.`category_id`) AS count_category 
FROM
  `oc_product_description` pd 
  INNER JOIN `oc_product_to_category` p2c ON pd.`product_id` = p2c.`product_id` 
  INNER JOIN  oc_category_description cd ON cd.`category_id`=p2c.`category_id`
WHERE pd.`name` LIKE '%$search%' OR pd.`description` LIKE '%$search%'  GROUP BY cd.`category_id` ORDER BY count_category DESC LIMIT 10 ");
            return $query->rows;
        }
    }



	public function getparent_levelone_category($cat_id_in){
		
		$query=$this->db->query("SELECT  * FROM oc_category_path cp INNER JOIN `oc_category_description` cd 
    ON cp.`path_id` = cd.`category_id` WHERE cp.`category_id` in(".$cat_id_in.")  AND cp.`level` IN (0, 1) GROUP BY cp.`path_id` ");
		return $query->rows;
		
	}


	public function Prod_Child_cat($cat_id_in){
	
	$query=$this->db->query("SELECT * FROM `oc_category_path` cp where cp.path_id = ".$cat_id_in." ");
	
	
		
//$query=$this->db->query("SELECT COUNT(category_id) as totalcount FROM  `oc_product_to_category`  WHERE category_id = ".$cat_id_in."  ");
		return $query->rows;
		
	}


	public function Count_Prod_child($cat_id_in){
	

$query=$this->db->query("SELECT  COUNT(category_id) as totalcount FROM `oc_product_to_category` WHERE category_id IN(
SELECT 
category_id
FROM
  `oc_category_path` cp 
 
WHERE path_id = ".$cat_id_in." ) 
");
//print_r($query->rows);
//echo $query->rows[0]['totalcount'];

//$query=$this->db->query("SELECT COUNT(category_id) as totalcount FROM  `oc_product_to_category`  WHERE category_id = ".$cat_id_in."  ");
		return $query->rows[0]['totalcount'];	
	}
    /*     * **vendor info-aa**** */
    public function getVendor($product_id) {
        $q = $this->db->query("select `seller_id`, `date_added` from `oc_product` where `product_id` = '$product_id'");
        if ($q->num_rows) {
            $seller_id = $q->row['seller_id'];
            $q1 = $this->db->query("select c.firstname, c.lastname, c.date_added from oc_vendordetail_lc v, oc_customer c where v.customer_id = c.customer_id  AND v.id = '$seller_id' ");
            if ($q1->num_rows) {
                return array(
                    'seller_id' => $seller_id, /*                     * vendor customer id* */
                    'firstname' => $q1->row['firstname'],
                    'lastname' => $q1->row['lastname'],
                    'date_added' => $q1->row['date_added']
                );
            } else
                return false;
        } else
            return false;
    }
    /*     * *****aa-end****** */
}
