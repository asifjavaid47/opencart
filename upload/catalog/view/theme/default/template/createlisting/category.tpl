<?php
//echo "<pre>";print_r($check_address); echo "</pre>";
echo $header; 
?>

<?php //echo $current_customer_id; ?>
<style type="text/css">

.mar_req_height_80	
	{
	 	height:90px;
		
	}
.txtcolor{
	color:red;
	font-size:10px;
	}	
</style>

<input type="hidden" value="<?php echo $current_customer_id;?>" class="current_customer_id" />

<div class="clr"></div>
<div class="search-product-head-container">
 <div class="container">
  <div class="search-produ-head">
  <!-- <div class="breadcum-block product-detai-bread">
    <ul>
     <li>Home</li>
     <li>></li>
     <li>SELL</li>
     <li>></li>
     <li>CREATE LISTING</li>
     <li>></li>
     <li>CHOOSE CATEGORY</li>
   </ul>
 </div>-->
</div>
</div>
</div>



<div class="min-height">
 <div class="container">
  <div class="row">
   <div class="hidden-xs hidden-sm col-md-2 col-lg-2">&nbsp;</div>

   <div class="container">
    <div class="row">
      <div class="col-sm-12 col-md-12 col-lg-12">
       <div class="buying-process-main">
        <div class="cart-section-block register">
          <div class="cart-step-one">
            <div class="step-one step-active">
             <span class="num-step num-step">1</span>
             <!-- <span class="step-tick"><img alt="" src="images/step-img-tick.png"> </span>-->
           </div>
           <div class="arrow-shoping">
             <img alt="" src="<?php echo $base;?>image/assets/images/step-1-divi.png">
           </div>
           <div class="clearfix"></div>
         </div>
         <div class="cart-step-one">
          <div class="step-one" >
           <span class="num-step" id="step_two">2</span>
         </div>
         <div class="arrow-shoping">
           <img alt="" src="<?php echo $base;?>image/assets/images/step-1-divi.png">
         </div>
         <div class="clearfix"></div>
       </div>
       <div class="cart-step-one">
        <div class="step-one">
         <span class="num-step" id="step_three">3</span>
       </div>
       <div class="arrow-shoping">
         <img alt="" src="<?php echo $base;?>image/assets/images/step-1-divi.png">
       </div>
       <div class="clearfix"></div>
     </div>
     <div class="cart-step-one last">
      <div class="step-one last-cart-step">
       <span class="num-step" id="step_four">4</span>
     </div>
     <div class="clearfix"></div>
   </div>
   <div class="clearfix"></div>

   <ul class="nav nav-tabs listing-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab" class="disable-cat">Choose Category</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab" class="disable-desc">Add Description</a></li>
    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab" class="disable-quantity-price">enter quantities and prices</a></li>
    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab" class="disable-review-listing">review listing</a></li>
  </ul>
</div>
</div>
</div>
<div class="clr"></div>
</div>
</div>

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 listing-wrapper">
  <div class="common-content">
    <!-- Tab panes -->
    <div class="tab-content">
      <div role="tabpanel" class="tab-pane fade in active" id="home">
        <div class="col-sm-3">
          <div class="listing-selection">
            <select size="3" class="main-cat">
              <?php foreach($get_category->rows as $key=> $val):?>
                <option value="<?php echo $val['category_id'];?>"><?php echo $val['name'];?></option>
              <?php endforeach; ?>
            </select>
          </div>
        </div>

        <div class="col-sm-3" id="sub_cat_1">
          <div class="listing-selection">
            <select size="3" class="sub-cat-1">
            </select>
          </div>
        </div>



        <div class="col-sm-3" id="sub_cat_2">
          <div class="listing-selection">
            <select size="3" class="sub-cat-2">
            </select>
          </div>
        </div>

        <div class="col-sm-3" id="sub_cat_3">
          <div class="listing-selection">
            <select size="3" class="sub-cat-3">
            </select>
          </div>
        </div>


        <div class="col-sm-3" id="sub_cat_4">
          <div class="listing-selection">
            <select size="3" class="sub-cat-4">
            </select>
          </div>
        </div>



        <div class="col-sm-3 congbox" id="continuebox">
          <div class="step-one step-active">
           <span class="num-step num-step"><i class="fa fa-check" aria-hidden="true"></i></span>
         </div>
         <div class="clr"></div>
         <span class="tick-mark"></span>
         Great! You've <br />selected a category. <br />Click continue.
         <div class="clr"></div>
         <a href="javascript:void(0);" class="continu btn btn-primary choose-cat-continue">Continue</a>
       </div>
       <div class="clr"></div>
       <div class="alert">
        <span>Categories you have selected</span>
        <div class="clr"></div>

        <span class="first-category-select"  style="color:#332690">Camaras y Accessories </span>
        <span class="second-category-select" style="color:#332690">  > Reflex y lentes </span>
        <span class="third-category-select"  style="color:#332690">   > Fotometros </span>
        <span class="forth-category-select"  style="color:#332690">   > Fotometros </span>
        <span class="fifth-category-select"  style="color:#332690">   > Fotometros </span>
      </div>
    </div>




    <div role="tabpanel" class="tab-pane fade" id="profile">


     <div id="profile" class="tab-pane fade in active add-description" role="tabpanel">
      <div style="border:0;" class="main-heading">title and description</div>
      <form class="form-inline">
       <div class="form-group">
         <div class="col-sm-3 text-right">Title:*</div>
         <div class="col-sm-9">
           <input type="text" placeholder="i.e,T-shirt for Man Christian Dior" class="form-control product-title" maxlength="64">
           <br>
           <span id="prod_chars">64</span> characters left

         </div>
       </div>
              <!--<div class="clr"></div>
              <div class="form-group">
                <div class="col-sm-3 text-right">Short Description:</div>
                <div class="col-sm-9">
                  <input type="text" placeholder="i.e,T-shirt for Man Christian Dior" class="form-control product-short-description" maxlength="64">
                  <i class="fa fa-question-circle" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="" data-original-title="This will help to find your item faster"></i>
                  <br>
                  <span id="desc_chars">64</span> characters left
                  
                </div>
              </div>-->
              <div class="clr"></div>
              <div class="form-group" style="display:none;">
                <div class="col-sm-3 text-right">Tags:*</div>
                <div class="col-sm-9">
                  <input type="hidden" placeholder="i.e,T-shirt for Man Christian Dior" class="form-control products-tag">
                  <i class="fa fa-question-circle" aria-hidden="true" data-toggle="tooltip" data-placement="right" title="" data-original-title="To help search engines to find your listing"></i>
                  <br>
                  <span id="countWord">Enter tags saperated by commas, The more the better.</span>
                </div>
              </div>
              
              
              
              
              
              <div class="clr"></div>
              <div class="form-group">
                <div class="col-sm-3 text-right">SKU:</div>
                <div class="col-sm-9">
                  <input type="text" placeholder="i.e,12875G" class="form-control products-sku"> 
                  <span class="span-product-sku" style="color:red; font-size:10px;">SKU already exists add another or system will generatr automatically!</span>
                </div>
              </div>
              
              
            </form>
            <div style="border:0;" class="main-heading">Add photos for your product</div>
            <!--<div class="subheading">*Do not upload logos banners or text in the photographs.</div>-->
            <br>
            <div class="col-sm-2">
              <div class="addphotos-wrap">
                <img src="<?php echo $base;?>image/no-image.png">
                <input type="file" class="img-browse" id="product_main_image" />
              </div>
              <br>
              <span style="display: block;" class="text-center">Main photo</span>
            </div>
            <div class="col-sm-2">

              <div class="addphotos-wrap no-image">
                <img src="<?php echo $base;?>image/no-image.png" class="product-hover-img" />
                <input type="file" class="img-browse product-img-upload" index="0" />
              </div>
            </div>
            <div class="col-sm-2">
              <div class="addphotos-wrap no-image">
                <img src="<?php echo $base;?>image/no-image.png" class="product-hover-img" />
                <input type="file" class="img-browse product-img-upload" index="1" />
              </div>
            </div>
            <div class="col-sm-2">
              <div class="addphotos-wrap no-image">
                <img src="<?php echo $base;?>image/no-image.png" class="product-hover-img" />
                <input type="file" class="img-browse product-img-upload"   index="2" />
              </div>
            </div>
            <div class="col-sm-2">
              <div class="addphotos-wrap no-image">
                <img src="<?php echo $base;?>image/no-image.png" class="product-hover-img" />
                <input type="file" class="img-browse product-img-upload"  index="3" />
              </div>
            </div>
            <div class="col-sm-2">
              <div class="addphotos-wrap no-image">
                <img src="<?php echo $base;?>image/no-image.png" class="product-hover-img" />
                <input type="file" class="img-browse product-img-upload"  index="4" />
              </div>
            </div>
            <div class="clr"></div>
            <div style="border:0;" class="main-heading">Product Description</div>
            <span class="span-product-condition col-sm-4" style="color:red; font-size:10px;">Please select the item condition!</span>
            <br />
            <div class="col-sm-2 text-right">Item Condition</div>
            <div class="col-sm-3">
              <br />
              <div class="col-sm-5 padding0">New Item</div>
              <input type="radio" name="product_condition" class="product-condition" value="new" />
              <br />
              <div class="col-sm-5 padding0">Used Item</div>
              <input type="radio" name="product_condition" class="product-condition" value="Used" />

              <!--<select size="2" style="width: 100%;" class="product-condition">
                <option value="new">New</option>
                <option value="Used">Used</option>
              </select>-->
            </div>
            <div class="clr"></div>
            <br>
            <!-- <div class="subheading">*Do not upload logos banners or text in the photographs.</div>-->
            <div class="clr"></div>
            <span class="desc-require" style="color: red; display: inline; font-size: 12px; margin-left: 25px; padding-left: 24px;">Please add description!</span>
            <br>
            <div class="col-sm-2 text-right">Main Description</div>
            <div class="col-sm-12">

             <main>
              <div class="adjoined-bottom">
                <div class="grid-container">
                  <div class="grid-width-100">
                    <!--<span class="desc-require">Please add description!</span>-->
                    <textarea  id="editor" name="editor" ></textarea>
                                        <!--<div id="editor">
                                            <h1>Hello world!</h1>
                                            <p>I'm an instance of <a href="http://ckeditor.com">CKEditor</a>.</p>
                                          </div>-->
                                        </div>
                                      </div>
                                    </div>
                                  </main>
                                </div>
                                <div class="clr"></div>
                                <br>
                                <a class="continu btn btn-info desc-continue pull-left" href="javascript:void(0);">Continue</a>
                                <!--<a class="continu btn btn-info desc-back pull-right" href="javascript:void(0);">Back</a>-->
                              </div>


                            </div>






                            <div id="messages" class="tab-pane fade" role="tabpanel">

                              <div style="border:0;" class="main-heading">Prices and stock</div>
                              <!--<div class="subheading">*Always enter real stock</div>-->
                              <br>
                              <form class="form-inline">
                       <!-- <div class="form-group">
                            <div class="col-sm-5 text-right">Available Stock:*</div>
                            <div class="col-sm-7">
                                <input type="text" onkeypress=" return isNumber(event);" placeholder="i.e,T-shirt for Man Christian Dior" class="form-control avail-stock" >
                                <br>
                                <span class="span-avail-stock" style="color:red; font-size:10px;"> Please add available stock!</span>
                                <span id="countWord">How many items do you have</span>
                            </div>
                        </div>
                        <div class="clr"></div>-->
                        <br>
                        <table class="listing-unittable">
                          <thead>
                            <tr>
                              <td colspan="1"></td>
                              <td>Unit</td>
                              <td>Price</td>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>Unit Price:*</td>
                              <td>x1</td>
                              <input type="hidden" class="quantity-one price-quantity" name="first_quantity" value="1" />
                              <td><span>$</span>&nbsp;<input type="text" onkeypress=" return isNumber(event);" name="first_price" placeholder="i.e, $10,00" class="form-control price-one price-quantity">
                                <span class="span-price-one" style="font-size:10px; color:red; margin-left: 20px;"> please enter price!</span>

                                <i title="" data-placement="right" data-toggle="tooltip" aria-hidden="true" class="fa fa-question-circle" data-original-title="Enter the unit price"></i>
                              </td>
                            </tr>
                            <tr>
                              <td>Quantity 1:*</td>
                              <td><span>x</span> &nbsp;<input type="text" placeholder="i.e, 10" onkeypress=" return isNumber(event);" name="second_quantity" class="form-control quantity-two price-quantity">
                                <span class="span-qty-two" style="font-size:10px; color:red; margin-left: 20px;"> please enter QTY!</span> 
                              </td>
                              <td><span>$</span> &nbsp;<input type="text" placeholder="i.e, $8,00" onkeypress=" return isNumber(event);" name="second_price"  class="form-control price-two price-quantity">
                                <span class="span-price-two" style="font-size:10px; color:red; margin-left: 20px;"> please enter price!</span>
                                <i title="" data-placement="right" data-toggle="tooltip" aria-hidden="true" class="fa fa-question-circle" data-original-title="Enter the discount price"></i>
                              </td>
                            </tr>
                            <tr>
                              <td>Quantity 2:</td>
                              <td><span>x</span> &nbsp;<input type="text" placeholder="i.e, 20" onkeypress=" return isNumber(event);" name="third_quantity"  class="form-control quantity-three price-quantity"></td>
                              <td><span>$</span> &nbsp;<input type="text" placeholder="i.e, $7,00" onkeypress=" return isNumber(event);" name="third_price"  class="form-control price-three price-quantity">
                                <span class="span-price-three" style="font-size:10px; color:red; margin-left: 20px;"> please enter price!</span>
                                <span class="data-icon"><i title="" data-placement="right" data-toggle="tooltip" aria-hidden="true" class="fa fa-question-circle" data-original-title="Enter the discount price"></i></span>
                              </td>
                            </tr>
                            <tr>
                              <td>Quantity 3:</td>
                              <td><span>x</span> &nbsp;<input type="text" placeholder="i.e, 50" onkeypress=" return isNumber(event);" name="forth_quantity"  class="form-control quantity-four price-quantity"></td>
                              <td><span>$</span> &nbsp;<input type="text" placeholder="i.e, $6,00" onkeypress=" return isNumber(event);" name="forth_price" class="form-control price-four price-quantity">
                                <span class="span-price-four" style="font-size:10px; color:red; margin-left: 20px;"> please enter price!</span>
                              </td>
                            </tr>
                            <tr>
                              <td>Quantity 4:</td>
                              <td><span>x</span> &nbsp;<input type="text" placeholder="i.e, 100" onkeypress=" return isNumber(event);" name="fifth_quantity" class="form-control quantity-five price-quantity"></td>
                              <td><span>$</span> &nbsp;<input type="text" placeholder="i.e, $5,00" onkeypress=" return isNumber(event);" name="fifth_price" class="form-control price-five price-quantity">
                                <span class="span-price-five" style="font-size:10px; color:red; margin-left: 20px;"> please enter price!</span>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                        <div class="form-group">
                          <div class="col-sm-5 text-right">Minimum buy:*</div>
                          <div class="col-sm-7">
                            <input type="text" placeholder="i.e, 5" class="form-control minimum-buy" onkeypress=" return isNumber(event);">    
                            <br>
                            <span class="col-sm-10 span-minimum-buy" style="color:red; font-size:10px;"> please enter minimum quantity!</span>
                            <span id="countWord">Minimum quantity allowed to buy</span>
                          </div>
                        </div>
                        <div class="clr"></div><br>


                        <div class="form-group">
                          <div class="col-sm-5 text-right">Available Stock:*</div>
                          <div class="col-sm-7">
                            <input type="text" onkeypress=" return isNumber(event);" placeholder="i.e,T-shirt for Man Christian Dior" class="form-control avail-stock" >
                            <br>
                            <span class="span-avail-stock" style="color:red; font-size:10px;"> Please add available stock!</span>
                            <span id="countWord">How many items do you have</span>
                          </div>
                        </div>
                        <div class="clr"></div><br>



                        <!--<div class="subheading">*Always enter real stock</div>-->
                        <div style="border:0; display:none;" class="main-heading" >Payment methods and discounts</div>
                        <div class="col-sm-12" style="display:none;">
                          <span class="col-sm-10 span-payment-method" style="color:red; font-size:10px;">Please check atleast one payment method</span>
                          <span class="col-sm-10 span-cash-and-discount" style="color:red; font-size:10px;">Please select cash payment method for discount!</span>
                          <span class="col-sm-10 span-wire-and-discount" style="color:red; font-size:10px;">Please select wire payment method for discount!</span>
                          <span class="col-sm-10 span-credit-and-discount" style="color:red; font-size:10px;">Please select credit card payment method for discount!</span>


                          <div class="col-sm-3 hpol">

                            <div class="form-group col-sm-12">
                              <input type="checkbox" id="cash_check" value="Cash">
                              <label for="cash-check">Cash</label>
                            </div>
                            <div class="form-group col-sm-12">
                              <input type="checkbox" id="wire_check" value="wire">
                              <label for="wire-check">Wire</label>
                            </div>
                            <div class="form-group col-sm-12">
                              <input type="checkbox" id="credit_check" value="credit card">
                              <label for="credit-check">Credit Card</label>
                            </div>
                          </div>
                          <div class="col-sm-6 hpol rt">
                            <div class="col-sm-12">
                              <input type="text" placeholder="i.e, 10" class="form-control pull-left cash-discount"><i class="prcnt-icon">%</i>
                            </div>
                            <div class="col-sm-12">
                              <input type="text" placeholder="i.e, 10" class="form-control pull-left wire-discount"><i class="prcnt-icon">%</i>
                            </div>
                            <div class="col-sm-12">
                              <input type="text" placeholder="i.e, 10" class="form-control pull-left credit-card-discount"><i class="prcnt-icon">%</i>
                            </div>
                            <i title="" data-placement="right" data-toggle="tooltip" aria-hidden="true" class="fa fa-question-circle" data-original-title="Add a discount to apply for each payment method. Enter 0 if you are not offering any discount."></i>
                          </div>
                        </div>
                        <div class="clr"></div><br>
                        <div style="border:0;" class="main-heading">Shipping</div>
                        <div col-sm-12="">

                         <span style="color:red; font-size:10px;" class="new-address-required">* Please add address to found product location!</span>
                          <br />
                          
                          <?php if(!empty($get_address)){?> 
                          <select name="shipping_ad" class="new-shipping-addr-dropdown form-control">
                          <?php foreach($get_address as $key => $option_addr){?>
                          <option value="<?php echo $key; ?>"><?php echo $option_addr; ?></option>
                          <?php } ?>
                          </select>
                          <?php } ?>
                          <a href="javascript:void(0)" class="new-address-link">+ Add Address</a>





                          <div id="new_address">

                           <?php
                           
                           /*if(isset($check_address))
                           {
                                foreach($check_address as $add_val){
                                    if (strpos($add_val['use_as'], 'Delivery Address') !== false) {
                                        $adrs = $add_val['new_address'];
                                        break;
                                    }else{
                                     $adrs = $add_val['new_address'];
                                    }
                                }
                            }
                            else
                            {
                              $adrs = '';
                            }*/
                     ?>
                     <input name="address_1" type="hidden" class="form-control checck-address-avail"  value="<?php echo $adrs;?>"  placeholder="Address"/>

                     <div class="form-group col-sm-6 mar_req_height_80 pl0 ">
                      <label for="address">Street</label>
                      <input style="width:100%;" name="address_1" type="text" class="form-control"  value=""  placeholder="Address"  id="input-address-1"/>
                      <?php if ($error_userdet_address_1) { ?>
                      <div class="text-danger span-address-valid txtcolor"><?php echo $error_userdet_address_1; ?></div>
                      <?php } ?>
                    </div>





                    <div class="form-group col-sm-12 mar_req_height_80">
                      <div class="row">
                        <div class="col-xs-3 pl0">
                          <label for="zip">Number *</label>
                          <input style="width:100%;" type="text"  name="vendor_doornumber" value="" class="form-control new-door-numb" placeholder="Number"/>
                          <?php if ($error_userdet_vendor_doornumber) { ?>
                          <div class="text-danger span-numb-valid txtcolor"><?php echo $error_userdet_vendor_doornumber; ?></div>
                          <?php } ?>

                        </div>
                        <div class="col-xs-3 pad_r_0">
                          <label for="zip">Floor</label>
                          <div class="clearfix"></div>
                          <input type="text" style="width:100%;"  name="vendor_floor" value="" class="form-control new-floor" placeholder="Floor"/>
                        </div>
                        <div class="col-xs-3 pad_r_0">
                          <label for="zip">Apartment</label>
                          <input type="text" style="width:100%;"  name="vendor_apartment" value="" class="form-control new-apt" placeholder="Apartment"  />
                        </div>
                        <div class="col-xs-3 pad_r_0">
                          <label for="zip"><?php echo $zipcode_labl;?></label>
                          <input type="text"  name="postcode" value="" class="form-control new-postcode" placeholder="Zip Code" />
                        </div>
                      </div>
                    </div>



                    <div class="form-group col-sm-3 mar_req_height_80 pl0">
                      <label for="country">Country</label>
                      <div class="clearfix"></div>
                      <select style="width:100%;" name="country_id" id="input-country" class="form-control">
                        <option value=""><?php echo $text_select; ?></option>
                        <?php foreach ($countries as $country) { ?>
                        <?php if ($country['country_id'] == $country_id) { ?>
                        <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                        <?php } ?>
                        <?php } ?>
                      </select>

                      <?php if ($error_userdet_country) { ?>
                      <div class="text-danger span-country-valid"><?php echo $error_userdet_country; ?></div>
                      <?php } ?>


                    </div>






                    <div class="form-group col-sm-3 mar_req_height_80 pl0 ">
                    	<label for="country"><?php echo $province_labl; ?></label>
                      <div class="clearfix"></div>
                      <select style="width:100%;" name="provience_id" id="provience_id" class="form-control">
                        <option value=""><?php echo $text_select; ?></option>
                        <?php foreach ($provience as $country) { ?>
                        <?php if ($country['id'] == $country_id) { ?>
                        <option value="<?php echo $country['id']; ?>" selected="selected"><?php echo $country['provincia']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $country['id']; ?>"><?php echo $country['provincia']; ?></option>
                        <?php } ?>
                        <?php } ?>
                      </select>

                      <?php if ($error_userdet_country) { ?>
                      <div class="text-danger span-province-valid txtcolor">Please select province!</div>
                      <?php } ?>
                    </div>



                    <div class="form-group col-sm-3 mar_req_height_80 pl0">
                     <label for="city"><?php echo $city_labl;?></label>
                     <div class="clearfix"></div>
                     <select style="width:100%;" name="city" id="input-city" class="form-control">
                     </select>
                     <?php if ($error_userdet_city) { ?>
                     <div class="text-danger span-city-valid"><?php echo $error_userdet_city; ?></div>
                     <?php } ?>                  
                   </div>
                   <a href="javascript:void(0);" class="save-new-address btn continu pull-left" style="margin-top: 34px; margin-left: 4px;"> Save Address</a>  
                   <a href="javascript:void(0);" class="cancel-new-address pull-left" style="margin-top: 34px; margin-left: 4px;">Cancel</a>  
                 </div>
                 
                 
                 

                 <div class="clearfix"></div>

                 <span class="span-shipping-select" style="color:red; font-size:10px; margin-left: 34px;">Please select correct shipping!</span>
                 <div class="form-group main-check col-sm-12">

                  <div class="form-group col-sm-12 sub-check">

					<br />
                    <div class="own-ship-default-hide">
                      <input type="checkbox" name="new_vendor_shipping" id="own-ship" class="own-ship-select new-vendor-shipping" value="i provide my own shipping">
                      <label for="own-ship">Vendor</label>
                      <span><input class="input-zone-delivery" type="text" name="vendor_zone_delivery" placeholder="Zone of delivery" /></span>
                      <span class="span-zone-delivery" style="color:red; font-size:10px;">Required!</span>
                    </div>


                    <input type="checkbox" name="new_buyer_shipping" id="buyer-pickup" class="new-buyer-shipping" value="buyer can pickup the item">
                    <label for="buyer-pickup">Buyer</label>

                    <br>



                    <input type="checkbox" name="new_xenvios_shipping" id="use_porcan" class="new-xenvios-shipping" value="user porcantidad shipping">
                    <label for="use-porcan">Xenvios</label>
                    <div class="form-group col-sm-12 shipping-attr">



                      <div class="col-sm-10 pull-right">
                      <span class="span-shipping-required">Below attributes is required!</span>
                        <input type="checkbox" name="" id="free-ship" class="porcantidad-free-ship" value="porcantidad free shipping">
                        <label for="free-ship">I will pay the shipping</label>
                        <div class="clearfix"></div>
                        <div class="form-inline">
                          <label style="width:10%;">Width</label>
                          <input type="text" style="width:70px;" placeholder="16" name="" class="form-control input-shipping-width" />
                          <select style="width:20%;" class="form-control option-shipping-width">
                            <option value="centimeters">Centimeters</option>
                            <option value="meters">Meters</option>
                          </select>
                        </div>

                        <div class="form-inline">
                          <label style="width:10%;">Height</label>
                          <input type="text" style="width:70px;" placeholder="16" name="" class="form-control input-shipping-height" />
                          <select style="width:20%;" class="form-control option-shipping-height">
                            <option value="centimeters">Centimeters</option>
                            <option value="meters">Meters</option>
                          </select>
                        </div>

                        <div class="form-inline">
                          <label style="width:10%;">Depth</label>
                          <input type="text" style="width:70px;" placeholder="16" name="" class="form-control input-shipping-depth" />
                          <select style="width:20%;" class="form-control option-shipping-depth">
                            <option value="centimeters">Centimeters</option>
                            <option value="meters">Meters</option>
                          </select>
                        </div>

                        <div class="form-inline">
                          <label style="width:10%;">Weight</label>
                          <input type="text" style="width:70px;" placeholder="16" name="" class="form-control input-shipping-weight" />
                          <select style="width:20%;" class="form-control option-shipping-weight">
                            <option value="grams">Grams</option>
                            <option value="kilos">Kilos</option>
                          </select>
                        </div>

                      </div>

                      <br>

                    </div>

                    <div class="clr"></div>
                    <br>
                    <!---own ship hide close-->



                  </div>
                  <div class="clr"></div>
                  <br>

                </div>
              </div>
              <div class="clr"></div><br>
              <div style="border:0;" class="main-heading">Warranty</div>
              <div class="col-sm-12">
               <span class="span-product-warranty" style="color:red; font-size:10px;">Please select the product warranty!</span>
               <br />

               <input type="radio" name="warranty" id="my-warranty" value="I provide warranty">
               <label for="my-warranty">I provide warranty</label>
               <br>
               <input type="radio" name="warranty" id="maker-warranty" value="Maker provides warranty">
               <label for="maker-warranty">Maker provides warranty</label>
               <br>
               <input type="radio" name="warranty" id="no-warranty" value="No warranty available">
               <label for="no-warranty">No warranty available</label>
             </div>
           </form>
           <a href="javascript:void(0);" class="submit-quantity-price continu pull-left" style="line-height:normal;">Next</a>
           <a href="javascript:void(0);" class="continu pull-right quantity-price-back" style="line-height:normal;">Back</a>
                <!--<input type="submit" class="" value="" style="line-height:normal;">
                <input type="submit" class="submit-quantity-price continu" value="Next" style="line-height:normal;">-->
                
                
              </div>


              <div id="settings" class="tab-pane fade" role="tabpanel">
               <div style="border:0;" class="main-heading">Choose listing type</div>
               <span class="col-sm-10 span-listing-type" style="color:red;font-size:10px;">Please select atleast one listing type!</span>
               <div class="col-sm-4" >
                <div class="gratis listing-type" id="1">
                 <h4>Publicacion Gratis</h4>
                 <p>Duracion de la campana: <strong class="big_green">60 dias</strong></p>
                 <p>Costo por publicar: <strong class="big_green sc">$0 <sup>00</sup></strong></p>
                 <p>Comision por venta: <strong class="big_green sc">5%</strong><br><span class="k_pr">del total de la venta</span></p>

                 <ul>
                  <li>Tus productos seran ordenados de acuerdo a tus ventas y tu reputacion</li>
                  <li>No apareceras en la pagina de inicio</li>
                </ul>
              </div>
            </div>
            <div class="col-sm-4">
              <div class="destacade listing-type" id="2">
               <h4>Publicacion Destacada</h4>
               <p>Duracion de la campana: <strong class="big_orange">llimitada</strong></p>
               <p>Costo por publicar: <strong class="big_orange sc">$0 <sup>00</sup></strong></p>
               <p>Comision por venta: <strong class="big_orange sc">6%</strong><br><span class="k_pr">del total de la venta</span></p>

               <ul>
                <li>Tus productos apareceran cerca de la cima de la busqueda</li>
                <li>Apareceras en el listado como Articulos Recomendados</li>
                <li>Compartiras espacio en la pagina de inicio</li>
              </ul>
            </div>
          </div>
          <div class="col-sm-4">
            <div class="liquidacion listing-type" id="3">
             <h4>Liquidacion</h4>
             <p>Duracion de la campana: <strong class="big_blue">llimitada</strong></p>
             <p>Costo por publicar: <strong class="big_blue sc">$0 <sup>00</sup></strong></p>
             <p>Comision por venta: <strong class="big_blue sc">7.5%</strong><br><span class="k_pr">del total de la venta</span></p>

             <ul>
              <li>Compartiras espacio en la pagina de inicio y en lo mas alto de la categoria</li>
              <li>Tus productos apareceran en las primeras 2 filas tituladas "Liquidacion"</li>
              <li>Apareceras en el listado de Luquidaciones</li>
            </ul>	
          </div>
        </div>

        <!--<iframe id="product_review_iframe" width="100%" height="500px" src="" class="listing-iframe"></iframe>-->
        <a class="continu btn btn-info review-product-submit" href="javascript:void(0);">Continue</a>
      </div>
    </div>
  </div>
</div>
<div class="hidden-xs hidden-sm col-md-2 col-lg-2">&nbsp;</div>
</div>
</div>
</div>


<div id="category_names"></div>

<div class="modal fade" id="login_panal_modal" data-keyboard="false" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body" style="padding-top: 0px;">
				<div class="col-sm-12 error-login"></div>
				<div class="col-sm-12 p0" id="quick-login">
					<div class="main-heading col-sm-12">Login</div>
					<div class="clr"></div>
					<div class="form-group required">
						<!--<label for="email"><?php //echo $entry_email; ?> *</label>-->
						<input type="text" name="email" value="" placeholder="E-Mail" id="input-email" class="form-control btn-inp-rad" />
					</div>
					<div class="form-group required">
						<!--<label for="password"><?php //echo $entry_password; ?> *</label>-->
						<input type="password"  name="password" value="" id="input-password"  placeholder="Password" class="form-control pass btn-inp-rad" />
					</div>
					<div class="form-group">
						<button type="button" class="continu loginaccount col-sm-12 btn-reg-rad"  data-loading-text="<?php echo $text_loading; ?>">Login</button>
						<span class="pull-left" style="color:black;"><input type="checkbox" /> Don't close session</span>
						<a href="index.php?route=account/forgotten" class="pull-right" style="color:#312783;">
              Forgot Password ?</a>
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

$('select#input-country').find('option:first').remove();

var check_current_customer_login = $('.current_customer_id').val();

	if(check_current_customer_login =='' && check_current_customer_login ==0){
		//event.preventDefault();
		$('#login_model').modal('show');
		check_current_customer_login_flag = 0;
	}else{
		//alert(check_current_customer_login);
		check_current_customer_login_flag = 1;
	}

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
					window.location.href='<?php echo $base;?>';//"index.php?route=customuserdetail/editaccount";
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
	



















var new_address_value_dropdown = $('.new-shipping-addr-dropdown').val();


$('.new-shipping-addr-dropdown').on('change', function() {
    new_address_value_dropdown = $(this).val(); 
});


  var validate_address = 0;
  var check_add_val = '';

  check_add_val = $('.checck-address-avail').val();

  if(check_add_val !=''){
    validate_address = 1;
     
	// $('.new-address-link').hide();
     
	$('.cancel-new-address').show();
	$('.new-address-required').hide();
 }
 else
 {
	$('.cancel-new-address').hide();
    $('.new-address-required').show();
    $('.new-address-link').show();
}

	
var new_address_flag = 0;

$('#new_address').hide();

$('.new-address-link').click(function(){
	new_address_flag = 1;
	$('#new_address').show();	
});


$('.cancel-new-address').click(function(){
	new_address_flag = 0;
	$('#new_address').hide();	
});
























var get_cat_id = '';

var product_title,product_short_description,product_tags,product_condition  , get_editor_html= '';
var product_sku = ''; 

var desc = 0;	
var quant  = 0;
var review = 0;
var db_flag = 0;

var flag_product_id = 0;

var product_condition_radio = '';
$('.span-product-condition').hide();

$('.product-condition').on('change', function() {
 product_condition_radio = $('input[name="product_condition"]:checked').val(); 

});


$(".minimum-buy").val("1");
$(".avail-stock").val("2");




$('#no-warranty').click();
$('#cash_check').trigger('click');
$('.cash-discount').val('10')
$(document).ready(function() {
	/* Umer code for login / register in this page start*/
  $.ajax(
  {
   url: 'index.php?route=createlisting/category/check_login',
   type: 'post',
			//data: {1},
			//async:false,
			success: function (data)
			{
				if(data==='not_logged_in')
				{
					//$('#login_panal_modal').modal('show');
				}
				//console.log(data);
			}
		});
  $('#input-password').keypress(function(e)
  {
   if(e.which == 13)
   {
				//alert('You pressed enter!');
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
    beforeSend: function() {
					//$('#quick-login .loginaccount').button('loading');
					$('#modal-quicksignup .alert-danger').remove();
				},
				complete: function() {
					//$('#quick-login .loginaccount').button('reset');
				},
				success: function(json) {
					$('#modal-quicksignup .form-group').removeClass('has-error');
					if(json['islogged']){
						 //window.location.href="index.php?route=account/account";
						   window.location.reload();
						 //window.location.href='<?php echo $base;?>';//"index.php?route=customuserdetail/editaccount";
           }
           if (json['error']) {
            $('.error-login').html('<div class="col-sm-12 alert alert-danger" style="margin:5px;"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
            $('#quick-login #input-email').parent().addClass('has-error');
            $('#quick-login #input-password').parent().addClass('has-error');
            $('#quick-login #input-email').focus();
          }

          if(json['success']){
             window.location.reload();
            $('#modal-quicksignup').modal('hide');
          }
        }
      });
 }












 /*Umer code end*/



 $('#category_names').hide();

 $('#sub_cat_1').hide();
 $('#sub_cat_2').hide();
 $('#sub_cat_3').hide();
 $('#sub_cat_4').hide();



 $('.first-category-select').hide();
 $('.second-category-select').hide();
 $('.third-category-select').hide();
 $('.forth-category-select').hide();
 $('.fifth-category-select').hide();		




 $('.main-cat').click(function () {


  $('#sub_cat_1').hide();
  $('#sub_cat_2').hide();
  $('#sub_cat_3').hide();
  $('#sub_cat_4').hide();

  var clicked_text1 = '';
  clicked_text1 = $(this).find("option:selected").text();
		//alert(clicked_text1);
    $('.first-category-select').text(clicked_text1);

    $('.first-category-select').show();
    $('.second-category-select').hide();
    $('.third-category-select').hide();
    $('.forth-category-select').hide();
    $('.fifth-category-select').hide();		










    var id = $(this).val();
    $('#category_names').html(id);
    $.ajax({
      url: 'index.php?route=createlisting/category/check_category',
      type: 'post',
      data: {"id":id},
      dataType: 'text',
      success: function (response){
				//alert(response);
				
				if(response !=''){
          $('.sub-cat-1').html(response);
          $('#sub_cat_1').show();
        }else{
          $('#continuebox').show();
        }
      }
    });

  });

 $('.sub-cat-1').click(function () {

  $('#sub_cat_2').hide();
  $('#sub_cat_3').hide();
  $('#sub_cat_4').hide();



  var clicked_text2 = '';
  clicked_text2 = $(this).find("option:selected").text();;
  $('.second-category-select').text(" > "+clicked_text2);

  $('.first-category-select').show();
  $('.second-category-select').show();
  $('.third-category-select').hide();
  $('.forth-category-select').hide();
  $('.fifth-category-select').hide();		





  var id = $(this).val();
  $('#category_names').html(id);
  $.ajax({
    url: 'index.php?route=createlisting/category/check_second_sub_category',
    type: 'post',
    data: {"id":id},
    dataType: 'text',
    success: function (response) {
				//alert(response);
				
        if(response !=''){
         $('.sub-cat-2').html(response);
         $('#sub_cat_2').show();
       }else{
         $('#sub_cat_2').hide();
       }
     }
   });		
});




 $('.sub-cat-2').click(function () {

  $('#sub_cat_3').hide();
  $('#sub_cat_4').hide();



  var clicked_text3 = '';
  clicked_text3 = $(this).find("option:selected").text();;
  $('.third-category-select').text(" > "+clicked_text3);

  $('.first-category-select').show();
  $('.second-category-select').show();
  $('.third-category-select').show();
  $('.forth-category-select').hide();
  $('.fifth-category-select').hide();		




  var id = $(this).val();
  $('#category_names').html(id);



  $.ajax({
    url: 'index.php?route=createlisting/category/check_third_sub_category',
    type: 'post',
    data: {"id":id},
    dataType: 'text',
    success: function (response) {
      if(response !=''){
       $('.sub-cat-3').html(response);
       $('#sub_cat_3').show();
     }else{
       $('#sub_cat_3').hide();
     }
   }
 });		
});


 $('.sub-cat-3').click(function () {

  $('#sub_cat_4').hide();



  var clicked_text4 = '';
  clicked_text4 = $(this).find("option:selected").text();;
  $('.forth-category-select').text(" > "+clicked_text4);

  $('.first-category-select').show();
  $('.second-category-select').show();
  $('.third-category-select').show();
  $('.forth-category-select').show();
  $('.fifth-category-select').hide();		






  var id = $(this).val();
  $('#category_names').html(id);

  $.ajax({
    url: 'index.php?route=createlisting/category/check_forth_sub_category',
    type: 'post',
    data: {"id":id},
    dataType: 'text',
    success: function (response) {
				//alert(response);
				
        if(response !=''){
         $('.sub-cat-4').html(response);
         $('#sub_cat_4').show();
       }else{
         $('#sub_cat_4').hide();
       }
     }
   });		
});



 $('.sub-cat-4').click(function () {

		//$('#sub_cat_4').hide();

	var clicked_text5 = '';
	clicked_text5 = $(this).find("option:selected").text();;
    
	$('.fifth-category-select').text(" > "+clicked_text5);

    $('.first-category-select').show();
    $('.second-category-select').show();
    $('.third-category-select').show();
    $('.forth-category-select').show();
    $('.fifth-category-select').show();		


    var id = $(this).val();
    $('#category_names').html(id);


  });





 $(".disable-desc").on("click", function(e) {
  if(desc == 0){
   return false;
 }
});

 $(".disable-quantity-price").on("click", function(e) {
  if(quant == 0){
   return false;
 }
});



 $(".disable-review-listing").on("click", function(e) {
		//alert(review)
		if(review == 0){
     return false;
   }
 });





 $('.choose-cat-continue').click(function (){

	if(check_current_customer_login_flag == 0)
	{
		$('#login_model').modal('show');
	}
	else
	{	 
     first_tabs_check();
	}
 });
 function first_tabs_check()
 {
  get_cat_id = $('#category_names').text();
	   //alert(get_cat_id);
	   if(get_cat_id !=''){
     desc = 1;
     console.log($('.disable-desc').attr("aria-expanded","true"));
     myparent = $('.disable-desc').attr("aria-expanded","true").parent();
     myparent.addClass("active");
     $('.disable-cat').attr("aria-expanded","false").parent().removeClass("active");
     $('#home').removeClass('active in');
     $('#profile').addClass('active in');
     $('#step_two').parent().addClass('step-active');
     $("html, body").animate({ scrollTop: 0 }, "fast");

     return true;
   }
 }



//title character limit

var maxLength = 64;
$('.product-title').keyup(function() {
  var length = $(this).val().length;
  var length = maxLength-length;
  $('#prod_chars').text(length);
});

$('.product-short-description').keyup(function() {
  var length1 = $(this).val().length;
  var length1 = maxLength-length1;
  $('#desc_chars').text(length1);
});





$('.span-product-sku').hide();


$(".products-sku").focusout(function(){
  product_sku = '';
  var sku_value = $(this).val();

  if(sku_value !=''){
    $.ajax({
     url: 'index.php?route=createlisting/category/product_sku',
     type: 'post',
     data: {"product_sku":sku_value},
     success: function(sku){
      if(sku == '1'){
       $('.products-sku').val('');
       $('.span-product-sku').show();
     }else{
       product_sku = sku_value;
       $('.span-product-sku').hide();
								//alert(product_sku);
              }

            },
          });
  }
});




$('.desc-require').hide();


window.second_tabs_check = function(){



 var form_error = false;

 product_title = $('.product-title').val();
				 // product_short_description = $('.product-short-description').val();
         product_tags = $('.products-tag').val();	
				  product_condition = product_condition_radio;//$('.product-condition').val();	


		  if(product_title == ''){	
            $('.product-title').css('border','1px solid red');
            form_error =  true;

          }else{
            $('.product-title').css('border','1px solid #ccc');
          }

				  /*if(product_short_description == ''){	
						$('.product-short-description').css('border','1px solid red');
						form_error =  true;
				  }else{
						$('.product-short-description').css('border','1px solid #ccc');
          }*/

				 /*if(product_tags == ''){	
						$('.products-tag').css('border','1px solid red');
						form_error =  true;
						return false;
				  }else{
						$('.products-tag').css('border','1px solid #ccc');
          }*/
				  //console.log(product_title);
				  
		
		if(product_condition_radio == ''){	
			$('.span-product-condition').show();
			form_error =  true;
			
		}else{
			$('.span-product-condition').hide();
        }
		
		
		
				  
         get_editor_html = CKEDITOR.instances['editor'].getData();
         if(get_editor_html == ''){
          $('.desc-require').show();
          return false;
        }else{
          $('.desc-require').hide();
        }




						  //if(product_title != '' && product_short_description !='' && product_tags !='' && get_editor_html !=''){	
                if(product_title != ''  && get_editor_html !='' && product_condition_radio !=''){	
								//if(db_flag == 0){
                 quant = 1;

                 myparent1 = $('.disable-quantity-price').attr("aria-expanded","true").parent();
                 myparent1.addClass("active");
                 $('.disable-desc').attr("aria-expanded","false").parent().removeClass("active");
                 $('#profile').removeClass('active in');
                 $('#messages').addClass('active in');
                 $('#step_three').parent().addClass('step-active');
                 $("html, body").animate({ scrollTop: 0 }, "fast");
                 return true;
								//}
						 // }else if(product_title == '' || product_short_description == '' || product_tags == '' ||  get_editor_html ==''){
            }else if(product_title == ''  ||  get_editor_html =='' || product_condition_radio == ''){


             myparent1 = $('.disable-desc').attr("aria-expanded","true").parent();
             myparent1.addClass("active");
             $('.disable-cat').attr("aria-expanded","false").parent().removeClass("active");
             $('.disable-quantity-price').attr("aria-expanded","false").parent().removeClass("active");
             $('.disable-review-listing').attr("aria-expanded","false").parent().removeClass("active");

             $('#profile').addClass('active in');
             $('#home').removeClass('active in');
             $('#messages').removeClass('active in');
             $('#settings').removeClass('active in');

             return 'uncomplete';
           }


         }

         $('.desc-continue').click(function () {
           second_tabs_check();	
         });





       });



var main_product_image = '';

$('#product_main_image').change( function(){
		var file_data = $("#product_main_image").prop("files")[0];   // Getting the properties of file from file field
		var form_data = new FormData();                  // Creating object of FormData class
		form_data.append("file", file_data);             // Appending parameter named file with properties of file_field to form_data

   $.ajax({
    url: 'index.php?route=createlisting/category/upload_product_main_img',
    type: 'post',
    data: form_data,
				//dataType: 'formData,',
				contentType: false,
				processData: false,

				success: function(data){
					
					//main_product_image = '<?php echo $base?>image/'+data;
					main_product_image = data;
					main_product_img_source = '<?php echo $base?>image/'+data;
					//alert(main_product_image);
          var get_main_product_image = $('#product_main_image').parent().children('img').attr('src',main_product_img_source);
					//alert(get_main_product_image);
				},
			});

 });



var store_product_image = [];
var append_product_img = '';
var get_index_atrr = '';

$('.product-img-upload').change( function(){
  get_index_atrr = $(this).attr("index");
  this_elem = $(this);
		var file_data1 = $(this).prop("files")[0];   // Getting the properties of file from file field
		var form_data1 = new FormData();                  // Creating object of FormData class
		form_data1.append("file", file_data1);             // Appending parameter named file with properties of file_field to form_data

   $.ajax({
    url: 'index.php?route=createlisting/category/upload_product_img',
    type: 'post',
    data: form_data1,
    contentType: false,
    processData: false,

    success: function(data){
                    //alert(data)
                    append_product_img = '<?php echo $base?>image/'+data;		
                    store_product_image[get_index_atrr] = data;
					//store_product_image.push(data);
					console.log(store_product_image);
					//alert(append_product_img);
					
					store_parent_div  = this_elem.parent();
					store_parent_div[0]['children'][0].src= append_product_img;
					//var show_product_image = $(this).parent();
				},
			});

 });






/* Third tab script start   price-quantity*/
function isNumber(evt){

  var iKeyCode = (evt.which) ? evt.which : evt.keyCode
  if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
  {
   return false;
 }
 return true;
}




$('.span-avail-stock').hide();
$('.span-price-one').hide();
$('.span-price-two').hide();
$('.span-price-three').hide();
$('.span-price-four').hide();
$('.span-price-five').hide();

$('.span-qty-two').hide();
$('.span-minimum-buy').hide();
$('.span-product-warranty').hide();

$('.span-payment-method').hide();


$('.span-shipping-select').hide();

$('.span-zone-delivery').hide();



var paymeny_method_flag = 0;

var require_shipping = '';
var use_porcantidad_or_own_shipping = '';
var buyer_pay_or_free_shipping = '';

var check_shipping_value = '';
var check_shipping_vendor_value = 0;
var check_shipping_porcantidad_value = 0;

var new_vendor_shipping = '';
var zone_delivery = '';

var new_buyer_shipping = '';

var new_xenvios_shipping = '';


var porcantidad_pay_shipping_checkbox = '';

var input_shipping_width = '';
var option_shipping_width = '';

var input_shipping_height = '';
var option_shipping_height = '';

var input_shipping_depth = '';
var option_shipping_depth = '';

var input_shipping_weight = '';
var option_shipping_weight = '';


var product_warranty = 'No warranty available';


$('.shipping-attr').hide();

$('.span-shipping-required').hide();









var avail_stock = '';
var price_one = '';

var qty_two = '';
var price_two = '';

var qty_three = '';
var price_three = '';

var qty_four = '';
var price_four = '';

var qty_five = '';
var price_five = '';
var minimum_buy  = '';


var cash_checkbox = 'Cash';
var wire_checkbox = '';
var credit_checkbox = '';

var cash_checkbox_value = 'Cash';
var wire_checkbox_value = '';
var credit_checkbox_value = '';


var cash_discount = '10';
var wire_discount = '';
var credit_card_discount = '';

$('.span-cash-and-discount').hide();
$('.span-wire-and-discount').hide();
$('.span-credit-and-discount').hide();




$('#cash_check').change(function()
{
 if(this.checked)
 {
  cash_checkbox = this.value;
}else{
  cash_checkbox = '';
}
});
$('#wire_check').change(function()
{
 if(this.checked)
 {
  wire_checkbox = this.value;
}else{
  wire_checkbox = '';
}
});

$('#credit_check').change(function()
{
 if(this.checked)
 {
  credit_checkbox = this.value;
}else{
  credit_checkbox = '';
}
});
	

	$('.porcantidad-free-ship').on('change', function() {
		
		porcantidad_pay_shipping_checkbox = this.checked ? this.value : '';
		//alert(porcantidad_pay_shipping_checkbox);
	});




 	$('.new-vendor-shipping').on('change', function() {
		
		new_vendor_shipping = this.checked ? this.value : '';
		//alert(new_vendor_shipping);
		
		
		if(new_vendor_shipping === 'i provide my own shipping'){
            check_shipping_vendor_value = 1;
	    }else{
		    check_shipping_vendor_value = 0;
		}
		
		
		
	});

 	$('.new-buyer-shipping').on('change', function() {
		
		new_buyer_shipping = this.checked ? this.value : '';
		//alert(new_buyer_shipping);
	});

 	$('.new-xenvios-shipping').on('change', function() {
		
		new_xenvios_shipping = this.checked ? this.value : '';
		//alert(new_xenvios_shipping);
		
		if(new_xenvios_shipping === 'user porcantidad shipping'){
			check_shipping_porcantidad_value = 1;
			$('.shipping-attr').show();
		}else{
			check_shipping_porcantidad_value = 0;
			$('.shipping-attr').hide();
		}
		
		
	});





function third_tabs_check(){




 var required_field = false;

 avail_stock =  $('.avail-stock').val();
 price_one = $('.price-one').val();
 qty_two = $('.quantity-two').val();
 price_two = $('.price-two').val();

 qty_three = $('.quantity-three').val();
 price_three = $('.price-three').val();

 qty_four = $('.quantity-four').val();
 price_four = $('.price-four').val();

 qty_five = $('.quantity-five').val();
 price_five = $('.price-five').val();

 minimum_buy  =  $('.minimum-buy').val();


 if(avail_stock == ''){
  $('.span-avail-stock').show();
  required_field =  true;
}else{
  $('.span-avail-stock').hide();
}


if(price_one == ''){
  $('.span-price-one').show();
  required_field =  true;
}else{
  $('.span-price-one').hide();
}



if(qty_two ==''){
  $('.span-qty-two').show();
  required_field =  true;
}else{
 $('.span-qty-two').hide();
}

if(price_two == ''){
  $('.span-price-two').show();
  required_field =  true;
}else{
  $('.span-price-two').hide();
}


if(qty_three !='' && price_three == ''){
  $('.span-price-three').show();
  required_field =  true;
}else{
  $('.span-price-three').hide();
}



if(qty_four !='' && price_four == ''){
  $('.span-price-four').show();
  required_field =  true;
}else{
  $('.span-price-four').hide();
}


if(qty_five !='' && price_five == ''){
  $('.span-price-five').show();
  required_field =  true;
}else{
  $('.span-price-five').hide();
}

if(minimum_buy == ''){
 $('.span-minimum-buy').show();
 required_field =  true;
}else{
 $('.span-minimum-buy').hide();
}

if(product_warranty == ''){
 $('.span-product-warranty').show();
 required_field =  true;
}else{
 $('.span-product-warranty').hide();
}



if(cash_checkbox == '' && wire_checkbox == '' && credit_checkbox == ''){
 $('.span-payment-method').show();
 paymeny_method_flag = 1;
}else{
  paymeny_method_flag = 0;
  $('.span-payment-method').hide();

  cash_checkbox_value = cash_checkbox;
  wire_checkbox_value = wire_checkbox;
  credit_checkbox_value = credit_checkbox;
}




cash_discount = $('.cash-discount').val();
wire_discount = $('.wire-discount').val();
credit_card_discount = $('.credit-card-discount').val();


//own_ship_price = $('.own-shipping-price').val();
//shipping_radius = $('.own-shipping-radius').val();

	  if(cash_discount !='' && cash_checkbox_value == ''){
		 $('.span-cash-and-discount').show();
			   //return false;
      }else{
        $('.span-cash-and-discount').hide();
      }
      if(wire_discount !='' && wire_checkbox_value == ''){
       $('.span-wire-and-discount').show();
			 // return false;
      }else{
       $('.span-wire-and-discount').hide();
     }

     if(credit_card_discount !='' && credit_checkbox_value == ''){
       $('.span-credit-and-discount').show();
			  //return false;
      }else{
       $('.span-credit-and-discount').hide();
     }


			/*if($("#buyer-ship").is(":checked") && own_ship_price == '') {
				 $('.own-shipping-price').css('border','1px solid red');
				 return false;
			}else{
			     $('.own-shipping-price').css('border','1px solid #ccc');
        }*/


        var price_quantity =[];
        $('.price-quantity').each(function(index){
          if($(this).val()){
           price_quantity[index] = $(this).val();
         }
       });



  
   
    if(new_vendor_shipping == '' && new_buyer_shipping == ''  && new_xenvios_shipping == ''){
		 $('.span-shipping-select').show();
		 
		 //alert("Please select the shipping method");
		 return false;
     }else{
		 $('.span-shipping-select').hide();
	 }




    zone_delivery = $('.input-zone-delivery').val();
	if(check_shipping_vendor_value == 1 && zone_delivery == ''){
		$('.span-zone-delivery').show();
		return false;
	}else{
		$('.span-zone-delivery').hide();
	}
	
	
	input_shipping_width = $('.input-shipping-width').val();
	option_shipping_width = $('.option-shipping-width').val();
	input_shipping_height = $('.input-shipping-height').val();
	option_shipping_height = $('.option-shipping-width').val();
	input_shipping_depth = $('.input-shipping-depth').val();
	option_shipping_depth = $('.option-shipping-depth').val();
	input_shipping_weight = $('.input-shipping-weight').val();
	option_shipping_weight = $('.option-shipping-weight').val();



if(check_shipping_porcantidad_value == 1){
		
	if(input_shipping_width == '' || option_shipping_width == '' || input_shipping_height == ''|| option_shipping_height == ''|| input_shipping_depth == '' || option_shipping_depth == ''  || input_shipping_weight == ''  || option_shipping_weight == '')
	{
		$('.span-shipping-required').show();
		return false;
    }else{
		$('.span-shipping-required').hide();
	}
	
}
	
	
	
	
	
        if(validate_address === 0 || new_address_flag === 1 ){

         validate_new_address();
         return false;

       }



 






       if(avail_stock != '' && price_one !='' && qty_two  !='' && price_two !='' && minimum_buy !='' && paymeny_method_flag != 1  ){	


        if((cash_discount !='' && cash_checkbox_value == '') || (wire_discount !='' && wire_checkbox_value == '') || (credit_card_discount !='' && credit_checkbox_value == '')){


         myparent4444 = $('.disable-quantity-price').attr("aria-expanded","true").parent();
         myparent4444.addClass("active");
         $('.disable-cat').attr("aria-expanded","false").parent().removeClass("active");
         $('.disable-desc').attr("aria-expanded","false").parent().removeClass("active");
         $('.disable-review-listing').attr("aria-expanded","false").parent().removeClass("active");

         $('#messages').addClass('active in');
         $('#home').removeClass('active in');
         $('#profile').removeClass('active in');
         $('#settings').removeClass('active in');

         return 'uncomplete';
       }



      review = 1;
      product_information();
						  //review = 1;

						  myparent2 = $('.disable-review-listing').attr("aria-expanded","true").parent();
						  myparent2.addClass("active");
						  $('.disable-quantity-price').attr("aria-expanded","false").parent().removeClass("active");
						  $('#messages').removeClass('active in');
						  $('#settings').addClass('active in');
						  
						  $('#step_four').parent().addClass('step-active');
						  $("html, body").animate({ scrollTop: 0 }, "fast");
						  return true;

           }else if(avail_stock == '' || price_one =='' || qty_two  =='' || price_two =='' || minimum_buy =='' || paymeny_method_flag == 1  ){


            myparent2 = $('.disable-quantity-price').attr("aria-expanded","true").parent();
            myparent2.addClass("active");
            $('.disable-cat').attr("aria-expanded","false").parent().removeClass("active");
            $('.disable-desc').attr("aria-expanded","false").parent().removeClass("active");
            $('.disable-review-listing').attr("aria-expanded","false").parent().removeClass("active");

            $('#messages').addClass('active in');
            $('#home').removeClass('active in');
            $('#profile').removeClass('active in');
            $('#settings').removeClass('active in');

            return 'uncomplete';
          }

        }


        var new_addredss_add  = '';
        var  new_province_add = '';
        var  new_numb_add     = '';
        var  new_country_add  = '';
        var  new_city_add     = '';
        var  new_floor_add    = '';
        var  new_apt_add      = '';
        var  new_postcode_add = '';







        $('#provience_id').change( function(){
         new_province_add =  $(this).val();
       });



        $('.span-address-valid').hide();
        $('.span-province-valid').hide();
        $('.span-numb-valid').hide();
        $('.span-country-valid').hide();
        $('.span-city-valid').hide();


        $('select#input-country').find('option[value="10"]').prop('selected', true);

        function validate_new_address(){

	          // alert("validate");
            if(validate_address != 1 || new_address_flag === 1){
             var  new_addre_required_field = false;

             new_addredss_add  =  $('#input-address-1').val();
             new_numb_add  =  $('.new-door-numb').val();
             new_country_add  =  $('#input-country').val();
             new_city_add  =  $('#input-city').val();
             new_floor_add  =  $('.new-floor').val();
             new_apt_add  =  $('.new-apt').val();
             new_postcode_add  =  $('.new-postcode').val();
				 //alert(new_country_add);
				//alert(new_addredss_add );
			   if(new_addredss_add == ''){
				 $('.span-address-valid').show();
				 new_addre_required_field =  true;
			   }else{
				 $('.span-address-valid').hide();
			   }
		
		
			   if(new_numb_add == ''){
				 $('.span-numb-valid').show();
				 new_addre_required_field =  true;
			   }else{
				 $('.span-numb-valid').hide();
			   }
		
			   if(new_province_add == ''){
				 $('.span-province-valid').show();
				 new_addre_required_field =  true;
			   }else{
				 $('.span-province-valid').hide();
			   }
		
			   if(new_city_add == ''){
				 $('.span-city-valid').show();
				 new_addre_required_field =  true;
			   }else{
				 $('.span-city-valid').hide();
			   }
		
		
			   if(new_addre_required_field === true){
							  //alert("return false");
							  return false;
				  }
				  else
				  {
				   $.ajax({
					url: 'index.php?route=createlisting/category/add_new_address',
					type: 'post',
					data: { "address":new_addredss_add , "door_number":new_numb_add, "floors_val":new_floor_add, "apt":new_apt_add,
					"postcde":new_postcode_add, "city":new_city_add, "country_id":new_country_add, "province":new_province_add},
					dataType: 'text',
					success: function (response) {
						    var parse_jsons = $.parseJSON(response);
                            //console.log("id is "+parse_jsons.last_id);
							//console.log(response);
							$('.new-shipping-addr-dropdown').append("<option value="+parse_jsons.last_id+">"+parse_jsons.comp_addr+"</option>");
							$("select.new-shipping-addr-dropdown option[value="+parse_jsons.last_id+"]").attr("selected", "selected");
							new_address_value_dropdown = parse_jsons.last_id;
							validate_address = 1;
							new_address_flag = 0;
							
							$('#input-address-1').val('');
							$('.new-door-numb').val('');
							$('#input-country').val('');
							$('#input-city').val('');
							$('.new-floor').val('');
							$('.new-apt').val('');
							$('.new-postcode').val('');
										   
										   
						   $('.new-address-required').hide();
						   $('#new_address').hide();
						   
						 }
					   });
				 }					  
       }



     }



     $('.save-new-address').click(function(){
      validate_new_address();
    });

     $('.submit-quantity-price').click(function(){
      validate_new_address();
      third_tabs_check();
    });	


     $('.quantity-price-back').click(function(){

       price_quantity_back = $('.disable-desc').attr("aria-expanded","true").parent();
       price_quantity_back.addClass("active");
       $('.disable-cat').attr("aria-expanded","false").parent().removeClass("active");
       $('.disable-quantity-price').attr("aria-expanded","false").parent().removeClass("active");
       $('.disable-review-listing').attr("aria-expanded","false").parent().removeClass("active");

       $('#profile').addClass('active in');
       $('#home').removeClass('active in');
       $('#messages').removeClass('active in');
       $('#settings').removeClass('active in');

       $("html, body").animate({ scrollTop: 0 }, "fast");


     });	



     $("input:radio[name=new_shipping]").click(function(){
             require_shipping = $(this).val();

			 if(require_shipping === 'i provide my own shipping'){
				  check_shipping_vendor_value = 1;
			      check_shipping_porcantidad_value = 0;
				  $('.shipping-attr').hide();
			 }
			 else if(require_shipping === 'buyer can pickup the item'){
				  check_shipping_vendor_value = 0;
				  check_shipping_porcantidad_value = 0;
				  $('.shipping-attr').hide();
			 }
			 else if(require_shipping === 'user porcantidad shipping'){
				  check_shipping_vendor_value = 0;
				  check_shipping_porcantidad_value = 1;
				  $('.shipping-attr').show();
			 }

			// alert(require_shipping);
			 
      });





     $("input:radio[name=warranty]").click(function(){
             product_warranty = $(this).val();
			 //alert(product_warranty);
      });






     function product_information(){
	//alert(flag_product_id);
	console.log("Category ID "+get_cat_id);
	console.log("Product Title "+product_title);
	//console.log("Product Short Description "+product_short_description);
	console.log("Product Tags "+product_tags);
	console.log("Product Conditions "+product_condition);
	console.log("Product Description "+get_editor_html);
	console.log("Product main image "+main_product_image);
	console.log("Product other imagee "+store_product_image);
	//alert("SKU "+product_sku);
	//alert("cash checkbox value "+ cash_checkbox_value);
	//alert("require shipping !!!!!!"+require_shipping);
	//alert("porcantidad or own shipping !!!!!!!!"+use_porcantidad_or_own_shipping);
	//alert("Buyer or free shipping !!!!!!!!"+buyer_pay_or_free_shipping);
	
	console.log("input width "+input_shipping_width);
	console.log("option width "+option_shipping_width);


	console.log("input height "+input_shipping_height);
	console.log("option height "+option_shipping_height);


	console.log("input depth "+input_shipping_depth);
	console.log("option depth "+option_shipping_depth);


	console.log("input weight "+input_shipping_weight);
	console.log("option weight "+option_shipping_weight);
	


	
	
	
	
	
	
	
	
 $.ajax({
  url: 'index.php?route=createlisting/category/product_information',
  type: 'post',
				//cache: false,
				data: {"cat_id":get_cat_id , "prod_title":product_title,  "prod_tags":product_tags ,
       "product_sku" :product_sku , "prod_condition" :product_condition , "prod_main_img":main_product_image , "store_product_image":store_product_image , 
       "prod_desc":get_editor_html , "avail_stock":avail_stock ,"qty_one": '1' , "price_one":price_one ,  "qty_two":qty_two , 
       "price_two":price_two  , "qty_three":qty_three , "price_three":price_three , "qty_four":qty_four , "price_four":price_four,
       "qty_five":qty_five , "price_five":price_five , "minimum_buy":minimum_buy , "cash_checkbox_value":cash_checkbox_value,
       "wire_checkbox_value":wire_checkbox_value , "credit_checkbox_value":credit_checkbox_value , "cash_discount":cash_discount,
       "wire_discount":wire_discount , "credit_card_discount":credit_card_discount , 
	   
	   "new_vendor_shipping":new_vendor_shipping ,"new_buyer_shipping":new_buyer_shipping ,"new_xenvios_shipping":new_xenvios_shipping ,
       
       "zone_delivery":zone_delivery , "porcantidad_pay_shipping_checkbox":porcantidad_pay_shipping_checkbox , "input_shipping_width":input_shipping_width ,
	   "option_shipping_width":option_shipping_width, "input_shipping_height":input_shipping_height , "option_shipping_height":option_shipping_height ,  
	   "input_shipping_depth":input_shipping_depth , "option_shipping_depth":option_shipping_depth , "input_shipping_weight":input_shipping_weight , 
	   "option_shipping_weight":option_shipping_weight , 
	    
	   "location_id":new_address_value_dropdown, 
	   "customer_id":check_current_customer_login,
	   
	   "flag_product_id":flag_product_id
	   //"use_porcantidad_or_own_shipping":use_porcantidad_or_own_shipping , "buyer_pay_or_free_shipping":buyer_pay_or_free_shipping ,
       
	   
	   

						//"prod_short_desc": product_short_description ,
          } ,
          async: false,
          success: function(response){
			  //alert(response);
            db_flag = 1;
            flag_product_id = response;
            console.log("Product id is "+flag_product_id);
            iframe_url = '<?php echo $base?>index.php?route=Productdetails/productdtls&amount=$0&quantity=0&pxs=';
            $('#product_review_iframe').attr("src",iframe_url+flag_product_id);
          },
        });
		 //alert("Product Information");

    }

    /* Third tab script end  */

    /* forth tab script start  */


    var listing_type = '';
    $(".listing-type").click(function(){
      listing_type = $(this).attr("id");			 
      $('.listing-type').removeClass('selected-listing-type');
      $(this).addClass('selected-listing-type');
			 //
			 //alert(listing_type);
     });


    $('.span-listing-type').hide();


    $(".disable-review-listing").click(function(){
      if(db_flag == 1){
				//alert("DB flag set!!!!");
        var check_value_of_second_tabs = second_tabs_check();


        if(check_value_of_second_tabs == 'uncomplete'){

         $('.disable-review-listing').attr("aria-expanded","false").parent().removeClass("active");
         $('#settings').removeClass('active in');
         console.log("return false second tabs");
         return false;
       }
       var check_values_of_third_tab = third_tabs_check();
       if(check_values_of_third_tab == 'uncomplete'){
         console.log("return false third tabs");
         return false;
       }else if(check_value_of_second_tabs != 'uncomplete' && check_values_of_third_tab != 'uncomplete' ){
				  // alert("request");
         third_tabs_check();
				   //product_information();
         }
       }
     });

    var warning_popup = 0;
    $(".review-product-submit").click(function(){


      if(listing_type == ''){
        $('.span-listing-type').show();
        return false;
      }else{
        $('.span-listing-type').hide();
        product_information();

        reviewparent = $('.disable-review-listing').attr("aria-expanded","true").parent();
        reviewparent.addClass("active");
        $('.disable-quantity-price').attr("aria-expanded","false").parent().removeClass("active");
        $('#messages').removeClass('active in');
        $('#settings').addClass('active in');

        $.ajax({
         url: 'index.php?route=createlisting/category/product_listing_update',
         type: 'post',
         data: {"prod_id":flag_product_id , "listing_type_id":listing_type} ,
         async: false,
         success: function(response){
          warning_popup = 1;
							// alert(warning_popup);
								//alert(response);
								$("html, body").animate({ scrollTop: 0 }, "fast");
								//window.location.href = "<?php echo $base;?>index.php?route=customuserdetail/editaccount";
								window.location.href = "<?php echo $base;?>index.php?route=Productdetails/productdtls&zamr=$"+price_one+"&xqtn=1&pxs="+flag_product_id;
							},
						});
      }
    });

    /* forth tab script end  */

    $('[data-toggle="tooltip"]').tooltip();



    window.onbeforeunload = return_not_saved;

    function return_not_saved()
    {
      if(warning_popup===0)
      {
       return "unsaved changes";
     }
   }


   $(document).ready(function() {
   //CKEDITOR.config.removePlugins = 'save,print,preview,find,about,maximize,showblocks,basicstyles,ImageButton';
   CKEDITOR.config.removePlugins = 'image';
 });


</script>

<script src="catalog/view/javascript/assets/ckeditor/ckeditor.js"></script>
<script src="catalog/view/javascript/assets/ckeditor/sample.js"></script>
<link href="catalog/view/javascript/assets/ckeditor/samples.css" rel="stylesheet" media="screen" />

<script>
	initSample();
</script>

<script>

  var check_img = '';
  var check_img1 = '';
  $(".addphotos-wrap > input").mouseover(function(){

   check_img = $(this).prevAll('img').first().attr("src");
	// alert(check_img);

  no_img = '<?php echo $base; ?>image/no-image.png';
  if(check_img == no_img){
    check_img = $(this).prevAll('img').first().attr("src" , "<?php echo $base; ?>image/no-image-hover.png");
  }else
  { 
  }


	// console.log(check_img);
	 //check_img = check_img.attr('src','<?php echo $base; ?>imageno-image-hover.png');
	  //check_img = $(this).attr('src','<?php echo $base; ?>image/no-image.png');

  });
  $(".addphotos-wrap > input").mouseout(function(){

    check_img1 = $(this).prevAll('img').first().attr("src");
    no_img1 = '<?php echo $base; ?>image/no-image-hover.png';


    if(check_img1 == no_img1)
    {
     check_img1 = $(this).prevAll('img').first().attr("src" , "<?php echo $base; ?>image/no-image.png")
   }
   else
   {
   }


 });


/*	$('.addphotos-wrap > img').hover(function(){
		if($(this).attr() == 'http://localhost/porcantidad/upload/image/no-image-hover.png'){
				
		}
		$(this).attr('src','<?php echo $base; ?>image/no-image-hover.png');
	})
  */</script>
  <style>
    #login_panal_modal{
     left:50%;
     height: 414px !important;
   }
   #login_panal_modal .modal-content{
     box-shadow:none;
     border:0;
   }
   .solo-en-block{
     margin-top:8px;
   }
   .search-input-block{
     height: 41px;	
   }
   .search-bar-container{
     font-size:14px;
   }
   .search-up-down{
     line-height: 1.3;
   }
   .top-icons-container{
     padding-top:14px;
   }
   .listing-type{
     cursor:pointer;
   }
 </style>



 <script type="text/javascript"><!--
  $('select[name=\'provience_id\']').on('change', function () {
    var data_attribute = this.value;
    $.ajax({
      url: 'index.php?route=customuserdetail/userdetail/cities_lc',
      type: 'POST',
      dataType: 'json',
      data: {city_id:data_attribute},
      success: function (data)
      {
        if (data == '') {
          $('#input-city').html('<option value="0" selected="selected">none</option>');
        }
        var resulted_data = '';
        for (i = 0; i < data.length; i++)
        {
          resulted_data = resulted_data + "<option value = " + data[i].id + ">" + data[i].localidad + "</option>"
        }
        $('#input-city').html(resulted_data);

      }
    });
  });

  $('select[name=\'country_id\']').trigger('change');
  //--></script>




  <?php echo $footer; ?>



