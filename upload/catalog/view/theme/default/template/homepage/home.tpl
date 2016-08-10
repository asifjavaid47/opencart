<?php 
	echo $header;
?>
<style>
.prod-bottom-bar
{
	padding: 1px !important; 
}
.product-one-block
{
    width: 164px !important;
    height: 246px;
}
.hover_selected_tier_price .one-no-block
{
    transition: all ease-out 0.5s;
    -webkit-transition: all ease-out 0.5s;
    background: #f1a111;
}
.hover_selected_tier_price .one-block-amt
{
    transition: all ease-out 0.5s;
    -webkit-transition: all ease-out 0.5s;
    background:#f1a111;
}
</style>
      
      
<div class="container">
           <div class="row" style="margin-top:58px;">
               <div class="col-sm-3 col-md-3 col-lg-3 col-w-200"> 

                   <div class="list-cate-main home-list-main">
                       <div class="populer-cate-container index-populer-cont">
							<a href="<?php echo $base.'index.php?route=product/search&quantity=1&search=saleoffs'; ?>">SaleOffs</a>
                           <div class="populer-cate-head">
                               Categories visited
                           </div>
                           <div class="populer-cate-content">
                                 <?php 
                               if(!empty($most_categories)){
                               
                               foreach($most_categories as $most_category){
                               
                               ?>
                               
                               <div class="first-popu-cate">
                                 <a href="<?php echo $base.'index.php?route=product/category&path='.$most_category['category_id']; ?>"><?php echo $most_category['name']; ?></a>
                               </div>
                                <?php }
                               
                               }else{
                               echo 'no record found';
                               
                               }
                               ?>                                
                           </div>
                       </div>
                       <div class="populer-cate-container cate-two-index">
                           <div class="populer-cate-head">
                               Popular Categories
                           </div>
                          
                                <div class="populer-cate-content">
                               <?php  
                               if($popular_categories){
                               foreach($popular_categories as $popular_category){
                              
                               
                               ?>
                               <div class="first-popu-cate">
                                   <a href="<?php echo $base.'index.php?route=product/category&path='.$most_category['category_id']; ?>"><?php echo $popular_category['name']; ?></a>
                               </div>
                               <?php 
                               }
                               }
                               ?>
                               
                           </div>
                          
                       </div>                                                                                     
                       <div class="clr"></div>
                   </div>
               </div>
               <div class="col-sm-9 col-md-9 col-lg-9 col-w-940">
                   <div class="silder-container">
                       <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                           <!-- Indicators -->
                           <ol class="carousel-indicators">
                               <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                               <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                               <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                           </ol>

                           <!-- Wrapper for slides -->
                           <div class="carousel-inner" role="listbox">
                               <div class="item active">
                                   <img src="http://porcantidad.leadconcept.biz/upload/image/assets/images/slider-img-one.png" alt="...">
<!--
                                <div class="carousel-caption">
                                    ...
                                </div>
-->
                               </div>
                               <div class="item">
                                   <img src="http://porcantidad.leadconcept.biz/upload/image/assets/images/slider-img-one.png" alt="...">
<!--
                                <div class="carousel-caption">
                                    ...
                                </div>
-->
                               </div>                           
                           </div>

                           <!-- Controls -->
                           <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                               <span class="glyphicon glyphicon-chevron-left" aria-hidden="true">
                                   <i class="fa fa-angle-left"></i>
                               </span>
                               <span class="sr-only">Previous</span>
                           </a>
                           <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                               <span class="glyphicon glyphicon-chevron-right" aria-hidden="true">
                                   <i class="fa fa-angle-right"></i>
                               </span>
                               <span class="sr-only">Next</span>
                           </a>
                       </div>
                   </div>
               </div>
           </div>
           <div class="clr"></div>
		   
           <div class="row">
               <div class="slide-one-main-container">
                      <div class="col-sm-3 col-md-3 col-lg-3 col-w-200">
                       <div class="add-img-block-one">
                           <img src="http://porcantidad.leadconcept.biz/upload/image/assets/images/banner2.jpg" alt="" />
                       </div>
                   </div>
					<div class="col-sm-9 col-md-9 col-lg-9 col-w-940">
						<div class="product-slider">
							<div class="client_slider">
								<div class="cilent_text">Sale Offs</div>
								<ul id="flexiselDemo1">     
								</ul> 
								<div class="clr"></div>
							</div>
						</div>
					</div>
                
					<div class="clr"></div>
               </div>
               <div class="slide-one-main-container">
                    <div class="col-sm-3 col-md-3 col-lg-3 col-w-200">
                       <div class="add-img-block-one">
                           <img src="http://porcantidad.leadconcept.biz/upload/image/assets/images/bnnner1.jpg" alt="" />
                       </div>
                   </div>
                   <div class="col-sm-9 col-md-9 col-lg-9 col-w-940">
                       <div class="product-slider">
                           <div class="client_slider">
                               <div class="cilent_text">Recommended items</div>
                               <ul id="flexiselDemo2">

							   
							   </ul> 
                               <div class="clr"></div>
                           </div>
                       </div>
                   </div>
                  
                   <div class="clr"></div>
               </div>
			   <div class="slide-one-main-container">
                   <div class="col-sm-12 col-md-12 col-lg-12">
                       <div class="product-slider">
                           <div class="client_slider">
                               <div class="cilent_text">Latest Items</div>
                               <ul id="flexiselDemo4">
							   </ul> 
                               <div class="clr"></div>
                           </div>
                       </div>
                   </div>
                   <div class="clr"></div>
               </div>
               <div class="col-sm-12 col-md-12 col-lg-12">
                   <div class="banner-block">                   
                       <a href="#">Learn more</a>
                       <div class="clr"></div>
                   </div>
               </div>               
           </div>
       </div>
	   
<script type="text/javascript">
	$('body').on('click', '.prevent_default', function (event)
	{
		event.preventDefault();
		console.log($(this));
		this_element = $(this);
		var quantity = this_element.attr('quantity');
		var amount = this_element.attr('amount');
		var product_id = this_element.attr('product_id');
		window.location.href = "<?php echo $_SERVER['PHP_SELF']; ?>?route=Productdetails/productdtls&zamr=" + amount + "&xqtn=" + quantity + "&pxs=" + product_id;
	});
 
	$('body').on('click', '.prevent_default2', function (event)
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
	
	$('body').on('mouseover', '.prevent_default', function(event)
	{
		event.preventDefault();
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
			//this_element.siblings('.hover_selected_tier_price').removeClass('hover_selected_tier_price');
			this_element.parent().siblings().children('.hover_selected_tier_price').removeClass('hover_selected_tier_price');
			this_element.addClass('hover_selected_tier_price');
			
			this_element.parents().eq(1).children().last().children(0)[0].innerHTML = Math.round(discounted_percent)+"%";

			saved_amount = discounted_price_remaining * product_quantity_final;
			console.log(this_element.parents().eq(1).children().last().children(0));
			this_element.parents().eq(1).children().last().children(0)[3].innerHTML = "$"+Math.round(saved_amount)+"!";
		}, 1000);
	}).on('mouseleave', '.prevent_default', function(event)
	{ 
		clearTimeout(setTimeoutConst_grid);
	});

	$(document).ready(function()
	{
		//alert('hi ');
		$.ajax(
		{
			url: 'index.php?route=common/home/get_sale_off_products',
			type: 'post',
			//data: {1},
			//async:false,
			success: function (data)
			{
				minimum_price_currently = 0, all_products_data = '', date_added_elem='', all_products_data1='', all_products_data2 = '', all_products_data3 = '', all_products_data_last = '';
				parsed_data = JSON.parse(data);
				number_of_products = parsed_data['products_details'].length;
				for(i=0;i<number_of_products;i++)
				{
					minimum_price_currently = 0;
					if(parsed_data['product_images'][i])
					{
						product_main_image = parsed_data['product_images'][i];
					}
					else
					{
						product_main_image = 'cache/placeholder-228x228.png';
					}
					
					parsed_price_original_parent = parsed_data['products_details'][i].price;
					minimum_price_currently = parsed_data['products_details'][i].price;
					parsed_price_original = parsed_data['products_details'][i].price;
					parsed_price = parseInt(parsed_data['products_details'][i].price);
					whole = Math.floor(parsed_price);
					fraction = parsed_price - whole;
					if(fraction < 9)
					{
						fraction = '0'+fraction;
					}
					else
					{
						fraction = fraction;
					}
					parsed_price="$"+whole+"<sup>"+fraction+"</sup>";
					
					// var date_time_now = new Date();
					// var current_time_stamp = date_time_now.getTime();
					// var day_before_timpstamp = current_time_stamp - 86400;
					
					// var element_time = new Date(parsed_data['products_details'][i].date_added);
					// var date_added_timestamp = element_time.getTime();
					
					// if(date_added_timestamp > day_before_timpstamp)
					// {
						date_added_elem = '<span class="liquidation_ribbon"><span class="ribbon_text">Sale Off</span></span>';						
					// }
					// else
					// {
						// date_added_elem = '';
					// }

					//remove following after correcting the upper condition
					// date_added_elem = '<span class="liquidation_ribbon"><span class="ribbon_text">Sale Off</span></span>';
					
					
					
					number_of_product_discounts = parsed_data['products_discounts'][i].length;
					
					if(number_of_product_discounts > 0)
					{
						minimum_price_currently = parsed_data['products_discounts'][i][number_of_product_discounts - 1].price;
					}
					
					whole_this = Math.floor(minimum_price_currently);
					fraction_this = minimum_price_currently - whole_this;
					if(fraction_this < 9)
					{
						fraction_this = '0'+fraction_this;
					}
					else
					{
						fraction_this = fraction_this;
					}
					
					minimum_price_currently="$"+whole_this+"<sup>"+fraction_this+"</sup>";
					
					
					all_products_data1 = '<li><div class="product-one-main product-one-block">'+date_added_elem+'<div class="grid-overflow-home"><a href="#" class="whole_product_redirections prevent_default2" quantity="1" amount="$'+parsed_price_original+'" product_id="'+parsed_data['products_details'][i].product_id+'" original_quantity="1" original_price="$'+parsed_price_original+'" ></a><div class="product-img-block"></span><img src="'+product_main_image+'" alt=""/></div><div class="product-title">'+parsed_data['products_description'][i][0].name+'</div><div class="amt-block-container"><div class="unit-price-block"><div class="price-block-container">'+parsed_price+'</div><div class="price-content-container">Unit price</div></div><div class="min-price-block"><div class="">'+minimum_price_currently+'</div><div class="price-content-container min-pr">Min price</div></div><div class="clr"><div class="col-sm-7 padding0 text-left product-address-block"><div class="product-address-content-container">Capital Federal</div></div><div class="col-sm-5 product-condition-content-container padding0 text-right">New Item</div></div></div><div class="over-table-block"><div class="clr"></div><div class="fix_tier_price_at_bottom"><div class="product_stock_tier">Stock '+parsed_data['products_details'][i].quantity+'</div><div class="product_title_tier_prices">'+parsed_data['products_description'][i][0].name+'</div><div class="first-amt-block"><a href="#" class="prevent_default" quantity="1" amount="$'+parsed_price_original+'" product_id="'+parsed_data['products_details'][i].product_id+'" original_quantity="1" original_price="$'+parsed_price_original+'"><div class="one-no-block">1</div><div class="one-block-amt">'+parsed_price+'</div></a></div>';
					all_products_data2 = '';
					for(j=0;j < number_of_product_discounts; j++)
					{
						parsed_price_original = parsed_data['products_discounts'][i][j].price;
						parsed_price = parseInt(parsed_data['products_discounts'][i][j].price);
						whole = Math.floor(parsed_price);
						fraction = parsed_price - whole;
						if(fraction < 9)
						{
							fraction = '0'+fraction;
						}
						else
						{
							fraction = fraction;
						}
						parsed_price="$"+whole+"<sup>"+fraction+"</sup>";
					
						all_products_data2 = all_products_data2 + '<div class="first-amt-block"><a href="#" class="prevent_default" quantity="'+parsed_data['products_discounts'][i][j].quantity+'" amount="$'+parsed_price_original+'" product_id="'+parsed_data['products_details'][i].product_id+'" original_quantity="1" original_price="$'+parsed_price_original_parent+'"><div class="one-no-block">'+parsed_data['products_discounts'][i][j].quantity+'</div><div class="one-block-amt">'+parsed_price+'</div></a></div>';
					}
					all_products_data3 = '<div class="col-sm-12 b_x_2 home_page_most_bottom_container"><span class="percentage_saved">-0%</span><span class="saved_amount_keyword pull-right">Ahorra</span><br><span class="total_amount_saved pull-right">$0!</span></div></div></div><div class="prod-bottom-bar grid_view_item"><span>% Escalade Descuentos</span></div></div></div></li>';
					all_products_data_last = all_products_data1 + all_products_data2 + all_products_data3;
					all_products_data = all_products_data + all_products_data_last;
				}
				$('#flexiselDemo1').html(all_products_data);
				$('#flexiselDemo1').flexisel();
			}
		});

		$.ajax(
		{
			url: 'index.php?route=common/home/get_recommended_products',
			type: 'post',
			//data: {1},
			//async:false,
			success: function (data)
			{
				minimum_price_currently = 0, all_products_data = '', product_type_data='', all_products_data1='', all_products_data2 = '', all_products_data3 = '', all_products_data_last = '';
				parsed_data = JSON.parse(data);
				number_of_products = parsed_data['products_details'].length;
				for(i=0;i<number_of_products;i++)
				{
					minimum_price_currently = 0;
					if(parsed_data['product_images'][i])
					{
						product_main_image = parsed_data['product_images'][i];
					}
					else
					{
						product_main_image = 'cache/placeholder-228x228.png';
					}
					
					parsed_price_original_parent = parsed_data['products_details'][i].price;
					minimum_price_currently = parsed_data['products_details'][i].price;
					
					parsed_price_original = parsed_data['products_details'][i].price;
					parsed_price = parseInt(parsed_data['products_details'][i].price);
					whole = Math.floor(parsed_price);
					fraction = parsed_price - whole;
					if(fraction < 9)
					{
						fraction = '0'+fraction;
					}
					else
					{
						fraction = fraction;
					}
					
					parsed_price="$"+whole+"<sup>"+fraction+"</sup>";
					
					if(parsed_data['products_details'][i].listing_type === "3")
					{
						// var date_time_now = new Date();
						// var current_time_stamp = date_time_now.getTime();
						// var day_before_timpstamp = current_time_stamp - 86400;
						
						// var element_time = new Date(parsed_data['products_details'][i].date_added);
						// var date_added_timestamp = element_time.getTime();
						
						// if(date_added_timestamp > day_before_timpstamp)
						// {
							product_type_data = '<span class="liquidation_ribbon"><span class="ribbon_text">Sale Off</span></span>';						
						// }
						// else
						// {
							// product_type_data = '';
						// }
					}
					else
					{
						product_type_data = '';
					}
					
					number_of_product_discounts = parsed_data['products_discounts'][i].length;
					
					if(number_of_product_discounts > 0)
					{
						minimum_price_currently = parsed_data['products_discounts'][i][number_of_product_discounts - 1].price;
					}
					
					whole_this = Math.floor(minimum_price_currently);
					fraction_this = minimum_price_currently - whole_this;
					if(fraction_this < 9)
					{
						fraction_this = '0'+fraction_this;
					}
					else
					{
						fraction_this = fraction_this;
					}
					
					minimum_price_currently="$"+whole_this+"<sup>"+fraction_this+"</sup>";
					
					
					all_products_data1 = '<li><div class="product-one-main product-one-block">'+product_type_data+'<div class="grid-overflow-home"><a href="#" class="whole_product_redirections prevent_default2" quantity="1" amount="$'+parsed_price_original+'" product_id="'+parsed_data['products_details'][i].product_id+'" original_quantity="1" original_price="$'+parsed_price_original+'" ></a><div class="product-img-block"></span><img src="'+product_main_image+'" alt=""/></div><div class="product-title">'+parsed_data['products_description'][i][0].name+'</div><div class="amt-block-container"><div class="unit-price-block"><div class="price-block-container">'+parsed_price+'</div><div class="price-content-container">Unit price</div></div><div class="min-price-block"><div class="" >'+minimum_price_currently+'</div><div class="price-content-container min-pr">Min price</div></div><div class="clr"><div class="col-sm-7 padding0 text-left product-address-block"><div class="product-address-content-container">Capital Federal</div></div><div class="col-sm-5 product-condition-content-container padding0 text-right">New Item</div></div></div><div class="over-table-block"><div class="clr"></div><div class="fix_tier_price_at_bottom"><div class="product_stock_tier">Stock '+parsed_data['products_details'][i].quantity+'</div><div class="product_title_tier_prices">'+parsed_data['products_description'][i][0].name+'</div><div class="first-amt-block"><a href="#" class="prevent_default" quantity="1" amount="$'+parsed_price_original+'" product_id="'+parsed_data['products_details'][i].product_id+'" original_quantity="1" original_price="$'+parsed_price_original+'"><div class="one-no-block">1</div><div class="one-block-amt">'+parsed_price+'</div></a></div>';
					
					all_products_data2 = '';
					for(j=0;j < number_of_product_discounts; j++)
					{
						parsed_price_original = parsed_data['products_discounts'][i][j].price;
						parsed_price = parseInt(parsed_data['products_discounts'][i][j].price);
						whole = Math.floor(parsed_price);
						fraction = parsed_price - whole;
						if(fraction < 9)
						{
							fraction = '0'+fraction;
						}
						else
						{
							fraction = fraction;
						}
						parsed_price="$"+whole+"<sup>"+fraction+"</sup>";
					
						all_products_data2 = all_products_data2 + '<div class="first-amt-block"><a href="#" class="prevent_default" quantity="'+parsed_data['products_discounts'][i][j].quantity+'" amount="$'+parsed_price_original+'" product_id="'+parsed_data['products_details'][i].product_id+'" original_quantity="1" original_price="$'+parsed_price_original_parent+'"><div class="one-no-block">'+parsed_data['products_discounts'][i][j].quantity+'</div><div class="one-block-amt">'+parsed_price+'</div></a></div>';
					}
					all_products_data3 = '<div class="col-sm-12 b_x_2 home_page_most_bottom_container"><span class="percentage_saved">-0%</span><span class="saved_amount_keyword pull-right">Ahorra</span><br><span class="total_amount_saved pull-right">$0!</span></div></div></div><div class="prod-bottom-bar grid_view_item"><span>% Escalade Descuentos</span></div></div></div></li>';
					all_products_data_last = all_products_data1 + all_products_data2 + all_products_data3;
					all_products_data = all_products_data + all_products_data_last;
				}
				
				$('#flexiselDemo2').html(all_products_data);
				$('#flexiselDemo2').flexisel();
			}
		});
		
		$.ajax(
		{
			url: 'index.php?route=common/home/get_latest_products',
			type: 'post',
			//data: {1},
			//async:false,
			success: function (data)
			{
				minimum_price_currently = 0, product_type_data = '', all_products_data = '', all_products_data1='', all_products_data2 = '', all_products_data3 = '', all_products_data_last = '';
				parsed_data = JSON.parse(data);
				number_of_products = parsed_data['products_details'].length;
				for(i=0;i<number_of_products;i++)
				{
					minimum_price_currently = 0;
					if(parsed_data['product_images'][i])
					{
						product_main_image = parsed_data['product_images'][i];
					}
					else
					{
						product_main_image = 'cache/placeholder-228x228.png';
					}
					
					parsed_price_original_parent = parsed_data['products_details'][i].price;
					minimum_price_currently = parsed_data['products_details'][i].price;
					parsed_price_original = parsed_data['products_details'][i].price;
					parsed_price = parseInt(parsed_data['products_details'][i].price);
					whole = Math.floor(parsed_price);
					fraction = parsed_price - whole;
					if(fraction < 9)
					{
						fraction = '0'+fraction;
					}
					else
					{
						fraction = fraction;
					}
					parsed_price="$"+whole+"<sup>"+fraction+"</sup>";
					
					if(parsed_data['products_details'][i].listing_type === "3")
					{
						// var date_time_now = new Date();
						// var current_time_stamp = date_time_now.getTime();
						// var day_before_timpstamp = current_time_stamp - 86400;
						
						// var element_time = new Date(parsed_data['products_details'][i].date_added);
						// var date_added_timestamp = element_time.getTime();
						
						// if(date_added_timestamp > day_before_timpstamp)
						// {
							product_type_data = '<span class="liquidation_ribbon"><span class="ribbon_text">Sale Off</span></span>';						
						// }
						// else
						// {
							// product_type_data = '';
						// }
					}
					else
					{
						product_type_data = '';
					}
					
					number_of_product_discounts = parsed_data['products_discounts'][i].length;
					
					if(number_of_product_discounts > 0)
					{
						minimum_price_currently = parsed_data['products_discounts'][i][number_of_product_discounts - 1].price;
					}
					
					whole_this = Math.floor(minimum_price_currently);
					fraction_this = minimum_price_currently - whole_this;
					if(fraction_this < 9)
					{
						fraction_this = '0'+fraction_this;
					}
					else
					{
						fraction_this = fraction_this;
					}
					
					minimum_price_currently="$"+whole_this+"<sup>"+fraction_this+"</sup>";
					
					
					all_products_data1 = '<li><div class="product-one-main product-one-block">'+product_type_data+'<div class="grid-overflow-home"><a href="#" class="whole_product_redirections prevent_default2" quantity="1" amount="$'+parsed_price_original+'" product_id="'+parsed_data['products_details'][i].product_id+'" original_quantity="1" original_price="$'+parsed_price_original+'" ></a><div class="product-img-block"><img src="'+product_main_image+'" alt=""/></div><div class="product-title">'+parsed_data['products_description'][i][0].name+'</div><div class="amt-block-container"><div class="unit-price-block"><div class="price-block-container">'+parsed_price+'</div><div class="price-content-container">Unit price</div></div><div class="min-price-block"><div class="">'+minimum_price_currently+'</div><div class="price-content-container min-pr">Min price</div></div><div class="clr"><div class="col-sm-7 padding0 text-left product-address-block"><div class="product-address-content-container">Capital Federal</div></div><div class="col-sm-5 product-condition-content-container padding0 text-right">New Item</div></div></div><div class="over-table-block"><div class="clr"></div><div class="fix_tier_price_at_bottom"><div class="product_stock_tier">Stock '+parsed_data['products_details'][i].quantity+'</div><div class="product_title_tier_prices">'+parsed_data['products_description'][i][0].name+'</div><div class="first-amt-block"><a href="#" class="prevent_default" quantity="1" amount="$'+parsed_price_original+'" product_id="'+parsed_data['products_details'][i].product_id+'" original_quantity="1" original_price="$'+parsed_price_original+'"><div class="one-no-block">1</div><div class="one-block-amt">'+parsed_price+'</div></a></div>';
					number_of_product_discounts = parsed_data['products_discounts'][i].length;
					all_products_data2 = '';
					for(j=0;j < number_of_product_discounts; j++)
					{
						parsed_price_original = parsed_data['products_discounts'][i][j].price;
						parsed_price = parseInt(parsed_data['products_discounts'][i][j].price);
						whole = Math.floor(parsed_price);
						fraction = parsed_price - whole;
						if(fraction < 9)
						{
							fraction = '0'+fraction;
						}
						else
						{
							fraction = fraction;
						}
						parsed_price="$"+whole+"<sup>"+fraction+"</sup>";
					
						all_products_data2 = all_products_data2 + '<div class="first-amt-block"><a href="#" class="prevent_default" quantity="'+parsed_data['products_discounts'][i][j].quantity+'" amount="$'+parsed_price_original+'" product_id="'+parsed_data['products_details'][i].product_id+'" original_quantity="1" original_price="$'+parsed_price_original_parent+'"><div class="one-no-block">'+parsed_data['products_discounts'][i][j].quantity+'</div><div class="one-block-amt">'+parsed_price+'</div></a></div>';
					}
					all_products_data3 = '<div class="col-sm-12 b_x_2 home_page_most_bottom_container"><span class="percentage_saved">-0%</span><span class="saved_amount_keyword pull-right">Ahorra</span><br><span class="total_amount_saved pull-right">$0!</span></div></div></div><div class="prod-bottom-bar grid_view_item"><span>% Escalade Descuentos</span></div></div></div></li>';
					all_products_data_last = all_products_data1 + all_products_data2 + all_products_data3;
					all_products_data = all_products_data + all_products_data_last;
				}
				
				$('#flexiselDemo4').html(all_products_data);
				$('#flexiselDemo4').flexisel();
			}
		});
		
		
		
		
		
		// $("#flexiselDemo4").flexisel({
		// visibleItems: 5,
		// animationSpeed: 1000,
		// autoPlay: true,
		// autoPlaySpeed: 3000,    		
		// pauseOnHover: true,
		// enableResponsiveBreakpoints: true,
    	// responsiveBreakpoints: { 
    		// portrait: { 
    			// changePoint:480,
    			// visibleItems: 1
    		// }, 
    		// landscape: { 
    			// changePoint:640,
    			// visibleItems: 2
    		// },
    		// tablet: { 
    			// changePoint:768,
    			// visibleItems: 3
    		// }
    	// }
    // });
		
		
		
		$('.prevent_default').click(function(e)
		{
			e.preventDefault();
		});
		
		
		$('body').on('click','.prod-bottom-bar' ,function()
		{
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
		
		
	});
</script>













 <?php echo $footer;?>