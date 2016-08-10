<?php echo $header; 
global $loader, $registry;
$loader->model('catalog/category');
$modelCat = $registry->get('model_catalog_category');
?>
      <div class="row">
       
        
<div class="search-product-head-container">
   <div class="container">
       <div class="search-produ-head">
           <!--<div class="search-heading">
               search Product
           </div> -->
           <div class="breadcum-block">
                <ul>
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php } 
                    if(isset($_GET['path']) && $_GET['path'] == 0){?>
                        <li><a href="<?php echo $base.'index.php?route=product/category&path=0'; ?>">All Products</a></li>
                   <?php
                    }
                    ?>
               </ul>
           </div>
       </div>
   </div>
</div>
<div class="container">
  <div class="row">
    <div class="col-sm-12 col-md-12 col-lg-12">
       <div class="clr"></div>
    </div>
    <div class="col-sm-3 col-md-3 col-lg-3 col-w-200">
       <div class="list-cate-main">
           <div class="populer-cate-container">
               <div class="populer-cate-head">
                   Popular Categories
               </div>
               <div class="populer-cate-content">
                  <?php
                  /******View all categories******/
                  $categories = $modelCat->getCategories();  
                  foreach ($categories as $category) {
                    $prducts_count = $modelCat->getCatProductsCount($category['category_id']);
                    if ($category['category_id']) {
                  ?>
                       <div class="first-popu-cate">
                           <a href="<?php echo $base.'index.php?route=product/category&path='.$category['category_id']; ?>" class=""><?php echo $category['name']; ?> <span>(<?php echo $prducts_count;?>)</span></a>
                       </div>
                      <?php /*$children = $modelCat->getCategories($category['category_id']);
                      foreach ($children as $child) {
                            if ($child['category_id']) {
                                $prducts_count = $modelCat->getCatProductsCount($child['category_id']);*/ 
                      ?>
                                <!--<div class="first-popu-cate">
                                    <a href="<?php /*echo $base.'index.php?route=product/category&path='.$child['category_id'];*/ ?>" class="">&nbsp;&nbsp;&nbsp;- <?php /*echo $child['name'];*/ ?> <span>(<?php /*echo $prducts_count;*/ ?>)</span></a>
                                </div>-->    
                       <?php
                        /*}
      }*/
                    }
                  }
                  ?>
               </div>
           </div>
           <div class="populer-cate-container">
               <div class="populer-cate-head">
                   Location
               </div>
               <div class="populer-cate-content">
                   <?php
                foreach($locations as $location){
                ?>   
                   <div class="first-popu-cate">
                       <a href="<?php echo $base;?>index.php?route=product/locProducts&loc=<?php echo urlencode($location['location']);?>"><?php echo $location['location'];?> <span>(<?php echo $location['locProducts'];?>)</span></a>
                   </div>
                <?php
                }
                ?>
               </div>
           </div>
           <div class="populer-cate-container">
               <div class="populer-cate-head">
                   Filter Items
               </div>
               <div class="populer-cate-content">
                   <div class="first-popu-cate">
                       <a href="<?php echo $base;?>index.php?route=account/order">- My Wishlist </a>
                   </div>
                   <div class="first-popu-cate">
                       <a href="<?php echo $base;?>index.php?route=account/wishlist">- My History</a>
                   </div>                           
               </div>
           </div>
           <div class="populer-cate-container">
               <div class="populer-cate-head">
                   Price Range
               </div>
               <div class="populer-cate-content">
                   <div class="first-popu-cate">
                       <a href="#">Up to $ 150 <span>(4796)</span></a>
                   </div>
                   <div class="first-popu-cate">
                       <a href="#">$ 150 to $ 250 <span>(10888)</span></a>
                   </div>
                   <div class="first-popu-cate">
                       <a href="#">Over $ 250 <span>(12976)</span></a>
                   </div>                           
               </div>
           </div>
           <div class="populer-cate-container">
               <div class="populer-cate-head">
                   Best Sellers
               </div>
               <div class="seller-img-block">
                   <img src="http://porcantidad.leadconcept.biz/upload/image/assets/images/seller-imgone.png" alt="">
               </div>
               <div class="seller-img-content">
                   <div class="seller-product-head">
                       <a href="#">Quisque in arcu</a>
                   </div>
                   <div class="seller-product-amt">
                       $222 <sup>00</sup>
                   </div>
                   <div class="seller-unit">
                       unit price
                   </div>
               </div>
               <div class="clr"></div>
           </div>
           <div class="populer-cate-container">                       
               <div class="seller-img-block">
                   <img src="http://porcantidad.leadconcept.biz/upload/image/assets/images/seller-imgtwo.png" alt="">
               </div>
               <div class="seller-img-content">
                   <div class="seller-product-head">
                       <a href="#">Pierre Paulin Armchair Mode</a> 
                   </div>
                   <div class="seller-product-amt">
                       $222 <sup>00</sup>
                   </div>
                   <div class="seller-unit">
                       unit price
                   </div>
               </div>
               <div class="clr"></div>
           </div>
           <div class="clr"></div>
       </div>
   </div>
      
   <div class="col-sm-9 col-md-9 col-lg-9 col-w-940">
   <?php 
    if ($products) {
        /*echo '<h2>'.$heading_title.'</h2>'; */  
   ?>
       <!--<div class="unit-price-main">
           <ul>
               <li><a href="#">Unit Price</a></li>
               <li>|</li>
               <li><a href="#">Unit Price</a></li>
           </ul>
       </div>-->
       <div class="produ-list-top-block">
           
           <div class="items-block">
               <?php echo $results; ?>
           </div>
           
           <div class="list-gread-block">
               <a href="javascript:void(0)" class='list_view'><i class="fa fa-th-list gread-mar-img"></i></a>
               <a href="javascript:void(0)" class='grid_view' ><i class="fa fa-th-large grid-acti"></i></a>
           </div>
           
           <div class="col-sm-3">
               <select name="category_id" class="highprice-select" onchange="change_location(this.value);">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category_1) { ?>
            <?php if ($category_1['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <?php if ($category_2['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_2['children'] as $category_3) { ?>
            <?php if ($category_3['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </select>
           </div>
           <div class="drop-btn-relev">
               <div class="dropdown-btn">
                   <select id="input-sort" class="highprice-select" onchange="location = this.value;">
                    <?php foreach ($sorts as $sorts) { ?>
                    <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                    <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
               </div>
           </div>
           <div class="drop-btn-relev">
               <div class="dropdown-btn">
                   <select id="input-limit" class="highprice-select" onchange="location = this.value;">
                    <?php foreach ($limits as $limits) { ?>
                    <?php if ($limits['value'] == $limit) { ?>
                    <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
               </div>
           </div>   
           
           <div class="clr"></div>
       </div>
       <div class="clr"></div>
       <div class="product-main-container grid_wrap">
          
        <?php
        $prod_count = 1;
        foreach ($products as $product) { ?>   
           <div class="product-one-main product-one-block <?php if($prod_count%4 == 0) echo 'block-last-child';?>">
               <div class="product-img-block">
                   <!--<a href="<?php /*echo $product['href'];*/ ?>">--><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /><!--</a>-->
               </div>
               <div class="product-head">
                   <!--With VR II Lens-->
               </div>
               <div class="product-content">
                   <?php echo $product['name']; ?>
               </div>
               <p><?php echo $product['description']; ?></p>
               <?php
               /******View all discounted quantities******/
              $disQuantities = $modelCat->getProductDiscounts($product['product_id']); 
               $minPrice; $maxPrice;
               if ($product['price']) {
                    $minPrice = $product['price'];
                    
                    $maxPrice = $product['price'];
               }
               $tier_count = 0;
               $disQuantities;
               $disLen = count($disQuantities);
               foreach ($disQuantities as $disQuantity) {
                    if ($tier_count == 0) {
                        /*$maxPrice = round($disQuantity['price'], 0);*/
                    } else if ($tier_count == $disLen - 1) {
                        $minPrice = round($disQuantity['price'], 0);
                    }
                    $tier_count++; 
               }
               ?>
               <?php ?>
               
               
               
               <div class="amt-block-container">
                   <div class="unit-price-block">
                       <div class="price-block-container">
                           <?php echo $maxPrice;?> <sup>00</sup>
                       </div>
                       <div class="price-content-container">
                           Unit price
                       </div>
                   </div>
                   <div class="min-price-block">
                       <div class="">
                           <?php echo $minPrice;?> <sup>00</sup>
                       </div>
                       <div class="price-content-container min-pr">
                           Min price
                       </div>
                   </div>
                   <div class="clr"></div>
               </div>
               <div class="over-table-block">
                   <div class="heart-block-container">
                       <a href="#"><img src="<?php echo $base;?>catalog/view/theme/default/image/over-heart-img.png" alt=""></a>
                   </div>
                   <div class="clr"></div>
                <?php
                  /******View all discounted quantities******/  
                  foreach ($disQuantities as $disQuantity) {
                  ?>   
                       <div class="first-amt-block">
                           <a href="#">
                               <div class="one-no-block prod-list-amt-first">
                                   <?php echo $disQuantity['quantity'];?>
                               </div>
                               <div class="one-block-amt prod-list-amt-first">
                                   <?php echo $currencySymb.round($disQuantity['price'],0)?> <sup>00</sup>
                               </div>
                           </a>
                       </div>
                   <?php
                   }
                   ?>
                  
                   <div class="in-stock-block produ-list-in-stock">
                       <?php echo $product['quantity'];?> en Stock
                   </div>
                   <div class="stock-content">
                       <?php echo $product['location'];?> 
                   </div>
               </div>
           </div>
           
        <?php
            $prod_count++;
        }
        ?>
          <div class="clr"></div> 
       </div>
       <div class="product-pagi-block">
           <?php echo $pagination; ?>
       </div>
       
       <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
       
   <?php
    }else{
        
    }
   ?>

   <div class="product-main-container list_wrap">
       <div class="product-list-block">
         <?php
        $prod_count = 1;
        foreach ($products as $product) { ?>   
                 
                     <div class="row">
                         
                        <div class="col-sm-7 col-md-7 col-lg-8">
                           <div class="list-hover-view">
                              <div class="heart-block-container">
                                 <a href="#"><img src="http://porcantidad.leadconcept.biz/upload/image/assets/images/over-heart-img.png" alt=""></a>
                              </div>
                              <div class="product-img-block">
                                 <img src="<?php echo $product['thumb']; ?>" alt="">
                              </div>
                              <div class="list-view-name">
                                 <div class="product-head">
                                  <?php echo $product['name']; ?>
                                 </div>
                                 <div class="product-content">
                                   <?php  echo $product['description'];?>
                                 </div>
                                  <div class="location-list"><?php echo $product['location']; ?><i class="fa fa-map-marker"></i>
</div>
                              </div>
                              <div class="table-responsive over-table-block">
                                 <table class="table">
                                    <tbody>
                                       
                                         <?php
                  /******View all discounted quantities******/ 
                  $disQuantities = $modelCat->getProductDiscounts($product['product_id']);
                  
                  ?>   
                                       <tr class="first-amt-block">
                                           <?php  
                                           foreach ($disQuantities as $disQuantity) {
                                           ?>
                                          <td><?php echo $disQuantity['quantity'];?></td>
                                        <?php }?>
                                       </tr>
                                       <tr class="first-amt-block">
                                           <?php  
                                           foreach ($disQuantities as $disQuantity) {
                                           ?>
                                          <td> <?php echo $currencySymb.round($disQuantity['price'],0)?> <sup>00</sup></td>
                                         <?php  }?>
                                       </tr>
                                
                                    </tbody>
                                 </table>
                                 <div class="in-stock-block produ-list-in-stock">
                                    <?php echo $product['quantity'];  ?>en Stock
                                 </div>
                                 <div class="stock-content">
                                      <?php echo $product['location'];  ?>
                                 </div>
                              </div>
                           </div>
                        </div>
                         <?php
               /******View all discounted quantities******/
               $disQuantities = $modelCat->getProductDiscounts($product['product_id']);
              
               
               $minPrice; $maxPrice;
               if ($product['price']) {
                    $minPrice = $product['price'];
                    
                    $maxPrice = $product['price'];
               }
               $tier_count = 0;
               $disQuantities;
               $disLen = count($disQuantities);
               foreach ($disQuantities as $disQuantity) {
                    if ($tier_count == 0) {
                        /*$maxPrice = round($disQuantity['price'], 0);*/
                    } else if ($tier_count == $disLen - 1) {
                        $minPrice = round($disQuantity['price'], 0);
                    }
                    $tier_count++; 
               }
               ?>
                        <div class="col-sm-5 col-md-5 col-lg-4">
                            <div class="border-le">
                           <div class="amt-block-container">
                              <div class="unit-price-block">
                                 <div class="price-block-container">
                                    <?php echo  $product['price']; ?> <sup>00</sup>
                                 </div>
                                 <div class="price-content-container">
                                    Unit price
                                 </div>
                              </div>
                              <div class="min-price-block">
                                 <div class="min-block-container">
                                     <?php  echo $minPrice; ?> <sup>00</sup>
                                 </div>
                                 <div class="min-content-container">
                                    Min price
                                 </div>
                              </div>
                              <div class="clr"></div>
                           </div>
                                </div>
                        </div>
                     </div>
                  
                   
                   <?php } ?>
                   
                  </div>
   </div>
   <h3 class='alert alert-warning'>Nothing found...</h3>
               </div>
   </div>
   <div class="col-sm-12 col-md-12 col-lg-12">
       <div class="banner-block">                   
           <a href="#">Learn more</a>
           <div class="clr"></div>
       </div>
   </div>

</div>
</div>        
      <?php /*echo $content_bottom;*/ ?>
    <?php /*echo $column_right;*/ ?>

<?php echo $footer; ?>
<script type='text/javascript'>
  function change_location(value)
  {
      current_location = window.location.href;
      alert(current_location.indexOf("category_id"));
      if(current_location.indexOf("category_id") > 0 )
      {
         
         splitted_location = current_location.split("&category_id=");
        location = splitted_location[0] + '&category_id=' + value;
      }
      else
      {
          location = location + '&category_id=' + value;
      }
      
  }
  $(document).ready(function(){
    
      $('.list_wrap').hide();
     $(".list_view").click(function(){
          $('.list_wrap').show();
           $('.grid_wrap').hide();
    });
     $(".grid_view").click(function(){
           $('.grid_wrap').show();
          $('.list_wrap').hide();
    });
      
        
    });  
    
    
</script> 
