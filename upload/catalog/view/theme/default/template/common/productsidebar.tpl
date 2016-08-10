<?php
global $loader, $registry;
$price="";
$search="";
$loader->model('catalog/productsidebar');
$modelSidebar = $registry->get('model_catalog_productsidebar');

$loader->model('catalog/category');
$modelCat = $registry->get('model_catalog_category');
?>
<?php
if(isset($_GET['price'])){
	$price='&price='.$_GET['price'];
	
}else{
	$price='';
}
if(isset($_GET['search'])){
	$search='&search='.$_GET['search'];
	
}else{
	$search='';
}

 ?>
<style>
.search_box
{
	padding:6px !important;
}


</style>
    <div class="col-sm-3 col-md-3 col-lg-3 col-w-200">
       <div class="list-cate-main">
            <?php if(isset($_GET['path']) && $_GET['path'] == 0){
                /**All products page**/
            }
            else{
            ?>
               <div class="populer-cate-container" style="padding: 10px 3px 3px 10px;">
                   <div class="populer-cate-head">
                       <a href="<?php echo $base;?>index.php?route=product/category&path=0"><i class="fa fa-list" aria-hidden="true"></i> All Products</a>
                   </div>
               </div> 
           <?php
            }
            ?>
           <div class="populer-cate-container">
               <div class="populer-cate-head">
			   <?php  
	if(isset($_GET['path'])){
		
			   $cat_id=$_GET['path'];
			
			  $tree_name_get = $modelCat->get_category_tree_name($cat_id);
			  print_r($tree_name_get);

	}
else{
	$cat_id="";
}
			   ?>
                 <?php      ?>
               </div>
               <div class="populer-cate-content">
                  <?php
                  /******View all categories******/
                  $categories = $modelSidebar->getCategories();  
                  foreach ($categories as $category) {
                        $prducts_count = $modelSidebar->getCatProductsCount($category['category_id']);
						
						if($_GET['path']==0){
							
						
                  ?>
				  
                       <div class="first-popu-cate">
                           <a href="<?php echo $base.'index.php?route=product/category&path='.$category['category_id']; ?>" class=""><?php echo $category['name']; ?> <span>(<?php echo $prducts_count;?>)</span></a>
                       </div>
                      <?php
					  }
					  
                      if(isset($_GET['path'])){ 
                           // if($_GET['path'] == $category['category_id']){
							   // echo "if lulu";
                                // $children = $modelSidebar->getCategories($category['category_id']);
                                // foreach ($children as $child) {
                                    // $prducts_count = $modelSidebar->getCatProductsCount($child['category_id']);
                                // ?>
                                     <!--<div class="first-popu-cate">
                                        <a href="<?php //echo $base.'index.php?route=product/category&path='.$child['category_id']; ?>" class="">&nbsp;&nbsp;&nbsp;- <?php //echo $child['name']; ?> <span>(<?php //echo $prducts_count; ?>)</span></a>
                                     </div>  --> 
                                 <?php
                                // }
                            // }
                            // else 
                            
                            
                            
								if($_GET['path'] != 0){
							
                            
                                 $children = $modelSidebar->getCategories($_GET['path']);
                                 foreach ($children as $child) {
                                    $prducts_count = $modelSidebar->getCatProductsCount($_GET['path']);
                                 }

                            	$children = $modelCat->get_sub_cat($_GET['path']);
								//echo "<pre>"; print_r($children); echo "</pre>";
                               // exit;
                                
                                $parent_id = $modelSidebar->getCatParentId($_GET['path']);
                                foreach ($children as $child) {
                                    //if($parent_id == $child['parent_id']){
                                        $prducts_count = $modelSidebar->getCatProductsCount($_GET['path']);
                                ?>
                                        <div class="first-popu-cate">
                                            <a href="<?php echo $base.'index.php?route=product/category&path='.$child['category_id'].$search.$price; ?>" class="">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?> <span>(<?php echo $prducts_count; ?>)</span></a>
                                        </div>   
                                <?php
                                    //}
                                }
                            }
                        }
						
						if($_GET['path'] != 0){
							break;
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
           <!--<div class="populer-cate-container">
               <div class="populer-cate-head">
                   Filter Items
               </div>
               <div class="populer-cate-content">
                   <div class="first-popu-cate">
                       <a href="<?php //echo $base;?>index.php?route=account/order">- My Wishlist </a>
                   </div>
                   <div class="first-popu-cate">
                       <a href="<?php //echo $base;?>index.php?route=account/wishlist">- My History</a>
                   </div>                           
               </div>
           </div> -->
           <div class="populer-cate-container">
               <div class="populer-cate-head">
                   Price Range
               </div>
			   <?php
					if(isset($_GET['price'])){
					$min_price=$_GET['price'];
					$min_price=explode('-',$min_price);
					}else{
					$min_price[0]="";
					$min_price[1]="";
					}	
					?>
               <div class="populer-cate-container">
                		<div class="col-sm-5" style="padding-left:0;">
                			<input type="text" class="form-control search_box"  id="min_price" name="min_price" onkeypress=" return isNumber(event);" value="<?php echo $min_price[0];  ?>" placeholder="Min." >
                		</div>
                		<div class="col-sm-5" style="padding-left:0;">
                			<input type="text" class="form-control search_box" name="max_price" id="max_price" onkeypress=" return isNumber(event);" value="<?php echo $min_price[1];  ?>" placeholder="Max.">
                		</div>
                		<div class="col-sm-2" style="padding-left:0;">
                			<button class="btn btn-default" id="btn_price">></button>
                		</div>
                	</div>
           </div>
           <?php
            /*******best seller*********/
            $bs_count = 0;
            foreach ($bs_products as $bs_product) { ?>
               <div class="populer-cate-container">
                   <?php if($bs_count == 0){?>
                       <div class="populer-cate-head">
                           Best Sellers
                       </div>
                   <?php }?>
                   <div class="seller-img-block">
                       <img src="<?php echo $bs_product['thumb']; ?>" alt="<?php echo $bs_product['name']; ?>" title="<?php echo $bs_product['name']; ?>" class="img-responsive" />
                   </div>
                   <div class="seller-img-content">
                       <div class="seller-product-head">
                           <a href="<?php echo $base?>index.php?route=product/product&product_id=<?php echo $bs_product['product_id']?>"><?php echo $bs_product['name']; ?></a>
                       </div>
                       <div class="seller-product-amt">
                           <?php echo $bs_product['price']; ?> <sup>00</sup>
                       </div>
                       <div class="seller-unit">
                           unit price
                       </div>
                   </div>
                   <div class="clr"></div>
               </div>
           <?php
                $bs_count++;
           }
            if($bs_count == 0) echo '<div class="populer-cate-container"><div class="populer-cate-head">No Best Seller</div></div>';
           /*************************/
           ?> 
           <div class="clr"></div>
       </div>
   </div>
   <script type="text/javascript">
	$(document).ready(function (){
		$('#btn_price').click(function(){
			
			var all_fields_filled = 1;
			var min = $("#min_price").val();
			var max = $("#max_price").val();
			if(min==''){
				all_fields_filled = 0;
				$('#min_price').attr('data-placement', "top");
				$('#min_price').attr('data-toggle', "tooltip");
				$('#min_price').attr("title", "Add a Number");
				$('#min_price').tooltip('show');
			}
			if(max==''){
				all_fields_filled = 0;
				$('#max_price').attr('data-placement', "bottom");
				$('#max_price').attr('data-toggle', "tooltip");
				$('#max_price').attr("title", "Add a Number");
				$('#max_price').tooltip('show');
			}
			if(all_fields_filled === 1){
				change_price(min,max);
				//window.location.href = "<?php echo $_SERVER['PHP_SELF']; ?>?route=product/search&price=" + min + '-' + max;
			}
		});
	});
   function change_price(min,max){
		current_location = window.location.href;
		if (current_location.indexOf("price") > 0){
			splitted_location = current_location.split("&price=");
			location = splitted_location[0] + '&price='+ min + '-' + max;
		}
		else{
			location = location + '&price=' +min + '-' + max;
		}
	}
   
   
   </script>
   
   
   