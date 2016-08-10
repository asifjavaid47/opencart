<?php

class ModelDashboardReportlist extends Model {

    public function reported_products() {
        $query = $this->db->query("SELECT * FROM `oc_reporting_lc` rp   INNER JOIN `oc_product_description` pd 
    ON rp.`product_id` = pd.`product_id` INNER JOIN oc_product op ON rp.`product_id`=op.`product_id` GROUP BY pd.`product_id`");
        return $query->rows;
    }
    public function questioner_email($question_id){
        
      $query=  $this->db->query("SELECT * FROM oc_customer  WHERE customer_id = (SELECT customer_id FROM oc_question WHERE question_id ='".$question_id."');");
        return $query->row;
    }

    public function reported_single_product($product_id) {
        $query = $this->db->query("SELECT * FROM `oc_reporting_lc` rp INNER JOIN oc_product op ON rp.`product_id`=op.`product_id`INNER JOIN `oc_product_description` pd ON rp.`product_id`=pd.`product_id`
  WHERE rp.`product_id`='" . $product_id . "' GROUP BY rp.`product_id`");
        return $query->row;
    }
    public function reported_seller_address() {
        $query = $this->db->query("SELECT rp.`product_id`,ov.`customer_id`,ad.address,ov.`v_name`,ov.`v_email`,ov.`v_phone` FROM `oc_reporting_lc` rp INNER JOIN oc_vendordetail_lc ov  ON rp.`seller_id`=ov.`id` INNER JOIN `oc_address_lc` ad ON ad.`customer_id`=ov.`customer_id` GROUP BY rp.product_id");
        return $query->rows;
    }

    public function reported_seller_address_single_user($seller_id) {
        $query = $this->db->query("SELECT * FROM `oc_reporting_lc` rp INNER JOIN oc_vendordetail_lc ov  ON rp.`seller_id`=ov.`id` INNER JOIN `oc_address_lc` ad ON ad.`customer_id`=ov.`customer_id` WHERE rp.`seller_id`='" . $seller_id . "' GROUP BY rp.product_id");
        return $query->row;
    }
    public function blockproducts($product_id){
        $this->db->query("UPDATE oc_product SET `status`= 0 WHERE product_id='".$product_id."'");
        
    }
     public function getQuestionAnswer($product_id) {
        //$q = $this->db->query("select q.question_id, q.question, q.date_time, (select CONCAT(firstname, ' ', lastname) from oc_customer where customer_id = q.customer_id) as cust_name, a.vendor_id, a.answer, a.date_time as a_date_time from oc_question q left join oc_answer a on q.question_id = a.question_id where q.product_id = $product_id ");

        $all_questions = $this->db->query("select * from oc_question where report_id='1' AND product_id = $product_id" );
        $questions_answers = array();
        for ($i = 0; $i < $all_questions->num_rows; $i++) {
            $answers_data = $this->db->query("select * from oc_answer where question_id = " . $all_questions->rows[$i]['question_id']);
            $questions_answers['questions'][$i] = $all_questions->rows[$i]['question'];
            $questions_answers['q_datetime'][$i] = $all_questions->rows[$i]['date_time'];
            $questions_answers['customer_id'][$i] = $all_questions->rows[$i]['customer_id'];
            $questions_answers['question_id'][$i] = $all_questions->rows[$i]['question_id'];


            if (!empty($answers_data)) {
                for ($k = 0; $k < $answers_data->num_rows; $k++) {
                    $questions_answers['answers'][$i][$k] = $answers_data->rows[$k]['answer'];
                    $questions_answers['a_datetime'][$i][$k] = $answers_data->rows[$k]['date_time'];
                    //$questions_answers['customer_id'][$i][$k] = $answers_data->rows[$k]['customer_id'];
                }
            }
        }
        return $questions_answers;
    }
    public function getseller_id_to_block(){
        
        $query=$this->db->query("SELECT * FROM `oc_reporting_lc` WHERE product_id='208' GROUP BY seller_id");
        return $query->row['seller_id'];
        
    }
    public function seller_id_user_block($block_id){

        $query=$this->db->query("SELECT ad.`customer_id` FROM`oc_reporting_lc` rp  INNER JOIN oc_vendordetail_lc ov  ON rp.`seller_id` = ov.`id` INNER JOIN `oc_address_lc` ad  ON ad.`customer_id` = ov.`customer_id` WHERE rp.`seller_id` = '".$block_id."' GROUP BY rp.product_id ");
        return $query->row['customer_id'];
    }
    public function user_block($block_id){
      
        $this->db->query("UPDATE `oc_customer` SET `status`=0 WHERE customer_id='".$block_id."'");
        
        
    }
     public function get_repoter_user($reporter_id) {

      $query = $this->db->query("SELECT * FROM oc_vendordetail_lc WHERE customer_id='".$this->db->escape($reporter_id)."'");
        return $query->row;
    }


}
