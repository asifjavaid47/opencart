<?php 

echo $header;
?>
<style>
.hover-show
{
	display:none;
	margin-left:0px !important;
	margin-top:0px !important;
}
.radio_area
{
	    display: block;
    clear: both;
}
</style>
<script>
var modify_address = 0, elements_in_stock = 0, modifying_address_id = 0;
var product_id_final, total_num_of_images, product_data_matched=0, quantity_products_val, previous_original_price, this_quantity, product_quantity_final, product_amount_final, discounted_price, discount_available = 0, total_amount, product_original_price;
var product_all_prices = [];
var product_amount_final ;
$(document).ready(function()
{
	var query = window.location.search.substring(1);
       
	parameters = query.split("&");
	console.log(parameters);
	split_product_id = parameters[3].split("=");
	product_id = split_product_id[1];
	product_id_final = parseInt(product_id);
	split_product_amount = parameters[1].split("=");
	product_amount = split_product_amount[1];
	split_product_amount_dollar = product_amount.split("$");
        
	product_amount_final = parseInt(split_product_amount_dollar[1]);
        
	split_product_quantity = parameters[2].split("=");
    
	original_amount_one_product = parameters[6].split('=');
	original_amount_one_product = original_amount_one_product[1];
	
	product_quantity = split_product_quantity[1];
	product_quantity_final = parseInt(product_quantity);
	$('#quantity_prod').val(product_quantity_final);
	quantity_products_val = product_quantity_final;
	this_quantity = product_quantity_final;
	$.ajax(
	{
		url: 'index.php?route=Productdetails/productdtls/get_product_data',
		type: 'post',
		data: {product_id_final:product_id_final},
		async:false,
		success: function (data){
                    
                    
			//////////////////////////////////// Data from product details Start////////////////////////
			var product_main_image = '';
			parsed_data = JSON.parse(data);
			//Product Title
			$('#product_detail_title').text(parsed_data['product_details'][0].name);
			//Define product main image
			if(parsed_data['product_details'][0].image)
			{
				product_main_image = parsed_data['product_details'][0].image;
			}
			else
			{
				product_main_image = 'cache/placeholder-228x228.png';
			}
			
			//Define product location
			if(parsed_data['product_details'][0].location)
			{
				$('#product_location').text(parsed_data['product_details'][0].location);
			}
			else
			{
				$('#product_location').text("No location set!");
			}
			
			//Assign image src to main image
			$('.main_image_link').attr('src', "image/"+product_main_image);
			
			//Append first image with product images slider
			$('#prod-image-slider').append('<li class="active" style="float: none; list-style: none; position: relative; width: 83px; margin-bottom: 20px;"><div class="prod-image"><div class="prod-image-inner"><a href="#" class="prevent_default change_main_image"><img id="imageslider0" src="image/'+product_main_image+'" alt=""/></a></div></div></li>');
			
			//Append quantity text wi in stock
			$('#in_stock_quantity').text(parsed_data['product_details'][0].quantity);
			elements_in_stock = parsed_data['product_details'][0].quantity;
			
			//Append first price in the discounted prices list
			if(1 === product_quantity_final && Math.round(parsed_data['product_details'][0].price) === product_amount_final)
                         
			{
				$('#discounted_prices_list').append('<div class="custom first-table-row"><a class="for_first_price prevent_default change_selected_price hover_selected" selector_attribute = "0" href="#"><div class="table-logo"><span class="hover-hide">x</span><span class="custom hover-show">x</span></div><div class="custom unit-count-block">1</div><div class="custom price-table-block">$'+Math.round(parsed_data['product_details'][0].price)+'</div></a><div class="clr"></div></div>');
				product_data_matched = 1;
			}
			else
			{
				$('#discounted_prices_list').append('<div class="custom first-table-row"><a class="for_first_price prevent_default change_selected_price" selector_attribute = "0" href="#"><div class="table-logo"><span class="hover-hide">x</span><span class="custom hover-show">x</span></div><div class="custom unit-count-block">1</div><div class="custom price-table-block">$'+Math.round(parsed_data['product_details'][0].price)+'</div></a><div class="clr"></div></div>');
			}
			//////////////////////////////////// Data from product details Ends////////////////////////
			
			
			product_original_price = Math.round(parsed_data['product_details'][0].price);
			product_all_prices[0] = 1;
			
			
			//////////////////////////////////// Data from product discounts Start////////////////////////
			number_of_discounted_prices = parsed_data['product_discounts'].length;
			
			if(number_of_discounted_prices > 0)
			{
				discount_available = 1;
			}
			else
			{
				discount_available = 0;
			}
			
			for(i=0; i < number_of_discounted_prices; i++)
			{
				product_all_prices[i+1] = Math.round(parsed_data['product_discounts'][i].quantity);
			}
			
			for(i=0; i < number_of_discounted_prices; i++)
			{
				if(i=== (number_of_discounted_prices-1))
				{
					if(Math.round(parsed_data['product_discounts'][i].quantity) === product_quantity_final && Math.round(parsed_data['product_discounts'][i].price) === product_amount_final)
					{
						$('#discounted_prices_list').append('<div class="custom first-table-row"><a id="'+product_all_prices[i+1]+'" class="hover_selected prevent_default change_selected_price first_price" selector_attribute = "'+(i+1)+'"  href="#" ><div class="table-logo"><span class="hover-hide">x</span><span class="custom hover-show">x</span></div><div class="custom unit-count-block">'+parsed_data['product_discounts'][i].quantity+'</div><div class="custom price-table-block">$'+Math.round(parsed_data['product_discounts'][i].price)+'</div></a><div class="clr"></div></div>');
						product_data_matched = 1;
					}
					else
					{
						$('#discounted_prices_list').append('<div class="custom first-table-row"><a id="'+product_all_prices[i+1]+'" class="prevent_default change_selected_price" selector_attribute = "'+(i+1)+'" href="#" ><div class="table-logo"><span class="hover-hide">x</span><span class="custom hover-show">x</span></div><div class="custom unit-count-block">'+parsed_data['product_discounts'][i].quantity+'</div><div class="custom price-table-block">$'+Math.round(parsed_data['product_discounts'][i].price)+'</div></a><div class="clr"></div></div>');
					}
				}
				else
				{
					if(Math.round(parsed_data['product_discounts'][i].quantity) === product_quantity_final && Math.round(parsed_data['product_discounts'][i].price) === product_amount_final)
					{
						$('#discounted_prices_list').append('<div class="custom first-table-row"><a id="'+product_all_prices[i+1]+'_'+product_all_prices[i+2]+'" class="hover_selected prevent_default change_selected_price first_price" selector_attribute = "'+(i+1)+'" href="#" ><div class="table-logo"><span class="hover-hide">x</span><span class="custom hover-show">x</span></div><div class="custom unit-count-block">'+parsed_data['product_discounts'][i].quantity+'</div><div class="custom price-table-block">$'+Math.round(parsed_data['product_discounts'][i].price)+'</div></a><div class="clr"></div></div>');
					}
					else
					{
						$('#discounted_prices_list').append('<div class="custom first-table-row"><a id="'+product_all_prices[i+1]+'_'+product_all_prices[i+2]+'" class="prevent_default change_selected_price" selector_attribute = "'+(i+1)+'" href="#" ><div class="table-logo"><span class="hover-hide">x</span><span class="custom hover-show">x</span></div><div class="custom unit-count-block">'+parsed_data['product_discounts'][i].quantity+'</div><div class="custom price-table-block">$'+Math.round(parsed_data['product_discounts'][i].price)+'</div></a><div class="clr"></div></div>');
					}
				}
			}
			
                      
			$('.for_first_price').attr('id', product_all_prices[0]+"_"+product_all_prices[1]);
			
			//////////////////////////////////// Data from product discounts end////////////////////////
			
			
			
			if( discount_available > 0 )
			{
				this_selector_attribute = $('.hover_selected').attr('selector_attribute');
				previous_selector_attribute = $('a[selector_attribute='+(this_selector_attribute-1)+']');
				if(previous_selector_attribute.length)
				{
					previous_original_quantity = previous_selector_attribute[0].children[1].innerHTML;
					previous_original_price_splitted = previous_selector_attribute[0].children[2].innerHTML.split('$');
					previous_original_price_temp = parseInt(previous_original_price_splitted[1]);
					
					//previous_original_price = previous_original_price_temp / previous_original_quantity;
					previous_original_price = previous_original_price_temp;
					console.log(previous_original_price);
				}
				else
				{
					previous_original_price = product_amount_final;
				}
				
				//discounted_price = product_amount_final / product_quantity_final;
				discounted_price = product_amount_final;
				
				if(discounted_price !== Math.round(parsed_data['product_details'][0].price))
				{
					//Append Original price text
					$('#product_original_price').text("$"+Math.round(previous_original_price));
					
					//Append with discounted original price
					$('#discounted_original_price').text("$"+Math.round(discounted_price));
					
					//Percentage discount
					discounted_price_remaining = Math.round(parsed_data['product_details'][0].price) - discounted_price;
					discounted_percent = (discounted_price_remaining / Math.round(parsed_data['product_details'][0].price)) * 100;
					
					$('#percentage_discount_value').text(Math.round(discounted_percent)+"% Less!");
					
					saved_amount = discounted_price_remaining * product_quantity_final;
					$('#save_amt_count').text("$"+Math.round(saved_amount));
				}
				
				else
				{
					$('#discounted_original_price').text("$"+Math.round(parsed_data['product_details'][0].price));
					$('#save_amt_count').text("$0");
				}
			}
			else
			{
				$('#discounted_original_price').text("$"+Math.round(parsed_data['product_details'][0].price));
				$('#save_amt_count').text("$0");
			}
			
			total_amount = product_amount_final * product_quantity_final;
                        
			$('#total_amount_block').text("$"+Math.round(product_amount_final));
			
			
			
			
			//////////////////////////////////// Data from product images Start////////////////////////
			number_of_images = parsed_data['product_images'].length;
			
			total_num_of_images = number_of_images;
			
			for(i=0; i < number_of_images; i++)
			{
				$('#prod-image-slider').append('<li class="" style="float: none; list-style: none; position: relative; width: 83px; margin-bottom: 20px;"><div class="prod-image"><div class="prod-image-inner"><a href="#" class="prevent_default change_main_image"><img id="imageslider'+(i+1)+'" src="image/'+parsed_data['product_images'][i].image+'" alt=""/></a></div></div></li>');
			}
			//////////////////////////////////// Data from product images Ends////////////////////////
			
			//////////////////////////////////// Data from product Sold Start////////////////////////
			
			$('#items_sold').text(parsed_data['product_sold']+" sold");
			
			//////////////////////////////////// Data from product Sold Ends////////////////////////
			
			//////////////////Data from product payment methods Start////////////////////////////////
			number_of_payments_methods = parsed_data['product_payment_types_and_discounts'].length;
			console.log(parsed_data['product_payment_types_and_discounts']);
			if(number_of_payments_methods > 0)
			{
				if(parsed_data['product_payment_types_and_discounts'][0].cash_payment !=="")
				{
					var cash_discount_val, cash_discount_text_percent;
					if(parsed_data['product_payment_types_and_discounts'][0].cash_discount !=="")
					{
						cash_discount_val = parsed_data['product_payment_types_and_discounts'][0].cash_discount;
						cash_discount_text_percent = parsed_data['product_payment_types_and_discounts'][0].cash_discount + "%";
					}
					else
					{
						cash_discount_val = 0;
						cash_discount_text_percent = "";
					}
					$('.check-box-container').append('<div class="check-one-bx"><div class="check-bx"><input type="checkbox" name="radiog_dark" id="radio5" class="css-checkbox" value="'+cash_discount_val+'"><label for="radio5" class="css-label radGroup2">Cash Discount <span>'+cash_discount_text_percent+'</span></label></div><div class="clr"></div></div>');
				}
				
				if(parsed_data['product_payment_types_and_discounts'][0].wire_payment !=="")
				{
					var wire_discount_val, wire_discount_text_percent;
					if(parsed_data['product_payment_types_and_discounts'][0].wire_discount !=="")
					{
						wire_discount_val = parsed_data['product_payment_types_and_discounts'][0].wire_discount;
						wire_discount_text_percent = parsed_data['product_payment_types_and_discounts'][0].wire_discount + "%";
					}
					else
					{
						wire_discount_val = 0;
						wire_discount_text_percent = "";
					}
					$('.check-box-container').append('<div class="check-one-bx"><div class="check-bx"><input type="checkbox" name="radiog_dark" id="radio6" class="css-checkbox" value="'+wire_discount_val+'"><label for="radio6" class="css-label radGroup2">Wire Discount <span>'+wire_discount_text_percent+'</span></label></div><div class="clr"></div></div>');
				}
				
				if(parsed_data['product_payment_types_and_discounts'][0].credit_card_payment !=="")
				{
					var cc_discount_val, cc_discount_text_percent;
					if(parsed_data['product_payment_types_and_discounts'][0].credit_card_discount !=="")
					{
						cc_discount_val = parsed_data['product_payment_types_and_discounts'][0].credit_card_discount;
						cc_discount_text_percent = parsed_data['product_payment_types_and_discounts'][0].credit_card_discount + "%";
					}
					else
					{
						cc_discount_val = 0;
						cc_discount_text_percent = "";
					}
					$('.check-box-container').append('<div class="check-one-bx"><div class="check-bx"><input type="checkbox" name="radiog_dark" id="radio7" class="css-checkbox" value="'+cc_discount_val+'"><label for="radio7" class="css-label radGroup2">Credit Card Discount <span>'+cc_discount_text_percent+'</span></label></div><div class="clr"></div></div>');
				}
				$('.check-box-container').append('<div class="check-one-bx"><div class="check-bx"><input type="checkbox" name="radiog_dark" id="radio9" class="css-checkbox"  value="0"><label for="radio9" class="css-label radGroup2">Agree with the Seller</label></div><div class="clr"></div></div>');
			}
			else
			{
				$('.check-box-container').text("No Payment Methods defined for this product");
				$('.check-box-container').append('<div class="check-one-bx"><div class="check-bx"><input type="checkbox" name="radiog_dark" id="radio9" class="css-checkbox"  value="0"><label for="radio9" class="css-label radGroup2">Agree with the Seller</label></div><div class="clr"></div></div>');
			}

			//////////////////Data from product payment methods End ////////////////////////////////
		
			for(i=0;i < product_all_prices.length; i++)
			{
				if(i === (product_all_prices.length-1))
				{
					if(quantity_products_val >= product_all_prices[i])
					{
						$('.hover_selected').removeClass('hover_selected');
						$('#'+product_all_prices[i]).addClass('hover_selected');
						//this_quantity_original = $('#'+product_all_prices[i])[0].children[1].innerHTML;
												   
						//this_amount_splitted = $('#'+product_all_prices[i])[0].children[2].innerHTML.split('$');
						//this_amount = parseInt(this_amount_splitted[1]);
													
					}
				}
				else
				{
					if(quantity_products_val >= product_all_prices[i] && quantity_products_val < product_all_prices[i+1])
					{
						$('.hover_selected').removeClass('hover_selected');
						$('#'+product_all_prices[i]+'_'+product_all_prices[i+1]).addClass('hover_selected');
						
						//this_quantity_original = $('#'+product_all_prices[i]+'_'+product_all_prices[i+1])[0].children[1].innerHTML;
						//this_amount_splitted = $('#'+product_all_prices[i]+'_'+product_all_prices[i+1])[0].children[2].innerHTML.split('$');
						//this_amount = parseInt(this_amount_splitted[1]);
					}
				}
			}
		
		
		
		
		}
	});

	$('.prevent_default').click(function(e)
	{
		e.preventDefault();
	});
	
	$('.change_main_image').click(function(e)
	{
            
           
		$('.bxslider > .active').removeClass('active');
		$(this).parents().eq(2).addClass('active');
		//$(this).addClass('active');
		changed_image = this.children[0].src;
		$('.main_image_link').attr('src', changed_image);
	});
	
	starting_image = 0;
	ending_image = total_num_of_images;
	$('.bx-prev').click(function()
	{
		for(i=0; i < total_num_of_images; i++)
		{
			temp = $('#imageslider'+(i)).attr('src');
			$('#imageslider'+i).attr('src', $('#imageslider'+(i+1)).attr('src'));
			$('#imageslider'+(i+1)).attr('src', temp);
		}
	});
	
	$('.bx-next').click(function()
	{		
		for(i=total_num_of_images; i >= 0; i--)
		{
			temp = $('#imageslider'+(i+1)).attr('src');
			$('#imageslider'+(i+1)).attr('src', $('#imageslider'+i).attr('src'));
			$('#imageslider'+i).attr('src', temp);
		}
	});
	// $('.change_selected_price').click(function()
	// {
		// var discounted_price_final, discount_value;
		// $('.hover_selected').removeClass('hover_selected');
		// $(this).addClass('hover_selected');
		// this_quantity = parseInt(this.children[1].innerHTML);
               
		// $('#quantity_prod').val(this_quantity);
                // $('.r-m').html(this_quantity);
		// this_amount_splitted = this.children[2].innerHTML.split('$');
		///////this_amount_temp = parseInt(this.children[2].innerHTML);
		// this_amount = parseInt(this_amount_splitted[1]);
		//////discounted_price = this_amount / this_quantity;
		// discounted_price = this_amount;
		////////total_amount = this_amount;
		// total_amount = this_amount * this_quantity;
		// this_selector_attribute = $(this).attr('selector_attribute');
		// previous_selector_attribute = $('a[selector_attribute='+(this_selector_attribute-1)+']');
		// if(previous_selector_attribute.length)
		// {
			// previous_original_quantity = previous_selector_attribute[0].children[1].innerHTML;
			// previous_original_price_splitted = previous_selector_attribute[0].children[2].innerHTML.split('$');
			// previous_original_price_temp = parseInt(previous_original_price_splitted[1]);
			
			//////////previous_original_price = previous_original_price_temp / previous_original_quantity;
			// previous_original_price = previous_original_price_temp;
			// console.log(previous_original_price);
		// }
		// else 
		// {
                 
			// previous_original_price = this_amount;
                        
		// }
		
		// payment_type_checked = $('input:checkbox[name=radiog_dark]:checked');
		
		// if(payment_type_checked.length)
		// {
			// this_type_discount_value = payment_type_checked[0].value;
			
			////////////discount_value = 10;
			// percent_10_value = (total_amount * this_type_discount_value)/100;
			// final_total_value = total_amount - percent_10_value;
			// $('#total_amount_block').text("$"+Math.round(final_total_value));
			
			// equal_discount_value = percent_10_value/this_quantity;
			// previous_original_price = Math.round(previous_original_price - equal_discount_value);
		
			// discounted_price_final = Math.round(final_total_value / this_quantity);
			
			// if(discounted_price !== product_original_price)
			// {
				//////////Append Original price text
				// $('#product_original_price').text("$"+Math.round(previous_original_price));
				
				//////////Append with discounted original price
				// $('#discounted_original_price').text("$"+Math.round(discounted_price_final));
				
				//////////Percentage discount
				// discounted_price_remaining = product_original_price - discounted_price_final;
				// discounted_percent = (discounted_price_remaining / product_original_price) * 100;
				
				// $('#percentage_discount_value').text(Math.round(discounted_percent)+"% Less!");
				
				// saved_amount = discounted_price_remaining * this_quantity;
				// $('#save_amt_count').text("$"+Math.round(saved_amount));
			// }
			// else
			// {
				// $('#product_original_price').text("$"+Math.round(product_original_price));
				
				// discounted_new_value = Math.round(final_total_value/ this_quantity);
				// $('#discounted_original_price').text("$"+Math.round(discounted_new_value));
				
				//////////Percentage discount
				// discounted_price_remaining_new =product_original_price - discounted_new_value;
				// discounted_percent_new = (discounted_price_remaining_new / product_original_price) * 100;
					
				// $('#percentage_discount_value').text(Math.round(discounted_percent_new)+"% Less!");
				// $('#save_amt_count').text("$"+Math.round((product_original_price- discounted_new_value)));
			// }
		// }
		  
                            // $('.t-m').text("$"+Math.round(total_amount));
                            // var ship_amount=$("#shipChargesRes").html();
                            // ship_amount=ship_amount.split('$');
                            // var tax = total_amount * 10 / 100;
                            // var sub_t=total_amount+tax;
                            // total_result = parseInt(ship_amount[1])+parseInt(sub_t);
                            // $(".c-d").html("-$"+tax);
                            // $(".t-a").html(total_result);
			// if(discounted_price !== product_original_price)
			// {
				////////////Append Original price text
				// $('#product_original_price').text("$"+Math.round(previous_original_price));
				
				/////////////Append with discounted original price
				// $('#discounted_original_price').text("$"+Math.round(discounted_price));
				
				/////////////Percentage discount
				// discounted_price_remaining = product_original_price - discounted_price;
				// discounted_percent = (discounted_price_remaining / product_original_price) * 100;
				
				// $('#percentage_discount_value').text(Math.round(discounted_percent)+"% Less!");
				
				// saved_amount = discounted_price_remaining * this_quantity;
				// $('#save_amt_count').text("$"+Math.round(saved_amount));
			// }
			
			// else
			// {
				// $('#product_original_price').text("");
				// $('#discounted_original_price').text("$"+Math.round(previous_original_price));
				// $('#percentage_discount_value').text("");
				// $('#save_amt_count').text("$0");
			// }
		
	// });
	
	// $('input:checkbox[name=radiog_dark]').change(function()
	// {
		// this_item = $('.hover_selected');
		// console.log();
		// this_quantity = parseInt(this_item[0].children[1].innerHTML);
		// this_amount_splitted = this_item[0].children[2].innerHTML.split('$');
		// this_amount = parseInt(this_amount_splitted[1]);
		//////////discounted_price = this_amount / this_quantity;
		// discounted_price = this_amount;
		
		/////////total_amount = this_amount;
		// total_amount = this_amount * this_quantity;
		
		// this_selector_attribute = $('.hover_selected').attr('selector_attribute');
		// previous_selector_attribute = $('a[selector_attribute='+(this_selector_attribute-1)+']');
		// if(previous_selector_attribute.length)
		// {
			// previous_original_quantity = previous_selector_attribute[0].children[1].innerHTML;
			// previous_original_price_splitted = previous_selector_attribute[0].children[2].innerHTML.split('$');
			// previous_original_price_temp = parseInt(previous_original_price_splitted[1]);
			
			//////////previous_original_price = previous_original_price_temp / previous_original_quantity;
			// previous_original_price = previous_original_price_temp;
			// console.log(previous_original_price);
		// }
		// else
		// {
			// previous_original_price = this_amount;
		// }
		
		// if(this.checked)
		// {
			// $('input:checkbox[name=radiog_dark]').prop('checked',false);
			// $(this).prop('checked', true);
			// this_type_discount_value = this.value;
			
			//////////alert("Cash Discount");
			// discount_value = 10;
			// percent_10_value = (total_amount * this_type_discount_value)/100;
			// final_total_value = total_amount - percent_10_value;
			// $('#total_amount_block').text("$"+Math.round(final_total_value));
			
			// equal_discount_value = percent_10_value/this_quantity;
			// previous_original_price = Math.round(previous_original_price - equal_discount_value);
		
			// discounted_price_final = Math.round(final_total_value / this_quantity);
			
			// if(discounted_price !== product_original_price)
			// {
				/////Append Original price text
				// $('#product_original_price').text("$"+Math.round(previous_original_price));
				
				//////////Append with discounted original price
				// $('#discounted_original_price').text("$"+Math.round(discounted_price_final));
				
				////////////Percentage discount
				// discounted_price_remaining = product_original_price - discounted_price_final;
				// discounted_percent = (discounted_price_remaining / product_original_price) * 100;
				
				// $('#percentage_discount_value').text(Math.round(discounted_percent)+"% Less!");
				
				// saved_amount = discounted_price_remaining * this_quantity;
				// $('#save_amt_count').text("$"+Math.round(saved_amount));
			// }
			
			// else
			// {
				// $('#product_original_price').text("$"+Math.round(product_original_price));
				
				// discounted_new_value = Math.round(final_total_value/ this_quantity);
				// $('#discounted_original_price').text("$"+Math.round(discounted_new_value));
				
				//////////Percentage discount
				// discounted_price_remaining_new =product_original_price - discounted_new_value;
				// discounted_percent_new = (discounted_price_remaining_new / product_original_price) * 100;
					
				// $('#percentage_discount_value').text(Math.round(discounted_percent_new)+"% Less!");
				
				// $('#save_amt_count').text("$"+Math.round((product_original_price- discounted_new_value)));
			// }
		// }
		// else
		// {
			// $('#total_amount_block').text("$"+Math.round(total_amount));
			// if(discounted_price !== product_original_price)
			// {
				////////////Append Original price text
				// $('#product_original_price').text("$"+Math.round(previous_original_price));
				
				///////Append with discounted original price
				// $('#discounted_original_price').text("$"+Math.round(discounted_price));
				
				/////Percentage discount
				// discounted_price_remaining = product_original_price - discounted_price;
				// discounted_percent = (discounted_price_remaining / product_original_price) * 100;
				
				// $('#percentage_discount_value').text(Math.round(discounted_percent)+"% Less!");
				
				// saved_amount = discounted_price_remaining * this_quantity;
				// $('#save_amt_count').text("$"+Math.round(saved_amount));
			// }
			
			// else
			// {
				// $('#product_original_price').text("");
				// $('#discounted_original_price').text("$"+Math.round(product_original_price));
				// $('#percentage_discount_value').text("");
				// $('#save_amt_count').text("$0");
			// }
		// }
	// });
	var acceptable_value=0;
	$("#quantity_prod").on("change paste keyup", function()
	{
		quantity_products_val = $('#quantity_prod').val();
		if(parseInt(elements_in_stock) < parseInt(quantity_products_val))
		{
			$('#quantity_prod').val(acceptable_value);
			return false;
		}
		else
		{
			acceptable_value = $('#quantity_prod').val();
			$('.q-m').html(quantity_products_val);
			change_product_details_with_plus_minus(quantity_products_val);
		}
	});
	
	// $('#minus_product').click(function(e)
	// {
		// quantity_products_val = $('#quantity_prod').val();
		// if(quantity_products_val < 1)
		// {
			// $('.hover_selected').removeClass('hover_selected');
		// }
		// else
		// {
			// quantity_products_val--;
			// $('#quantity_prod').val(quantity_products_val);
			// change_product_details_with_plus_minus(quantity_products_val);
                        // e.preventDefault();
		// }
	// });
	// $('#plus_product').click(function(e)
	// {
             
		// quantity_products_val = $('#quantity_prod').val();
		// quantity_products_val++;
		// $('#quantity_prod').val(quantity_products_val);
		// change_product_details_with_plus_minus(quantity_products_val);
    // });
	
	
	
	function change_product_details_with_plus_minus(quantity_products_val)
	{
		if(quantity_products_val==="")
		{
			$('#discounted_original_price').text("$0");
			$('#percentage_discount_value').text("");
			$('#product_original_price').text("");
			$('#total_amount_block').text("");
			$('#save_amt_count').text("");
			$('.hover_selected').removeClass('hover_selected');
		}	
		else
		{
                    
			quantity_products_val = parseInt(quantity_products_val);
                      
			if(quantity_products_val === 0)
			{
				$('#discounted_original_price').text("$0");
				$('#percentage_discount_value').text("");
				$('#product_original_price').text("");
				$('#total_amount_block').text("");
				$('#save_amt_count').text("");
				$('.hover_selected').removeClass('hover_selected');
			}
			else
			{
                           
				var discounted_price_final, discount_value;
				
				for(i=0;i < product_all_prices.length; i++)
				{
					if(i === (product_all_prices.length-1))
					{
                                            
						if(quantity_products_val >= product_all_prices[i])
						{
							$('.hover_selected').removeClass('hover_selected');
							$('#'+product_all_prices[i]).addClass('hover_selected');
							this_quantity_original = $('#'+product_all_prices[i])[0].children[1].innerHTML;
                                                       
							this_amount_splitted = $('#'+product_all_prices[i])[0].children[2].innerHTML.split('$');
							this_amount = parseInt(this_amount_splitted[1]);
                                                        
						}
					}
					else
					{
						if(quantity_products_val >= product_all_prices[i] && quantity_products_val < product_all_prices[i+1])
						{
							$('.hover_selected').removeClass('hover_selected');
							$('#'+product_all_prices[i]+'_'+product_all_prices[i+1]).addClass('hover_selected');
							
							this_quantity_original = $('#'+product_all_prices[i]+'_'+product_all_prices[i+1])[0].children[1].innerHTML;
							this_amount_splitted = $('#'+product_all_prices[i]+'_'+product_all_prices[i+1])[0].children[2].innerHTML.split('$');
							this_amount = parseInt(this_amount_splitted[1]);
						}
					}
				}
				this_quantity = quantity_products_val;
				//discounted_price = this_amount / this_quantity_original;
				discounted_price = this_amount;
				total_for_plus_minus = Math.round(discounted_price * this_quantity);
				$('.t-m').text("$"+Math.round(total_for_plus_minus));
				$('.t-a').text("$"+Math.round(total_for_plus_minus));
				$('#total_price_amount').text("$"+Math.round(total_for_plus_minus));
				total_amount = total_for_plus_minus;
				total_tax=total_amount*10/100;
                 $('.c-d').html(total_tax);
				this_selector_attribute = $('.hover_selected').attr('selector_attribute');
				previous_selector_attribute = $('a[selector_attribute='+(this_selector_attribute-1)+']');
				if(previous_selector_attribute.length)
				{
					previous_original_quantity = previous_selector_attribute[0].children[1].innerHTML;
					previous_original_price_splitted = previous_selector_attribute[0].children[2].innerHTML.split('$');
					previous_original_price_temp = parseInt(previous_original_price_splitted[1]);
					
					//previous_original_price = previous_original_price_temp / previous_original_quantity;
					previous_original_price = previous_original_price_temp;
					console.log(previous_original_price);
				}
				else
				{
					previous_original_price = this_amount;
				}
				
				
				//payment_type_checked = $('input:checkbox[name=radiog_dark]:checked');
				
				//if(payment_type_checked.length)
				//{
					this_type_discount_value = payment_type_checked[0].value;
			
					//discount_value = 10;
					percent_10_value = (total_amount * this_type_discount_value)/100;
					final_total_value = total_amount - percent_10_value;
                                       alert(final_total_value);
					$('#total_amount_block').text("$"+Math.round(final_total_value));
					
					equal_discount_value = percent_10_value/this_quantity;
					previous_original_price = Math.round(previous_original_price - equal_discount_value);
				
					discounted_price_final = Math.round(final_total_value / this_quantity);
			
					if(discounted_price !== product_original_price)
					{
						//////////////////Append Original price text
						$('#product_original_price').text("$"+Math.round(previous_original_price));
						
						/////////////////Append with discounted original price
						$('#discounted_original_price').text("$"+Math.round(discounted_price_final));
						
						//////////////Percentage discount
						discounted_price_remaining = product_original_price - discounted_price_final;
						discounted_percent = (discounted_price_remaining / product_original_price) * 100;
						
						$('#percentage_discount_value').text(Math.round(discounted_percent)+"% Less!");
						
						saved_amount = discounted_price_remaining * this_quantity;
						$('#save_amt_count').text("$"+Math.round(saved_amount));
					}
					
					else
					{
						$('#product_original_price').text("$"+Math.round(product_original_price));
						
						discounted_new_value = Math.round(final_total_value/ this_quantity);
						$('#discounted_original_price').text("$"+Math.round(discounted_new_value));
						
						/////////////Percentage discount
						discounted_price_remaining_new =product_original_price - discounted_new_value;
						discounted_percent_new = (discounted_price_remaining_new / product_original_price) * 100;
							
						$('#percentage_discount_value').text(Math.round(discounted_percent_new)+"% Less!");
						
						$('#save_amt_count').text("$"+Math.round((product_original_price- discounted_new_value)));
					}
				//}
				//else
				//{
					$('.t-m').text("$"+Math.round(total_for_plus_minus));
					if(discounted_price !== product_original_price)
					{
						/////////////////Append Original price text
						$('#product_original_price').text("$"+Math.round(previous_original_price));
						
						/////////////////Append with discounted original price
						$('#discounted_original_price').text("$"+Math.round(discounted_price));
						
						//////////Percentage discount
						discounted_price_remaining = product_original_price - discounted_price;
						discounted_percent = (discounted_price_remaining / product_original_price) * 100;
						
						$('#percentage_discount_value').text(Math.round(discounted_percent)+"% Less!");
						
						saved_amount = discounted_price_remaining * this_quantity;
						$('#save_amt_count').text("$"+Math.round(saved_amount));
					}
					
					else
					{
						$('#product_original_price').text("");
						$('#discounted_original_price').text("$"+Math.round(product_original_price));
						$('#percentage_discount_value').text("");
						$('#save_amt_count').text("$0");
					}
				//}
			}
		}
	}
    /*****add to wishlist-aa*****/    
    $('.add-wishlist').on('click', function(e)
	{
        e.preventDefault();
        var product_id = $(this).attr("id");
        /*alert(product_id);*/
        $.ajax({
                url: 'index.php?route=account/wishlist/add',
                type: 'post',
                data: 'product_id=' + product_id,
                dataType: 'json',
                success: function(json) {
                    $('.alert').remove();
                    if (json['redirect']) {
                        location = json['redirect'];
                    }
                    if (json['success']) {
                        /*$('#wishlist-response').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');*/
                        $('#wishlist-response').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> Added to your wishlist. <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    }
                    $('#wishlist-total span').html(json['total']);
                    $('#wishlist-total').attr('title', json['total']);

                    $('html, body').animate({ scrollTop: 0 }, 'slow');
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
    });
    /******add to wishlist-aa-end*******/
	$()
});
function isNumber(evt)
{
	var iKeyCode = (evt.which) ? evt.which : evt.keyCode;
	if(iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
	{
		return false;
	}
	return true;
}
</script>
<script type="text/javascript">
$(document).ready(function()
{
	var allowed_to_go_back_to_price_step = 1;
	var selectedVal = "";
    $(".rad").click(function()
	{
		var selected = $("input[type='radio'][name='payment_method']:checked");
		if (selected.length > 0)
		{
			selectedVal = selected.val();   
		}
		$("#confirmQuantityContinue").click(function()
		{
			//$("#cash_method").html(selectedVal);
		});
    });

	$("#confirmQuantityContinue").click(function()
	{
		allowed_to_go_back_to_price_step = 0;
		$('.nav-tabs a[href="#payment_method_tab"]').tab('show');
		$('#leftbar').show();
		$( "#step-two" ).removeClass( "not-active" );
		// var a= $('#bill_summery1').html();
		// console.log(a);
		// $('#bill_summery').html(a);
		// price=$('.r-p').html();
		// price=price.split(':');
		// price=price[1];
		// quantity=$('.q-m').html();
		// orignal_price=$("#sub_total").html();
		// orignal_price=orignal_price.split('<sup>');
		// orignal_price=orignal_price[0].split('$');
		// total_res=Math.round(price * quantity);
		// total=total_res-orignal_price[1];
		// $(".big-txt").html("You Saved $" +total );
	});
	
	$("#payMethodContinue").click(function()
	{
		$('.nav-tabs a[href="#delivery_method"]').tab('show');
		$('#leftbar').show();
		$( "#step-three" ).removeClass( "not-active" );
		// price=$('.r-p').html();
		// price=price.split(':');
		// price=price[1];
		// quantity=$('.q-m').html();
		// orignal_price=$("#sub_total").html();
		// orignal_price=orignal_price.split('<sup>');
		// orignal_price=orignal_price[0].split('$');
		// total_res=Math.round(price * quantity);
		// total=total_res-orignal_price[1];
		// $(".big-txt").html("You Saved $" +total );
	});
	
	
	
	var check_radio_checkbox_val = '';
	
	$('.radio-1-check').on('change', function() {
		check_radio_checkbox_val = this.checked ? this.value : '';
		//alert(check_radio_checkbox_val);
	});

	$('.radio-2-check').on('change', function() {
		check_radio_checkbox_val = this.checked ? this.value : '';
		//alert(check_radio_checkbox_val);
	});

	$('.check-xenvios-box').on('change', function() {
		check_radio_checkbox_val = this.checked ? this.value : '';
		//alert(check_radio_checkbox_val);
	});

	
	
	
	
	
	$('.select-one-delivery-m').hide();
	$("#shipMethodContinue").click(function()
	{
		if(check_radio_checkbox_val !=''){
		    
			$('.select-one-delivery-m').hide();
			
			$('.nav-tabs a[href="#review_purchase"]').tab('show');
			$('#leftbar').show();
			$( "#step-four" ).removeClass( "not-active" );
			 price=original_amount_one_product;
			 
			 quantity=$('.q-m').html();
			 orignal_price=$("#sub_total").html();
				orignal_price=orignal_price.split('<sup>');
			 orignal_price=orignal_price[0].split('$');
			 total_res=Math.round(price * quantity);
			 total=total_res-orignal_price[1];
			 $(".big-txt").html("You Saved $" +total );
		}else{
			$('.select-one-delivery-m').show();
			return false;
			
		}
	});
	$('#step-one').click(function()
	{
		if(allowed_to_go_back_to_price_step === 0)
		{
			return false;
		}
	});
});

</script>
<style>
.not-active
{
   pointer-events: none;
   cursor: pointer;
}
</style>

    <div class="search-product-head-container">
         <div class="container">
            <div class="search-produ-head">
               <div class="breadcum-block product-detai-bread">
                  <ul>
                     <li>Home</li>
                     <li>&gt;</li>
                     <li>Shop</li>
                     <li>&gt;</li>
                     <li>Buying Process</li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
      <div class="white-block min-height">
         <div class="container">
            <div class="row">
<!--               <div class="hidden-xs hidden-sm col-md-2 col-lg-2">&nbsp;</div>-->
               <div class="col-lg-10 midbox">
                 
				<div class="steps-bg">
					<div class="row">
                        <div id='whole_container_buy_process' class="col-sm-12 col-md-12 col-lg-12">
                           <div class="buying-process-main">
                              <div class="cart-section-block" style="margin:0;">
                                 <div class="cart-step-one">
                                    <div class="step-one step-active">
                                       <span class="num-step num-step">1</span>
                                       <!-- <span class="step-tick"><img alt="" src="http://porcantidad.leadconcept.biz/upload/image/assets/images/step-img-tick.png"> </span>-->
                                    </div>
                                    <div class="arrow-shoping">
                                       <img alt="" src="<?php echo $base;?>image/assets/images/step-1-divi.png">
                                    </div>
                                    <div class="clearfix"></div>
                                 </div>
                                 <div class="cart-step-one">
                                    <div class="step-one">
                                       <span class="num-step">2</span>
                                    </div>
                                    <div class="arrow-shoping">
                                       <img alt="" src="<?php echo $base;?>image/assets/images/step-1-divi2.png">
                                    </div>
                                    <div class="clearfix"></div>
                                 </div>
                                 <div class="cart-step-one">
                                    <div class="step-one">
                                       <span class="num-step">3</span>
                                    </div>
                                    <div class="arrow-shoping">
                                       <img alt="" src="<?php echo $base;?>image/assets/images/step-1-divi2.png">
                                    </div>
                                    <div class="clearfix"></div>
                                 </div>
                                 <div class="cart-step-one last">
                                    <div class="step-one last-cart-step">
                                       <span class="num-step">4</span>
                                    </div>
                                    <div class="clearfix"></div>
                                 </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                            
                        <form name="ship_method" method="post" action="" class="addOrderForm">
                            <div class="delivery_tabs">

                          <!-- Nav tabs -->
                          <ul class="nav nav-tabs text-center" role="tablist">
                            <li role="presentation" class="active"  id="step-one"><a href="#confirm_quantity" aria-controls="confirm_quantity" role="tab" data-toggle="tab" >1 Confirms the Quantity and Price  </a></li>
                            <li role="presentation" class="not-active" id="step-two"><a href="#payment_method_tab" aria-controls="payment_method_tab" role="tab" data-toggle="tab">2 Confirm Payment Method</a></li>
                            <li role="presentation" class="not-active"  id="step-three"><a href="#delivery_method" aria-controls="delivery_method" role="tab" data-toggle="tab">3 Confirm Delivery Method</a></li>
                            <li role="presentation" class="not-active" id="step-four"><a href="#review_purchase" aria-controls="review_purchase" role="tab" data-toggle="tab">4  Review purchase</a></li>
                          </ul>
                      <!-- Tab panes -->
                      <div class="tab-content col-sm-8">
                        <?php 

                        /*echo 'Unit Price: '.$unit_price;*/
                        $subtotal = round($unit_price*$quantity);
                        $discount_amount = round($discount/100*$subtotal);
                        $discounted_total = $subtotal - $discount_amount;
                        /*$total = ($subtotal - $discount_amount) + $ship_charges;*/      

                          if($cust_id == 0)
                                echo '! Please <a href="javascript:void(0);" class="login-reuired">Signin</a> to confirm the method.';
                          else if($is_product_selected == 0)
                                echo '! Please <a href="?route=product/category">Select</a> a product before.';
                          else if($quantity == 0)
                               echo '! Please <a href="?route=Productdetails/productdtls&amount=$0&quantity=0&pxs='.$product_id.'">Select</a> a quantity before.';
                          else{
                          ?>  
                              
                            <div role="tabpanel" class="tab-pane " id="delivery_method">
                                <div class="col-sm-12 col-md-12 col-lg-12">
                                   <div class="delivery-method-bx">
										<h2>Delivery Method</h2>
                                        <span class="select-one-delivery-m" style="color:red;">Please select delivery method</span>
										<span class="resp"></span>
										<input type="hidden" id="cust_id" name="cust_id" value="<?php echo $cust_id;?>" />
										<input type="hidden" id="product_id" name="product_id" value="<?php echo $product_id;?>" />
										<input type="hidden" id="quantity" name="quantity" value="<?php echo $quantity;?>" />
										<input type="hidden" id="unit_price" name="unit_price" value="<?php echo $unit_price;?>" />
										<input type="hidden" id="discount" name="discount" value="<?php echo $discount;?>" />
										<input type="hidden" class="shipping_charges" name="shipping_charges" value="" id="shipChargesInput" />
										<input type="hidden" class="total" name="total" value="" id="totalAmountInput" />
										<input type="hidden" class="vendor_id" name="vendor_id" value="<?php echo $vendor_id;?>" id="vendor_id" />
										<ul>
											<li>
											<?php
												if(!empty($buyer_shipping))
												{
													?>
													<div class="radio_area delivery-m">
														<input type="hidden" id="shipping_method" value="Vendor will ship and buyer will pay" name="shipping_method" />
													</div>
													<div class="radio_area delivery-m">
														<input type="radio" name="radiog_lite" id="radio1" class="radio-1-check delivery-method-save-order" value="I will pick up the item"> &nbsp;I will pick up the item <?php echo "(". $city_province .")"; ?>
														<!-- <span class="subt-txt-rdo">Only week days from 8:00 am to 5:00 pm</span>-->
													</div>
													<?php
												}
												
												else
												{
													?>
													<div class="radio_area delivery-m">
														<input type="radio" name="radiog_lite" id="radio1" class="radio-1-check" value="I will pick up the item"> &nbsp;I will pick up the item <?php echo "(". $counrty_name[0]['state'].',&nbsp '.$counrty_name[0]['city'].")"; ?>
														<!-- <span class="subt-txt-rdo">Only week days from 8:00 am to 5:00 pm</span>-->
													</div>
													<?php 
												}
												
												if(!empty($vendor_shipping))
												{
													?>
													<div class="radio_area delivery-m">
														<input type="radio" name="radiog_lite" id="radio12" class="radio-2-check" value="I will agree with vendor"> &nbsp; I will agree with vendor
														<!-- <span class="subt-txt-rdo">Only week days from 8:00 am to 5:00 pm</span>-->
													</div>
													
													<ul class="other-extra " style='display:none;' id='address_drop_down'>
														<div class="radio_area delivery-m"> 
															<li style="color:#838383; padding-left:0;" class="p0">Select your Address</li> 
														</div>  
														<div class="col-sm-9 p0">
															<?php
																$have_address = 0;
																if(!empty($get_address))
																{
																	//print_r($get_address);
																	?>
																	
																	<select class="form-control vendor-sec-address maximize shipAddress"  name="sec_address">
																		<?php
																			foreach($get_address as $key => $option_addr)
																			{
																				if($option_addr['use_as']!="" && strpos($option_addr['use_as'], 'Delivery'))
																				{
																					?>
																					<option class='address_get' value="<?php echo $key; ?>"  data-address="<?php echo $option_addr; ?>" data-radius="<?php echo $radius;?>" data-shippCharges="<?php echo $own_shipping_price;?>" data-discountedTotal="<?php echo $discounted_total;?>" data-vendorId="<?php echo $vendor_id;?>" selected="selected" ><?php echo $option_addr; ?></option>
																					<?php
																				}
																				else 
																				{
																					?>
																					<option class='address_get' value="<?php echo $key; ?>"  data-address="<?php echo $option_addr; ?>" data-radius="<?php echo $radius;?>" data-shippCharges="<?php echo $own_shipping_price;?>" data-discountedTotal="<?php echo $discounted_total;?>" data-vendorId="<?php echo $vendor_id;?>"><?php echo $option_addr; ?></option>
																					<?php
																				}
																				$have_address++;
																			}
																		?>
																	</select>
																	<?php	
																}
															?>
															<a href='javascript:void(0);' style='display:none;' class="modify_address" id="modify_address" style="display: inline; cursor:pointer;">Modify</a>
															<?php 
																if($have_address == 0)
																{
																	?>
																	<li class="">
																		<a href='javascript:void(0);' class="input_opt add-new-address" id="newaddress" style="display: inline; cursor:pointer;">+ new address</a>
																	</li>
																	<?php 
																}
																else
																{
																	?>    
																	<li class="modify">
																		<div class="modify-txt">
																			<a href='javascript:void(0);' class="input_opt add-new-address" id="newaddress" style="display: inline; cursor:pointer;">+ new address</a>
																		</div>
																	</li>
																	<?php 
																}
															?>
													</ul>
													<?php
												}
												
												else
												{
													?>
													<div class="radio_area delivery-m">
														<input type="radio" name="radiog_lite" id="radio12" class="radio-2-check" value="I will agree with vendor" disabled> &nbsp; I will agree with vendor
														<!-- <span class="subt-txt-rdo">Only week days from 8:00 am to 5:00 pm</span>-->
													</div>
													<?php
												}
												
												if(!empty($xenvios_shipping))
												{
													?>
													<div class="radio_area delivery-m">
														<input type="radio" name="radiog_lite" class="css-label radGroup1 check-xenvios-box" id="radio1" value="Use Xenvios" disabled> &nbsp;Use Xenvios
														<!-- <span class="subt-txt-rdo">Only week days from 8:00 am to 5:00 pm</span>-->
													</div>
													<?php
												}
												else
												{
													?>
													<div class="radio_area delivery-m">
														<input type="checkbox" name="radiog_lite" class="css-label radGroup1 check-xenvios-box" id="radio1" value="Use Xenvios" disabled> &nbsp;Use Xenvios
														<!-- <span class="subt-txt-rdo">Only week days from 8:00 am to 5:00 pm</span>-->
													</div>
													<?php
												}
												
												
                                        if(!empty($require_shipping_method) && $require_shipping_method == 'buyer can pickup the item')
										{
											?>
                                            <div class="radio_area delivery-m">
                                              <!--  I will pick up the item -->
                                               <!-- <span class="subt-txt-rdo">Only week days from 8:00 am to 5:00 pm</span> -->
												<input type="hidden" id="shipping_method" value="Buyer can pickup the item" name="shipping_method" />
                                            </div>
											<ul class="other-extra">
												<?php 
													foreach ($address_info as $address_rec)
													{
														$address = "";
														if ($address_rec['new_address'] != "")
														{
															$address = $address_rec['new_address'];
														}
														else
														{
															$address = $address_rec['address'];
														}
														if($address_rec['use_as'] != "" && strpos($address_rec['use_as'], 'Delivery'))
														{

														}
													}
												?>
												<div class="radio_area delivery-m">
													<input type="radio" name="radiog_lite" id="radio1" class="" value="I will pick up the item" checked> &nbsp;I will pick up the item &nbsp;<?php echo "(". $counrty_name[0]['state'].',&nbsp '.$counrty_name[0]['city'].")"; ?>
													<!-- <span class="subt-txt-rdo">Only week days from 8:00 am to 5:00 pm</span>-->
												</div>
												<div class="radio_area delivery-m">
													<input type="radio" name="radiog_lite" id="radio12" class="" value="I will agree with vendor" disabled > &nbsp; I will agree with vendor
													<!-- <span class="subt-txt-rdo">Only week days from 8:00 am to 5:00 pm</span>-->
												</div>
												<div class="radio_area delivery-m">
													<input type="radio" name="radiog_lite" class="css-label radGroup1 " id="radio1" value="Use Xenvios" disabled> &nbsp;Use Xenvios
													<!-- <span class="subt-txt-rdo">Only week days from 8:00 am to 5:00 pm</span>-->
												</div>
											</ul>
                                            <?php
										}
										else
										{
											if(!empty($porcantidad_or_own_shipping) && $porcantidad_or_own_shipping == 'user porcantidad shipping')
											{
												if(!empty($buyer_pay_or_free_shipping) && $buyer_pay_or_free_shipping == 'buyer will pay shipping')
												{
													?>
													<div class="radio_area delivery-m">
														<!--Porcantidad will ship and you (buyer) will pay -->
														<input type="hidden" id="shipping_method" value="Porcantidad will ship and buyer will pay" name="shipping_method" />
													</div>
                                                    
                                                    <div class="radio_area delivery-m">
														<input type="radio" name="radiog_lite" id="radio1" value="I will pick up the item" disabled> &nbsp;I will pick up the item
														<!-- <span class="subt-txt-rdo">Only week days from 8:00 am to 5:00 pm</span>-->
													</div>
													
													<div class="radio_area delivery-m">
														<input type="radio" name="radiog_lite" id="radio12" value="I will agree with vendor" disabled > &nbsp; I will agree with vendor
														<!-- <span class="subt-txt-rdo">Only week days from 8:00 am to 5:00 pm</span>-->
													</div>
													
													<div class="radio_area delivery-m">
														<input type="radio" name="radiog_lite" class="css-label radGroup1" id="radio1" value="Use Xenvios" disabled> &nbsp;Use Xenvios
														<!-- <span class="subt-txt-rdo">Only week days from 8:00 am to 5:00 pm</span>-->
													</div>
													<?php   
												}
												else if(!empty($buyer_pay_or_free_shipping) && $buyer_pay_or_free_shipping == 'porcantidad free shipping')
												{
													?>
													<div class="radio_area delivery-m">
													   <!-- Porcantidad free shipping (Vendor will Pay) -->
														<input type="hidden" id="shipping_method" value="Porcantidad will ship and Vendor will Pay" name="shipping_method" />
													</div>
													<div class="radio_area delivery-m">
														<input type="radio" name="radiog_lite" id="radio1" value="I will pick up the item" disabled> &nbsp;I will pick up the item
														<!-- <span class="subt-txt-rdo">Only week days from 8:00 am to 5:00 pm</span>-->
													</div>
													<div class="radio_area delivery-m">
														<input type="radio" name="radiog_lite" id="radio12" value="I will agree with vendor" disabled> &nbsp; I will agree with vendor
														<!-- <span class="subt-txt-rdo">Only week days from 8:00 am to 5:00 pm</span>-->
													</div>
													<div class="radio_area delivery-m">
														<input type="radio" name="radiog_lite" class="css-label radGroup1" id="radio1" value="Use Xenvios" disabled> &nbsp;Use Xenvios
														<!-- <span class="subt-txt-rdo">Only week days from 8:00 am to 5:00 pm</span>-->
													</div>
													<?php 
												}
											}
											else if(!empty($porcantidad_or_own_shipping) && $porcantidad_or_own_shipping == 'i provide my own shipping')
											{
												if(!empty($buyer_pay_or_free_shipping) && $buyer_pay_or_free_shipping == 'own shipping buyer will pay')
												{
													?>
													<div class="radio_area delivery-m">
														<input type="hidden" id="shipping_method" value="Vendor will ship and buyer will pay" name="shipping_method" />
													</div>
													<div class="radio_area delivery-m">
														<input type="radio" name="radiog_lite" id="radio1" value="I will pick up the item" disabled > &nbsp;I will pick up the item
														<!-- <span class="subt-txt-rdo">Only week days from 8:00 am to 5:00 pm</span>-->
													</div>
													<div class="radio_area delivery-m">
														<input type="radio" name="radiog_lite" id="radio12" value="I will agree with vendor" checked > &nbsp; I will agree with vendor
														<!-- <span class="subt-txt-rdo">Only week days from 8:00 am to 5:00 pm</span>-->
													</div>
													<div class="radio_area delivery-m">
														<input type="radio" name="radiog_lite" class="css-label radGroup1" id="radio1" value="Use Xenvios" disabled> &nbsp;Use Xenvios
														<!-- <span class="subt-txt-rdo">Only week days from 8:00 am to 5:00 pm</span>-->
													</div>
													<ul class="other-extra ">
														<div class="radio_area delivery-m"> 
															<li style="color:#838383; padding-left:0;" class="p0">Select your Address</li> 
														</div>  
														<div class="col-sm-9 p0">
															<select class="form-control vendor-sec-address maximize shipAddress"  name="sec_address">
																<?php
																	$have_address = 0;
																	foreach($address_info as $address_rec)
																	{
																		if($address_rec['new_address']!="")
																		{
																			$address=$address_rec['new_address'];
																		}
																		else
																		{
																			$address=$address_rec['address'];
																		}
																		?>
																		<?php
																		if($address_rec['use_as']!="" && strpos($address_rec['use_as'], 'Delivery'))
																		{
																			?>
																			<option class='address_get' value="<?php echo $address_rec['address_id'];?>"  data-address="<?php echo $address_rec['new_address'].','.$address_rec['city'].', Pakistan';?>" data-radius="<?php echo $radius;?>" data-shippCharges="<?php echo $own_shipping_price;?>" data-discountedTotal="<?php echo $discounted_total;?>" data-vendorId="<?php echo $vendor_id;?>" selected="selected" ><?php echo $address;?></option> 
																			<?php
																		}
																		else 
																		{
																			?>
																			<option class='address_get' value="<?php echo $address_rec['address_id'];?>"  data-address="<?php echo $address_rec['new_address'].','.$address_rec['city'].', Pakistan';?>" data-radius="<?php echo $radius;?>" data-shippCharges="<?php echo $own_shipping_price;?>" data-discountedTotal="<?php echo $discounted_total;?>" data-vendorId="<?php echo $vendor_id;?>" ><?php echo $address;?></option> 
																			<?php
																		}
																		$have_address++;
																	}
																?>
															</select>
															<a href='javascript:void(0);' style='display:none;' class="modify_address" id="modify_address" style="display: inline; cursor:pointer;">Modify</a>
															<?php 
																if($have_address == 0)
																{
																	?>
																	<li class="">
																		<a href='javascript:void(0);' class="input_opt add-new-address" id="newaddress" style="display: inline; cursor:pointer;">+ new address</a>
																	</li>
																	<?php 
																}
																else
																{
																	?>    
																	<li class="modify">
																		<div class="modify-txt">
																			<a href='javascript:void(0);' class="input_opt add-new-address" id="newaddress" style="display: inline; cursor:pointer;">+ new address</a>
																		</div>
																	</li>
																	<?php 
																}
															?>
													</ul>
													<?php   
												}
												else if(!empty($buyer_pay_or_free_shipping) && $buyer_pay_or_free_shipping == 'own free shipping')
												{
                                                    
                                                           
                                                    ?>

                                                        <div class="radio_area delivery-m">
                                                            <!--Vendor will ship without any charges-->
                                                            <input type="hidden" id="shipping_method" value="Vendor free shipping" name="shipping_method" />
                                                        </div>
                                                        <div class="radio_area delivery-m">
										 
										<input type="radio" name="radiog_lite" id="radio1" value="I will pick up the item" disabled> &nbsp;I will pick up the item 
										
                                      <!-- <span class="subt-txt-rdo">Only week days from 8:00 am to 5:00 pm</span>-->
										</div>
										<div class="radio_area delivery-m">
										<input type="radio" name="radiog_lite" id="radio12" value="I will agree with vendor" checked> &nbsp; I will agree with vendor 
										
                                      <!-- <span class="subt-txt-rdo">Only week days from 8:00 am to 5:00 pm</span>-->
										</div>
										<div class="radio_area delivery-m">
										<input type="radio" name="radiog_lite" class="css-label radGroup1" id="radio1" value="Use Xenvios" disabled> &nbsp;Use Xenvios
										
                                      <!-- <span class="subt-txt-rdo">Only week days from 8:00 am to 5:00 pm</span>-->
										</div>
										
                                                        <ul class="other-extra address_tab" style="display:none; ">
                                                          <div class="radio_area delivery-m"> 
                                                              <li style="color:#838383;">Select your Address</li> 
                                                          </div>  
														   <li>
										
										
											</li>
											
                                 <li>
														  <select class="form-control vendor-sec-address maximize shipAddress"  name="sec_address">
															
                                                        <?php
                                                        $have_address = 0;

                                                        foreach($address_info as $address_rec){
                                                            $address="";
                                                     if($address_rec['new_address']!=""){
                                                     $address=$address_rec['new_address'];
                                                     }else{
                                                     $address=$address_rec['address'];
                                                     }
                                                        ?>
                                                        <?php if($address_rec['use_as']!="" && strpos($address_rec['use_as'], 'Delivery')){
                                                     
                                                        ?>
                                                        <option class='address_get' value="<?php echo $address_rec['address_id'];?>"  data-address="<?php echo $address_rec['new_address'].','.$address_rec['city'].', Pakistan';?>" data-radius="<?php echo $radius;?>" data-shippCharges="<?php echo $own_shipping_price;?>" data-discountedTotal="<?php echo $discounted_total;?>" data-vendorId="<?php echo $vendor_id;?>" selected="selected" ><?php echo $address;?></option> 
                                                        <?php }
                                                        else 
                                                        { ?>
                                                         <option class='address_get' value="<?php echo $address_rec['address_id'];?>"  data-address="<?php echo $address_rec['new_address'].','.$address_rec['city'].', Pakistan';?>" data-radius="<?php echo $radius;?>" data-shippCharges="<?php echo $own_shipping_price;?>" data-discountedTotal="<?php echo $discounted_total;?>" data-vendorId="<?php echo $vendor_id;?>" ><?php echo $address;?></option> 
                                                        <?php
                                                        }
                                                            $have_address++;
                                                        }
														?>
														</select>
														<a href='javascript:void(0);' style='display:none;' class="modify_address" id="modify_address" style="display: inline; cursor:pointer;">Modify</a>
														<?php
                                                        if($have_address == 0){
                                                        ?>
                                                        <li>
                                                            <a href='javascript:void(0);' class="input_opt add-new-address" id="newaddress" style="display: inline; cursor:pointer;">+ new address</a>
                                                          </li>
                                                        <?php 
                                                        }
                                                        else{
                                                        ?>    
                                                           
                                                              <div class="modify-txt">
                                                                  <a href='javascript:void(0);' class="input_opt add-new-address" id="newaddress" style="display: inline; cursor:pointer;">+ new address</a>
                                                              </div>
                                                     
                                                        <?php 
                                                        }
                                                        ?>
                                                      </ul>

                                                <?php
                                                    }
                                                }
                                            }

                                            ?>

                                         </li>    
										
                                      </ul>
									 <div id="new_address" class="col-sm-12 p0">

      <div class="form-group col-sm-5 p0">
        <input name="address_1" type="text" class="form-control vendor-new-address"  value=""  placeholder="Street"  id="input-address-1"/>
        <span class="text-muted"><?php echo $step_vendor_street_ex;?></span>
        <?php if ($error_userdet_address_1) { ?>
        <div class="text-danger span-vendor-new-address"><?php echo $error_userdet_address_1; ?></div>
        <?php } ?>
      </div>
      
      <div class="form-group col-sm-4">
        <div class="pl0">
         <!-- <label for="number">Number *</label>-->
         <input type="text" class="form-control nomandatory vendor-new-door-number" name="doornumber" value="" placeholder="Number" id="input-number"/>
         <span class="text-muted"><?php echo $step_vendor_door_num_ex;?></span>
         <?php if ($error_userdet_doornumber) { ?>
         <div class="text-danger span-vendor-new-door-number"><?php echo $error_userdet_doornumber; ?></div>
         <?php } ?>
       </div>
     </div>
     
     <div class="form-group col-sm-3 padding0" style="margin-top: 8px;">
      <label for="no_number">&nbsp;<?php echo $user_no_number_checkbox;?></label>
      <input type="checkbox" class="pull-left no-number-checkbox" id="vendor_no_number" />
    </div>
    <div class="clearfix"></div>

    <div class="col-sm-3 form-group p0">
     <!-- <label for="floor">Floor</label>-->
     <input type="text" class="form-control nomandatory vendor-new-floor" placeholder="Floor" name="floor" value="" id="input-floor" />
     <span class="text-muted">Floor</span>
   </div>
   <div class="col-sm-3 form-group">
     <!-- <label for="apartment">Apartment</label>-->
     <input type="text" class="form-control nomandatory vendor-new-apt" placeholder="Apartment" name="apartment" value="" id="input-apartment" />
     <span class="text-muted">Apartment</span>
   </div>
   <div class="col-sm-2 padding0 form-group">
    <!--<label for="zip"><?php echo $zipcode_labl;?> *</label>-->
    <input type="text"  name="postcode" value="" class="form-control nomandatory vendor-new-postcode" placeholder="Zip Code"  id="input-postcode" />
    <span class="text-muted"><?php echo $user_zip_labl;?></span>
    <?php if ($error_userdet_postcode) { ?>
    <div class="text-danger span-vendor-new-postcode"><?php echo $error_userdet_postcode; ?></div>
    <?php } ?>
  </div>
  <div class="col-sm-4 llo" style="line-height:2.4;">
    <a target="_blank" href="http://www.andreani.com/buscador-de-codigos-postales-resultado" class="input_opt"><?php echo $user_zip_not_know;?></a>
  </div>





                              <input id="address_hidden" type="hidden" name="new_address_condition" value="0" class="address_hidden">

                              <div class="form-group col-sm-9 height_75 p0">
                                <select name="country_id1" id="input-country1" class="form-control vendor-input-country">
                                  <option value=""><?php echo $text_select; ?></option>
                                  <?php foreach ($countries as $country) { ?>
                                  <?php if ($country['country_id'] == $country_id) { ?>
                                  <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                                  <?php } else { ?>
                                  <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                                  <?php } ?>
                                  <?php } ?>
                                </select>
                                <span class="text-muted"><?php echo $step_vendor_country_ex;?></span>
                                <div class="text-danger span-vendor-input-country"><?php echo $error_userdet_country; ?></div>
                              </div>


                              <div class="form-group col-sm-9 height_75 p0">
                                <select name="provience_id1" id="provience_id1" class="form-control vendor-province-id">
                                  <option value=""><?php echo $text_select; ?></option>
                                  <?php foreach ($provience as $country) { ?>
                                  <?php if ($country['id'] == $country_id) { ?>
                                  <option value="<?php echo $country['id']; ?>" selected="selected"><?php echo $country['provincia']; ?></option>
                                  <?php } else { ?>
                                  <option value="<?php echo $country['id']; ?>"><?php echo $country['provincia']; ?></option>
                                  <?php } ?>
                                  <?php } ?>
                                </select>
                                <span class="text-muted"><?php echo $step_vendor_province_ex;?></span>
                                <div class="text-danger span-vendor-province-id"><?php echo $error_userdet_country; ?></div>
                              </div>

                              <div class="form-group col-sm-8 height_75 p0">
                               <select name="city" id="input-city1" class="form-control vendor-input-city">
                               </select>
                               <span class="text-muted"><?php echo $step_vendor_cty_ex;?></span>
                               <div class="text-danger span-vendor-input-city"><?php echo $error_userdet_city; ?></div>
                             </div>
                             <div class="form-group col-sm-4 height_75">
                               <a href="javascript:void(0);" class="input_opt no-need-new-address"><?php echo $step_vendor_existing_address_txt;?></a>
                             </div>
                               
                          <div class="clearfix"></div>
							<a href="javascript:void(0)" class="save_address"  style="color: rgb(51, 38, 144); margin-left: 300px; font-size: 15px; font-weight: bold;">Save Address</a> 
							<!--<a href="javascript:void(0)" class="save_address" >save address</a>-->
                          </div>	
                        
                                       <div class="clearfix"></div>
                                       <button class="continu" id="shipMethodContinue" name="shipMethod" type="button">Continue</button>
                                            
                                      
                                   </div>
                                </div>
                            </div>
                            <div role="tabpanel" class="tab-pane" id="payment_method_tab">
                          
                               <div class="col-sm-8 col-md-8 col-lg-8">
                                   <div class="delivery-method-bx">
                                      <h2>Payment Method</h2>
                                           
                                      
                                      <ul style="margin-left:0px;">
                                                    <li>    
                                                        <label>
                                                       <div class="radio_area delivery-m">
                                                     <input type="radio" value="<?php echo $cash_discount.'% Cash discount!'; ?>" id="payment_method" name="payment_method" required checked />&nbsp; I will agree with seller 
                                                 </div>
                                                 <div class="radio_area delivery-m">
                                                <input type="radio" value="<?php echo $cash_discount.'% Cash discount!'; ?>" id="payment_method" name="payment_method" disabled /> &nbsp; Credit card 
                                                 </div>
                                                 <div class="radio_area delivery-m">
                                                <input type="radio" value="<?php echo $cash_discount.'% Cash discount!'; ?>" id="payment_method" name="payment_method" disabled /> &nbsp;  Use Xpagos 
                                                 </div>
                                                          
                                                        </label>
                                                    </li>
                                                   
                                                </ul>    
                                      <!--<div class="radio_area payment-radio">
                                            <?php 
                                            if($credit_card_payment != ''){
                                            ?>
                                               
                                                <ul style="margin-left:0px;">
                                                    <li>    
                                                        <label>
                                                       <div class="radio_area delivery-m">
                                                     <input type="radio" value="<?php echo $cash_discount.'% Cash discount!'; ?>" id="payment_method" name="payment_method" required checked />&nbsp; I will agree with seller 
                                                 </div>
                                                 <div class="radio_area delivery-m">
                                                <input type="radio" value="<?php echo $cash_discount.'% Cash discount!'; ?>" id="payment_method" name="payment_method" disabled /> &nbsp; Credit card 
                                                 </div>
                                                 <div class="radio_area delivery-m">
                                                <input type="radio" value="<?php echo $cash_discount.'% Cash discount!'; ?>" id="payment_method" name="payment_method" disabled /> &nbsp;  Use Xpagos 
                                                 </div>
                                                          
                                                        </label>
                                                    </li>
                                                   
                                                </ul>
                                            <?php
                                            }
                                            ?>    
                                            </div>
<div class="radio_area payment-radio">
                                            <?php 
                                            if($credit_card_payment != ''){
                                            ?>
                                               
                                                <ul style="margin-left:0px;">
                                                    <li>    
                                                        <label>
                                                       <div class="radio_area delivery-m">
                                                     <input type="radio" value="<?php echo $cash_discount.'% Cash discount!'; ?>" id="payment_method" name="payment_method" required checked />&nbsp; I will agree with seller 
                                                 </div>
                                                 <div class="radio_area delivery-m">
                                                <input type="radio" value="<?php echo $cash_discount.'% Cash discount!'; ?>" id="payment_method" name="payment_method" disabled /> &nbsp; Credit card 
                                                 </div>
                                                 <div class="radio_area delivery-m">
                                                <input type="radio" value="<?php echo $cash_discount.'% Cash discount!'; ?>" id="payment_method" name="payment_method" disabled /> &nbsp;  Use Xpagos 
                                                 </div>
                                                          
                                                        </label>
                                                    </li>
                                                   
                                                </ul>
                                            <?php
                                            }
                                            ?>    
                                            </div>
                                            <div class="radio_area payment-radio">
                                            <?php 
                                            if($cash_payment != ''){
                                            ?>
                                                <label>
                                                <?php if($payment_method == 'cash'){
                                                
                                                ?>
                                                 
                                                <?php
                                                }
                                                else{
                                                ?>   
                                                
                                                <?php        
                                                }
                                                ?>    
                                                   

                                            <?php
                                            }
                                            ?>    
                                            </div>

                                            <div class="radio_area payment-radio">

                                            <?php 
                                            if($wire_payment != ''){
                                            ?>
                                                <label>
                                                    <?php if($payment_method == 'wire'){?>
                                                    <!--<div class="radio_area delivery-m">
                                                     <input type="radio" value="<?php echo $cash_discount.'% Cash discount!'; ?>" id="payment_method" name="payment_method" required checked />&nbsp; I will agree with seller 
                                                 </div>
                                                 <div class="radio_area delivery-m">
                                                <input type="radio" value="<?php echo $cash_discount.'% Cash discount!'; ?>" id="payment_method" name="payment_method" disabled /> &nbsp; Credit card 
                                                 </div>
                                                 <div class="radio_area delivery-m">
                                                <input type="radio" value="<?php echo $cash_discount.'% Cash discount!'; ?>" id="payment_method" name="payment_method" disabled /> &nbsp;  Use Xpagos 
                                                 </div>-->
                                                    <?php
                                                    }
                                                    else{
                                                    ?>
                                                       <div class="radio_area delivery-m">
                                                     <input type="radio" value="<?php echo $cash_discount.'% Cash discount!'; ?>" id="payment_method" name="payment_method" required checked />&nbsp; I will agree with seller 
                                                 </div>
                                                 <div class="radio_area delivery-m">
                                                <input type="radio" value="<?php echo $cash_discount.'% Cash discount!'; ?>" id="payment_method" name="payment_method" disabled /> &nbsp; Credit card 
                                                 </div>
                                                 <div class="radio_area delivery-m">
                                                <input type="radio" value="<?php echo $cash_discount.'% Cash discount!'; ?>" id="payment_method" name="payment_method" disabled /> &nbsp;  Use Xpagos 
                                                 </div>
                                                    <?php
                                                    }
                                                    ?>
                                                   

                                            <?php
                                            }
                                            ?>  
                                            </div>                      
-->
                                       <p>&nbsp;</p>
                                        <button class="continu rad" type="button" id="payMethodContinue">Continue</button>

                                   </div>
                                </div>
                            
                            </div>
                                                    <div role="tabpanel" class="tab-pane active" id="confirm_quantity">
                                                        
                                                        
                                                             <div class="col-sm-8 col-md-8 col-lg-8">
							<div class="delivery-method-bx">
								<h2>Quantity and Price</h2>
								<!--Quantity--> 
								<div class="quanty-price">            
									<div class="qty_title">Quantity</div>
									<div class="qty-table-product">
									<!--
										<div class="minus-btn-qty">
											<button id="minus_product" type="button"><i class="fa fa-minus"></i></button>
										</div>-->
										<div class="textbox-qty">
											<input type="text"  id="quantity_prod" style='border:1px solid;' onkeypress=" return isNumber(event);" name="qty" placeholder="100" value="">
										</div>
										<div class="custom qty_title">Units</div>
										<!--
										<div class="minus-btn-qty">
											<button id="plus_product" type="button"><i class="fa fa-plus"></i></button>
										</div>-->
										<div class="clr"></div>
									</div>
									<div class="total-price">
									<span id='total_label'>Total</span>
									<span id='total_price_amount'></span>
									</div>
									<br>
									<div class="custom stock-in-block">
										<span class="red-price" id='in_stock_quantity'></span>
										<span class="in-stock-class ">In Stock <i class="fa fa-check-circle"></i></span>
										<!--<span class="in-stock-class r-p" style="clear:both; display: inline-block;" >Price: <?php // echo $price;?></span>-->
									</div>
								</div>
								<div class="min-h">&nbsp;</div>
								<button class="continu" id="confirmQuantityContinue" type="button">Continue</button>
							</div>
                        </div>
                                                    </div>
                            <div role="tabpanel" class="tab-pane" id="review_purchase">       
                           <div class="col-sm-12 col-md-12 col-lg-12">
                           <div class="delivery-method-bx">
                              <h2>Review Your Purchase</h2>
                               <div class="review-perices">
                                   <div class="row">
                                <div class="col-sm-1 col-md-1 col-lg-1">
                                <div class="item-section-title">Item</div>
                                    </div>
                                      <div class="col-lg-10">
                                <div class="item-section-right">
                                    <img class="rev-img" alt="" src="<?php echo $thumb; ?>" width="100" height="100">  
                                  <div class="info-sec">
                                    <!--<h4><?php echo $product_name;?></h4>-->
                                   <!-- <div class="items-price">100 items <span>$15000</span><div class="modify-txt"><a href="#">Modify</a></div></div> 
                                    
                                   --> </div> 
                                </div>   
                                   </div>
                                       </div>
                               </div>
                               <div class="review-perices">
                                 
                                <div class="item-section-title"></div>
                                    </div>
                                 
                                 <div class="review-perices">
                                 
                                <div class="item-section-title"><?php echo $product_name;?></div>
                                    </div>
                                 <div class="row">
                                     <div class="col-lg-1">&nbsp;</div>      
                               <div class="col-lg-10">
                                <div class="item-section-right">
                                   <!-- <div class="radio_area review-per">
                                       <input type="radio" class="css-checkbox" id="radio13" name="radiog_lite">
                                       <label class="css-label radGroup1" id='cash_method' for="radio13">Cash 10% Discount
                                           <div class="modify-txt"><a href="#">Modify</a></div>
                                        <span> -$1500<sup>00</sup></span>
                                        </label>               
                                       
                                    </div> -->
                                    <div class="col-w-195">
                                        <div class="qty-box box-rev-table" id='bill_summery'>
                          
                           
                           </div>
                                </div>  
                                    <h3 class="big-txt">You Saved  $0<sup>00</sup>    !!</h3>
                                   </div>
                                       </div>
                               </div>
                               <button id='last_continue' class="continu" type="button">Continue</button>
                           </div>
                        </div></div>
                              
                            <?php
                            }
                            ?>   
                          </div>
                          
                        </div>
                      </form>         

                            <!-- bootstrap tabs end -->
                      <div class="col-sm-4 col-md-4 col-lg-4 pull-right" id='leftbar'>
                       <div class="custom total-box" style="margin-top:20px;">
                        <?php 
                        if($is_product_selected == 0)
                            echo '! Please <a href="?route=product/category">Select</a> a product before.';
                        else if($quantity == 0)
                               echo '! Please <a href="?route=Productdetails/productdtls&amount=$0&quantity=0&pxs='.$product_id.'">Select</a> a quantity before.';
                        else{
                        ?>
                         <div class="tot-img">
                             <img src="<?php echo $thumb; ?>" alt="">
                         </div>
                         <div class="tot-title text-center"><?php echo $product_name;?></div>
                           <div class="qty-box" id='bill_summery1'>
                           <table class="table">
                               <tbody>
                                   <tr><td>Quantity</td> <td class="r-m q-m" id="product_quantity"><?php echo $quantity;?></td> </tr>
                                  
                               <tr><td>Subtotal</td> <td class="r-m t-m" id="sub_total">$<?php echo $subtotal;?><sup>00</sup></td> </tr>
                                    <!--<tr><td >-<?php //echo $discount;?> % Cash</td> <td class="rr-m c-d" id="cash_discount">-$<?php echo $discount_amount;?> <sup style="font-size: 14px;">00</sup></td> </tr>-->
                                    
                                   <tr>
                                       <td>Shipping</td> 
                                       <td class="rr-m" >
                                           <span id="shipChargesRes"></span>
                                       </td> 
                                   </tr>
                                   <tr class="total"><td>&nbsp;</td></tr>
                                   <tr>
										<td style="line-height: 40px;">Total </td> 
                                       <td class="rr-m" style="line-height: 40px;   font-size: 20px !important;">
                                           <span class="t-a" id="totalAmount"></span>
                                       </td> 
                                   </tr>
                               </tbody>
                               </table>
							</div>
							<div class="custom col-w-237">
								<div class="unit-price-product-block step-one-unit-table">
									<div class="table-logo">
										&nbsp;
									</div>
									<div class="product-unit-block">
										Unit
									</div>
									<div class="price-product-block">
										Price
									</div>
									<div class="clr"></div>
								</div>
								<div id='discounted_prices_list'>
								</div>
							</div>
                         <?php
                         }
                         ?>
                         </div>
                     </div>
                            
                        </div>
                     
                     <div class="clr"></div>
                  </div>
				  <div id='final_description_container_buy_process' class="midbox col-sm-8" style="display:none">
						<h3><i class="fa fa-check-square-o" aria-hidden="true"></i> Congratulations for your Purchase</h3>
						<p class="text-muted">You only have to communicate with the seller to arrange the payment and shipping of the product</p>
						<div class="cong_bordered">
						<h3 id='finalization_vender_name'></h3>
						<p id='finalization_vender_phone'></p>
						<p id='finalization_vender_email'></p>
						<p id='finalization_vender_description'></p>

						</div>
						<button id='finalized_last_continue' class="continu" type="button">Continue</button>
				  </div>
               </div>
						
			</div>
            <div class="hidden-xs hidden-sm col-md-2 col-lg-2">&nbsp;</div>
         </div>
      </div>
      </div>
      
      <!--Login Modal start-->

<div id='login_model' class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
    
    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin:10px"><span aria-hidden="true">&times;</span></button>
    
    
      <div class="modal-body">
        
 <div class="col-sm-12 error-login"></div>

   <div class="col-sm-12 col-md-12 col-lg-12">
      <div class="clr"></div>
   </div>


<div class="col-sm-12 p0" id="quick-login">
                <div class="main-heading col-sm-12">Login</div>
                 <div class="clr"></div>
                <p><?php //echo $if_you_have_an_account_with_us; ?></p>
                <div class="form-group required">
                    <!--<label for="email"><?php //echo $entry_email; ?> *</label>-->
                    <input type="text" name="email" value="" placeholder="E-Mail" id="input-email" class="form-control btn-inp-rad" />
                </div>
                <div class="form-group required">
                        <!--<label for="password"><?php //echo $entry_password; ?> *</label>-->
                    <input type="password"  name="password" value="" id="input-password"  placeholder="Password" class="form-control pass btn-inp-rad" />
                </div>
                <div class="form-group">
                <button type="button" class="continu loginaccount col-sm-12 btn-reg-rad"  data-loading-text="Loading...">Login</button>
                <span class="pull-left" style="color:black;"><input type="checkbox" /> Don't close session</span>
                <a href="index.php?route=account/forgotten" class="pull-right" style="color:#312783;">
                 
                 Forget Password ?</a>
                </div>
                 <div class="clr"></div>
                <div style="border-bottom:1px solid #e5e5e5; height:20px;"></div>
                <br />
                <div class="" style="color:black;"> Don't have an account? <a href="<?php echo $base;?>index.php?route=account/register" style="color:#312783;">Register here.</a></div>
                <div class="clr" style="height:20px;"></div>

               <!-- <div class="form-group">
                <a href="<?php //echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
                </div>-->
            </div>
   
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->	  


<!--Login modal end-->


      
      
      
<script>

    $('#input-password').keypress(function(e)
	{
        if(e.which == 13)
		{
           	user_login();
        }
    });

	$('#quick-login .loginaccount').click(function()
	{
		user_login();
	});
	
	function user_login()
	{
		$.ajax(
		{
			url: 'index.php?route=account/register/login_login',
			type: 'post',
			data: $('#quick-login input[type=\'text\'], #quick-login input[type=\'password\']'),
			dataType: 'json',
			beforeSend: function()
			{
				//$('#quick-login .loginaccount').button('loading');
				$('#modal-quicksignup .alert-danger').remove();
			},
			success: function(json)
			{
				$('#modal-quicksignup .form-group').removeClass('has-error');
				if(json['islogged'])
				{
					//window.location.href="index.php?route=account/account";
					window.location.reload();
				}
				if (json['error'])
				{
					$('.error-login').html('<div class="col-sm-12 alert alert-danger" style="margin:5px;"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
					$('#quick-login #input-email').parent().addClass('has-error');
					$('#quick-login #input-password').parent().addClass('has-error');
					$('#quick-login #input-email').focus();
				}
				if(json['success'])
				{
					window.location.reload();
					//$('#modal-quicksignup').modal('hide');
				}
			}
		});
	}



	
	$('.login-reuired').click(function(event)
	{
		//event.preventDefault();
		$('#login_model').modal('show');
	});

</script>>      
      
      
      
      
      
      
      
      
      
      
      
      

<script type="text/javascript">
$(document).ready(function()
{
	$('.span-vendor-input-country').hide();
	$('.span-vendor-province-id').hide();
	$('.span-vendor-input-city').hide();

	$('.span-vendor-new-address').hide();
	$('.span-vendor-new-door-number').hide();
	$('.span-vendor-new-postcode').hide();	
	$('#new_address').hide();
	$('#newaddress').click(function()
	{
		$('#address_drop_down').hide();
		modify_address = 0;
		$('#new_address').show();
		$('#input-address-1').val('');
		$('#input-number').val('');
		$('#input-floor').val('');
		$('#input-apartment').val('');
		$('#input-postcode').val('');
		$('#country_id1').val('');
		$('#provience_id1').val('');
		// $('#').val(parsed_data[''])
	});
	$('.no-need-new-address').click(function()
	{
		$('#new_address').hide();
		$('#newaddress').show();
		 $('#address_drop_down').show();
	})
});

$('body').on('change', 'input[name=radiog_lite]', function()
{
	if ($('#radio12').is(':checked')) 
	{
		$('.other-extra').show();
		$('#newaddress').show();
	}
	else
	{
		$('.other-extra').hide();
		$('#new_address').hide();
	}
});
//ajax for cities
$('select[name=\'provience_id1\']').on('change', function() {
	
    var data_attribute = this.value;
    $.ajax({
      url: 'index.php?route=customuserdetail/userdetail/cities_lc',
      type:'POST',
      dataType: 'json',
      data: {city_id:data_attribute},
      success: function(data)
      {
       if(data==''){
         $('#input-city1').html('<option value="0" selected="selected"><?php echo $text_none; ?></option>');
       }
       var resulted_data =  '';
       for(i=0;i<data.length;i++)
       {
        resulted_data = resulted_data + "<option value = "+data[i].id+">"+data[i].localidad+"</option>"
      }
      $('#input-city1').html(resulted_data);
      
    }   
  });
  });

  
//for add data  
$(".save_address").click(function()
{
	vendordetail();
});
var vendor_num_val = '';
$('#vendor_no_number').change(function()
{       
	if(this.checked)
	{
		vendor_num_val = 'checked';
		alert('checking');
	}
	else
	{
		vendor_num_val = '';
	}
});
function vendordetail()
{
	var vendor_error =  false;
	var vendor_new_address = $('.vendor-new-address').val();
	var vendor_door_number = $('.vendor-new-door-number').val();
	var vendor_new_floor = $('.vendor-new-floor').val();
	var vendor_new_apt =$('.vendor-new-apt').val();
	var vendor_new_postcode =$('.vendor-new-postcode').val();
	var vendor_new_country =$('.vendor-input-country').val();
	var vendor_new_province =$('.vendor-province-id').val();
	var vendor_new_cty = $('.vendor-input-city').val();
	if(vendor_new_address == '')
	{
		$('.span-vendor-new-address').show();
		vendor_error =  true;
	}
	else
	{
		$('.span-vendor-new-address').hide();
	}

	if(vendor_door_number == '' && vendor_num_val == '')
	{
		$('.span-vendor-new-door-number').show();
		vendor_error =  true;
	}
	else
	{
		$('.span-vendor-new-door-number').hide();
	}

	if(vendor_new_postcode == '')
	{
		$('.span-vendor-new-postcode').show();
		vendor_error =  true;
	}
	else
	{
		$('.span-vendor-new-postcode').hide();
	}


	if(vendor_new_country == '')
	{
		$('.span-vendor-input-country').show();
		vendor_error =  true;
	}
	else
	{
		$('.span-vendor-input-country').hide();
	}
	if(vendor_new_province == '')
	{
		$('.span-vendor-province-id').show();
		vendor_error =  true;
	}
	else
	{
		$('.span-vendor-province-id').hide();
	}

	if(vendor_new_cty == '' || vendor_new_cty == null)
	{
		$('.span-vendor-input-city').show();
		vendor_error =  true;
	}
	else
	{
		$('.span-vendor-input-city').hide();
	}			

	if(vendor_error === true)
	{
		
	}
	else
	{
		request_type = 0;
		if(modify_address === 1)
		{
			request_type = 1;
		}
		else
		{
			request_type = 0;
		}
		$.ajax(
		{
			url: 'index.php?route=Buyprocess/buyprocessstep1/buy_verification_add_address',
			type: 'post',
			data: {request_type:request_type, modifying_address_id:modifying_address_id,  vendor_new_address:vendor_new_address, vendor_door_number:vendor_door_number, vendor_new_floor:vendor_new_floor, vendor_new_apt:vendor_new_apt, vendor_new_postcode:vendor_new_postcode, vendor_new_country:vendor_new_country, vendor_new_province:vendor_new_province, vendor_new_cty:vendor_new_cty},
			success: function (data)
			{
				console.log(data);
				parsed_data = JSON.parse(data);
				if(data !== 'not_inserted' || data !== 'not_updated')
				{
					if(parsed_data['modify'] === 1)
					{
						$(".shipAddress option[value='"+parsed_data['id']+"']").remove();
						$('.shipAddress').append('<option class="address_get" value="'+parsed_data['id']+'" data-address="'+parsed_data['new_address']+parsed_data['city']+parsed_data['country']+'" data-radius="<?php echo $radius;?>" data-shippCharges="<?php echo $own_shipping_price;?>" data-discountedTotal="<?php echo $discounted_total;?>" data-vendorId="<?php echo $vendor_id;?>" selected>'+parsed_data['new_address']+'</option>');
						$('.shipAddress').trigger("change");
					}
					else
					{
						$('.shipAddress').append('<option class="address_get" value="'+parsed_data['id']+'" data-address="'+parsed_data['new_address']+parsed_data['city']+parsed_data['country']+'" data-radius="<?php echo $radius;?>" data-shippCharges="<?php echo $own_shipping_price;?>" data-discountedTotal="<?php echo $discounted_total;?>" data-vendorId="<?php echo $vendor_id;?>" selected>'+parsed_data['new_address']+'</option>');
						$('.shipAddress').trigger("change");
					}
					$('#new_address').hide();
				}
			}
		});
	}
}
</script>
<script type="text/javascript">
$(document).ready(function() {
   var myRadio = $('input[name=radiog_lite]');
   var checkedValue = myRadio.filter(':checked').val();
            if(checkedValue=='I will agree with vendor'){
				
               $('.shipAddress').trigger("change");
            }else{
                 $('.address_tab').hide();
                value= $("#sub_total").html();
                $("#shipChargesRes").html(0);
                $("#totalAmount").html(value);
                $("#total_price_amount").html(value);
				
            }
 $('input[name=radiog_lite]').change(function(){
     checkedValue = myRadio.filter(':checked').val();
            if(checkedValue=='I will agree with vendor'){
               $('.address_tab').show();
               $('.shipAddress').trigger("change");
            }else if (checkedValue=='I will pick up the item'){
               $('.address_tab').hide();
            }
            });
            
});
$('#last_continue').click(function()
{
	$('#whole_container_buy_process').hide();
	
	$.ajax(
	{
		url: 'index.php?route=Buyprocess/buyprocessstep1/get_vendor_details',
		type: 'post',
		data: {product_id_final, product_id_final},
		success: function(data)
		{
			parsed_data = JSON.parse(data);
			splitted_name = parsed_data.v_name.split(' ');
			updated_name = splitted_name[1]+' '+splitted_name[0];
			
			$('#finalization_vender_phone').text(parsed_data.v_phone);
			$('#finalization_vender_email').text(parsed_data.v_email);
			$('#finalization_vender_name').text(updated_name);
			$('#finalization_vender_description').text(parsed_data.vendor_information);
		}
	});
	$('#final_description_container_buy_process').show();
	
});

$('#finalized_last_continue').click(function()
{
	//window.location.href = '<?php echo $base;?>';
	window.location.href = '<?php echo $base;?>';
		var quantity=$("#quantity_prod").val();
		var subtotal=$("#sub_total").html();
		var shiping_charges=$("#shipChargesRes").html();
		var total=$(".t-a").html();
		var deliverymethod=$(".delivery-method-save-order").val();
		var paymentmethod=$("#payment_method").val();
		//alert(deliverymethod);
		var product_image=$(".rev-img").attr("src");
		var save_amount=$(".big-txt").html();
		var ship_address=$("#radio12").val();
		
		if(ship_address!=null){
			
			ship_address=$('select[name=sec_address]').val()
			//alert(ship_address);
		}
		$.ajax({
			
			type:"POST",
			url:"index.php?route=Buyprocess/buyprocessstep1/place_order",
			data:{quantity:quantity,subtotal:subtotal,shiping_charges:shiping_charges,total:total,deliverymethod:deliverymethod,paymentmethod:paymentmethod,paymentmethod:paymentmethod,product_image:product_image,save_amount:save_amount,ship_address:ship_address,product_id_final:product_id_final},
			success:function(res)
			{
				window.location.href = '<?php echo $base;?>';
			}
});
	
	
});
   	var modify_address_id =0;
    $('#modify_address').click(function()
	{
		$('#newaddress').hide();
		$('#address_drop_down').hide();
		//alert(modify_address_id);
		modify_address = 1;
		$.ajax(
		{
			type:"POST", 
			data: {modify_address_id:modify_address_id},
			url:"index.php?route=Buyprocess/buyprocessstep1/get_address_to_modify",
			success: function(data)
			{
				console.log(data);
				parsed_data = JSON.parse(data);
				console.log(parsed_data);
				$('#input-address-1').val(parsed_data['new_address']);
				$('#input-number').val(parsed_data['door_number']);
				$('#input-floor').val(parsed_data['floor']);
				$('#input-apartment').val(parsed_data['apartment']);
				$('#input-postcode').val(parsed_data['postcode']);
				$('#country_id1').val(parsed_data['country']);
				$('#provience_id1').val(parsed_data['province']);
				// $('#').val(parsed_data[''])
				modifying_address_id = parsed_data['id'];
				$('#new_address').show();
			}
       });
	});
$('.shipAddress').change(function()
	{
        if($(this).val() !=='')
		{
			modify_address_id = $(this).val();
			$('#modify_address').css('display', 'block');
		}
		else
		{
			$('#modify_address').css('display', 'none');
		}
		$("#loadShippingCharges").show();
		$("#shippLoad_modal").show();
		var shipAddress = $('.shipAddress option:selected').attr("data-address");
		var vendorId = $('.shipAddress option:selected').attr("data-vendorId");
		var radius = $('.shipAddress option:selected').attr("data-radius");
		var shippCharges = $('.shipAddress option:selected').attr("data-shippCharges");
		var discountedTotal = $('.shipAddress option:selected').attr("data-discountedTotal");
               
		//alert(shipAddress+' '+vendorId+' '+radius+' '+shippCharges+' '+discountedTotal);
		$.ajax(
		{
			type:"POST", 
			data: "shipAddress=" + shipAddress + "&vendorId=" + vendorId + "&radius=" + radius + "&shippCharges=" + shippCharges,
			url:"index.php?route=Buyprocess/buyprocessstep1/getShipCharges",
			success: function(data)
			{
				$("#shipChargesRes").html('$'+data); 
				$("#shipChargesInput").val(data);
                                
                                if(discountedTotal>0){
				var total = parseInt(discountedTotal) + parseInt(data); 
                            }else{
                                var total = $("#sub_total").html();
                                
                                total=total.split("<sup>");
                                total=total[0].split("$");
                                total=total[1];
                                
                                var cash=$("#cash_discount").html();
                              cash=cash.split("<sup>");
                               cash=cash[0].split("$");
                                cash=cash[1];
                                total=total-cash;
        }
				$("#totalAmountInput").val(total);
				$(".t-a").html('$'+total);
				$("#loadShippingCharges").hide();
				$("#shippLoad_modal").hide();
				$( "#step-two" ).removeClass( "not-active" );
			},
			error: function()
			{
				$("#loadShippingCharges").hide();
				$("#shippLoad_modal").hide();
				alert('Something went wrong');
			}
		});
	}); 
    

</script>
 <!--  foooterarea-->
<?php
echo $footer;
?>
