<?php
if(isset($min_price) && isset($max_price))
{
	for($i = 0; $i< sizeof($products); $i++)
	{
		if(($products[$i]['current_unit_price']  < $min_price) || ($products[$i]['current_unit_price']  > $max_price))
		{
			unset($products[$i]);
		}
	}
}
if(isset($is_sort_set))
{
	if($is_sort_set == 'yes')
	{
		if($sort_order == "ASC")
		{
			usort($products, function($a, $b)
			{
				return $a['listing_type'] - $b['listing_type'];
			});
			usort($products, function($a, $b)
			{
				return $a['current_unit_price'] - $b['current_unit_price'];
			});
		}
		else if($sort_order == "DESC")
		{
			usort($products, function($a, $b)
			{
				return $a['listing_type'] - $b['listing_type'];
			});
			usort($products, function($a, $b)
			{
				return $b['current_unit_price'] - $a['current_unit_price'];
			});
		}
	}
}
// echo '<pre>';
// print_r($products);
echo $header; 
global $loader, $registry;
$loader->model('catalog/category');
$modelCat = $registry->get('model_catalog_category');


$loader->model('catalog/product');
$productmodel = $registry->get('model_catalog_product');
$price='';
?>
<style>
.grid_wrap .product-img-block img
{
	width:200px !important;
	height:200px !important;
}
.search_box
{
	padding:6px !important;
}
</style>

<div class="row">
    <div class="search-product-head-container" style="background-image:none; ">
		<div class="alert alert-success alert-dismissible " id="wish-warn" role="alert" style="display: none;">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span id="close" aria-hidden="true">&times;</span></button>
			<strong>Warning!</strong> You must login or create an account to save in your wish list!
		</div>
		<div class="alert alert-success alert-dismissible " id="wish-success" role="alert" style="display: none;">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span id="close" aria-hidden="true">&times;</span></button>
			<strong>Success!</strong>You have successfully added in  your &quot;wish list
		</div>
		<div class="container">
			<div class="search-produ-head">
           
                <!--<div class="search-heading">
                    search Product
                </div> -->
                  <div class="breadcum-block">
                  <ul>
                      <li><a href="<?php echo $base?>">Home</a></li>
                        <?php 
                        
                            $store_cat_id1 = array();
						if(!empty($search_categories)){
                                                    foreach ($search_categories as $category) {
                                                    $prducts_count = $modelCat->getCatProductsCount($category['category_id']);
                                                    $store_cat_id1[$category['category_id']] = $prducts_count;
                                                     
                                                    }                                              
                                                    $maxs = array_keys($store_cat_id1, max($store_cat_id1));

					        }
                                    if(!empty($maxs[0])){
                                    $category_tree = $modelCat->get_category_tree($maxs[0]);
                                  
							foreach($category_tree as $tree_name)
							{
                                                        echo "<li>&gt;</li>";  
                                                        $tree_name_get = $modelCat->get_category_tree_name($tree_name['path_id']);
                                                        ?>
								<li><a href="<?php echo 'index.php?route=product/category&path='.$tree_name['path_id'];?>"><?php echo $tree_name_get; ?></a></li>  
								<?php
							} 
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
						Categories
					</div>
<div class="populer-cate-content">
      <?php
                                                $searchs="";
      /******View all categories******/
                                                $store_cat_id = array();
      if(!empty($search_categories)){
      
      foreach ($search_categories_parent_level_one as $category) {
      $prducts_count = $modelCat->getCatProductsCount($category['category_id']);
      
      
      $count_all_Child_prod = $productmodel->Count_Prod_child($category['category_id']);
      
    
      //$parnent_level_one=$modelCat->getparent_levelone_category($category['category_id']);
      //echo "<pre>";
     // print_r($parnent_level_one);
      
      if(isset($_GET['search'])){
                                                
	$searchs='&search='.$_GET['search'];
	}else{
	$searchs="";
	}if(isset($_GET['price'])){
	$price='&price='.$_GET['price'];
	}else{
	$price='';
	}
	?>
      <div class="first-popu-cate">
       <a href="<?php echo $base.'index.php?route=product/category&path='.$category['category_id'].$searchs.$price; ?>" class=""><?php echo $category['name']; ?> <span>(<?php echo $count_all_Child_prod;?>)</span></a>
      </div>

      <?php }
                                                
     }
     ?>
                            <!--    <div class="first-popu-cate">
                                <a href="<?php /*echo $base.'index.php?route=product/category&path='.$child['category_id'];*/ ?>" class="">&nbsp;&nbsp;&nbsp;- <?php /*echo $child['name'];*/ ?> <span>(<?php /*echo $prducts_count;*/ ?>)</span></a>
                            </div>-->    

                        </div>
                    </div>
                            
                    <!--<div class="populer-cate-container">
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
                      <!-- wish list -->
               <!-- <div class="populer-cate-container">
                	<div class="populer-cate-head">
                		Filter Items
                	</div>
                	<div class="populer-cate-content">                            
                		<div class="first-popu-cate" id="wish-count">
                			<a href="<?php echo $base;?>index.php?route=account/wishlist">- My Wishlist<span>&nbsp;(2)</span> </a>
                		</div>
                		<div class="first-popu-cate">
                			<a href="<?php echo $base;?>index.php?route=account/order">- My History</a>
                		</div>                           
                	</div>
                </div> -->
                <!-- wish list -->
                <div class="populer-cate-container">
                	<div class="populer-cate-head">
                		Price Range
                	</div>
                	<!--<div class="populer-cate-content">
                		<div class="first-popu-cate">
                			<a class="pric_link" href="?route=product/search&price=0-150">Up to $ 150 </a>
                			<!--<span>(4796)</span>

                		</div>
                		<div class="first-popu-cate">
                			<a  class="pric_link" href="?route=product/search&price=150-250">$ 150 to $ 250</a>
                		</div>
                		<div class="first-popu-cate">
                			<a href="?route=product/search&price=250-">Over $ 250 </a>
                		</div>  
                	</div> -->
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
                			<input type="text" class="form-control search_box"  id="min_price" name="min_price" placeholder="Min." onkeypress=" return isNumber(event);" value="<?php echo $min_price[0];  ?>" >
                		</div>
                		<div class="col-sm-5" style="padding-left:0;">
                			<input type="text" class="form-control search_box" name="max_price" id="max_price" placeholder="Max." onkeypress=" return isNumber(event);" value="<?php echo $min_price[1]; ?>">
                		</div>
                		<div class="col-sm-2" style="padding-left:0;">
                			<button class="btn btn-default" id="btn_price">></button>
                		</div>
                	</div>
                </div>
          <!--   <div class="populer-cate-container">
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
                			$222
                		</div>
                		<div class="seller-unit">
                			unit price
                		</div>
                	</div>
                	<div class="clr"></div>
                </div>
          -->
             <!--<div class="populer-cate-container">                       
                	<div class="seller-img-block">
                		<img src="http://porcantidad.leadconcept.biz/upload/image/assets/images/seller-imgtwo.png" alt="">
                	</div>
                	<div class="seller-img-content">
                		<div class="seller-product-head">
                			<a href="#">Pierre Paulin Armchair Mode</a> 
                		</div>
                		<div class="seller-product-amt">
                			$222
                		</div>
                		<div class="seller-unit">
                			unit price
                		</div>
                	</div>
                	<div class="clr"></div>
                </div> -->
                <div class="clr"></div>
            </div>
        </div>

        <div class="col-sm-9 col-md-9 col-lg-9 col-w-940">
        	<?php
        	if ($products)
        	{
        	?>
        	<div class="produ-list-top-block">
        		<div class="items-block">
        		<!--show full pagination	 <?php //echo $results; ?>-->
				<?php 
				$data = explode("(" , $results); 
				echo $data[0];
				
				?>
				
        		</div>
        		<div class="list-gread-block">
        			<a href="javascript:void(0)" class='list_view'><i class="fa fa-th-list gread-mar-img"></i></a>
        			<a href="javascript:void(0)" class='grid_view' ><i class="fa fa-th-large grid-acti"></i></a>
        		</div>           
						<!-- <div class="col-sm-2">
							<select name="location" class="highprice-select" onchange="change_location2(alert(this.value));">
								<option value="0"><?php echo $text_category; ?></option>
								<?php 
									foreach($locations as $location)
									{ ?>   
										<option value="<?php echo $location['location'] ?>"><?php echo $location['location'] ?></option>
										<?php 
									}
								?>
							</select>
						</div> -->
                                                 <!-- location -->
						<!--<div class="col-sm-2">
							<select name="location" style="width:100%;" class="highprice-select" onchange="change_location2(this.value);">
								<option value="" selected>Location</option>
								<option value="">Any location</option>
								<?php 
								//foreach($locations as $location){
								?>   
								<option value="<?php //echo $location['location'] ?>"><?php echo $location['location'] ?></option>
								<?php //}?>
							</select>
						</div> -->
                                                <!-- location -->
                                                <!-- categories -->
					<!--	<div class="col-sm-2">
							<?php $allcategories = $modelCat->getCategories();
							?>
							<select name="category_id" style="width:100%;" class="highprice-select" onchange="change_location(this.value);">
								<option value="0"><?php echo $text_category; ?></option>
								<?php foreach ($allcategories as $category_1) { ?>
								<?php if ($category_1['category_id'] == $category_id) { ?>
								<option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
								<?php } ?>

								<?php } ?>
							</select>
						</div> 
                                                -->
                                                <!-- categories -->
						<div class="drop-btn-relev">
							<div class="dropdown-btn">

								<select id="input-sort" class="highprice-select" onchange="change_location4(this.value);"  >
									<?php foreach ($sorts as $sorts) { ?>
									<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
									<option value="<?php echo $sorts['value']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $sorts['value']; ?>"><?php echo $sorts['text']; ?></option>
									<?php } ?>
									<?php } ?>
								</select>
							</div>
						</div>
						<!--<div class="drop-btn-relev">
							<div class="dropdown-btn">
								<select id="input-limit" style="width:36px;" class="highprice-select" onchange="change_location3(this.value);">
									<?php foreach ($limits as $limits) { ?>
									<?php if ($limits['value'] == $limit) { ?>
									<option value="<?php echo $limits['text']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
									<?php } else { ?>
									<option value="<?php echo $limits['text']; ?>"><?php echo $limits['text']; ?></option>
									<?php } ?>
									<?php } ?>
								</select>
							</div>
						</div> -->
						<div class="clr"></div>
					</div>
					<div class="clr"></div>
					<div class="product-main-container grid_wrap">
						<?php
                       
						$prod_count = 1;
						$increment_for_stock = 0;
						$product_increment_stock = 0;
						if($is_sort_set=='yes')
						{
							foreach ($products as $product)
							{
								if($search_quantity < $product['quantity'])
								{
									?>   
								<div class="product-one-main product-one-block <?php if($prod_count%4 == 0) echo 'block-last-child';?>">							
									<?php
										if(intval($product['listing_type'])==3)
										{
											// $date1 = new DateTime(date('y-m-d'));
											// $date2 = new DateTime($product['date_added']);
											// $diff = $date2->diff($date1)->format("%a");

											// if($diff < 1)
											// {
											   echo '<span class="liquidation_ribbon"><span class="ribbon_text">Sale Off</span></span>';
											//}
										}
										else if(intval($product['listing_type'])==2)
										{
											echo '<span class="destacada_ribbon"></span>';
										}
										else if(intval($product['listing_type'])==1)
										{
											echo '<span class="gratics_ribbon"></span>';
										}
									?>
									<div class='grid-overflow'>
										<a href='#' class='whole_product_redirections prevent_default2' quantity = 1 amount = <?php echo $product['price']; ?> product_id=<?php echo $product['product_id']?> original_quantity=1 original_price=<?php echo $product['price']; ?> ></a>
											<div class="product-img-block">
												<!--<a href="<?php /*echo $product['href'];*/ ?>">--><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /><!--</a>-->
											</div>
											<div class="product-title">
												<?php echo $product['name']; ?>
											</div>
											<?php
												/******View all discounted quantities******/
												$disQuantities = $modelCat->getProductDiscounts($product['product_id']);
												$minPrice; $maxPrice;
												if ($product['price'])
												{
													$minPrice = $product['price'];
													$minPrice_exploded = explode(',',$minPrice);
													if(!empty($minPrice_exploded[1]))
													{
														$minPrice = $minPrice_exploded[0].$minPrice_exploded[1];
													}
													else
													{
														$minPrice = $minPrice;
													}
													$minPrice_exploded_again = explode('$', $minPrice);
													if(!empty($minPrice_exploded_again[1]))
													{
														$minPrice = $minPrice_exploded_again[1];
													}
													else
													{
														$minPrice = $minPrice_exploded_again[0];
													}
													$whole = floor($minPrice);
													$fraction = $minPrice - $whole;
													$fraction_splitted = explode('.', $fraction);
													if(!empty($fraction_splitted[1]))
													{
														$fraction = $fraction_splitted[1];
													}
													else
													{
														$fraction = $fraction_splitted[0];
													}
													if($fraction < 9)
													{
														$fraction = '0'.$fraction;
													}
													else
													{
														$fraction = $fraction;
													}
													$minPrice="$".$whole."<sup>".$fraction."</sup>";
													
													$maxPrice = $product['price'];
													$maxPrice_exploded = explode(',',$maxPrice);
													if(!empty($maxPrice_exploded[1]))
													{
														$maxPrice = $maxPrice_exploded[0].$maxPrice_exploded[1];
													}
													else
													{
														$maxPrice = $maxPrice;
													}
													$maxPrice_exploded_again = explode('$', $maxPrice);
													if(!empty($maxPrice_exploded_again[1]))
													{
														$maxPrice = $maxPrice_exploded_again[1];
													}
													else
													{
														$maxPrice = $maxPrice_exploded_again[0];
													}
													$whole = floor($maxPrice);
													$fraction = $maxPrice - $whole;
													$fraction_splitted = explode('.', $fraction);
													if(!empty($fraction_splitted[1]))
													{
														$fraction = $fraction_splitted[1];
													}
													else
													{
														$fraction = $fraction_splitted[0];
													}
													if($fraction < 9)
													{
														$fraction = '0'.$fraction;
													}
													else
													{
														$fraction = $fraction;
													}
													$maxPrice="$".$whole."<sup>".$fraction."</sup>";
												}
												$tier_count = 0;
												$disQuantities;
												$disLen = count($disQuantities);
												$increment1 = 0;
												foreach($disQuantities as $disQuantity)
												{
													if($tier_count == $disLen - 1)
													{
														$minPrice = $disQuantity['price'];
														$minPrice_exploded = explode(',',$minPrice);
														if(!empty($minPrice_exploded[1]))
														{
															$minPrice = $minPrice_exploded[0].$minPrice_exploded[1];
														}
														else
														{
															$minPrice = $minPrice;
														}
														$minPrice_exploded_again = explode('$', $minPrice);
														if(!empty($minPrice_exploded_again[1]))
														{
															$minPrice = $minPrice_exploded_again[1];
														}
														else
														{
															$minPrice = $minPrice_exploded_again[0];
														}

														$whole = floor($minPrice);
														$fraction = $minPrice - $whole;
														$fraction_splitted = explode('.', $fraction);
														if(!empty($fraction_splitted[1]))
														{
															$fraction = $fraction_splitted[1];
														}
														else
														{
															$fraction = $fraction_splitted[0];
														}
														if($fraction < 9)
														{
															$fraction = '0'.$fraction;
														}
														else
														{
															$fraction = $fraction;
														}
														$minPrice="$".$whole."<sup>".$fraction."</sup>";
													}
													
													if($increment1 == (sizeof($disQuantities)-1))
													{
														if($search_quantity >= $disQuantities[$increment1]['quantity'])
														{
															$maxPrice = $disQuantities[$increment1]['price'];
															$maxPrice_exploded = explode(',',$maxPrice);
															if(!empty($maxPrice_exploded[1]))
															{
																$maxPrice = $maxPrice_exploded[0].$maxPrice_exploded[1];
															}
															else
															{
																$maxPrice = $maxPrice;
															}
															$maxPrice_exploded_again = explode('$', $maxPrice);
															if(!empty($maxPrice_exploded_again[1]))
															{
																$maxPrice = $maxPrice_exploded_again[1];
															}
															else
															{
																$maxPrice = $maxPrice_exploded_again[0];
															}
															$whole = floor($maxPrice);
															$fraction = $maxPrice - $whole;
															$fraction_splitted = explode('.', $fraction);
															if(!empty($fraction_splitted[1]))
															{
																$fraction = $fraction_splitted[1];
															}
															else
															{
																$fraction = $fraction_splitted[0];
															}
															if($fraction < 9)
															{
																$fraction = '0'.$fraction;
															}
															else
															{
															$fraction = $fraction;
															}
															$maxPrice="$".$whole."<sup>".$fraction."</sup>";
														}
													}
													else
													{
														if($search_quantity >= $disQuantities[$increment1]['quantity'] && $search_quantity < $disQuantities[$increment1+1]['quantity'])
														{
															$maxPrice = $disQuantities[$increment1]['price'];
															$maxPrice_exploded = explode(',',$maxPrice);
															if(!empty($maxPrice_exploded[1]))
															{
																$maxPrice = $maxPrice_exploded[0].$maxPrice_exploded[1];
															}
															else
															{
																$maxPrice = $maxPrice;
															}
															$maxPrice_exploded_again = explode('$', $maxPrice);
															if(!empty($maxPrice_exploded_again[1]))
															{
																$maxPrice = $maxPrice_exploded_again[1];
															}
															else
															{
																$maxPrice = $maxPrice_exploded_again[0];
															}
															$whole = floor($maxPrice);
															$fraction = $maxPrice - $whole;
															$fraction_splitted = explode('.', $fraction);
															if(!empty($fraction_splitted[1]))
															{
																$fraction = $fraction_splitted[1];
															}
															else
															{
																$fraction = $fraction_splitted[0];
															}
															if($fraction < 9)
															{
																$fraction = '0'.$fraction;
															}
															else
															{
															$fraction = $fraction;
															}
															$maxPrice="$".$whole."<sup>".$fraction."</sup>";
														}
													}
													$increment1++;

													$tier_count++; 
												}
											?>
											<div class="amt-block-container">
												<div class="unit-price-block">
													<div class="price-block-container">
														<?php echo $maxPrice;?>
													</div>
													<div class="price-content-container">
														Unit price
													</div>
												</div>
												<div class="min-price-block">
													<div class="">
														<?php echo $minPrice;?>
													</div>
													<div class="price-content-container">
														Min price
													</div>
												</div>
												<div class="clr"></div>
												<?php
													if(!empty($product['buyer_pay_or_free_shipping']))
													{
														if($product['buyer_pay_or_free_shipping'] == 'porcantidad free shipping')
														{
															?>
															<div class="shipping-truck-block col-sm-6 green">
																<!-- <i class="fa fa-truck" aria-hidden="true"></i> -->
																<div class="shipping-content-container">
																	Shipping
																</div>
															</div>
															<?php
														}
														else
														{
															?>
															<div class="shipping-truck-block col-sm-6">
																<!--  <i class="fa fa-truck" aria-hidden="true"></i> -->
																<div class="shipping-content-container">
																	Shipping
																</div>
															</div>
															<?php
														}
													}
													else
													{
														?>
														<div class="shipping-truck-block col-sm-6 green" style='visibility:hidden'>
															<!--  <i class="fa fa-truck" aria-hidden="true"></i> -->
															<div class="shipping-content-container">
																Shipping
															</div>
														</div>
														<?php
													}
												?>
												<br>
												<div class="product-condition-block col-sm-12 padding0">
													<div class="col-sm-7 padding0 text-left product-address-block">
														<div class="product-address-content-container">
															<?php echo $product['location']; ?>
														</div>
													</div>
													<div class="col-sm-5 product-condition-content-container padding0 text-right">
														New Item
													</div>
												</div>
												<div class="clr"></div>
											</div>
											<div class="over-table-block">
												<?php
													$add_selected_class;
												?>
												<div class="clr"></div>
												<div class='fix_tier_price_at_bottom'>
													<div class="product_title_tier_prices">
														<?php
															echo $product['name'];
														?>
													</div>
													
													<div class="first-amt-block">
														<?php
														$already_selected_tier_price = 0;
														//echo $disQuantities[0]['quantity'];
														if(isset($disQuantities[0]['quantity']))
														{
															if($search_quantity >= 1 && $search_quantity <  $disQuantities[0]['quantity'])
															{
																$add_selected_class = 'hover_selected_tier_price';
																$already_selected_tier_price = 1;
															}
															else
															{
																$add_selected_class = '';
															}
														}
														else
														{
															if($search_quantity >= 1)
															{
																$add_selected_class = 'hover_selected_tier_price';
																$already_selected_tier_price = 1;
															}
															else
															{
																$add_selected_class = '';
															}
														}

														?>
														<a href="#" class='prevent_default <?php echo $add_selected_class?>' quantity = 1 amount = <?php echo $product['price']; ?> product_id=<?php echo $product['product_id']?> original_quantity=1 original_price=<?php echo $product['price']; ?>>
															<div class="one-no-block prod-list-amt-first">
																1
															</div>
															<div class="one-block-amt prod-list-amt-first">
																<?php
																	$product_price = $product['price'];
																	$product_price_exploded = explode(',',$product_price);
																	if(!empty($product_price_exploded[1]))
																	{
																		$product_price = $product_price_exploded[0].$product_price_exploded[1];
																	}
																	else
																	{
																		$product_price = $product_price;
																	}
																	$product_price_exploded_again = explode('$', $product_price);
																	if(!empty($product_price_exploded_again[1]))
																	{
																		$product_price = $product_price_exploded_again[1];
																	}
																	else
																	{
																		$product_price = $product_price_exploded_again[0];
																	}
																
																	//$product_price = intval($product_price);
																	$whole = floor($product_price);
																	$fraction = $product_price - $whole;
																	$fraction_splitted = explode('.', $fraction);
																	if(!empty($fraction_splitted[1]))
																	{
																		$fraction = $fraction_splitted[1];
																	}
																	else
																	{
																		$fraction = $fraction_splitted[0];
																	}
																	if($fraction < 9)
																	{
																		$fraction = '0'.$fraction;
																	}
																	else
																	{
																		$fraction = $fraction;
																	}
																	echo $whole."<sup>".$fraction."</sup>";
																?>
															</div>
														</a>
													</div>
													<?php
														/******View all discounted quantities******/
														$previous_val = 1;
														// print_r($disQuantities);
														// exit;
														$increment = 0;
														foreach($disQuantities as $disQuantity)
														{
															$disQuantity_price = $disQuantity['price'];
															$whole = floor($disQuantity_price);
															$fraction = $disQuantity_price - $whole;
															
															$disQuantity_price = $disQuantity['price'];
															$disQuantity_price_exploded = explode(',',$disQuantity_price);
															if(!empty($disQuantity_price_exploded[1]))
															{
																$disQuantity_price = $disQuantity_price_exploded[0].$disQuantity_price_exploded[1];
															}
															else
															{
																$disQuantity_price = $disQuantity_price;
															}
															$disQuantity_price_exploded_again = explode('$', $disQuantity_price);
															if(!empty($disQuantity_price_exploded_again[1]))
															{
																$disQuantity_price = $disQuantity_price_exploded_again[1];
															}
															else
															{
																$disQuantity_price = $disQuantity_price_exploded_again[0];
															}
															$whole = floor($disQuantity_price);
															$fraction = $disQuantity_price - $whole;
															$fraction_splitted = explode('.', $fraction);
															if(!empty($fraction_splitted[1]))
															{
																$fraction = $fraction_splitted[1];
															}
															else
															{
																$fraction = $fraction_splitted[0];
															}
															if($fraction < 9)
															{
																$fraction = '0'.$fraction;
															}
															else
															{
																$fraction = $fraction;
															}
															$last_value = $currencySymb.$whole."<sup>".$fraction."</sup>";
															
															
															// if($already_selected_tier_price == 0)
															// {
																if($increment == (sizeof($disQuantities)-1))
																{
																	if($search_quantity >= $disQuantities[$increment]['quantity'])
																	{
																		$add_selected_class = 'hover_selected_tier_price';
																		$already_selected_tier_price = 1;
																	}
																	else
																	{
																		$add_selected_class = '';
																	}
																}
																else
																{
																	if($search_quantity >= $disQuantities[$increment]['quantity'] && $search_quantity < $disQuantities[$increment+1]['quantity'])
																	{
																		$add_selected_class = 'hover_selected_tier_price';
																		$already_selected_tier_price = 1;
																	}
																	else
																	{
																		$add_selected_class = '';
																	}
																}
																$increment++;
															//}
															
															?>
															
															<div class="first-amt-block">
																<a href="#" class='prevent_default <?php echo $add_selected_class ?>' quantity = <?php echo $disQuantity['quantity'];?> amount = <?php echo $currencySymb.round($disQuantity['price'],0); ?> product_id=<?php echo $product['product_id']?> original_quantity=1 original_price=<?php echo $product['price']; ?>>
																	<div class="one-no-block prod-list-amt-first">
																		<?php echo $disQuantity['quantity'];?>
																	</div>
																	<div class="one-block-amt prod-list-amt-first">
																		<?php echo $last_value;?>
																	</div>
																</a>
															</div>
															<?php
														}
													?>
													<div class="col-sm-6" style="padding: 0 4px 0;">
														<div class="in-stock-block produ-list-in-stock white">
															<?php echo $product['quantity'];?> en Stock
														</div>
														<div class="stock-content">
															<?php echo $product['location'];?> 
														</div>
													</div>
													<div class="col-sm-6 b_x_2 saved_values_element">
														<span class='percentage_saved'>
															-0%
														</span>
														<br>
														<span class='saved_amount_keyword'>
															Ahorra
														</span>
														<br>
														<span class='total_amount_saved'>
															$0!
														</span>
													</div>
												</div>
											</div>
											<div class="prod-bottom-bar grid_view_item">
												<span>% Escalade Descuentos</span>
											</div>
										</div>
									</div>
									<?php
									// $prod_count++;
								}
								else
								{
									$out_stock_products[$increment_for_stock] = $product_increment_stock;
									$increment_for_stock++;
								}
								$product_increment_stock++;
							}
							
							for($increment_now = 0; $increment_now < sizeof($out_stock_products); $increment_now++)
							{
								?>   
								<div class="product-one-main product-one-block <?php if($prod_count%4 == 0) echo 'block-last-child';?>">							
									<?php
										if(intval($products[$out_stock_products[$increment_now]]['listing_type'])==3)
										{
											   echo '<span class="liquidation_ribbon"><span class="ribbon_text">Sale Off</span></span>';
										}
										else if(intval($products[$out_stock_products[$increment_now]]['listing_type'])==2)
										{
											echo '<span class="destacada_ribbon"></span>';
										}
										else if(intval($products[$out_stock_products[$increment_now]]['listing_type'])==1)
										{
											echo '<span class="gratics_ribbon"></span>';
										}
									?>
									<div class='grid-overflow'>
										<a href='#' class='whole_product_redirections prevent_default2' quantity = 1 amount = <?php echo $products[$out_stock_products[$increment_now]]['price']; ?> product_id=<?php echo $products[$out_stock_products[$increment_now]]['product_id']?> original_quantity=1 original_price=<?php echo $products[$out_stock_products[$increment_now]]['price']; ?> ></a>
											<div class="product-img-block">
												<!--<a href="<?php /*echo $product['href'];*/ ?>">--><img src="<?php echo $products[$out_stock_products[$increment_now]]['thumb']; ?>" alt="<?php echo $products[$out_stock_products[$increment_now]]['name']; ?>" title="<?php echo $products[$out_stock_products[$increment_now]]['name']; ?>" class="img-responsive" /><!--</a>-->
											</div>
											<div class="product-title">
												<?php echo $products[$out_stock_products[$increment_now]]['name']; ?>
											</div>
											<?php
												/******View all discounted quantities******/
												$disQuantities = $modelCat->getProductDiscounts($products[$out_stock_products[$increment_now]]['product_id']);
												$minPrice; $maxPrice;
												if ($products[$out_stock_products[$increment_now]]['price'])
												{
													$minPrice = $products[$out_stock_products[$increment_now]]['price'];
													$minPrice_exploded = explode(',',$minPrice);
													if(!empty($minPrice_exploded[1]))
													{
														$minPrice = $minPrice_exploded[0].$minPrice_exploded[1];
													}
													else
													{
														$minPrice = $minPrice;
													}
													$minPrice_exploded_again = explode('$', $minPrice);
													if(!empty($minPrice_exploded_again[1]))
													{
														$minPrice = $minPrice_exploded_again[1];
													}
													else
													{
														$minPrice = $minPrice_exploded_again[0];
													}
													$whole = floor($minPrice);
													$fraction = $minPrice - $whole;
													$fraction_splitted = explode('.', $fraction);
													if(!empty($fraction_splitted[1]))
													{
														$fraction = $fraction_splitted[1];
													}
													else
													{
														$fraction = $fraction_splitted[0];
													}
													if($fraction < 9)
													{
														$fraction = '0'.$fraction;
													}
													else
													{
														$fraction = $fraction;
													}
													$minPrice="$".$whole."<sup>".$fraction."</sup>";
													
													$maxPrice = $products[$out_stock_products[$increment_now]]['price'];
													$maxPrice_exploded = explode(',',$maxPrice);
													if(!empty($maxPrice_exploded[1]))
													{
														$maxPrice = $maxPrice_exploded[0].$maxPrice_exploded[1];
													}
													else
													{
														$maxPrice = $maxPrice;
													}
													$maxPrice_exploded_again = explode('$', $maxPrice);
													if(!empty($maxPrice_exploded_again[1]))
													{
														$maxPrice = $maxPrice_exploded_again[1];
													}
													else
													{
														$maxPrice = $maxPrice_exploded_again[0];
													}
													$whole = floor($maxPrice);
													$fraction = $maxPrice - $whole;
													$fraction_splitted = explode('.', $fraction);
													if(!empty($fraction_splitted[1]))
													{
														$fraction = $fraction_splitted[1];
													}
													else
													{
														$fraction = $fraction_splitted[0];
													}
													if($fraction < 9)
													{
														$fraction = '0'.$fraction;
													}
													else
													{
														$fraction = $fraction;
													}
													$maxPrice="$".$whole."<sup>".$fraction."</sup>";
												}
												$tier_count = 0;
												$disQuantities;
												$disLen = count($disQuantities);
												$increment1 = 0;
												foreach($disQuantities as $disQuantity)
												{
													if($tier_count == $disLen - 1)
													{
														$minPrice = $disQuantity['price'];
														$minPrice_exploded = explode(',',$minPrice);
														if(!empty($minPrice_exploded[1]))
														{
															$minPrice = $minPrice_exploded[0].$minPrice_exploded[1];
														}
														else
														{
															$minPrice = $minPrice;
														}
														$minPrice_exploded_again = explode('$', $minPrice);
														if(!empty($minPrice_exploded_again[1]))
														{
															$minPrice = $minPrice_exploded_again[1];
														}
														else
														{
															$minPrice = $minPrice_exploded_again[0];
														}

														$whole = floor($minPrice);
														$fraction = $minPrice - $whole;
														$fraction_splitted = explode('.', $fraction);
														if(!empty($fraction_splitted[1]))
														{
															$fraction = $fraction_splitted[1];
														}
														else
														{
															$fraction = $fraction_splitted[0];
														}
														if($fraction < 9)
														{
															$fraction = '0'.$fraction;
														}
														else
														{
															$fraction = $fraction;
														}
														$minPrice="$".$whole."<sup>".$fraction."</sup>";
													}
													
													if($increment1 == (sizeof($disQuantities)-1))
													{
														if($search_quantity >= $disQuantities[$increment1]['quantity'])
														{
															$maxPrice = $disQuantities[$increment1]['price'];
															$maxPrice_exploded = explode(',',$maxPrice);
															if(!empty($maxPrice_exploded[1]))
															{
																$maxPrice = $maxPrice_exploded[0].$maxPrice_exploded[1];
															}
															else
															{
																$maxPrice = $maxPrice;
															}
															$maxPrice_exploded_again = explode('$', $maxPrice);
															if(!empty($maxPrice_exploded_again[1]))
															{
																$maxPrice = $maxPrice_exploded_again[1];
															}
															else
															{
																$maxPrice = $maxPrice_exploded_again[0];
															}
															$whole = floor($maxPrice);
															$fraction = $maxPrice - $whole;
															$fraction_splitted = explode('.', $fraction);
															if(!empty($fraction_splitted[1]))
															{
																$fraction = $fraction_splitted[1];
															}
															else
															{
																$fraction = $fraction_splitted[0];
															}
															if($fraction < 9)
															{
																$fraction = '0'.$fraction;
															}
															else
															{
															$fraction = $fraction;
															}
															$maxPrice="$".$whole."<sup>".$fraction."</sup>";
														}
													}
													else
													{
														if($search_quantity >= $disQuantities[$increment1]['quantity'] && $search_quantity < $disQuantities[$increment1+1]['quantity'])
														{
															$maxPrice = $disQuantities[$increment1]['price'];
															$maxPrice_exploded = explode(',',$maxPrice);
															if(!empty($maxPrice_exploded[1]))
															{
																$maxPrice = $maxPrice_exploded[0].$maxPrice_exploded[1];
															}
															else
															{
																$maxPrice = $maxPrice;
															}
															$maxPrice_exploded_again = explode('$', $maxPrice);
															if(!empty($maxPrice_exploded_again[1]))
															{
																$maxPrice = $maxPrice_exploded_again[1];
															}
															else
															{
																$maxPrice = $maxPrice_exploded_again[0];
															}
															$whole = floor($maxPrice);
															$fraction = $maxPrice - $whole;
															$fraction_splitted = explode('.', $fraction);
															if(!empty($fraction_splitted[1]))
															{
																$fraction = $fraction_splitted[1];
															}
															else
															{
																$fraction = $fraction_splitted[0];
															}
															if($fraction < 9)
															{
																$fraction = '0'.$fraction;
															}
															else
															{
															$fraction = $fraction;
															}
															$maxPrice="$".$whole."<sup>".$fraction."</sup>";
														}
													}
													$increment1++;

													$tier_count++; 
												}
											?>
											<div class="amt-block-container">
												<div class="unit-price-block">
													<div class="price-block-container">
														<?php echo $maxPrice;?>
													</div>
													<div class="price-content-container">
														Unit price
													</div>
												</div>
												<div class="min-price-block">
													<div class="">
														<?php echo $minPrice;?>
													</div>
													<div class="price-content-container">
														Min price
													</div>
												</div>
												<div class="clr"></div>
												<?php
													if(!empty($products[$out_stock_products[$increment_now]]['buyer_pay_or_free_shipping']))
													{
														if($products[$out_stock_products[$increment_now]]['buyer_pay_or_free_shipping'] == 'porcantidad free shipping')
														{
															?>
															<div class="shipping-truck-block col-sm-6 green">
																<!-- <i class="fa fa-truck" aria-hidden="true"></i> -->
																<div class="shipping-content-container">
																	Shipping
																</div>
															</div>
															<?php
														}
														else
														{
															?>
															<div class="shipping-truck-block col-sm-6">
																<!--  <i class="fa fa-truck" aria-hidden="true"></i> -->
																<div class="shipping-content-container">
																	Shipping
																</div>
															</div>
															<?php
														}
													}
													else
													{
														?>
														<div class="shipping-truck-block col-sm-6 green" style='visibility:hidden'>
															<!--  <i class="fa fa-truck" aria-hidden="true"></i> -->
															<div class="shipping-content-container">
																Shipping
															</div>
														</div>
														<?php
													}
												?>
												<br>
												<div class="product-condition-block col-sm-12 padding0">
													<div class="col-sm-7 padding0 text-left product-address-block">
														<div class="product-address-content-container">
															<?php echo $products[$out_stock_products[$increment_now]]['location']; ?>
														</div>
													</div>
													<div class="col-sm-5 product-condition-content-container padding0 text-right">
														New Item
													</div>
												</div>
												<div class="clr"></div>
												<div style='color:red; font-weight:bold;line-height:0;'>
													Out of Stock
												</div>
											</div>
											<div class="over-table-block">
												<?php
													$add_selected_class;
												?>
												<div class="clr"></div>
												<div class='fix_tier_price_at_bottom'>
													<div class="product_title_tier_prices">
														<?php
															echo$products[$out_stock_products[$increment_now]]['name'];
														?>
													</div>
													
													<div class="first-amt-block">
														<?php
														$already_selected_tier_price = 0;
														//echo $disQuantities[0]['quantity'];
														if(isset($disQuantities[0]['quantity']))
														{
															if($search_quantity >= 1 && $search_quantity <  $disQuantities[0]['quantity'])
															{
																$add_selected_class = 'hover_selected_tier_price';
																$already_selected_tier_price = 1;
															}
															else
															{
																$add_selected_class = '';
															}
														}
														else
														{
															if($search_quantity >= 1)
															{
																$add_selected_class = 'hover_selected_tier_price';
																$already_selected_tier_price = 1;
															}
															else
															{
																$add_selected_class = '';
															}
														}

														?>
														<a href="#" class='prevent_default <?php echo $add_selected_class?>' quantity = 1 amount = <?php echo $products[$out_stock_products[$increment_now]]['price']; ?> product_id=<?php echo $products[$out_stock_products[$increment_now]]['product_id']?> original_quantity=1 original_price=<?php echo $products[$out_stock_products[$increment_now]]['price']; ?>>
															<div class="one-no-block prod-list-amt-first">
																1
															</div>
															<div class="one-block-amt prod-list-amt-first">
																<?php
																	$product_price = $products[$out_stock_products[$increment_now]]['price'];
																	$product_price_exploded = explode(',',$product_price);
																	if(!empty($product_price_exploded[1]))
																	{
																		$product_price = $product_price_exploded[0].$product_price_exploded[1];
																	}
																	else
																	{
																		$product_price = $product_price;
																	}
																	$product_price_exploded_again = explode('$', $product_price);
																	if(!empty($product_price_exploded_again[1]))
																	{
																		$product_price = $product_price_exploded_again[1];
																	}
																	else
																	{
																		$product_price = $product_price_exploded_again[0];
																	}
																
																	//$product_price = intval($product_price);
																	$whole = floor($product_price);
																	$fraction = $product_price - $whole;
																	$fraction_splitted = explode('.', $fraction);
																	if(!empty($fraction_splitted[1]))
																	{
																		$fraction = $fraction_splitted[1];
																	}
																	else
																	{
																		$fraction = $fraction_splitted[0];
																	}
																	if($fraction < 9)
																	{
																		$fraction = '0'.$fraction;
																	}
																	else
																	{
																		$fraction = $fraction;
																	}
																	echo $whole."<sup>".$fraction."</sup>";
																?>
															</div>
														</a>
													</div>
													<?php
														/******View all discounted quantities******/
														$previous_val = 1;
														// print_r($disQuantities);
														// exit;
														$increment = 0;
														foreach($disQuantities as $disQuantity)
														{
															$disQuantity_price = $disQuantity['price'];
															$whole = floor($disQuantity_price);
															$fraction = $disQuantity_price - $whole;
															
															$disQuantity_price = $disQuantity['price'];
															$disQuantity_price_exploded = explode(',',$disQuantity_price);
															if(!empty($disQuantity_price_exploded[1]))
															{
																$disQuantity_price = $disQuantity_price_exploded[0].$disQuantity_price_exploded[1];
															}
															else
															{
																$disQuantity_price = $disQuantity_price;
															}
															$disQuantity_price_exploded_again = explode('$', $disQuantity_price);
															if(!empty($disQuantity_price_exploded_again[1]))
															{
																$disQuantity_price = $disQuantity_price_exploded_again[1];
															}
															else
															{
																$disQuantity_price = $disQuantity_price_exploded_again[0];
															}
															$whole = floor($disQuantity_price);
															$fraction = $disQuantity_price - $whole;
															$fraction_splitted = explode('.', $fraction);
															if(!empty($fraction_splitted[1]))
															{
																$fraction = $fraction_splitted[1];
															}
															else
															{
																$fraction = $fraction_splitted[0];
															}
															if($fraction < 9)
															{
																$fraction = '0'.$fraction;
															}
															else
															{
																$fraction = $fraction;
															}
															$last_value = $currencySymb.$whole."<sup>".$fraction."</sup>";
															
															
															// if($already_selected_tier_price == 0)
															// {
																if($increment == (sizeof($disQuantities)-1))
																{
																	if($search_quantity >= $disQuantities[$increment]['quantity'])
																	{
																		$add_selected_class = 'hover_selected_tier_price';
																		$already_selected_tier_price = 1;
																	}
																	else
																	{
																		$add_selected_class = '';
																	}
																}
																else
																{
																	if($search_quantity >= $disQuantities[$increment]['quantity'] && $search_quantity < $disQuantities[$increment+1]['quantity'])
																	{
																		$add_selected_class = 'hover_selected_tier_price';
																		$already_selected_tier_price = 1;
																	}
																	else
																	{
																		$add_selected_class = '';
																	}
																}
																$increment++;
															//}
															
															?>
															
															<div class="first-amt-block">
																<a href="#" class='prevent_default <?php echo $add_selected_class ?>' quantity = <?php echo $disQuantity['quantity'];?> amount = <?php echo $currencySymb.round($disQuantity['price'],0); ?> product_id=<?php echo $products[$out_stock_products[$increment_now]]['product_id']?> original_quantity=1 original_price=<?php echo $products[$out_stock_products[$increment_now]]['price']; ?>>
																	<div class="one-no-block prod-list-amt-first">
																		<?php echo $disQuantity['quantity'];?>
																	</div>
																	<div class="one-block-amt prod-list-amt-first">
																		<?php echo $last_value;?>
																	</div>
																</a>
															</div>
															<?php
														}
													?>
													<div class="col-sm-6" style="padding: 0 4px 0;">
														<div class="in-stock-block produ-list-in-stock white">
															<?php echo $products[$out_stock_products[$increment_now]]['quantity'];?> en Stock
														</div>
														<div class="stock-content">
															<?php echo $products[$out_stock_products[$increment_now]]['location'];?> 
														</div>
													</div>
													<div class="col-sm-6 b_x_2 saved_values_element">
														<span class='percentage_saved'>
															-0%
														</span>
														<br>
														<span class='saved_amount_keyword'>
															Ahorra
														</span>
														<br>
														<span class='total_amount_saved'>
															$0!
														</span>
													</div>
												</div>
											</div>
											<div class="prod-bottom-bar grid_view_item">
												<span>% Escalade Descuentos</span>
											</div>
										</div>
									</div>
									<?php
							}
						}
						
						else
						{
							foreach ($products as $product)
							{
								?>   
								<div class="product-one-main product-one-block <?php if($prod_count%4 == 0) echo 'block-last-child';?>">							
									<?php
										if(intval($product['listing_type'])==3)
										{
											// $date1 = new DateTime(date('y-m-d'));
											// $date2 = new DateTime($product['date_added']);
											// $diff = $date2->diff($date1)->format("%a");

											// if($diff < 1)
											// {
											   echo '<span class="liquidation_ribbon"><span class="ribbon_text">Sale Off</span></span>';
											//}
										}
										else if(intval($product['listing_type'])==2)
										{
											echo '<span class="destacada_ribbon"></span>';
										}
										else if(intval($product['listing_type'])==1)
										{
											echo '<span class="gratics_ribbon"></span>';
										}
									?>
									<div class='grid-overflow'>
										<a href='#' class='whole_product_redirections prevent_default2' quantity = 1 amount = <?php echo $product['price']; ?> product_id=<?php echo $product['product_id']?> original_quantity=1 original_price=<?php echo $product['price']; ?> ></a>
											<div class="product-img-block">
												<!--<a href="<?php /*echo $product['href'];*/ ?>">--><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /><!--</a>-->
											</div>
											<div class="product-title">
												<?php echo $product['name']; ?>
											</div>
											<?php
												/******View all discounted quantities******/
												$disQuantities = $modelCat->getProductDiscounts($product['product_id']);
												$minPrice; $maxPrice;
												if ($product['price'])
												{
													$minPrice = $product['price'];
													$minPrice_exploded = explode(',',$minPrice);
													if(!empty($minPrice_exploded[1]))
													{
														$minPrice = $minPrice_exploded[0].$minPrice_exploded[1];
													}
													else
													{
														$minPrice = $minPrice;
													}
													$minPrice_exploded_again = explode('$', $minPrice);
													if(!empty($minPrice_exploded_again[1]))
													{
														$minPrice = $minPrice_exploded_again[1];
													}
													else
													{
														$minPrice = $minPrice_exploded_again[0];
													}
													$whole = floor($minPrice);
													$fraction = $minPrice - $whole;
													$fraction_splitted = explode('.', $fraction);
													if(!empty($fraction_splitted[1]))
													{
														$fraction = $fraction_splitted[1];
													}
													else
													{
														$fraction = $fraction_splitted[0];
													}
													if($fraction < 9)
													{
														$fraction = '0'.$fraction;
													}
													else
													{
														$fraction = $fraction;
													}
													$minPrice="$".$whole."<sup>".$fraction."</sup>";
													
													$maxPrice = $product['price'];
													$maxPrice_exploded = explode(',',$maxPrice);
													if(!empty($maxPrice_exploded[1]))
													{
														$maxPrice = $maxPrice_exploded[0].$maxPrice_exploded[1];
													}
													else
													{
														$maxPrice = $maxPrice;
													}
													$maxPrice_exploded_again = explode('$', $maxPrice);
													if(!empty($maxPrice_exploded_again[1]))
													{
														$maxPrice = $maxPrice_exploded_again[1];
													}
													else
													{
														$maxPrice = $maxPrice_exploded_again[0];
													}
													$whole = floor($maxPrice);
													$fraction = $maxPrice - $whole;
													$fraction_splitted = explode('.', $fraction);
													if(!empty($fraction_splitted[1]))
													{
														$fraction = $fraction_splitted[1];
													}
													else
													{
														$fraction = $fraction_splitted[0];
													}
													if($fraction < 9)
													{
														$fraction = '0'.$fraction;
													}
													else
													{
														$fraction = $fraction;
													}
													$maxPrice="$".$whole."<sup>".$fraction."</sup>";
												}
												$tier_count = 0;
												$disQuantities;
												$disLen = count($disQuantities);
												$increment1 = 0;
												foreach($disQuantities as $disQuantity)
												{
													if($tier_count == $disLen - 1)
													{
														$minPrice = $disQuantity['price'];
														$minPrice_exploded = explode(',',$minPrice);
														if(!empty($minPrice_exploded[1]))
														{
															$minPrice = $minPrice_exploded[0].$minPrice_exploded[1];
														}
														else
														{
															$minPrice = $minPrice;
														}
														$minPrice_exploded_again = explode('$', $minPrice);
														if(!empty($minPrice_exploded_again[1]))
														{
															$minPrice = $minPrice_exploded_again[1];
														}
														else
														{
															$minPrice = $minPrice_exploded_again[0];
														}

														$whole = floor($minPrice);
														$fraction = $minPrice - $whole;
														$fraction_splitted = explode('.', $fraction);
														if(!empty($fraction_splitted[1]))
														{
															$fraction = $fraction_splitted[1];
														}
														else
														{
															$fraction = $fraction_splitted[0];
														}
														if($fraction < 9)
														{
															$fraction = '0'.$fraction;
														}
														else
														{
															$fraction = $fraction;
														}
														$minPrice="$".$whole."<sup>".$fraction."</sup>";
													}
													
													if($increment1 == (sizeof($disQuantities)-1))
													{
														if($search_quantity >= $disQuantities[$increment1]['quantity'])
														{
															$maxPrice = $disQuantities[$increment1]['price'];
															$maxPrice_exploded = explode(',',$maxPrice);
															if(!empty($maxPrice_exploded[1]))
															{
																$maxPrice = $maxPrice_exploded[0].$maxPrice_exploded[1];
															}
															else
															{
																$maxPrice = $maxPrice;
															}
															$maxPrice_exploded_again = explode('$', $maxPrice);
															if(!empty($maxPrice_exploded_again[1]))
															{
																$maxPrice = $maxPrice_exploded_again[1];
															}
															else
															{
																$maxPrice = $maxPrice_exploded_again[0];
															}
															$whole = floor($maxPrice);
															$fraction = $maxPrice - $whole;
															$fraction_splitted = explode('.', $fraction);
															if(!empty($fraction_splitted[1]))
															{
																$fraction = $fraction_splitted[1];
															}
															else
															{
																$fraction = $fraction_splitted[0];
															}
															if($fraction < 9)
															{
																$fraction = '0'.$fraction;
															}
															else
															{
															$fraction = $fraction;
															}
															$maxPrice="$".$whole."<sup>".$fraction."</sup>";
														}
													}
													else
													{
														if($search_quantity >= $disQuantities[$increment1]['quantity'] && $search_quantity < $disQuantities[$increment1+1]['quantity'])
														{
															$maxPrice = $disQuantities[$increment1]['price'];
															$maxPrice_exploded = explode(',',$maxPrice);
															if(!empty($maxPrice_exploded[1]))
															{
																$maxPrice = $maxPrice_exploded[0].$maxPrice_exploded[1];
															}
															else
															{
																$maxPrice = $maxPrice;
															}
															$maxPrice_exploded_again = explode('$', $maxPrice);
															if(!empty($maxPrice_exploded_again[1]))
															{
																$maxPrice = $maxPrice_exploded_again[1];
															}
															else
															{
																$maxPrice = $maxPrice_exploded_again[0];
															}
															$whole = floor($maxPrice);
															$fraction = $maxPrice - $whole;
															$fraction_splitted = explode('.', $fraction);
															if(!empty($fraction_splitted[1]))
															{
																$fraction = $fraction_splitted[1];
															}
															else
															{
																$fraction = $fraction_splitted[0];
															}
															if($fraction < 9)
															{
																$fraction = '0'.$fraction;
															}
															else
															{
															$fraction = $fraction;
															}
															$maxPrice="$".$whole."<sup>".$fraction."</sup>";
														}
													}
													$increment1++;

													$tier_count++; 
												}
											?>
											<div class="amt-block-container">
												<div class="unit-price-block">
													<div class="price-block-container">
														<?php echo $maxPrice;?>
													</div>
													<div class="price-content-container">
														Unit price
													</div>
												</div>
												<div class="min-price-block">
													<div class="">
														<?php echo $minPrice;?>
													</div>
													<div class="price-content-container">
														Min price
													</div>
												</div>
												<div class="clr"></div>
												<?php
													if(!empty($product['buyer_pay_or_free_shipping']))
													{
														if($product['buyer_pay_or_free_shipping'] == 'porcantidad free shipping')
														{
															?>
															<div class="shipping-truck-block col-sm-6 green">
																<!-- <i class="fa fa-truck" aria-hidden="true"></i> -->
																<div class="shipping-content-container">
																	Shipping
																</div>
															</div>
															<?php
														}
														else
														{
															?>
															<div class="shipping-truck-block col-sm-6">
																<!--  <i class="fa fa-truck" aria-hidden="true"></i> -->
																<div class="shipping-content-container">
																	Shipping
																</div>
															</div>
															<?php
														}
													}
													else
													{
														?>
														<div class="shipping-truck-block col-sm-6 green" style='visibility:hidden'>
															<!--  <i class="fa fa-truck" aria-hidden="true"></i> -->
															<div class="shipping-content-container">
																Shipping
															</div>
														</div>
														<?php
													}
												?>
												<br>
												<div class="product-condition-block col-sm-12 padding0">
													<div class="col-sm-7 padding0 text-left product-address-block">
														<div class="product-address-content-container">
															<?php echo $product['location']; ?>
														</div>
													</div>
													<div class="col-sm-5 product-condition-content-container padding0 text-right">
														New Item
													</div>
												</div>
												<div class="clr"></div>
												<?php
													if($product['quantity'] < $search_quantity)
													{
														?>
														<div style='color:red; font-weight:bold;line-height:0;'>
															Out of Stock
														</div>
														<?php
													}
												?>
												
											</div>
											<div class="over-table-block">
												<?php
													$add_selected_class;
												?>
												<div class="clr"></div>
												<div class='fix_tier_price_at_bottom'>
													<div class="product_title_tier_prices">
														<?php
															echo $product['name'];
														?>
													</div>
													
													<div class="first-amt-block">
														<?php
														$already_selected_tier_price = 0;
														//echo $disQuantities[0]['quantity'];
														if(isset($disQuantities[0]['quantity']))
														{
															if($search_quantity >= 1 && $search_quantity <  $disQuantities[0]['quantity'])
															{
																$add_selected_class = 'hover_selected_tier_price';
																$already_selected_tier_price = 1;
															}
															else
															{
																$add_selected_class = '';
															}
														}
														else
														{
															if($search_quantity >= 1)
															{
																$add_selected_class = 'hover_selected_tier_price';
																$already_selected_tier_price = 1;
															}
															else
															{
																$add_selected_class = '';
															}
														}

														?>
														<a href="#" class='prevent_default <?php echo $add_selected_class?>' quantity = 1 amount = <?php echo $product['price']; ?> product_id=<?php echo $product['product_id']?> original_quantity=1 original_price=<?php echo $product['price']; ?>>
															<div class="one-no-block prod-list-amt-first">
																1
															</div>
															<div class="one-block-amt prod-list-amt-first">
																<?php
																	$product_price = $product['price'];
																	$product_price_exploded = explode(',',$product_price);
																	if(!empty($product_price_exploded[1]))
																	{
																		$product_price = $product_price_exploded[0].$product_price_exploded[1];
																	}
																	else
																	{
																		$product_price = $product_price;
																	}
																	$product_price_exploded_again = explode('$', $product_price);
																	if(!empty($product_price_exploded_again[1]))
																	{
																		$product_price = $product_price_exploded_again[1];
																	}
																	else
																	{
																		$product_price = $product_price_exploded_again[0];
																	}
																
																	//$product_price = intval($product_price);
																	$whole = floor($product_price);
																	$fraction = $product_price - $whole;
																	$fraction_splitted = explode('.', $fraction);
																	if(!empty($fraction_splitted[1]))
																	{
																		$fraction = $fraction_splitted[1];
																	}
																	else
																	{
																		$fraction = $fraction_splitted[0];
																	}
																	if($fraction < 9)
																	{
																		$fraction = '0'.$fraction;
																	}
																	else
																	{
																		$fraction = $fraction;
																	}
																	echo $whole."<sup>".$fraction."</sup>";
																?>
															</div>
														</a>
													</div>
													<?php
														/******View all discounted quantities******/
														$previous_val = 1;
														// print_r($disQuantities);
														// exit;
														$increment = 0;
														foreach($disQuantities as $disQuantity)
														{
															$disQuantity_price = $disQuantity['price'];
															$whole = floor($disQuantity_price);
															$fraction = $disQuantity_price - $whole;
															
															$disQuantity_price = $disQuantity['price'];
															$disQuantity_price_exploded = explode(',',$disQuantity_price);
															if(!empty($disQuantity_price_exploded[1]))
															{
																$disQuantity_price = $disQuantity_price_exploded[0].$disQuantity_price_exploded[1];
															}
															else
															{
																$disQuantity_price = $disQuantity_price;
															}
															$disQuantity_price_exploded_again = explode('$', $disQuantity_price);
															if(!empty($disQuantity_price_exploded_again[1]))
															{
																$disQuantity_price = $disQuantity_price_exploded_again[1];
															}
															else
															{
																$disQuantity_price = $disQuantity_price_exploded_again[0];
															}
															$whole = floor($disQuantity_price);
															$fraction = $disQuantity_price - $whole;
															$fraction_splitted = explode('.', $fraction);
															if(!empty($fraction_splitted[1]))
															{
																$fraction = $fraction_splitted[1];
															}
															else
															{
																$fraction = $fraction_splitted[0];
															}
															if($fraction < 9)
															{
																$fraction = '0'.$fraction;
															}
															else
															{
																$fraction = $fraction;
															}
															$last_value = $currencySymb.$whole."<sup>".$fraction."</sup>";
															
															
															// if($already_selected_tier_price == 0)
															// {
																if($increment == (sizeof($disQuantities)-1))
																{
																	if($search_quantity >= $disQuantities[$increment]['quantity'])
																	{
																		$add_selected_class = 'hover_selected_tier_price';
																		$already_selected_tier_price = 1;
																	}
																	else
																	{
																		$add_selected_class = '';
																	}
																}
																else
																{
																	if($search_quantity >= $disQuantities[$increment]['quantity'] && $search_quantity < $disQuantities[$increment+1]['quantity'])
																	{
																		$add_selected_class = 'hover_selected_tier_price';
																		$already_selected_tier_price = 1;
																	}
																	else
																	{
																		$add_selected_class = '';
																	}
																}
																$increment++;
															//}
															
															?>
															
															<div class="first-amt-block">
																<a href="#" class='prevent_default <?php echo $add_selected_class ?>' quantity = <?php echo $disQuantity['quantity'];?> amount = <?php echo $currencySymb.round($disQuantity['price'],0); ?> product_id=<?php echo $product['product_id']?> original_quantity=1 original_price=<?php echo $product['price']; ?>>
																	<div class="one-no-block prod-list-amt-first">
																		<?php echo $disQuantity['quantity'];?>
																	</div>
																	<div class="one-block-amt prod-list-amt-first">
																		<?php echo $last_value;?>
																	</div>
																</a>
															</div>
															<?php
														}
													?>
													<div class="col-sm-6" style="padding: 0 4px 0;">
														<div class="in-stock-block produ-list-in-stock white">
															<?php echo $product['quantity'];?> en Stock
														</div>
														<div class="stock-content">
															<?php echo $product['location'];?> 
														</div>
													</div>
													<div class="col-sm-6 b_x_2 saved_values_element">
														<span class='percentage_saved'>
															-0%
														</span>
														<br>
														<span class='saved_amount_keyword'>
															Ahorra
														</span>
														<br>
														<span class='total_amount_saved'>
															$0!
														</span>
													</div>
												</div>
											</div>
											<div class="prod-bottom-bar grid_view_item">
												<span>% Escalade Descuentos</span>
											</div>
										</div>
									</div>
									<?php
									// $prod_count++;
								
							}
						}
						
					?>
					<div class="clr"></div> 
				</div>
				<?php 
					if(!$categories && !$products)
					{
						?>
						<p>
							<?php
								echo $text_empty;
							?>
						</p>
						<div class="buttons">
							<div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
						</div>
						<?php
					}
			}
			else
			{
				?>
				<div class="produ-list-top-block">
					<?php 
						//if(!empty($results))
						//{
							//echo $results;
						//}
					?>
				</div>
				<div class="list-gread-block">
					<a href="javascript:void(0)" class='list_view'><i class="fa fa-th-list gread-mar-img"></i></a>
					<a href="javascript:void(0)" class='grid_view' ><i class="fa fa-th-large grid-acti"></i></a>
				</div>           
				<!-- <div class="col-sm-2">
					<select name="location" class="highprice-select" onchange="change_location2(alert(this.value));">
						<option value="0"><?php echo $text_category; ?></option>
						<?php 
							//foreach($locations as $location)
							//{	?>   
								<option value="<?php //echo $location['location'] ?>"><?php //echo $location['location'] ?></option>
								<?php
							//}
						?>
					</select>
				</div> -->
				
			
				<div class="drop-btn-relev">
					<div class="dropdown-btn">

						<select id="input-sort" class="highprice-select" onchange="change_location4(this.value);"  >
							<?php foreach ($sorts as $sorts) { ?>
							<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
							<option value="<?php echo $sorts['value']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
							<?php } else { ?>
							<option value="<?php echo $sorts['value']; ?>"><?php echo $sorts['text']; ?></option>
							<?php } ?>
							<?php } ?>
						</select>
					</div>
				</div>
				
				<div class="clr"></div>
			</div>
			
			<div class="product-main-container grid_wrap" style="min-height: 400px  !important;">  
				<h3 class='col-sm-8 alert alert-warning'>Nothing found...</h3>
			</div>
			<?php
		}
	?>
					<div class="product-main-container list_wrap" style="min-height: 450px !important;">
						<div class="product-list-block">
							<?php
							$out_stock_products = array();
							if($products)
							{
							if($is_sort_set=='yes')
							{
								$increment_for_stock=0;
								$product_increment_stock = 0;
								foreach ($products as $product)
								{
									if($search_quantity < $product['quantity'])
									{
										?> 
								<div class="ribbon_immediate_after">
									<?php
									if(intval($product['listing_type'])==3)
									{
										// $date1 = new DateTime(date('y-m-d'));
										// $date2 = new DateTime($product['date_added']);
										// $diff = $date2->diff($date1)->format("%a");
										// if($diff < 30)
										// {
											  echo'<span class="liquidation_ribbon"><span class="ribbon_text">Sale Off</span></span>';
										// }
									}
									else if(intval($product['listing_type'])==2)
									{
										echo'<span class="destacada_ribbon"></span>';
									}
									else if(intval($product['listing_type'])==1)
									{
										echo'<span class="gratics_ribbon"></span>';
									}
						?>
						<div class="col-sm-7 col-md-7 col-lg-9 pr0">
							<div class="list-hover-view">
								<a href='#' class='whole_product_redirections prevent_default2' quantity = 1 amount = <?php echo $product['price']; ?> product_id=<?php echo $product['product_id']?> original_quantity=1 original_price=<?php echo $product['price']; ?> ></a>
													<!-- <div class="heart-block-container">
														<a href="#"><img src="http://porcantidad.leadconcept.biz/upload/image/assets/images/over-heart-img.png" alt=""></a>
													</div> -->
													<div class="product-img-block">
														<img src="<?php echo $product['thumb']; ?>" alt="">
													</div>
													<div class="list-view-name">
														<div class="product-head">
															<?php echo $product['name']; ?>
														</div>
														<div class="product-content">
															<?php  echo strip_tags ($product['description']);?>
														</div>
														<!-- <div class="location-list"><?php //echo $product['location']; ?><i class="fa fa-map-marker"></i>
														</div> -->
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
																		if($search_quantity == 1)
																		{
																			$add_selected_class = 'hover_effect_tier_price_list';
																		}
																		else
																		{
																			$add_selected_class = '';
																		}
																	?>
																	<td style="cursor:pointer" class="prevent_default_list <?php echo $add_selected_class?>" hover_effect_selector='0' quantity = 1 amount = <?php echo $product['price']; ?> product_id=<?php echo $product['product_id']?> original_quantity=1 original_price=<?php echo $product['price']; ?> >1</td>
																	<?php
																	$effect_value=1;
																	
																	foreach ($disQuantities as $disQuantity)
																	{
																		if($search_quantity == $disQuantity['quantity'])
																		{
																			$add_selected_class = 'hover_effect_tier_price_list';
																		}
																		else
																		{
																			$add_selected_class = '';
																		}
																		?>
																		<td style="cursor:pointer" class="prevent_default_list <?php echo $add_selected_class?>" hover_effect_selector='<?php echo $effect_value ?>' quantity = <?php echo $disQuantity['quantity'];?> amount = <?php echo $currencySymb.round($disQuantity['price'],0); ?> product_id=<?php echo $product['product_id']?> original_quantity=1 original_price=<?php echo $product['price']; ?> ><?php echo $disQuantity['quantity'];?></td>
																		<?php
																			$effect_value++;
																	}
																	?>
																	<td rowspan="2" class='saved_values_element'>
																		<span class='list_view_saved_percent'>
																			-0%
																		</span>
																		<br>
																		<span class='list_view_saved_amount_keyword'>
																			Ahorra
																		</span>
																		<br>
																		<span class='list_view_saved_amount_value'>
																			$0!
																		</span>
																	</td>
																</tr>
																<tr class="first-amt-block">
																	<?php
																		$product_price = $product['price'];
																		$product_price_exploded = explode(',',$product_price);
																		if(!empty($product_price_exploded[1]))
																		{
																			$product_price = $product_price_exploded[0].$product_price_exploded[1];
																		}
																		else
																		{
																			$product_price = $product_price;
																		}
																		$product_price_exploded_again = explode('$', $product_price);
																		if(!empty($product_price_exploded_again[1]))
																		{
																			$product_price = $product_price_exploded_again[1];
																		}
																		else
																		{
																			$product_price = $product_price_exploded_again[0];
																		}
																		//$product_price = intval($product_price);
																		$whole = floor($product_price);
																		$fraction = $product_price - $whole;
																		$fraction_splitted = explode('.', $fraction);
																		if(!empty($fraction_splitted[1]))
																		{
																			$fraction = $fraction_splitted[1];
																		}
																		else
																		{
																			$fraction = $fraction_splitted[0];
																		}
											
																		if($fraction < 9)
																		{
																			$fraction = '0'.$fraction;
																		}
																		else
																		{
																			$fraction = $fraction;
																		}
																		//$product_price="$".$whole."<sup>".$fraction."</sup>";
																		
																		
																		if(isset($disQuantities[0]['quantity']))
																		{
																			if($search_quantity >= 1 && $search_quantity <  $disQuantities[0]['quantity'])
																			{
																				$add_selected_class = 'hover_effect_tier_price_list';
																				$already_selected_tier_price = 1;
																			}
																			else
																			{
																				$add_selected_class = '';
																			}
																		}
																		else
																		{
																			if($search_quantity >= 1)
																			{
																				$add_selected_class = 'hover_effect_tier_price_list';
																				$already_selected_tier_price = 1;
																			}
																			else
																			{
																				$add_selected_class = '';
																			}
																		}
																		
																		
																		
																		// if($search_quantity == 1)
																		// {
																			// $add_selected_class = 'hover_effect_tier_price_list';
																		// }
																		// else
																		// {
																			// $add_selected_class = '';
																		// }
																	?>
																	
																	<td style="cursor:pointer" class="prevent_default_list <?php echo $add_selected_class?>" hover_effect_selector='0' quantity = 1 amount = <?php echo $product['price']; ?> product_id=<?php echo $product['product_id']?> original_quantity=1 original_price=<?php echo $product['price']; ?> ><?php echo $currencySymb.$whole."<sup>".$fraction."</sup>";?></td>
																		<?php
																			$effect_value = 1;
																			$increment = 0;
																			foreach ($disQuantities as $disQuantity)
																			{
																				$disQuantity_price = $disQuantity['price'];
																				$whole = floor($disQuantity_price);
																				$fraction = $disQuantity_price - $whole;
																				
																				$disQuantity_price = $disQuantity['price'];
																				$disQuantity_price_exploded = explode(',',$disQuantity_price);
																				if(!empty($disQuantity_price_exploded[1]))
																				{
																					$disQuantity_price = $disQuantity_price_exploded[0].$disQuantity_price_exploded[1];
																				}
																				else
																				{
																					$disQuantity_price = $disQuantity_price;
																				}
																				$disQuantity_price_exploded_again = explode('$', $disQuantity_price);
																				if(!empty($disQuantity_price_exploded_again[1]))
																				{
																					$disQuantity_price = $disQuantity_price_exploded_again[1];
																				}
																				else
																				{
																					$disQuantity_price = $disQuantity_price_exploded_again[0];
																				}
																				//$minPrice = $minPrice_exploded_again[1];
																				//$disQuantity_price = intval($disQuantity_price);
																				$whole = floor($disQuantity_price);
																				$fraction = $disQuantity_price - $whole;
																				$fraction_splitted = explode('.', $fraction);
																				if(!empty($fraction_splitted[1]))
																				{
																					$fraction = $fraction_splitted[1];
																				}
																				else
																				{
																					$fraction = $fraction_splitted[0];
																				}
																				if($fraction < 9)
																				{
																					$fraction = '0'.$fraction;
																				}
																				else
																				{
																					$fraction = $fraction;
																				}
																				$last_value = $currencySymb.$whole."<sup>".$fraction."</sup>";
																				//$last_value = $currencySymb.$whole."<sup>".$fraction."</sup>"
																				
																				
																				if($increment == (sizeof($disQuantities)-1))
																				{
																					if($search_quantity >= $disQuantities[$increment]['quantity'])
																					{
																						$add_selected_class = 'hover_effect_tier_price_list';
																						$already_selected_tier_price = 1;
																					}
																					else
																					{
																						$add_selected_class = '';
																					}
																				}
																				else
																				{
																					if($search_quantity >= $disQuantities[$increment]['quantity'] && $search_quantity < $disQuantities[$increment+1]['quantity'])
																					{
																						$add_selected_class = 'hover_effect_tier_price_list';
																						$already_selected_tier_price = 1;
																					}
																					else
																					{
																						$add_selected_class = '';
																					}
																				}
																				$increment++;
																				
																				
																				
																				
																				
																				// if($search_quantity == $disQuantity['quantity'])
																				// {
																					// $add_selected_class = 'hover_effect_tier_price_list';
																				// }
																				// else
																				// {
																					// $add_selected_class = '';
																				// }
																			
																			?>
																			<td style="cursor:pointer" class="prevent_default_list <?php echo $add_selected_class ?>" hover_effect_selector='<?php echo $effect_value ?>' quantity = <?php echo $disQuantity['quantity'];?> amount = <?php echo $currencySymb.round($disQuantity['price'],0); ?> product_id=<?php echo $product['product_id']?> original_quantity=1 original_price=<?php echo $product['price']; ?>> <?php echo $last_value; ?></td>
																				<?php
																					$effect_value++;
																		}
																			?>
																	</tr>
																	<tr>
																		<td colspan="6" class='product_tier_price_details_portion'><span id="feature_dialogue"><?php echo $product['name'] ?></span>
																			<br>
																			<span id="feauture_d_after">Stock <?php echo $product['quantity'];  ?> - Belgrano, <?php echo $product['location'];  ?></span>
																		</td>
																	</tr>
																</tbody>
															</table>
														<!--
															<div class="in-stock-block produ-list-in-stock">
																<?php // echo $product['quantity'];  ?>en Stock
															</div>
															<div class="stock-content">
																<?php // echo $product['location'];  ?>
															</div>
														-->
													</div>
													<div class="prod-bottom-bar right">
														<span><span>%</span> Escalade Descuentos</span>
													</div>
												</div>
											</div>
											<?php
												/******View all discounted quantities******/
												$disQuantities = $modelCat->getProductDiscounts($product['product_id']);
												$minPrice; $maxPrice;
												if ($product['price'])
												{
													// $minPrice = $product['price'];
													// $minPrice=explode('.',$product['price']);
													// $minPrice=$minPrice[0];
													$minPrice = $product['price'];
													$minPrice_exploded = explode(',',$minPrice);
													if(!empty($minPrice_exploded[1]))
													{
														$minPrice = $minPrice_exploded[0].$minPrice_exploded[1];
													}
													else
													{
														$minPrice = $minPrice;
													}
													$minPrice_exploded_again = explode('$', $minPrice);
													if(!empty($minPrice_exploded_again[1]))
													{
														$minPrice = $minPrice_exploded_again[1];
													}
													else
													{
														$minPrice = $minPrice_exploded_again[0];
													}
													//$minPrice = $minPrice_exploded_again[1];
													//$minPrice = intval($minPrice);
													$whole = floor($minPrice);
													$fraction = $minPrice - $whole;
													$fraction_splitted = explode('.', $fraction);
													if(!empty($fraction_splitted[1]))
													{
														$fraction = $fraction_splitted[1];
													}
													else
													{
														$fraction = $fraction_splitted[0];
													}
													if($fraction < 9)
													{
														$fraction = '0'.$fraction;
													}
													else
													{
														$fraction = $fraction;
													}
													$minPrice="$".$whole."<sup>".$fraction."</sup>";
													
													
													
													if(isset($disQuantities[0]['quantity']))
													{
														if($search_quantity >= 1 && $search_quantity <  $disQuantities[0]['quantity'])
														{
															$maxPrice = $product['price'];
															$maxPrice_exploded = explode(',',$maxPrice);
															if(!empty($maxPrice_exploded[1]))
															{
																$maxPrice = $maxPrice_exploded[0].$maxPrice_exploded[1];
															}
															else
															{
																$maxPrice = $maxPrice;
															}
															$maxPrice_exploded_again = explode('$', $maxPrice);
															if(!empty($maxPrice_exploded_again[1]))
															{
																$maxPrice = $maxPrice_exploded_again[1];
															}
															else
															{
																$maxPrice = $maxPrice_exploded_again[0];
															}
															//$maxPrice = $maxPrice_exploded_again[1];
															//$maxPrice = intval($maxPrice);
															$whole = floor($maxPrice);
															$fraction = $maxPrice - $whole;
															$fraction_splitted = explode('.', $fraction);
															if(!empty($fraction_splitted[1]))
															{
																$fraction = $fraction_splitted[1];
															}
															else
															{
																$fraction = $fraction_splitted[0];
															}
															if($fraction < 9)
															{
																$fraction = '0'.$fraction;
															}
															else
															{
																$fraction = $fraction;
															}
															$maxPrice="$".$whole."<sup>".$fraction."</sup>";
															
														}
													}
													else
													{
														if($search_quantity >= 1)
														{
															$maxPrice = $product['price'];
															$maxPrice_exploded = explode(',',$maxPrice);
															if(!empty($maxPrice_exploded[1]))
															{
																$maxPrice = $maxPrice_exploded[0].$maxPrice_exploded[1];
															}
															else
															{
																$maxPrice = $maxPrice;
															}
															$maxPrice_exploded_again = explode('$', $maxPrice);
															if(!empty($maxPrice_exploded_again[1]))
															{
																$maxPrice = $maxPrice_exploded_again[1];
															}
															else
															{
																$maxPrice = $maxPrice_exploded_again[0];
															}
															//$maxPrice = $maxPrice_exploded_again[1];
															//$maxPrice = intval($maxPrice);
															$whole = floor($maxPrice);
															$fraction = $maxPrice - $whole;
															$fraction_splitted = explode('.', $fraction);
															if(!empty($fraction_splitted[1]))
															{
																$fraction = $fraction_splitted[1];
															}
															else
															{
																$fraction = $fraction_splitted[0];
															}
															if($fraction < 9)
															{
																$fraction = '0'.$fraction;
															}
															else
															{
																$fraction = $fraction;
															}
															$maxPrice="$".$whole."<sup>".$fraction."</sup>";
														}
													}
												}
												$tier_count = 0;
												$disQuantities;
												$disLen = count($disQuantities);
												$increment2 = 0;
												foreach ($disQuantities as $disQuantity)
												{
													// if ($tier_count == 0)
													// {
													// /*$maxPrice = round($disQuantity['price'], 0);*/
													// }
													// else 
													if ($tier_count == $disLen - 1)
													{
														//$minPrice = round($disQuantity['price'], 0);
														// $minPrice = $disQuantity['price'];
														// $whole = floor($minPrice);
														// $fraction = $minPrice - $whole;
														// $minPrice=$whole."<sup>".$fraction."</sup>";
													
														$minPrice = $disQuantity['price'];
														$minPrice_exploded = explode(',',$minPrice);
														if(!empty($minPrice_exploded[1]))
														{
															$minPrice = $minPrice_exploded[0].$minPrice_exploded[1];
														}
														else
														{
															$minPrice = $minPrice;
														}
														$minPrice_exploded_again = explode('$', $minPrice);
														if(!empty($minPrice_exploded_again[1]))
														{
															$minPrice = $minPrice_exploded_again[1];
														}
														else
														{
															$minPrice = $minPrice_exploded_again[0];
														}
														//$minPrice = $minPrice_exploded_again[1];
														//$minPrice = intval($minPrice);
														$whole = floor($minPrice);
														$fraction = $minPrice - $whole;
														$fraction_splitted = explode('.', $fraction);
														if(!empty($fraction_splitted[1]))
														{
															$fraction = $fraction_splitted[1];
														}
														else
														{
															$fraction = $fraction_splitted[0];
														}
														if($fraction < 9)
														{
															$fraction = '0'.$fraction;
														}
														else
														{
															$fraction = $fraction;
														}
														$minPrice="$".$whole."<sup>".$fraction."</sup>";
														//$minPrice="$".$whole."<sup>".$fraction."</sup>";
													}
													
													if($increment2 == (sizeof($disQuantities)-1))
													{
														if($search_quantity >= $disQuantities[$increment2]['quantity'])
														{
															$maxPrice = $disQuantities[$increment2]['price'];
															$maxPrice_exploded = explode(',',$maxPrice);
															if(!empty($maxPrice_exploded[1]))
															{
																$maxPrice = $maxPrice_exploded[0].$maxPrice_exploded[1];
															}
															else
															{
																$maxPrice = $maxPrice;
															}
															$maxPrice_exploded_again = explode('$', $maxPrice);
															if(!empty($maxPrice_exploded_again[1]))
															{
																$maxPrice = $maxPrice_exploded_again[1];
															}
															else
															{
																$maxPrice = $maxPrice_exploded_again[0];
															}
															$whole = floor($maxPrice);
															$fraction = $maxPrice - $whole;
															$fraction_splitted = explode('.', $fraction);
															if(!empty($fraction_splitted[1]))
															{
																$fraction = $fraction_splitted[1];
															}
															else
															{
																$fraction = $fraction_splitted[0];
															}
															if($fraction < 9)
															{
																$fraction = '0'.$fraction;
															}
															else
															{
															$fraction = $fraction;
															}
															$maxPrice="$".$whole."<sup>".$fraction."</sup>";
														}
													}
													else
													{
														if($search_quantity >= $disQuantities[$increment2]['quantity'] && $search_quantity < $disQuantities[$increment2+1]['quantity'])
														{
															$maxPrice = $disQuantities[$increment2]['price'];
															$maxPrice_exploded = explode(',',$maxPrice);
															if(!empty($maxPrice_exploded[1]))
															{
																$maxPrice = $maxPrice_exploded[0].$maxPrice_exploded[1];
															}
															else
															{
																$maxPrice = $maxPrice;
															}
															$maxPrice_exploded_again = explode('$', $maxPrice);
															if(!empty($maxPrice_exploded_again[1]))
															{
																$maxPrice = $maxPrice_exploded_again[1];
															}
															else
															{
																$maxPrice = $maxPrice_exploded_again[0];
															}
															$whole = floor($maxPrice);
															$fraction = $maxPrice - $whole;
															$fraction_splitted = explode('.', $fraction);
															if(!empty($fraction_splitted[1]))
															{
																$fraction = $fraction_splitted[1];
															}
															else
															{
																$fraction = $fraction_splitted[0];
															}
															if($fraction < 9)
															{
																$fraction = '0'.$fraction;
															}
															else
															{
															$fraction = $fraction;
															}
															$maxPrice="$".$whole."<sup>".$fraction."</sup>";
														}
													}
													$increment2++;
													
													$tier_count++; 
												}
											?>
											<div class="col-sm-5 col-md-5 col-lg-3">
												<div class="border-le">
													<div class="amt-block-container">
														<div class="unit-price-block">
															<div class="price-block-container">
																<?php
																echo  $maxPrice;
																?>
															</div>
															<div class="price-content-container">
																Unit price
															</div>
														</div>
														<div class="min-price-block">
															<div class="min-block-container">
																<?php  echo $minPrice; ?>
															</div>
															<div class="min-content-container">
																Min price
															</div>
														</div>
														<div class="clr"></div>
														<?php
														if(!empty($product['buyer_pay_or_free_shipping']))
														{
															if($product['buyer_pay_or_free_shipping'] == 'porcantidad free shipping')
															{
																?>
																<div class="shipping-truck-block col-sm-6 green">
																	<!-- <i class="fa fa-truck" aria-hidden="true"></i>-->
																	<div class="shipping-content-container">
																		Shipping
																	</div>
																</div>
																<?php
															}
															else
															{	?>
																<div class="shipping-truck-block col-sm-6">
																	<!-- <i class="fa fa-truck" aria-hidden="true"></i> -->
																	<div class="shipping-content-container">
																		Shipping
																	</div>
																</div>
																<?php
															}
														}
														else
														{
															?>
															<div class="shipping-truck-block col-sm-6 green" style='visibility:hidden'>
																<!-- <i class="fa fa-truck" aria-hidden="true"></i> -->
																<div class="shipping-content-container">
																	Shipping
																</div>
															</div>
															<?php
														}
														?>
														<div class="product-condition-block col-sm-6 padding0">
														<div class="product-condition-content-container">
															
															New Item
														</div>
														<div class="product-address-block">
															<div class="product-address-content-container">
																<?php echo $product['location']; ?>
																
															</div>
														</div>
													</div>
													<div class="clr"></div>
												</div>
											</div>
										</div>
									</div>
									<?php
									}
									else
									{
										$out_stock_products[$increment_for_stock] = $product_increment_stock;
										$increment_for_stock++;
									}
									$product_increment_stock++;
								}
								
								
								
								for($increment_now = 0; $increment_now < sizeof($out_stock_products); $increment_now++)
								{
									?> 
								<div class="ribbon_immediate_after">
									<?php
								if(intval($products[$out_stock_products[$increment_now]]['listing_type'])==3)
									{
										// $date1 = new DateTime(date('y-m-d'));
										// $date2 = new DateTime($product['date_added']);
										// $diff = $date2->diff($date1)->format("%a");
										// if($diff < 30)
										// {
											  echo'<span class="liquidation_ribbon"><span class="ribbon_text">Sale Off</span></span>';
										// }
									}
									else if(intval($products[$out_stock_products[$increment_now]]['listing_type'])==2)
									{
										echo'<span class="destacada_ribbon"></span>';
									}
									else if(intval($products[$out_stock_products[$increment_now]]['listing_type'])==1)
									{
										echo'<span class="gratics_ribbon"></span>';
									}
						?>
						<div class="col-sm-7 col-md-7 col-lg-9 pr0">
							<div class="list-hover-view">
								<a href='#' class='whole_product_redirections prevent_default2' quantity = 1 amount = <?php echo $products[$out_stock_products[$increment_now]]['price']; ?> product_id=<?php echo $products[$out_stock_products[$increment_now]]['product_id']?> original_quantity=1 original_price=<?php echo $products[$out_stock_products[$increment_now]]['price']; ?> ></a>
													<!-- <div class="heart-block-container">
														<a href="#"><img src="http://porcantidad.leadconcept.biz/upload/image/assets/images/over-heart-img.png" alt=""></a>
													</div> -->
													<div class="product-img-block">
														<img src="<?php echo $products[$out_stock_products[$increment_now]]['thumb']; ?>" alt="">
													</div>
													<div class="list-view-name">
														<div class="product-head">
															<?php echo $products[$out_stock_products[$increment_now]]['name']; ?>
														</div>
														<div class="product-content">
															<?php  echo strip_tags ($products[$out_stock_products[$increment_now]]['description']);?>
														</div>
														<!-- <div class="location-list"><?php //echo $product['location']; ?><i class="fa fa-map-marker"></i>
														</div> -->
													</div>
													<div class="table-responsive over-table-block">
														<table class="table">
															<tbody> 
																<?php
																	/******View all discounted quantities******/ 
																	$disQuantities = $modelCat->getProductDiscounts($products[$out_stock_products[$increment_now]]['product_id']);
																?>   
																<tr class="first-amt-block">
																	<?php
																	
																	if(isset($disQuantities[0]['quantity']))
																	{
																		if($search_quantity >= 1 && $search_quantity <  $disQuantities[0]['quantity'])
																		{
																			$add_selected_class = 'hover_effect_tier_price_list';
																			$already_selected_tier_price = 1;
																		}
																		else
																		{
																			$add_selected_class = '';
																		}
																	}
																	else
																	{
																		if($search_quantity >= 1)
																		{
																			$add_selected_class = 'hover_effect_tier_price_list';
																			$already_selected_tier_price = 1;
																		}
																		else
																		{
																			$add_selected_class = '';
																		}
																	}
																	?>
																	<td style="cursor:pointer" class="prevent_default_list <?php echo $add_selected_class?>" hover_effect_selector='0' quantity = 1 amount = <?php echo $product['price']; ?> product_id=<?php echo $product['product_id']?> original_quantity=1 original_price=<?php echo $product['price']; ?> >1</td>
																	<?php
																	$effect_value=1;
																	$increment = 0;
																	foreach ($disQuantities as $disQuantity)
																	{
																		if($increment == (sizeof($disQuantities)-1))
																		{
																			if($search_quantity >= $disQuantities[$increment]['quantity'])
																			{
																				$add_selected_class = 'hover_effect_tier_price_list';
																				$already_selected_tier_price = 1;
																			}
																			else
																			{
																				$add_selected_class = '';
																			}
																		}
																		else
																		{
																			if($search_quantity >= $disQuantities[$increment]['quantity'] && $search_quantity < $disQuantities[$increment+1]['quantity'])
																			{
																				$add_selected_class = 'hover_effect_tier_price_list';
																				$already_selected_tier_price = 1;
																			}
																			else
																			{
																				$add_selected_class = '';
																			}
																		}
																		$increment++;
																		?>
																		<td style="cursor:pointer" class="prevent_default_list <?php echo $add_selected_class?>" hover_effect_selector='<?php echo $effect_value ?>' quantity = <?php echo $disQuantity['quantity'];?> amount = <?php echo $currencySymb.round($disQuantity['price'],0); ?> product_id=<?php echo $products[$out_stock_products[$increment_now]]['product_id']?> original_quantity=1 original_price=<?php echo $products[$out_stock_products[$increment_now]]['price']; ?> ><?php echo $disQuantity['quantity'];?></td>
																		<?php
																			$effect_value++;
																	}
																	?>
																	<td rowspan="2" class='saved_values_element'>
																		<span class='list_view_saved_percent'>
																			-0%
																		</span>
																		<br>
																		<span class='list_view_saved_amount_keyword'>
																			Ahorra
																		</span>
																		<br>
																		<span class='list_view_saved_amount_value'>
																			$0!
																		</span>
																	</td>
																</tr>
																<tr class="first-amt-block">
																	<?php
																		$product_price = $products[$out_stock_products[$increment_now]]['price'];
																		$product_price_exploded = explode(',',$product_price);
																		if(!empty($product_price_exploded[1]))
																		{
																			$product_price = $product_price_exploded[0].$product_price_exploded[1];
																		}
																		else
																		{
																			$product_price = $product_price;
																		}
																		$product_price_exploded_again = explode('$', $product_price);
																		if(!empty($product_price_exploded_again[1]))
																		{
																			$product_price = $product_price_exploded_again[1];
																		}
																		else
																		{
																			$product_price = $product_price_exploded_again[0];
																		}
																		//$product_price = intval($product_price);
																		$whole = floor($product_price);
																		$fraction = $product_price - $whole;
																		$fraction_splitted = explode('.', $fraction);
																		if(!empty($fraction_splitted[1]))
																		{
																			$fraction = $fraction_splitted[1];
																		}
																		else
																		{
																			$fraction = $fraction_splitted[0];
																		}
											
																		if($fraction < 9)
																		{
																			$fraction = '0'.$fraction;
																		}
																		else
																		{
																			$fraction = $fraction;
																		}
																		//$product_price="$".$whole."<sup>".$fraction."</sup>";
																		
																		
																		if(isset($disQuantities[0]['quantity']))
																		{
																			if($search_quantity >= 1 && $search_quantity <  $disQuantities[0]['quantity'])
																			{
																				$add_selected_class = 'hover_effect_tier_price_list';
																				$already_selected_tier_price = 1;
																			}
																			else
																			{
																				$add_selected_class = '';
																			}
																		}
																		else
																		{
																			if($search_quantity >= 1)
																			{
																				$add_selected_class = 'hover_effect_tier_price_list';
																				$already_selected_tier_price = 1;
																			}
																			else
																			{
																				$add_selected_class = '';
																			}
																		}
																		
																		
																		
																		// if($search_quantity == 1)
																		// {
																			// $add_selected_class = 'hover_effect_tier_price_list';
																		// }
																		// else
																		// {
																			// $add_selected_class = '';
																		// }
																	?>
																	
																	<td style="cursor:pointer" class="prevent_default_list <?php echo $add_selected_class?>" hover_effect_selector='0' quantity = 1 amount = <?php echo $products[$out_stock_products[$increment_now]]['price']; ?> product_id=<?php echo $products[$out_stock_products[$increment_now]]['product_id']?> original_quantity=1 original_price=<?php echo $products[$out_stock_products[$increment_now]]['price']; ?> ><?php echo $currencySymb.$whole."<sup>".$fraction."</sup>";?></td>
																		<?php
																			$effect_value = 1;
																			$increment = 0;
																			foreach ($disQuantities as $disQuantity)
																			{
																				$disQuantity_price = $disQuantity['price'];
																				$whole = floor($disQuantity_price);
																				$fraction = $disQuantity_price - $whole;
																				
																				$disQuantity_price = $disQuantity['price'];
																				$disQuantity_price_exploded = explode(',',$disQuantity_price);
																				if(!empty($disQuantity_price_exploded[1]))
																				{
																					$disQuantity_price = $disQuantity_price_exploded[0].$disQuantity_price_exploded[1];
																				}
																				else
																				{
																					$disQuantity_price = $disQuantity_price;
																				}
																				$disQuantity_price_exploded_again = explode('$', $disQuantity_price);
																				if(!empty($disQuantity_price_exploded_again[1]))
																				{
																					$disQuantity_price = $disQuantity_price_exploded_again[1];
																				}
																				else
																				{
																					$disQuantity_price = $disQuantity_price_exploded_again[0];
																				}
																				//$minPrice = $minPrice_exploded_again[1];
																				//$disQuantity_price = intval($disQuantity_price);
																				$whole = floor($disQuantity_price);
																				$fraction = $disQuantity_price - $whole;
																				$fraction_splitted = explode('.', $fraction);
																				if(!empty($fraction_splitted[1]))
																				{
																					$fraction = $fraction_splitted[1];
																				}
																				else
																				{
																					$fraction = $fraction_splitted[0];
																				}
																				if($fraction < 9)
																				{
																					$fraction = '0'.$fraction;
																				}
																				else
																				{
																					$fraction = $fraction;
																				}
																				$last_value = $currencySymb.$whole."<sup>".$fraction."</sup>";
																				//$last_value = $currencySymb.$whole."<sup>".$fraction."</sup>"
																				
																				
																				if($increment == (sizeof($disQuantities)-1))
																				{
																					if($search_quantity >= $disQuantities[$increment]['quantity'])
																					{
																						$add_selected_class = 'hover_effect_tier_price_list';
																						$already_selected_tier_price = 1;
																					}
																					else
																					{
																						$add_selected_class = '';
																					}
																				}
																				else
																				{
																					if($search_quantity >= $disQuantities[$increment]['quantity'] && $search_quantity < $disQuantities[$increment+1]['quantity'])
																					{
																						$add_selected_class = 'hover_effect_tier_price_list';
																						$already_selected_tier_price = 1;
																					}
																					else
																					{
																						$add_selected_class = '';
																					}
																				}
																				$increment++;
																				
																				
																				
																				
																				
																				// if($search_quantity == $disQuantity['quantity'])
																				// {
																					// $add_selected_class = 'hover_effect_tier_price_list';
																				// }
																				// else
																				// {
																					// $add_selected_class = '';
																				// }
																			
																			?>
																			<td style="cursor:pointer" class="prevent_default_list <?php echo $add_selected_class ?>" hover_effect_selector='<?php echo $effect_value ?>' quantity = <?php echo $disQuantity['quantity'];?> amount = <?php echo $currencySymb.round($disQuantity['price'],0); ?> product_id=<?php echo $products[$out_stock_products[$increment_now]]['product_id']?> original_quantity=1 original_price=<?php echo $products[$out_stock_products[$increment_now]]['price']; ?>> <?php echo $last_value; ?></td>
																				<?php
																					$effect_value++;
																		}
																			?>
																	</tr>
																	<tr>
																		<td colspan="6" class='product_tier_price_details_portion'><span id="feature_dialogue"><?php echo $products[$out_stock_products[$increment_now]]['name'] ?></span>
																			<br>
																			<span id="feauture_d_after">Stock <?php echo $products[$out_stock_products[$increment_now]]['quantity'];  ?> - Belgrano, <?php echo $products[$out_stock_products[$increment_now]]['location'];  ?></span>
																		</td>
																	</tr>
																</tbody>
															</table>
														<!--
															<div class="in-stock-block produ-list-in-stock">
																<?php // echo $product['quantity'];  ?>en Stock
															</div>
															<div class="stock-content">
																<?php // echo $product['location'];  ?>
															</div>
														-->
													</div>
													<div class="prod-bottom-bar right">
														<span><span>%</span> Escalade Descuentos</span>
													</div>
												</div>
											</div>
											<?php
												/******View all discounted quantities******/
												$disQuantities = $modelCat->getProductDiscounts($products[$out_stock_products[$increment_now]]['product_id']);
												$minPrice; $maxPrice;
												if ($products[$out_stock_products[$increment_now]]['price'])
												{
													// $minPrice = $product['price'];
													// $minPrice=explode('.',$product['price']);
													// $minPrice=$minPrice[0];
													$minPrice = $products[$out_stock_products[$increment_now]]['price'];
													$minPrice_exploded = explode(',',$minPrice);
													if(!empty($minPrice_exploded[1]))
													{
														$minPrice = $minPrice_exploded[0].$minPrice_exploded[1];
													}
													else
													{
														$minPrice = $minPrice;
													}
													$minPrice_exploded_again = explode('$', $minPrice);
													if(!empty($minPrice_exploded_again[1]))
													{
														$minPrice = $minPrice_exploded_again[1];
													}
													else
													{
														$minPrice = $minPrice_exploded_again[0];
													}
													//$minPrice = $minPrice_exploded_again[1];
													//$minPrice = intval($minPrice);
													$whole = floor($minPrice);
													$fraction = $minPrice - $whole;
													$fraction_splitted = explode('.', $fraction);
													if(!empty($fraction_splitted[1]))
													{
														$fraction = $fraction_splitted[1];
													}
													else
													{
														$fraction = $fraction_splitted[0];
													}
													if($fraction < 9)
													{
														$fraction = '0'.$fraction;
													}
													else
													{
														$fraction = $fraction;
													}
													$minPrice="$".$whole."<sup>".$fraction."</sup>";
													
													
													
													if(isset($disQuantities[0]['quantity']))
													{
														if($search_quantity >= 1 && $search_quantity <  $disQuantities[0]['quantity'])
														{
															$maxPrice = $products[$out_stock_products[$increment_now]]['price'];
															$maxPrice_exploded = explode(',',$maxPrice);
															if(!empty($maxPrice_exploded[1]))
															{
																$maxPrice = $maxPrice_exploded[0].$maxPrice_exploded[1];
															}
															else
															{
																$maxPrice = $maxPrice;
															}
															$maxPrice_exploded_again = explode('$', $maxPrice);
															if(!empty($maxPrice_exploded_again[1]))
															{
																$maxPrice = $maxPrice_exploded_again[1];
															}
															else
															{
																$maxPrice = $maxPrice_exploded_again[0];
															}
															//$maxPrice = $maxPrice_exploded_again[1];
															//$maxPrice = intval($maxPrice);
															$whole = floor($maxPrice);
															$fraction = $maxPrice - $whole;
															$fraction_splitted = explode('.', $fraction);
															if(!empty($fraction_splitted[1]))
															{
																$fraction = $fraction_splitted[1];
															}
															else
															{
																$fraction = $fraction_splitted[0];
															}
															if($fraction < 9)
															{
																$fraction = '0'.$fraction;
															}
															else
															{
																$fraction = $fraction;
															}
															$maxPrice="$".$whole."<sup>".$fraction."</sup>";
															
														}
													}
													else
													{
														if($search_quantity >= 1)
														{
															$maxPrice = $products[$out_stock_products[$increment_now]]['price'];
															$maxPrice_exploded = explode(',',$maxPrice);
															if(!empty($maxPrice_exploded[1]))
															{
																$maxPrice = $maxPrice_exploded[0].$maxPrice_exploded[1];
															}
															else
															{
																$maxPrice = $maxPrice;
															}
															$maxPrice_exploded_again = explode('$', $maxPrice);
															if(!empty($maxPrice_exploded_again[1]))
															{
																$maxPrice = $maxPrice_exploded_again[1];
															}
															else
															{
																$maxPrice = $maxPrice_exploded_again[0];
															}
															//$maxPrice = $maxPrice_exploded_again[1];
															//$maxPrice = intval($maxPrice);
															$whole = floor($maxPrice);
															$fraction = $maxPrice - $whole;
															$fraction_splitted = explode('.', $fraction);
															if(!empty($fraction_splitted[1]))
															{
																$fraction = $fraction_splitted[1];
															}
															else
															{
																$fraction = $fraction_splitted[0];
															}
															if($fraction < 9)
															{
																$fraction = '0'.$fraction;
															}
															else
															{
																$fraction = $fraction;
															}
															$maxPrice="$".$whole."<sup>".$fraction."</sup>";
														}
													}
												}
												$tier_count = 0;
												$disQuantities;
												$disLen = count($disQuantities);
												$increment2 = 0;
												foreach ($disQuantities as $disQuantity)
												{
													// if ($tier_count == 0)
													// {
													// /*$maxPrice = round($disQuantity['price'], 0);*/
													// }
													// else 
													if ($tier_count == $disLen - 1)
													{
														//$minPrice = round($disQuantity['price'], 0);
														// $minPrice = $disQuantity['price'];
														// $whole = floor($minPrice);
														// $fraction = $minPrice - $whole;
														// $minPrice=$whole."<sup>".$fraction."</sup>";
													
														$minPrice = $disQuantity['price'];
														$minPrice_exploded = explode(',',$minPrice);
														if(!empty($minPrice_exploded[1]))
														{
															$minPrice = $minPrice_exploded[0].$minPrice_exploded[1];
														}
														else
														{
															$minPrice = $minPrice;
														}
														$minPrice_exploded_again = explode('$', $minPrice);
														if(!empty($minPrice_exploded_again[1]))
														{
															$minPrice = $minPrice_exploded_again[1];
														}
														else
														{
															$minPrice = $minPrice_exploded_again[0];
														}
														//$minPrice = $minPrice_exploded_again[1];
														//$minPrice = intval($minPrice);
														$whole = floor($minPrice);
														$fraction = $minPrice - $whole;
														$fraction_splitted = explode('.', $fraction);
														if(!empty($fraction_splitted[1]))
														{
															$fraction = $fraction_splitted[1];
														}
														else
														{
															$fraction = $fraction_splitted[0];
														}
														if($fraction < 9)
														{
															$fraction = '0'.$fraction;
														}
														else
														{
															$fraction = $fraction;
														}
														$minPrice="$".$whole."<sup>".$fraction."</sup>";
														//$minPrice="$".$whole."<sup>".$fraction."</sup>";
													}
													
													if($increment2 == (sizeof($disQuantities)-1))
													{
														if($search_quantity >= $disQuantities[$increment2]['quantity'])
														{
															$maxPrice = $disQuantities[$increment2]['price'];
															$maxPrice_exploded = explode(',',$maxPrice);
															if(!empty($maxPrice_exploded[1]))
															{
																$maxPrice = $maxPrice_exploded[0].$maxPrice_exploded[1];
															}
															else
															{
																$maxPrice = $maxPrice;
															}
															$maxPrice_exploded_again = explode('$', $maxPrice);
															if(!empty($maxPrice_exploded_again[1]))
															{
																$maxPrice = $maxPrice_exploded_again[1];
															}
															else
															{
																$maxPrice = $maxPrice_exploded_again[0];
															}
															$whole = floor($maxPrice);
															$fraction = $maxPrice - $whole;
															$fraction_splitted = explode('.', $fraction);
															if(!empty($fraction_splitted[1]))
															{
																$fraction = $fraction_splitted[1];
															}
															else
															{
																$fraction = $fraction_splitted[0];
															}
															if($fraction < 9)
															{
																$fraction = '0'.$fraction;
															}
															else
															{
															$fraction = $fraction;
															}
															$maxPrice="$".$whole."<sup>".$fraction."</sup>";
														}
													}
													else
													{
														if($search_quantity >= $disQuantities[$increment2]['quantity'] && $search_quantity < $disQuantities[$increment2+1]['quantity'])
														{
															$maxPrice = $disQuantities[$increment2]['price'];
															$maxPrice_exploded = explode(',',$maxPrice);
															if(!empty($maxPrice_exploded[1]))
															{
																$maxPrice = $maxPrice_exploded[0].$maxPrice_exploded[1];
															}
															else
															{
																$maxPrice = $maxPrice;
															}
															$maxPrice_exploded_again = explode('$', $maxPrice);
															if(!empty($maxPrice_exploded_again[1]))
															{
																$maxPrice = $maxPrice_exploded_again[1];
															}
															else
															{
																$maxPrice = $maxPrice_exploded_again[0];
															}
															$whole = floor($maxPrice);
															$fraction = $maxPrice - $whole;
															$fraction_splitted = explode('.', $fraction);
															if(!empty($fraction_splitted[1]))
															{
																$fraction = $fraction_splitted[1];
															}
															else
															{
																$fraction = $fraction_splitted[0];
															}
															if($fraction < 9)
															{
																$fraction = '0'.$fraction;
															}
															else
															{
															$fraction = $fraction;
															}
															$maxPrice="$".$whole."<sup>".$fraction."</sup>";
														}
													}
													$increment2++;
													
													$tier_count++; 
												}
											?>
											<div class="col-sm-5 col-md-5 col-lg-3">
												<div class="border-le">
													<div class="amt-block-container">
														<div class="unit-price-block">
															<div class="price-block-container">
																<?php
																echo  $maxPrice;
																?>
															</div>
															<div class="price-content-container">
																Unit price
															</div>
														</div>
														<div class="min-price-block">
															<div class="min-block-container">
																<?php  echo $minPrice; ?>
															</div>
															<div class="min-content-container">
																Min price
															</div>
														</div>
														<div class="clr"></div>
														<?php
														if(!empty($products[$out_stock_products[$increment_now]]['buyer_pay_or_free_shipping']))
														{
															if($products[$out_stock_products[$increment_now]]['buyer_pay_or_free_shipping'] == 'porcantidad free shipping')
															{
																?>
																<div class="shipping-truck-block col-sm-6 green">
																	<!-- <i class="fa fa-truck" aria-hidden="true"></i>-->
																	<div class="shipping-content-container">
																		Shipping
																	</div>
																</div>
																<?php
															}
															else
															{	?>
																<div class="shipping-truck-block col-sm-6">
																	<!-- <i class="fa fa-truck" aria-hidden="true"></i> -->
																	<div class="shipping-content-container">
																		Shipping
																	</div>
																</div>
																<?php
															}
														}
														else
														{
															?>
															<div class="shipping-truck-block col-sm-6 green" style='visibility:hidden'>
																<!-- <i class="fa fa-truck" aria-hidden="true"></i> -->
																<div class="shipping-content-container">
																	Shipping
																</div>
															</div>
															<?php
														}
														?>
														<div class="product-condition-block col-sm-6 padding0">
														<div class="product-condition-content-container">
															
															New Item
														</div>
														<div class="product-address-block">
															<div class="product-address-content-container">
																<?php echo $products[$out_stock_products[$increment_now]]['location']; ?>
																
															</div>
														</div>
													</div>
													<div class='pull-left' style='color:red;font-weight:bold;'>
														Out of Stock
													</div>
													<div class="clr"></div>
												</div>
											</div>
										</div>
									</div>
									<?php
									}
								}
								
								else
								{
									foreach ($products as $product)
								{
								
										?> 
								<div class="ribbon_immediate_after">
									<?php
									if(intval($product['listing_type'])==3)
									{
										// $date1 = new DateTime(date('y-m-d'));
										// $date2 = new DateTime($product['date_added']);
										// $diff = $date2->diff($date1)->format("%a");
										// if($diff < 30)
										// {
											  echo'<span class="liquidation_ribbon"><span class="ribbon_text">Sale Off</span></span>';
										// }
									}
									else if(intval($product['listing_type'])==2)
									{
										echo'<span class="destacada_ribbon"></span>';
									}
									else if(intval($product['listing_type'])==1)
									{
										echo'<span class="gratics_ribbon"></span>';
									}
						?>
						<div class="col-sm-7 col-md-7 col-lg-9 pr0">
							<div class="list-hover-view">
								<a href='#' class='whole_product_redirections prevent_default2' quantity = 1 amount = <?php echo $product['price']; ?> product_id=<?php echo $product['product_id']?> original_quantity=1 original_price=<?php echo $product['price']; ?> ></a>
													<!-- <div class="heart-block-container">
														<a href="#"><img src="http://porcantidad.leadconcept.biz/upload/image/assets/images/over-heart-img.png" alt=""></a>
													</div> -->
													<div class="product-img-block">
														<img src="<?php echo $product['thumb']; ?>" alt="">
													</div>
													<div class="list-view-name">
														<div class="product-head">
															<?php echo $product['name']; ?>
														</div>
														<div class="product-content">
															<?php  echo strip_tags ($product['description']);?>
														</div>
														<!-- <div class="location-list"><?php //echo $product['location']; ?><i class="fa fa-map-marker"></i>
														</div> -->
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
																		if($search_quantity == 1)
																		{
																			$add_selected_class = 'hover_effect_tier_price_list';
																		}
																		else
																		{
																			$add_selected_class = '';
																		}
																	?>
																	<td style="cursor:pointer" class="prevent_default_list <?php echo $add_selected_class?>" hover_effect_selector='0' quantity = 1 amount = <?php echo $product['price']; ?> product_id=<?php echo $product['product_id']?> original_quantity=1 original_price=<?php echo $product['price']; ?> >1</td>
																	<?php
																	$effect_value=1;
																	
																	foreach ($disQuantities as $disQuantity)
																	{
																		if($search_quantity == $disQuantity['quantity'])
																		{
																			$add_selected_class = 'hover_effect_tier_price_list';
																		}
																		else
																		{
																			$add_selected_class = '';
																		}
																		?>
																		<td style="cursor:pointer" class="prevent_default_list <?php echo $add_selected_class?>" hover_effect_selector='<?php echo $effect_value ?>' quantity = <?php echo $disQuantity['quantity'];?> amount = <?php echo $currencySymb.round($disQuantity['price'],0); ?> product_id=<?php echo $product['product_id']?> original_quantity=1 original_price=<?php echo $product['price']; ?> ><?php echo $disQuantity['quantity'];?></td>
																		<?php
																			$effect_value++;
																	}
																	?>
																	<td rowspan="2" class='saved_values_element'>
																		<span class='list_view_saved_percent'>
																			-0%
																		</span>
																		<br>
																		<span class='list_view_saved_amount_keyword'>
																			Ahorra
																		</span>
																		<br>
																		<span class='list_view_saved_amount_value'>
																			$0!
																		</span>
																	</td>
																</tr>
																<tr class="first-amt-block">
																	<?php
																		$product_price = $product['price'];
																		$product_price_exploded = explode(',',$product_price);
																		if(!empty($product_price_exploded[1]))
																		{
																			$product_price = $product_price_exploded[0].$product_price_exploded[1];
																		}
																		else
																		{
																			$product_price = $product_price;
																		}
																		$product_price_exploded_again = explode('$', $product_price);
																		if(!empty($product_price_exploded_again[1]))
																		{
																			$product_price = $product_price_exploded_again[1];
																		}
																		else
																		{
																			$product_price = $product_price_exploded_again[0];
																		}
																		//$product_price = intval($product_price);
																		$whole = floor($product_price);
																		$fraction = $product_price - $whole;
																		$fraction_splitted = explode('.', $fraction);
																		if(!empty($fraction_splitted[1]))
																		{
																			$fraction = $fraction_splitted[1];
																		}
																		else
																		{
																			$fraction = $fraction_splitted[0];
																		}
											
																		if($fraction < 9)
																		{
																			$fraction = '0'.$fraction;
																		}
																		else
																		{
																			$fraction = $fraction;
																		}
																		//$product_price="$".$whole."<sup>".$fraction."</sup>";
																		
																		
																		if(isset($disQuantities[0]['quantity']))
																		{
																			if($search_quantity >= 1 && $search_quantity <  $disQuantities[0]['quantity'])
																			{
																				$add_selected_class = 'hover_effect_tier_price_list';
																				$already_selected_tier_price = 1;
																			}
																			else
																			{
																				$add_selected_class = '';
																			}
																		}
																		else
																		{
																			if($search_quantity >= 1)
																			{
																				$add_selected_class = 'hover_effect_tier_price_list';
																				$already_selected_tier_price = 1;
																			}
																			else
																			{
																				$add_selected_class = '';
																			}
																		}
																		
																		
																		
																		// if($search_quantity == 1)
																		// {
																			// $add_selected_class = 'hover_effect_tier_price_list';
																		// }
																		// else
																		// {
																			// $add_selected_class = '';
																		// }
																	?>
																	
																	<td style="cursor:pointer" class="prevent_default_list <?php echo $add_selected_class?>" hover_effect_selector='0' quantity = 1 amount = <?php echo $product['price']; ?> product_id=<?php echo $product['product_id']?> original_quantity=1 original_price=<?php echo $product['price']; ?> ><?php echo $currencySymb.$whole."<sup>".$fraction."</sup>";?></td>
																		<?php
																			$effect_value = 1;
																			$increment = 0;
																			foreach ($disQuantities as $disQuantity)
																			{
																				$disQuantity_price = $disQuantity['price'];
																				$whole = floor($disQuantity_price);
																				$fraction = $disQuantity_price - $whole;
																				
																				$disQuantity_price = $disQuantity['price'];
																				$disQuantity_price_exploded = explode(',',$disQuantity_price);
																				if(!empty($disQuantity_price_exploded[1]))
																				{
																					$disQuantity_price = $disQuantity_price_exploded[0].$disQuantity_price_exploded[1];
																				}
																				else
																				{
																					$disQuantity_price = $disQuantity_price;
																				}
																				$disQuantity_price_exploded_again = explode('$', $disQuantity_price);
																				if(!empty($disQuantity_price_exploded_again[1]))
																				{
																					$disQuantity_price = $disQuantity_price_exploded_again[1];
																				}
																				else
																				{
																					$disQuantity_price = $disQuantity_price_exploded_again[0];
																				}
																				//$minPrice = $minPrice_exploded_again[1];
																				//$disQuantity_price = intval($disQuantity_price);
																				$whole = floor($disQuantity_price);
																				$fraction = $disQuantity_price - $whole;
																				$fraction_splitted = explode('.', $fraction);
																				if(!empty($fraction_splitted[1]))
																				{
																					$fraction = $fraction_splitted[1];
																				}
																				else
																				{
																					$fraction = $fraction_splitted[0];
																				}
																				if($fraction < 9)
																				{
																					$fraction = '0'.$fraction;
																				}
																				else
																				{
																					$fraction = $fraction;
																				}
																				$last_value = $currencySymb.$whole."<sup>".$fraction."</sup>";
																				//$last_value = $currencySymb.$whole."<sup>".$fraction."</sup>"
																				
																				
																				if($increment == (sizeof($disQuantities)-1))
																				{
																					if($search_quantity >= $disQuantities[$increment]['quantity'])
																					{
																						$add_selected_class = 'hover_effect_tier_price_list';
																						$already_selected_tier_price = 1;
																					}
																					else
																					{
																						$add_selected_class = '';
																					}
																				}
																				else
																				{
																					if($search_quantity >= $disQuantities[$increment]['quantity'] && $search_quantity < $disQuantities[$increment+1]['quantity'])
																					{
																						$add_selected_class = 'hover_effect_tier_price_list';
																						$already_selected_tier_price = 1;
																					}
																					else
																					{
																						$add_selected_class = '';
																					}
																				}
																				$increment++;
																				
																				
																				
																				
																				
																				// if($search_quantity == $disQuantity['quantity'])
																				// {
																					// $add_selected_class = 'hover_effect_tier_price_list';
																				// }
																				// else
																				// {
																					// $add_selected_class = '';
																				// }
																			
																			?>
																			<td style="cursor:pointer" class="prevent_default_list <?php echo $add_selected_class ?>" hover_effect_selector='<?php echo $effect_value ?>' quantity = <?php echo $disQuantity['quantity'];?> amount = <?php echo $currencySymb.round($disQuantity['price'],0); ?> product_id=<?php echo $product['product_id']?> original_quantity=1 original_price=<?php echo $product['price']; ?>> <?php echo $last_value; ?></td>
																				<?php
																					$effect_value++;
																		}
																			?>
																	</tr>
																	<tr>
																		<td colspan="6" class='product_tier_price_details_portion'><span id="feature_dialogue"><?php echo $product['name'] ?></span>
																			<br>
																			<span id="feauture_d_after">Stock <?php echo $product['quantity'];  ?> - Belgrano, <?php echo $product['location'];  ?></span>
																		</td>
																	</tr>
																</tbody>
															</table>
														<!--
															<div class="in-stock-block produ-list-in-stock">
																<?php // echo $product['quantity'];  ?>en Stock
															</div>
															<div class="stock-content">
																<?php // echo $product['location'];  ?>
															</div>
														-->
													</div>
													<div class="prod-bottom-bar right">
														<span><span>%</span> Escalade Descuentos</span>
													</div>
												</div>
											</div>
											<?php
												/******View all discounted quantities******/
												$disQuantities = $modelCat->getProductDiscounts($product['product_id']);
												$minPrice; $maxPrice;
												if ($product['price'])
												{
													// $minPrice = $product['price'];
													// $minPrice=explode('.',$product['price']);
													// $minPrice=$minPrice[0];
													$minPrice = $product['price'];
													$minPrice_exploded = explode(',',$minPrice);
													if(!empty($minPrice_exploded[1]))
													{
														$minPrice = $minPrice_exploded[0].$minPrice_exploded[1];
													}
													else
													{
														$minPrice = $minPrice;
													}
													$minPrice_exploded_again = explode('$', $minPrice);
													if(!empty($minPrice_exploded_again[1]))
													{
														$minPrice = $minPrice_exploded_again[1];
													}
													else
													{
														$minPrice = $minPrice_exploded_again[0];
													}
													//$minPrice = $minPrice_exploded_again[1];
													//$minPrice = intval($minPrice);
													$whole = floor($minPrice);
													$fraction = $minPrice - $whole;
													$fraction_splitted = explode('.', $fraction);
													if(!empty($fraction_splitted[1]))
													{
														$fraction = $fraction_splitted[1];
													}
													else
													{
														$fraction = $fraction_splitted[0];
													}
													if($fraction < 9)
													{
														$fraction = '0'.$fraction;
													}
													else
													{
														$fraction = $fraction;
													}
													$minPrice="$".$whole."<sup>".$fraction."</sup>";
													
													
													
													if(isset($disQuantities[0]['quantity']))
													{
														if($search_quantity >= 1 && $search_quantity <  $disQuantities[0]['quantity'])
														{
															$maxPrice = $product['price'];
															$maxPrice_exploded = explode(',',$maxPrice);
															if(!empty($maxPrice_exploded[1]))
															{
																$maxPrice = $maxPrice_exploded[0].$maxPrice_exploded[1];
															}
															else
															{
																$maxPrice = $maxPrice;
															}
															$maxPrice_exploded_again = explode('$', $maxPrice);
															if(!empty($maxPrice_exploded_again[1]))
															{
																$maxPrice = $maxPrice_exploded_again[1];
															}
															else
															{
																$maxPrice = $maxPrice_exploded_again[0];
															}
															//$maxPrice = $maxPrice_exploded_again[1];
															//$maxPrice = intval($maxPrice);
															$whole = floor($maxPrice);
															$fraction = $maxPrice - $whole;
															$fraction_splitted = explode('.', $fraction);
															if(!empty($fraction_splitted[1]))
															{
																$fraction = $fraction_splitted[1];
															}
															else
															{
																$fraction = $fraction_splitted[0];
															}
															if($fraction < 9)
															{
																$fraction = '0'.$fraction;
															}
															else
															{
																$fraction = $fraction;
															}
															$maxPrice="$".$whole."<sup>".$fraction."</sup>";
															
														}
													}
													else
													{
														if($search_quantity >= 1)
														{
															$maxPrice = $product['price'];
															$maxPrice_exploded = explode(',',$maxPrice);
															if(!empty($maxPrice_exploded[1]))
															{
																$maxPrice = $maxPrice_exploded[0].$maxPrice_exploded[1];
															}
															else
															{
																$maxPrice = $maxPrice;
															}
															$maxPrice_exploded_again = explode('$', $maxPrice);
															if(!empty($maxPrice_exploded_again[1]))
															{
																$maxPrice = $maxPrice_exploded_again[1];
															}
															else
															{
																$maxPrice = $maxPrice_exploded_again[0];
															}
															//$maxPrice = $maxPrice_exploded_again[1];
															//$maxPrice = intval($maxPrice);
															$whole = floor($maxPrice);
															$fraction = $maxPrice - $whole;
															$fraction_splitted = explode('.', $fraction);
															if(!empty($fraction_splitted[1]))
															{
																$fraction = $fraction_splitted[1];
															}
															else
															{
																$fraction = $fraction_splitted[0];
															}
															if($fraction < 9)
															{
																$fraction = '0'.$fraction;
															}
															else
															{
																$fraction = $fraction;
															}
															$maxPrice="$".$whole."<sup>".$fraction."</sup>";
														}
													}
												}
												$tier_count = 0;
												$disQuantities;
												$disLen = count($disQuantities);
												$increment2 = 0;
												foreach ($disQuantities as $disQuantity)
												{
													// if ($tier_count == 0)
													// {
													// /*$maxPrice = round($disQuantity['price'], 0);*/
													// }
													// else 
													if ($tier_count == $disLen - 1)
													{
														//$minPrice = round($disQuantity['price'], 0);
														// $minPrice = $disQuantity['price'];
														// $whole = floor($minPrice);
														// $fraction = $minPrice - $whole;
														// $minPrice=$whole."<sup>".$fraction."</sup>";
													
														$minPrice = $disQuantity['price'];
														$minPrice_exploded = explode(',',$minPrice);
														if(!empty($minPrice_exploded[1]))
														{
															$minPrice = $minPrice_exploded[0].$minPrice_exploded[1];
														}
														else
														{
															$minPrice = $minPrice;
														}
														$minPrice_exploded_again = explode('$', $minPrice);
														if(!empty($minPrice_exploded_again[1]))
														{
															$minPrice = $minPrice_exploded_again[1];
														}
														else
														{
															$minPrice = $minPrice_exploded_again[0];
														}
														//$minPrice = $minPrice_exploded_again[1];
														//$minPrice = intval($minPrice);
														$whole = floor($minPrice);
														$fraction = $minPrice - $whole;
														$fraction_splitted = explode('.', $fraction);
														if(!empty($fraction_splitted[1]))
														{
															$fraction = $fraction_splitted[1];
														}
														else
														{
															$fraction = $fraction_splitted[0];
														}
														if($fraction < 9)
														{
															$fraction = '0'.$fraction;
														}
														else
														{
															$fraction = $fraction;
														}
														$minPrice="$".$whole."<sup>".$fraction."</sup>";
														//$minPrice="$".$whole."<sup>".$fraction."</sup>";
													}
													
													if($increment2 == (sizeof($disQuantities)-1))
													{
														if($search_quantity >= $disQuantities[$increment2]['quantity'])
														{
															$maxPrice = $disQuantities[$increment2]['price'];
															$maxPrice_exploded = explode(',',$maxPrice);
															if(!empty($maxPrice_exploded[1]))
															{
																$maxPrice = $maxPrice_exploded[0].$maxPrice_exploded[1];
															}
															else
															{
																$maxPrice = $maxPrice;
															}
															$maxPrice_exploded_again = explode('$', $maxPrice);
															if(!empty($maxPrice_exploded_again[1]))
															{
																$maxPrice = $maxPrice_exploded_again[1];
															}
															else
															{
																$maxPrice = $maxPrice_exploded_again[0];
															}
															$whole = floor($maxPrice);
															$fraction = $maxPrice - $whole;
															$fraction_splitted = explode('.', $fraction);
															if(!empty($fraction_splitted[1]))
															{
																$fraction = $fraction_splitted[1];
															}
															else
															{
																$fraction = $fraction_splitted[0];
															}
															if($fraction < 9)
															{
																$fraction = '0'.$fraction;
															}
															else
															{
															$fraction = $fraction;
															}
															$maxPrice="$".$whole."<sup>".$fraction."</sup>";
														}
													}
													else
													{
														if($search_quantity >= $disQuantities[$increment2]['quantity'] && $search_quantity < $disQuantities[$increment2+1]['quantity'])
														{
															$maxPrice = $disQuantities[$increment2]['price'];
															$maxPrice_exploded = explode(',',$maxPrice);
															if(!empty($maxPrice_exploded[1]))
															{
																$maxPrice = $maxPrice_exploded[0].$maxPrice_exploded[1];
															}
															else
															{
																$maxPrice = $maxPrice;
															}
															$maxPrice_exploded_again = explode('$', $maxPrice);
															if(!empty($maxPrice_exploded_again[1]))
															{
																$maxPrice = $maxPrice_exploded_again[1];
															}
															else
															{
																$maxPrice = $maxPrice_exploded_again[0];
															}
															$whole = floor($maxPrice);
															$fraction = $maxPrice - $whole;
															$fraction_splitted = explode('.', $fraction);
															if(!empty($fraction_splitted[1]))
															{
																$fraction = $fraction_splitted[1];
															}
															else
															{
																$fraction = $fraction_splitted[0];
															}
															if($fraction < 9)
															{
																$fraction = '0'.$fraction;
															}
															else
															{
															$fraction = $fraction;
															}
															$maxPrice="$".$whole."<sup>".$fraction."</sup>";
														}
													}
													$increment2++;
													
													$tier_count++; 
												}
											?>
											<div class="col-sm-5 col-md-5 col-lg-3">
												<div class="border-le">
													<div class="amt-block-container">
														<div class="unit-price-block">
															<div class="price-block-container">
																<?php
																echo  $maxPrice;
																?>
															</div>
															<div class="price-content-container">
																Unit price
															</div>
														</div>
														<div class="min-price-block">
															<div class="min-block-container">
																<?php  echo $minPrice; ?>
															</div>
															<div class="min-content-container">
																Min price
															</div>
														</div>
														<div class="clr"></div>
														<?php
														if(!empty($product['buyer_pay_or_free_shipping']))
														{
															if($product['buyer_pay_or_free_shipping'] == 'porcantidad free shipping')
															{
																?>
																<div class="shipping-truck-block col-sm-6 green">
																	<!-- <i class="fa fa-truck" aria-hidden="true"></i>-->
																	<div class="shipping-content-container">
																		Shipping
																	</div>
																</div>
																<?php
															}
															else
															{	?>
																<div class="shipping-truck-block col-sm-6">
																	<!-- <i class="fa fa-truck" aria-hidden="true"></i> -->
																	<div class="shipping-content-container">
																		Shipping
																	</div>
																</div>
																<?php
															}
														}
														else
														{
															?>
															<div class="shipping-truck-block col-sm-6 green" style='visibility:hidden'>
																<!-- <i class="fa fa-truck" aria-hidden="true"></i> -->
																<div class="shipping-content-container">
																	Shipping
																</div>
															</div>
															<?php
														}
														?>
														<div class="product-condition-block col-sm-6 padding0">
														<div class="product-condition-content-container">
															
															New Item
														</div>
														<div class="product-address-block">
															<div class="product-address-content-container">
																<?php echo $product['location']; ?>
																
															</div>
														</div>
													</div>
													<?php
													if($search_quantity > $product['quantity'])
													{
														?>
														<div class='pull-left' style='color:red;font-weight:bold;'>
															Out of Stock
														</div>
														<?php
													}
												?>
													
													
													
													<div class="clr"></div>
												</div>
											</div>
										</div>
									</div>
									<?php
									
								}
								}
								
								
								
								
								
							
								?>
						</div>
						<?php  
					}
					else
					{	?>
						
						<script type="text/javascript">
							$('.list_wrap').html("<h3 class='col-sm-8 alert alert-warning'>Nothing found...</h3>");
						</script>
					<?php }
				?>
			</div>
			<div class="product-pagi-block">
				<?php
				if(!empty($pagination))
				{
					echo $pagination; ?>
					<?php
				}
				?>
			</div>
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
		if (current_location.indexOf("category_id") > 0)
		{
			splitted_location = current_location.split("&category_id=");
			location = splitted_location[0] + '&category_id=' + value;
		}
		else
		{
			location = location + '&category_id=' + value;
		}
	}
	function change_price(min,max)
	{
		
		current_location = window.location.href;
		if (current_location.indexOf("price") > 0)
		{
			splitted_location = current_location.split("&price=");
			location = splitted_location[0] + '&price='+ min + '-' + max;
		}
		else
		{
			location = location + '&price=' +min + '-' + max;
		}
	}
	function change_location2(value)
	{
		current_location = window.location.href;
		if (current_location.indexOf("location") > 0)
		{
			splitted_location = current_location.split("&location=");
			location = splitted_location[0] + '&location=' + value;
		}
		else
		{
			location = location + '&location=' + value;
		}
	}
	function change_location3(value)
	{
		current_location = window.location.href;
		if (current_location.indexOf("limit") > 0)
		{
			splitted_location = current_location.split("&limit=");
			location = splitted_location[0] + '&limit=' + value;
		}
		else
		{
			location = location + '&limit=' + value;
		}
	}
	function change_location4(value)
	{
		current_location = window.location.href;
		if(value =='p.listing_type-DESC'){
		if (current_location.indexOf("sort") > 0)
		{
			splitted_location = current_location.split("&sort=");
			location = splitted_location[0];
		}
			splitted_location = current_location.split("&sort=");
			console.log(splitted_location);
			location=splitted_location[0];
			return false;	
		}
		
		
		
		if (current_location.indexOf("sort") > 0)
		{
			value = value.split("-");
			splitted_location = current_location.split("&sort=");
			location = splitted_location[0] + '&sort=' + value[0] + '&order=' + value[1];
		}
		else
		{
			value = value.split("-");
			location = location + '&sort=' + value[0] + '&order=' + value[1];

		}
		if(value =='p.listing_type-DESC'){
			alert("here");
			splitted_location = current_location.split("&sort=");
			
			location=splitted_location;
			alert("")
			
		}
	}
	$(document).ready(function ()
	{
		var view = localStorage.getItem("list_wrap");
		if (view)
		{
			$("." + view).hide();
		} else
		{
			$('.list_wrap').hide();
		}
		$(".list_view").click(function ()
		{
			localStorage.setItem("list_wrap", "grid_wrap");
			$('.list_wrap').show();
			$('.grid_wrap').hide();
		});
		$(".grid_view").click(function ()
		{
			localStorage.setItem("list_wrap", "list_wrap");
			$('.grid_wrap').show();
			$('.list_wrap').hide();
		});
		$(".wishlist").click(function ()
		{
			var prod_id = $(this).attr('data-id');
			$("#image_loader").show();
			$.ajax({
				url: 'index.php?route=account/wishlist/add',
				type: 'POST',
				data:{product_id:prod_id},
				success: function (response)
				{
					$("#image_loader").hide();
					if (response == 0)
					{
						$("#wish-warn").show();
						$("body").scrollTop(0);
					}
					else
					{
						$("body").scrollTop(0);
						$("wish-success").show();
					}
				}
			});
		});
	});
</script>

<script>
	$('.prevent_default').click(function (event)
	{
		event.preventDefault();
		console.log($(this));
		this_element = $(this);
		var quantity = this_element.attr('quantity');
		var amount = this_element.attr('amount');
		var product_id = this_element.attr('product_id');
		window.location.href = "<?php echo $_SERVER['PHP_SELF']; ?>?route=Productdetails/productdtls&zamr=" + amount + "&xqtn=" + quantity + "&pxs=" + product_id;
	});

	$('.prevent_default2').click(function (event)
	{
		event.preventDefault();
		console.log($(this));
		this_element = $(this);
		var quantity = this_element.attr('quantity');
		var amount = this_element.attr('amount');
		var product_id = this_element.attr('product_id');
		window.location.href = "<?php echo $_SERVER['PHP_SELF']; ?>?route=Productdetails/productdtls&zamr=" + amount + "&xqtn=" + quantity + "&pxs=" + product_id;
	});

var setTimeoutConst_grid;
$('.prevent_default').mouseover(function(event)
{
	this_element = $(this);
	setTimeoutConst_grid = setTimeout(function()
	{
		var quantity = this_element.attr('quantity');
		var amount = this_element.attr('amount');
		var product_id = this_element.attr('product_id');
		var original_price = this_element.attr('original_price');
		var original_quantity = this_element.attr('original_quantity');
		
		original_price_split1 = original_price.split(',');
		if(original_price_split1[1])
		{
			original_price = (original_price_split1[0])+''+(original_price_split1[1]);		
		}
		else
		{
			original_price = original_price_split1[0];		
		}
		
		amount_split1 = amount.split(',');
		if(amount_split1[1])
		{
			amount = (amount_split1[0])+''+(amount_split1[1]);		
		}
		else
		{
			amount = amount_split1[0];
		}
		
		amount_splitted = amount.split('$');
		amount = amount_splitted[1];
		original_price_splitted = original_price.split('$');
		original_price = original_price_splitted[1];
		
		product_amount_final = amount;
		product_quantity_final = quantity;
			
		//discounted_price = product_amount_final / product_quantity_final;
		discounted_price = product_amount_final;
		
		discounted_price_remaining = Math.round(original_price) - discounted_price;
		discounted_percent = (discounted_price_remaining / Math.round(original_price)) * 100;
		if(discounted_percent < 0)
		{
			discounted_percent = Math.abs(discounted_percent);
		}
		else
		{
			discounted_percent = "-"+discounted_percent;
		}
		
				
		//this_element.parent().siblings().children('.hover_selected_tier_price').removeClass('hover_selected_tier_price');
		this_element.parent().siblings().children('.hover_selected_tier_price').removeClass('hover_selected_tier_price');
		this_element.addClass('hover_selected_tier_price');
		
		this_element.parents().eq(1).children().last().children(0)[0].innerHTML = Math.round(discounted_percent)+"%";

		saved_amount = discounted_price_remaining * product_quantity_final;
		console.log(this_element.parents().eq(1).children().last().children(0));
		this_element.parents().eq(1).children().last().children(0)[4].innerHTML = "$"+Math.round(saved_amount)+"!";
	}, 1000);
}).mouseleave(function(event)
{
	clearTimeout(setTimeoutConst_grid);
});

var setTimeoutConst;
entered_firset_time = 0;
$('.prevent_default_list').mouseover(function(event)
{
	//alert('i am here');
	this_element = $(this);
	setTimeoutConst = setTimeout(function()
	{
		hover_effect_selectors = this_element.attr('hover_effect_selector');
		this_element.parents().eq(1).find('td[hover_effect_selector = '+hover_effect_selectors+']').addClass('hover_effect_selector');
	
		var quantity = this_element.attr('quantity');
		var amount = this_element.attr('amount');
		var product_id = this_element.attr('product_id');
		var original_price = this_element.attr('original_price');
		var original_quantity = this_element.attr('original_quantity');
		
		original_price_split1 = original_price.split(',');
		if(original_price_split1[1])
		{
			original_price = (original_price_split1[0])+''+(original_price_split1[1]);		
		}
		else
		{
			original_price = original_price_split1[0];		
		}
		
		this_element.parents().eq(1).find('.hover_effect_tier_price_list').removeClass('hover_effect_tier_price_list');
		hover_effect_selectors = this_element.attr('hover_effect_selector');
		this_element.addClass('hover_effect_tier_price_list');
		this_element.parents().eq(1).find('td[hover_effect_selector = '+hover_effect_selectors+']').addClass('hover_effect_tier_price_list');
	
		amount_split1 = amount.split(',');
		if(amount_split1[1])
		{
			amount = (amount_split1[0])+''+(amount_split1[1]);		
		}
		else
		{
			amount = amount_split1[0];		
		}
		
		amount_splitted = amount.split('$');
		amount = amount_splitted[1];
		original_price_splitted = original_price.split('$');
		original_price = original_price_splitted[1];

		product_amount_final = amount;
		product_quantity_final = quantity;

		discounted_price = product_amount_final;

		discounted_price_remaining = Math.round(original_price) - discounted_price;
		discounted_percent = (discounted_price_remaining / Math.round(original_price)) * 100;
		
		if(discounted_percent < 0)
		{
			discounted_percent = Math.abs(discounted_percent);
		}
		else
		{
			discounted_percent = '-'+discounted_percent;
		}
		
		saved_amount = discounted_price_remaining * product_quantity_final;
	
		//$('.list_view_saved_percent').text("-"+Math.round(discounted_percent)+"%");
		this_element.parents().eq(1).find('.list_view_saved_percent').text(Math.round(discounted_percent)+"%");
		//$('.list_view_saved_amount_value').text("$"+Math.round(saved_amount)+"!");
		this_element.parents().eq(1).find('.list_view_saved_amount_value').text("$"+Math.round(saved_amount)+"!");
		entered_firset_time = 1;
	}, 1000);
}).mouseleave(function(event)
{
	clearTimeout(setTimeoutConst);
	hover_effect_selectors = $(this).attr('hover_effect_selector');	
	if(entered_firset_time === 1)
	{
		$('td[hover_effect_selector = '+hover_effect_selectors+']').removeClass('hover_effect_selector');
	}
});

$('.prevent_default_list').click(function (event)
{
	//event.preventDefault();
	console.log($(this));
	this_element = $(this);
	var quantity = this_element.attr('quantity');
	var amount = this_element.attr('amount');
	var product_id = this_element.attr('product_id');
	window.location.href = "<?php echo $_SERVER['PHP_SELF']; ?>?route=Productdetails/productdtls&zamr=" + amount + "&xqtn=" + quantity + "&pxs=" + product_id;
});
</script>
<script type="text/javascript">
	$(document).ready(function ()
	{
		
		$('#btn_price').click(function()
		{
			
			
			var all_fields_filled = 1;
			var min = $("#min_price").val();
			var max = $("#max_price").val();
			if(min=='')
			{
				all_fields_filled = 0;
				$('#min_price').attr('data-placement', "top");
				$('#min_price').attr('data-toggle', "tooltip");
				$('#min_price').attr("title", "Add a Number");
				$('#min_price').tooltip('show');
			}
			if(max=='')
			{
				all_fields_filled = 0;
				$('#max_price').attr('data-placement', "bottom");
				$('#max_price').attr('data-toggle', "tooltip");
				$('#max_price').attr("title", "Add a Number");
				$('#max_price').tooltip('show');
			}
			if(all_fields_filled === 1)
			{
				change_price(min,max);
				//window.location.href = "<?php echo $_SERVER['PHP_SELF']; ?>?route=product/search&price=" + min + '-' + max;
			}
		});
	});

	$('.prod-bottom-bar.grid_view_item').click(function()
	{
		this_element = $(this).parent().find('.hover_selected_tier_price');
		var quantity = this_element.attr('quantity');
		var amount = this_element.attr('amount');
		var product_id = this_element.attr('product_id');
		var original_price = this_element.attr('original_price');
		var original_quantity = this_element.attr('original_quantity');
		
		original_price_split1 = original_price.split(',');
		if(original_price_split1[1])
		{
			original_price = (original_price_split1[0])+''+(original_price_split1[1]);		
		}
		else
		{
			original_price = original_price_split1[0];		
		}
		
		amount_split1 = amount.split(',');
		if(amount_split1[1])
		{
			amount = (amount_split1[0])+''+(amount_split1[1]);		
		}
		else
		{
			amount = amount_split1[0];		
		}
		
		amount_splitted = amount.split('$');
		amount = amount_splitted[1];
		original_price_splitted = original_price.split('$');
		original_price = original_price_splitted[1];
		
		product_amount_final = amount;
		product_quantity_final = quantity;
			
		//discounted_price = product_amount_final / product_quantity_final;
		discounted_price = product_amount_final;
		
		discounted_price_remaining = Math.round(original_price) - discounted_price;
		discounted_percent = (discounted_price_remaining / Math.round(original_price)) * 100;
		if(discounted_percent < 0)
		{
			discounted_percent = Math.abs(discounted_percent);
		}
		else
		{
			discounted_percent = "-"+discounted_percent;
		}
		
		this_element.parent().siblings().children('.hover_selected_tier_price').removeClass('hover_selected_tier_price');
		this_element.addClass('hover_selected_tier_price');
		
		this_element.parents().eq(1).children().last().children(0)[0].innerHTML = Math.round(discounted_percent)+"%";

		saved_amount = discounted_price_remaining * product_quantity_final;
		console.log(this_element.parents().eq(1).children().last().children(0));
		this_element.parents().eq(1).children().last().children(0)[4].innerHTML = "$"+Math.round(saved_amount)+"!";

	
		if($(this).siblings('.over-table-block').css('display') == 'none')
		{
			$(this).siblings('.over-table-block').show("slide", { direction: "down" }, 1000);
			$(this).css('bottom','0');
		}
		else
		{
			$(this).siblings('.over-table-block').hide("slide", { direction: "down" }, 1000);
			$(this).css('bottom','-20%');
		}
	});

	$('.prod-bottom-bar.right').click(function()
	{
		this_element = $(this).parent().find('.hover_effect_tier_price_list').first();
		hover_effect_selectors = this_element.attr('hover_effect_selector');
		this_element.parents().eq(1).find('td[hover_effect_selector = '+hover_effect_selectors+']').addClass('hover_effect_tier_price_list');

		var quantity = this_element.attr('quantity');
		var amount = this_element.attr('amount');
		var product_id = this_element.attr('product_id');
		var original_price = this_element.attr('original_price');
		var original_quantity = this_element.attr('original_quantity');
		
		original_price_split1 = original_price.split(',');
		if(original_price_split1[1])
		{
			original_price = (original_price_split1[0])+''+(original_price_split1[1]);		
		}
		else
		{
			original_price = original_price_split1[0];		
		}
		
		// this_element.parents().eq(1).find('.hover_effect_tier_price_list').removeClass('hover_effect_tier_price_list');
		// hover_effect_selectors = this_element.attr('hover_effect_selector');
		// this_element.addClass('hover_effect_tier_price_list');
		// this_element.parents().eq(1).find('td[hover_effect_selector = '+hover_effect_selectors+']').addClass('hover_effect_tier_price_list');
		
		amount_split1 = amount.split(',');
		if(amount_split1[1])
		{
			amount = (amount_split1[0])+''+(amount_split1[1]);		
		}
		else
		{
			amount = amount_split1[0];		
		}
		
		amount_splitted = amount.split('$');
		amount = amount_splitted[1];
		original_price_splitted = original_price.split('$');
		original_price = original_price_splitted[1];

		product_amount_final = amount;
		product_quantity_final = quantity;

		discounted_price = product_amount_final;

		discounted_price_remaining = Math.round(original_price) - discounted_price;
		discounted_percent = (discounted_price_remaining / Math.round(original_price)) * 100;
		
		if(discounted_percent < 0)
		{
			discounted_percent = Math.abs(discounted_percent);
		}
		else
		{
			discounted_percent = '-'+discounted_percent;
		}
		
		saved_amount = discounted_price_remaining * product_quantity_final;
	
		//////////$('.list_view_saved_percent').text("-"+Math.round(discounted_percent)+"%");
		this_element.parents().eq(1).find('.list_view_saved_percent').text(Math.round(discounted_percent)+"%");
		//////////$('.list_view_saved_amount_value').text("$"+Math.round(saved_amount)+"!");
		this_element.parents().eq(1).find('.list_view_saved_amount_value').text("$"+Math.round(saved_amount)+"!");
		
		
		
		if($(this).siblings('.over-table-block').css('display') == 'none')
		{
			$(this).siblings('.over-table-block').show("slide", { direction: "right" }, 1000);
			$(this).css('left','91.5%');
		}
		else
		{
			$(this).siblings('.over-table-block').hide("slide", { direction: "right" }, 1000);
			$(this).css('left','100%');
		}
	});
</script>
