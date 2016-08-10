<?php 
echo $header;
?>
<style>
	.text-muted{
		font-size:14px;
		display:block;
		margin-top:9px;
	}
	.cart-step-one{
		width:19%;
	}
	

	
</style>




<div class="search-product-head-container">
  <div class="container">
    <div class="search-produ-head">
      <!--<div class="breadcum-block product-detai-bread">
        <ul>
          <li>Home</li>
          <li>></li>
          <li>Shop</li>
          <li>></li>
          <li>T-Shirt</li>
        </ul>
      </div>-->
    </div>
  </div>
</div>
<div class="min-height">
  <div class="container">
    <div class="row">
      <div class="hidden-xs hidden-sm col-md-2 col-lg-2">&nbsp;</div>
      <div class="col-md-12">
        <div class="container">
          <div class="row">
            <div class="col-sm-12">
              <div class="buying-process-main" style="margin-bottom:-45px;">
                <div class="cart-section-block register">
                  <div class="cart-step-one">
                    <div class="step-one step-active"> <span class="num-step num-step">1</span> 
                      <!-- <span class="step-tick"><img alt="" src="images/step-img-tick.png"> </span>--> 
                      
                    </div>
                    <div class="arrow-shoping"> <img alt="" src="<?php echo $base;?>image/assets/images/step-1-divi.png"> </div>
                    <div class="clearfix"></div>
                  </div>
                  <div class="cart-step-one">
                    <div class="step-one"> <span class="num-step">2</span> </div>
                    <div class="arrow-shoping"> <img alt="" src="<?php echo $base;?>image/assets/images/step-1-divi2.png"> </div>
                    <div class="clearfix"></div>
                  </div>
                  <div class="cart-step-one">
                    <div class="step-one"> <span class="num-step">3</span> </div>
                  </div>
                  <ul class="nav nav-tabs listing-tabs gfr" role="tablist">
                    <li role="presentation" style="margin-left:-80px;" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab" class="userdetail-tab"><?php echo $user_detail_heading;?></a></li>
                    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab" class="vendor-tab"><?php echo $tab_vendorname;?></a></li>
                    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab" class="company-tab"><?php echo $tab_companydetail;?></a></li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="clr"></div>
          </div>
        </div>
      </div>
      <div class="clearfix"></div>
      <!--<div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
        <div class="sideoptions">
          <ul>
          
        
            <li><a href="<?php echo $base;?>index.php?route=customuserdetail/myaccount"><i class="fa fa-user" aria-hidden="true"></i><?php echo $user_left_myaccount;?></a></li>
            <li><a href="<?php echo $base.'index.php?route=customuserdetail/editaccount'; ?>"><i class="fa fa-pencil-square-o" aria-hidden="true"></i><?php echo $user_left_editact;?></a></li>
            <li><a href="<?php echo $base;?>index.php?route=customuserdetail/resetpwd"><i class="fa fa-key" aria-hidden="true"></i><?php echo $user_lefft_pass;?></a></li>
            <li><a href="<?php echo $base;?>index.php?route=customuserdetail/addressbook"><i class="fa fa-book" aria-hidden="true"></i><?php echo $user_left_address;?></a></li>
            <!--<li><a href=""><i class="fa fa-envelope-o" aria-hidden="true"></i> my enquiry</a></li>
            <li><a href=""><i class="fa fa-star-half-o" aria-hidden="true"></i> reward points</a></li>
            <li><a href="<?php echo $base;?>index.php?route=account/logout"><i class="fa fa-sign-out" aria-hidden="true"></i> logout</a></li>
         </ul>
        </div>
      </div>-->
      
      <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 midbox" style="margin-top:0 !important;">
        <div class="common-content kkl" style="margin-top:-46px;">          
          <!-- Tab panes -->
          <div class="tab-content col-sm-12 p0">
            <div role="tabpanel" class="tab-pane fade in active" id="home">
              <div class="main-heading" style="padding:15px; text-transform:capitalize;"><?php echo $user_detail_heading;?></div>
              <span class="alert sub_caption"><?php echo $user_madatory_text;?></span>
              
              


              
              
              <div class="clear5"></div>
              <div class="clear5"></div>
              <!--<div class="section-heading" style="padding:15px;">user details</div>-->
              <form action="<?php echo $action; ?>"  method="post" enctype="multipart/form-data">
                <div class="form-group col-sm-5">
                 <!-- <label for="address">Street *</label>-->
                 <input name="address_1" type="text" class="form-control user-address-1"  value=""  placeholder="Street"  id="input-address-1"/>
                 <span class="text-muted"><?php echo $user_street_labl;?></span>
                 <?php if ($error_userdet_address_1) { ?>
                 <div class="text-danger span-user-address-1"><?php echo $error_userdet_address_1; ?></div>
                 <?php } ?>
               </div>
               <div class="form-group col-sm-4">
                <div class="pl0">
                 <!-- <label for="number">Number *</label>-->
                 <input type="text" class="form-control nomandatory user_detail_numbers" name="doornumber" value="" placeholder="Number" id="user_detail_numbers"/>
                 <span class="text-muted"><?php echo $user_number_labl;?></span>
                 <?php if ($error_userdet_doornumber) { ?>
                 <div class="text-danger span-nomandatory"><?php echo $error_userdet_doornumber; ?></div>
                 <?php } ?>
               </div>
             </div>
             
             
             <div class="form-group col-sm-3 padding0" style="margin-top: 8px;">
               <label for="no_number">&nbsp;<?php echo $user_no_number_checkbox;?></label>
               <input type="checkbox" class="pull-left no-number-checkbox" id="no_number" />
             </div>
             <div class="clearfix"></div>
             <div class="col-sm-3 form-group">
               <!-- <label for="floor">Floor</label>-->
               <input type="text" class="form-control nomandatory" placeholder="Floor" name="floor" value="" id="input-floor" />
               <span class="text-muted"><?php echo $user_optional_labl;?></span>
             </div>
             <div class="col-sm-3 form-group">
               <!-- <label for="apartment">Apartment</label>-->
               <input type="text" class="form-control nomandatory" placeholder="Apartment" name="apartment" value="" id="input-apartment" />
               <span class="text-muted"><?php echo $user_optional_labl;?></span>
             </div>
             <div class="col-sm-3 form-group">
              <!--<label for="zip"><?php echo $zipcode_labl;?> *</label>-->
              <input type="text"  name="postcode" value="" class="form-control nomandatory" placeholder="Zip Code"  id="input-postcode" />
              <span class="text-muted"><?php echo $user_zip_labl;?></span>
              <?php if ($error_userdet_postcode) { ?>
              <div class="text-danger span-input-zipcode"><?php echo $error_userdet_postcode; ?></div>
              <?php } ?>
            </div>
            <div class="col-sm-3 llo padding0" style="line-height:1.3;">
             <a target="_blank" href="http://www.andreani.com/buscador-de-codigos-postales-resultado" class="input_opt"><?php echo $user_zip_not_know;?></a>
           </div>
           <div class="form-group col-sm-9">
             <!-- <label for="country"><?php echo $country_labl; ?></label>-->
             <select name="country_id" id="input-country" class="form-control">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($countries as $country) { ?>
              <?php if ($country['country_id'] == $country_id) { ?>
              <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
            <span class="text-muted"><?php echo $user_country_labl;?></span>
            <?php if ($error_userdet_country) { ?>
            <div class="text-danger span-input-country"><?php echo $error_userdet_country; ?></div>
            <?php } ?>
          </div>
          <div class="form-group col-sm-9">
            <!--<label for="country"><?php echo $province_labl; ?></label>-->
            <select name="provience_id" id="provience_id" class="form-control">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($provience as $country) { ?>
              <?php if ($country['id'] == $country_id) { ?>
              <option value="<?php echo $country['id']; ?>" selected="selected"><?php echo $country['provincia']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $country['id']; ?>"><?php echo $country['provincia']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
            <span class="text-muted"><?php echo $user_providce_labl;?></span>
            <?php if ($error_userdet_country) { ?>
            <div class="text-danger span-input-province"><?php echo $error_userdet_country; ?></div>
            <?php } ?>
          </div>
          
          
          
          
          <div class="form-group col-sm-9">
            <!--<label for="city"><?php echo $city_labl;?> *</label>-->
            <select name="city" id="input-city" class="form-control">
            </select>
            <span class="text-muted"><?php echo $user_city_labl;?></span>
            <?php if ($error_userdet_city) { ?>
            <div class="text-danger span-input-city"><?php echo $error_userdet_city; ?></div>
            <?php } ?>
          </div>
          
          

          <div class="form-group col-sm-6">
           <!-- <label for="tax"><?php echo $tax_id_labl; ?> *</label>-->
           <input type="text" name="tax_id" id="tax_id" class="form-control" value="" placeholder="Tax ID" />
           <span class="text-muted"><?php echo $user_tax_labl;?></span>
           <?php if ($error_userdet_taxid) { ?>
           <div class="text-danger span-tax-id"><?php echo $error_userdet_taxid; ?></div>
           <?php } ?>
           
           <?php if ($error_userdet_taxid_already_exists) { ?>
           <div class="text-danger span-tax-already-exists"><?php echo $error_userdet_taxid_already_exists; ?></div>
           <?php } ?>

           
           
           
           
         </div>
         <div class="clearfix"></div>
         <div class="ask-btn alert">
          <!--<input type="submit" value="Continue" class="continu pull-left submit-user-detail" />-->
          <a href="javascript:void(0);" class="continu pull-left submit-user-detail" ><?php echo $btn_nextstep;?></a>
          <a href="<?php echo $base;?>index.php?route=customuserdetail/editaccount" style="color:#332690; font-size: 14px;" class="pull-right" ><?php echo $link_contlater;?></a> </div>
        </form>
      </div>
      
      
      
      
      <!--vendor detail tab start-->  
      <div role="tabpanel" class="tab-pane fade" id="profile">
       
       <div class="main-heading" style="padding:15px; text-transform:capitalize;"><?php echo $step_vendor_head_labl?></div>
       <span class="alert sub_caption"><?php echo $step_vendor_sub_cation_labl;?></span>
       <form id="appendhash" action="<?php echo $action; ?>"  method="post" enctype="multipart/form-data">
        <div class="form-group col-sm-12 height_75">
         <div class="col-sm-6">
          <input type="text" class="form-control vendor-name maximize" id="name" placeholder="Contact name"  name="name" value=""/>
          <span class="text-muted"><?php echo $step_vendor_name_ex;?></span>
          <div class="text-danger span-vendor-name"><?php echo $error_userdet_name; ?></div>
        </div>
        <div class="col-sm-5 text-center padding0">
         <a style="font-size: 1.2em;" class='input_opt' id="user_details"><?php echo $step_vendor_user_reg_txt;?></a>
         <br />
         <span class="text-muted"><?php echo $step_vendor_load_info_txt;?></span>
       </div>
     </div>
     <div class="form-group col-sm-12 height_75">
      <div class="col-sm-6">
        <input type="text" class="form-control vnumbersOnlyphone vendor-phone maximize" id="phone" onkeypress=" return isNumber(event);" placeholder="Contact phone"  name="phone" value="" />
        <span class="text-muted"><?php echo $step_vendor_phonee_ex;?></span>
        <div class="text-danger span-vendor-phone"><?php echo $error_userdet_phone; ?></div>
      </div>
    </div>
    <div class="form-group col-sm-12 height_75">
      <div class="col-sm-6">
        <input type="text" class="form-control vendor-email maximize" id="email" placeholder="Contact email" name="email"  value="" />
        <span class="text-muted"><?php echo $step_vendor_email_ex;?></span>
        <div class="text-danger span-vendor-email"><?php echo $error_userdet_email; ?></div>
      </div>

    </div>

    <div class="form-group col-sm-12 height_75">
      <div class="col-sm-9">
        
        <select class="form-control vendor-sec-address maximize" name="sec_address">
          <option><?php echo $get_address;?></option>
        </select>
        <span class="text-muted"><?php echo $step_vendor_address_text_option;?></span>
      </div>
      
      <a  href"javascript:void(0);"  class="input_opt add-new-address" id="newaddress"><?php echo $step_vendor_new_address_text;?></a>
    </div>


    <div id="new_address" class="col-sm-12">

      <div class="form-group col-sm-5">
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

    <div class="col-sm-3 form-group">
     <!-- <label for="floor">Floor</label>-->
     <input type="text" class="form-control nomandatory vendor-new-floor" placeholder="Floor" name="floor" value="" id="input-floor" />
     <span class="text-muted"><?php echo $user_optional_labl;?></span>
   </div>
   <div class="col-sm-3 form-group">
     <!-- <label for="apartment">Apartment</label>-->
     <input type="text" class="form-control nomandatory vendor-new-apt" placeholder="Apartment" name="apartment" value="" id="input-apartment" />
     <span class="text-muted"><?php echo $user_optional_labl;?></span>
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

                              <div class="form-group col-sm-9 height_75">
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


                              <div class="form-group col-sm-9 height_75">
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

                              <div class="form-group col-sm-8 height_75">
                               <select name="city" id="input-city1" class="form-control vendor-input-city">
                               </select>
                               <span class="text-muted"><?php echo $step_vendor_cty_ex;?></span>
                               <div class="text-danger span-vendor-input-city"><?php echo $error_userdet_city; ?></div>
                             </div>
                             <div class="form-group col-sm-4 height_75">
                               <a href="javascript:void(0);" class="input_opt no-need-new-address"><?php echo $step_vendor_existing_address_txt;?></a>
                             </div>
                             
                            <div class="clearfix"></div>
                          </div>	
                          
                          <div class="form-group col-sm-8">
                              <label for="" class="col-sm-12 vvbv"><?php echo $step_vendor_cust_info_txt;?></label>
                              <div class="clear5"><br /></div>
                              <span class="text-muted"><?php echo $step_vendor_purchase_txt;?></span>
                              <div class="clr"></div>
                              <textarea class="maximize vendor-customer-information" rows="4" cols="12" placeholder="Enter text here"></textarea>
                              <span class="text-muted col-sm-7 padding0"><?php echo $step_vendor_purchase_ex_txt;?></span>
                              <span class="text-muted col-sm-5 text-right padding0"><?php echo $step_vendor_txt_left?></span>
                              <div class="clearfix"></div>
                          </div>
                          
                          
                          
                          
                          
                          <div class="clr"><br /></div>
                          <div class="ask-btn alert">
                           <!--<input type="submit" value="Continue" class="continu pull-left" />-->
                           <a href="javascript:void(0);" class="continu pull-left submit-vendor-detail" ><?php echo $btn_nextstep;?></a>
                           <a href="<?php echo $base;?>index.php?route=customuserdetail/editaccount" class="pull-right input_opt" ><?php echo $step_vendor_finish_later;?></a>

                         </div>
                       </form>
                     </div>
                     <!--vendor detail tab end-->  
                     
                     <!--company detail tab start-->  
                     
                     <div role="tabpanel" class="tab-pane fade" id="messages">
                      
                      
                      
                      

                       
                       
                      <div class="main-heading" style="padding:15px;"><?php echo $step_company_head_labl;?></div>
                      <span class="alert sub_caption"><?php echo $step_company_sub_caption;?></span>
                      <form id="appendhash1" action="<?php echo $action; ?>"  method="post" enctype="multipart/form-data">

                        
                        <div class="form-group col-sm-6">
                          
                          <input type="text" name="company_name" value="" class="form-control company-names" id="companyname" placeholder="<?php echo $company_name_labl;?>" />
                          <span class="text-muted"><?php echo $step_company_co_name_ex;?></span>
                          <?php if ($error_userdet_companyname) { ?>
                          <div class="text-danger span-company-names"><?php echo $error_userdet_companyname; ?></div>
                          <?php } ?>                      

                        </div>
                        <div class="clearfix"></div>
                        <div class="form-group col-sm-9">
                          <select class="form-control company-address" name="company_address" >
                           <option><?php echo  $address." ". $door_number." ".$floor .$apartment.","." ".$city.", ".$province.", ".$countrys; ?></option>
                           <option><?php echo isset ($complete_address)?$complete_address:''; ?></option>
                         </select>
                         <span class="text-muted"><?php echo $step_company_cont_add_txt;?></span>
                         <div class="clr"><br /></div>
                       </div>
                       <div class="col-sm-3 text-center padding0">
                         <a class="input_opt add-new-address1" style="font-size: 1.2em;"><?php echo $step_company_new_add_txt;?></a>
                       </div>
                       
                       <div id="new_address1">
                        
                        
                        
                        <div class="form-group col-sm-5">
                          <input type="text" id="input-address-3" placeholder="Street" value="" class="form-control user-address-3 company-new-address" name="address_1">
                          <span class="text-muted"><?php echo $step_company_street_ex;?></span>
                          <?php if ($error_userdet_address_1) { ?>
                          <div class="text-danger span-company-new-address"><?php echo $error_userdet_address_1; ?></div>
                          <?php } ?>
                          
                        </div>
                        
                        <div class="form-group col-sm-4">
                          <div class="pl0">
                            <input type="text" id="input-number" placeholder="Number" value="" name="doornumber" class="form-control company-door-numner">
                            <span class="text-muted"><?php echo $user_number_labl;?></span>
                            <div class="text-danger span-company-door-numner"><?php echo $error_userdet_doornumber;?></div>
                          </div>
                        </div>
                        
                        <div style="margin-top: 8px;" class="form-group col-sm-3 padding0">
                         <label for="no_number">&nbsp;<?php echo $user_no_number_checkbox;?></label>
                         <input type="checkbox" id="no_number_company" class="pull-left no-number-checkbox company-no-number-checkbox">
                       </div>
                       
                       <div class="clearfix"></div>
                       
                       
                       <div class="col-sm-3 form-group">
                        <input type="text" id="input-floor" value="" name="floor" placeholder="Floor" class="form-control nomandatory company-floor">
                        <span class="text-muted"><?php echo $user_optional_labl;?></span>
                      </div>
                      
                      <div class="col-sm-3 form-group">
                        <input type="text" id="input-apartment" value="" name="apartment" placeholder="Apartment" class="form-control nomandatory company-apt">
                        <span class="text-muted"><?php echo $user_optional_labl;?></span>
                      </div>
                      
                      <div class="col-sm-3 form-group">
                        <input type="text" id="input-postcode" placeholder="Zip Code" class="form-control nomandatory company-postcode" value="" name="postcode">
                        <span class="text-muted"><?php echo $user_zip_labl;?></span>
                        <div class="text-danger span-company-postcode"><?php echo $error_userdet_postcode;?></div>
                      </div>
                      
                      <div style="line-height:1.3;" class="col-sm-3 llo padding0">
                       <a class="input_opt" href="http://www.andreani.com/buscador-de-codigos-postales-resultado" target="_blank"><?php echo $user_zip_not_know;?></a>
                     </div>
                     
                     
                     
                     
                     
                     <div class="form-group col-sm-9">
                      <select name="country_id" id="input-country" class="form-control company-country">
                        <option value=""><?php echo $text_select; ?></option>
                        <?php foreach ($countries as $country) { ?>
                        <?php if ($country['country_id'] == $country_id) { ?>
                        <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                        <?php } ?>
                        <?php } ?>
                      </select>
                      <span class="text-muted"><?php echo $user_country_labl;?></span>
                      <?php if ($error_userdet_country) { ?>
                      <div class="text-danger span-company-country"><?php echo $error_userdet_country; ?></div>
                      <?php } ?>
                    </div>

                    
                    
                    
                    <div class="form-group col-sm-9">
                      <select name="provience_id_company" id="provience_id_company" class="form-control company-province">
                        <option value=""><?php echo $text_select; ?></option>
                        <?php foreach ($provience as $country) { ?>
                        <?php if ($country['id'] == $country_id) { ?>
                        <option value="<?php echo $country['id']; ?>" selected="selected"><?php echo $country['provincia']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $country['id']; ?>"><?php echo $country['provincia']; ?></option>
                        <?php } ?>
                        <?php } ?>
                      </select>
                      <span class="text-muted"><?php echo $user_providce_labl;?></span>
                      <?php if ($error_userdet_country) { ?>
                      <div class="text-danger span-company-province"><?php echo $error_userdet_country; ?></div>
                      <?php } ?>

                      
                    </div>


                    <div class="form-group col-sm-9">
                     <select name="city" id="input-city-company" class="form-control company-city">
                     </select>
                     <span class="text-muted"><?php echo $user_city_labl;?></span>
                     <?php if ($error_userdet_city) { ?>
                     <div class="text-danger span-company-city"><?php echo $error_userdet_city; ?></div>
                     <?php } ?> 
                     
                   </div>


                   <div style="line-height:1.3;" class="col-sm-3 llo padding0">
                     <a class="input_opt company-no-need-new-address" href="javascript:void(0);"><?php echo $step_company_exis_add;?></a>
                   </div>      


                 </div>
                 
                 
                 
                 <div class="clearfix"></div>
   
   
                                     
                                  <div class="col-sm-4">
                                   <label class="common-label"><?php echo $step_company_logo;?></label>
                                 </div>
                                 
                                 <div class="col-sm-5">
                                   <div class="uploaded_thumb maximize ">
                                     <img class="displaylogo" src="<?php echo $base;?>image/assets/images/no-image.png" />
                                   </div>
                                   
                                   
                                   
                                   <div class="input_browse continu maximize text-center">
                                    <span class="clogo-text">Upload</span>
                                     <input type="file" style="opacity:0;" id="companylogo"  name="upload_company_logo" accept="img/*" value=""  class="clogo" />
                                   </div>
                                   
                                   <span class="text-muted"><?php echo $step_company_logo_size;?></span>
                                   <br />
                                 </div>
                                 
                                 <div class="clearfix"><br /></div>
                                 
                                 
                                 <div class="col-sm-4">
                                   <label class="common-label"><?php echo $step_company_banner;?></label>
                                 </div>
                                 
                                 <div class="col-sm-7">
                                   <div class="uploaded_thumb maximize ">
                                    <img class="displaybanner" src="<?php echo $base;?>image/assets/images/no-image.png" />
                                  </div>
                                  <div class="input_browse continu maximize text-center">
                                   <span class="cbanner-text">Upload</span>
                                   <input type="file" style="opacity:0;" id="companybanner" class="cbanner" name="company_banner" accept="img/*" />
                                 </div>
                                 <div class="clearfix"><br /></div>
                                 <span class="text-muted"><?php echo $step_company_banner_size;?></span>
                               </div>
                               
                               <div class="clearfix"><br /></div>
                               
                               
                               <a style="width:30%;" href="javascript:void(0);" class="continu pull-left submit-company-detail" ><?php echo $step_finish_txt;?></a>
                               <a href="<?php echo $base;?>index.php?route=customuserdetail/editaccount" class="input_opt pull-right" ><?php echo $step_vendor_finish_later;?></a>
                               
                             </form>
                           </div>
                           <!--company detail tab end -->  
                         </div>
                       </div>
                     </div>
                     <div class="hidden-xs hidden-sm col-md-2 col-lg-2">&nbsp;</div>
                   </div>
                 </div>
               </div>
               <?php 
               //echo $my_custom_text;
               ?>
               <script>
                
		$('select#input-country').find('option:first').remove();
		$('select#input-country1').find('option:first').remove();
				
				
				/********* user detail tab start ************/  
                var vendor_tab = 0;
                var company_tab = 0;

                $('.span-user-address-1').hide();
                $('.span-nomandatory').hide();
                $('.span-input-zipcode').hide();
                $('.span-input-country').hide();
                $('.span-input-province').hide();
                $('.span-input-city').hide();
                $('.span-tax-id').hide();
				$('.span-tax-already-exists').hide();
				
				
                
                var no_num_val = '';
                $('#no_number').change(function()
                {
                 if(this.checked)
                 {
                  no_num_val = this.value;
                }else{
                  no_num_val = '';
                }
              });
                
                function userdetail(){
                 var tax_flag = 0;
                 var user_form_error = false;
                 
                 var user_street = $('.user-address-1').val();
                 var user_number = $('.nomandatory').val();
                 var user_floor = $('#input-floor').val();
                 var user_apt = $('#input-apartment').val();
                 var user_postcode = $('#input-postcode').val();
                 var user_country = $('#input-country').val();
                 var user_provice = $('#provience_id').val();
                 var user_city = $('#input-city').val();
                 var user_taxid = $('#tax_id').val();


                 if(user_street == ''){
                  $('.span-user-address-1').show();
                  user_form_error =  true;
                }else{
                 $('.span-user-address-1').hide();
               }
               
               if(user_number == '' && no_num_val == ''){
                $('.span-nomandatory').show();
                user_form_error = true;
              }else{
               $('.span-nomandatory').hide();
             }


             if(user_postcode == ''){
              $('.span-input-zipcode').show();
              user_form_error = true;
            }else{
             $('.span-input-zipcode').hide();
           }


           if(user_country == ''){
            $('.span-input-country').show();
            user_form_error = true;
          }else{
           $('.span-input-country').hide();
         }


         if(user_provice == ''){
          $('.span-input-province').show();
          user_form_error = true;
        }else{
         $('.span-input-province').hide();
       }

       if(user_city == '' || user_city == null){
        $('.span-input-city').show();
        user_form_error =  true;
      }else{
       $('.span-input-city').hide();
     }
 
 var already_exists_not_valid_flag = 0;
 
     if(user_taxid !=''){
      tax_flag = 1;
      $.ajax({
       url: 'index.php?route=customuserdetail/userdetail/check_taxid',
       type: 'post',
       data: {"tax_id":user_taxid} ,
       async: false,
       success: function(response){
		   
			if(response == 'not valid')
			{
				//alert(response+"inner");
				 $('.span-tax-already-exists').hide();
				 $('.span-tax-id').show();
				 already_exists_not_valid_flag = 1;
			}
			else if(response == 'already exists')
			{
				//alert(response);
				 $('.span-tax-already-exists').show();
				 $('.span-tax-id').hide();
				already_exists_not_valid_flag = 1;
			}
			else
			{
				 $('.span-tax-already-exists').hide();
				  $('.span-tax-id').hide();
				  already_exists_not_valid_flag = 0;
			}
		   /* if(response !=''){
			 $('.span-tax-id').show();
		   }else{
			 tax_flag
			 $('.span-tax-id').hide();
		   }*/
			
		},
		});			  
      
    }else{
      tax_flag = 0;
    }
    
    if(user_street !=''  && user_postcode !='' && user_country !='' && user_provice !='' && user_city !='' && tax_flag == 0 ){
				//alert(no_num_val);
       if(user_number == '' && no_num_val == ''){
        $('.span-nomandatory').show();
        return false;
      }else{
        $('.span-nomandatory').hide();

        $.ajax({
			 url: 'index.php?route=customuserdetail/userdetail/user_detail',
			 type: 'post',
			 data: {"address_1":user_street , "doornumber":user_number , "floor":user_floor , "apartment":user_apt , "postcode":user_postcode ,
			 "city":user_city , "country_id":user_country , "provience_id":user_provice ,  "tax_id":user_taxid , } ,
			 async: false,
			 success: function(response){
					   //alert(response+" ok ");
					   vendor_tab = 1;
					   
					   vendorparent = $('.vendor-tab').attr("aria-expanded","true").parent();
					   vendorparent.addClass("active");
					   $('.userdetail-tab').attr("aria-expanded","false").parent().removeClass("active");
					   $('#home').removeClass('active in');
					   $('#profile').addClass('active in');
					   //$('#step_two').parent().addClass('step-active');

						current_address = window.location.href;
						current_address = current_address + "#vendordetail";
						window.location.href = current_address;

					   return true;
                 },
               });
        
        
                        $.ajax({
							 url: 'index.php?route=customuserdetail/userdetail/get_user_address_in_vendor',
							 type: 'post',
							//data: {} ,
							async: false,
							success: function(response){
								//alert(response);
								$('.vendor-sec-address').html('<option>'+response+'</option>')
								
							},
						});
      }
    }
	
	else if(user_street !=''  && user_postcode !='' && user_country !='' && user_provice !='' && user_city !='' && tax_flag == 1  && already_exists_not_valid_flag == 0)
	{
	   if(user_number == '' && no_num_val == '')
	   {
        $('.span-nomandatory').show();
        return false;
       }
	   else
	   {
			$('.span-nomandatory').hide();
	
			$.ajax({
				 url: 'index.php?route=customuserdetail/userdetail/user_detail',
				 type: 'post',
				 data: {"address_1":user_street , "doornumber":user_number , "floor":user_floor , "apartment":user_apt , "postcode":user_postcode ,
				 "city":user_city , "country_id":user_country , "provience_id":user_provice ,  "tax_id":user_taxid , } ,
				 async: false,
				 success: function(response){
						   //alert(response+" ok ");
						   vendor_tab = 1;
						   
						   vendorparent = $('.vendor-tab').attr("aria-expanded","true").parent();
						   vendorparent.addClass("active");
						   $('.userdetail-tab').attr("aria-expanded","false").parent().removeClass("active");
						   $('#home').removeClass('active in');
						   $('#profile').addClass('active in');
						   //$('#step_two').parent().addClass('step-active');
	
							current_address = window.location.href;
							current_address = current_address + "#vendordetail";
							window.location.href = current_address;
	
						   return true;
					 },
				   });
			
			
							$.ajax({
								 url: 'index.php?route=customuserdetail/userdetail/get_user_address_in_vendor',
								 type: 'post',
								//data: {} ,
								async: false,
								success: function(response){
									//alert(response);
									$('.vendor-sec-address').html('<option>'+response+'</option>')
									
								},
							});
	
		  
	   }
	
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
  }
  
  
  $(".submit-user-detail").click(function(){
      userdetail();
 });
  

  $(".vendor-tab").on("click", function(e) {
    if(vendor_tab == 0){
     return false;
   }
 });


  $(".company-tab").on("click", function(e) {
    if(company_tab == 0){
     return false;
   }
 });

  /*********user detail tab end************/  





  /*********vendor detail tab start************/  
  
  

  
  $('#new_address').hide();

  var new_address_condition = 0;
  
  $('.add-new-address').click(function () {
    $('.add-new-address').hide();
    $('#new_address').show();
				new_address_condition = 1;//$('#address_hidden').val('1');
      });

  $('.no-need-new-address').click(function () {
   $('.add-new-address').show();
   $('#new_address').hide();
			new_address_condition = 0;//$('#address_hidden').val('0');
    });
  
  

  var vendor_num_val = '';
  $('#vendor_no_number').change(function()
  {
    if(this.checked)
    {
     vendor_num_val = this.value;
   }else{
     vendor_num_val = '';
   }
 });

  
  

  
  
  $('.span-vendor-name').hide();
  $('.span-vendor-phone').hide();
  $('.span-vendor-email').hide();
  
  $('.span-vendor-input-country').hide();
  $('.span-vendor-province-id').hide();
  $('.span-vendor-input-city').hide();
  
  $('.span-vendor-new-address').hide();
  $('.span-vendor-new-door-number').hide();
  $('.span-vendor-new-postcode').hide();
  
  
  
  function vendordetail(){
   
			var vendor_error =  false;
			
			var vendor_name = $('.vendor-name').val();
			var vendor_phone = $('.vendor-phone').val();
			var vendor_email = $('.vendor-email').val();
			var vendor_sec_address = $('.vendor-sec-address').val();
			var vendor_new_address = $('.vendor-new-address').val();
			var vendor_door_number = $('.vendor-new-door-number').val();
			var vendor_new_floor = $('.vendor-new-floor').val();
			var vendor_new_apt =$('.vendor-new-apt').val();
			var vendor_new_postcode =$('.vendor-new-postcode').val();
			var vendor_new_country =$('.vendor-input-country').val();
			var vendor_new_province =$('.vendor-province-id').val();
			var vendor_new_cty = $('.vendor-input-city').val();
			var vendor_customer_information = $('.vendor-customer-information').val();
		
		
			if(vendor_name == ''){
			 $('.span-vendor-name').show();
			 vendor_error =  true;
		   }else{
			 $('.span-vendor-name').hide();
		   }
		   
		   
		   
		   if(vendor_phone == ''){
			 $('.span-vendor-phone').show();
			 vendor_error =  true;
		   }else{
			 $('.span-vendor-phone').hide();
		   }
		
		   if(vendor_email == ''){
			 $('.span-vendor-email').show();
			 vendor_error =  true;
		   }else{
			 $('.span-vendor-email').hide();
		   }
		   
		   
		   if(new_address_condition == 1){
			 
			if(vendor_new_address == ''){
			 $('.span-vendor-new-address').show();
			 vendor_error =  true;
		   }else{
			 $('.span-vendor-new-address').hide();
		   }
		   
		   if(vendor_door_number == '' && vendor_num_val == ''){
			 $('.span-vendor-new-door-number').show();
			 vendor_error =  true;
		   }else{
			 $('.span-vendor-new-door-number').hide();
		   }
		
		   if(vendor_new_postcode == ''){
			 $('.span-vendor-new-postcode').show();
			 vendor_error =  true;
		   }else{
			 $('.span-vendor-new-postcode').hide();
		   }
		
		
		   if(vendor_new_country == ''){
			 $('.span-vendor-input-country').show();
			 vendor_error =  true;
		   }else{
			 $('.span-vendor-input-country').hide();
		   }
		   if(vendor_new_province == ''){
			 $('.span-vendor-province-id').show();
			 vendor_error =  true;
		   }else{
			 $('.span-vendor-province-id').hide();
		   }
		
		   if(vendor_new_cty == '' || vendor_new_cty == null){
			 $('.span-vendor-input-city').show();
			 vendor_error =  true;
		   }else{
			 $('.span-vendor-input-city').hide();
		   }				
		 }else{
		   vendor_new_country = '';
		   vendor_new_province = '';
		   vendor_new_cty = '';
		 }
		 
			 
			 
			 if(vendor_name != '' && vendor_phone !='' && vendor_email!='' ){
			   
			  if(new_address_condition == 1){
									//alert("Inner");
						if(vendor_new_address == '' || vendor_new_postcode == '' || vendor_new_country == '' || vendor_new_province == '' || vendor_new_cty =='' || vendor_new_cty == null){
						 
						  return false;
						}
						if(vendor_door_number == '' && vendor_num_val == ''){
						  
						  return false;
						}
						
					$.ajax({
						 url: 'index.php?route=customuserdetail/userdetail/vendordetail',
						 type: 'post',
						 data: {"name":vendor_name , "phone":vendor_phone , "email":vendor_email , "sec_address":vendor_sec_address , "address_1":vendor_new_address ,
						 "postcode":vendor_new_postcode , "city":vendor_new_cty , "vendor_doornumber":vendor_door_number ,  "vendor_floor":vendor_new_floor ,
						 "vendor_apartment":vendor_new_apt , "country_id":vendor_new_country , "zone_id":vendor_new_province ,  "vendor_information":vendor_customer_information
						 
					   } ,
					   async: false,
						   success: function(response){
	
								company_tab = 1;
								
								companyparent = $('.company-tab').attr("aria-expanded","true").parent();
								companyparent.addClass("active");
								$('.vendor-tab').attr("aria-expanded","false").parent().removeClass("active");
								$('#profile').removeClass('active in');
								$('#messages').addClass('active in');
								
								
								current_address = window.location.href.split('#')[0];
								//alert(current_address);
								//window.location.href.split('#')[0];
								current_address = current_address + "#companydetail";
								window.location.href = current_address;

								
								
								return true;
						  },
					});
						
						$.ajax({
							url: 'index.php?route=customuserdetail/userdetail/get_user_vendor_address_in_company',
							type: 'post',
							async: false,
								success: function(responses){
									
									var json_obj = $.parseJSON(responses);//parse JSON
									//alert(json_obj[0]);
									var company_dropdown_address =  '';
									for(i=0;i<json_obj.length;i++)
									{
									company_dropdown_address = company_dropdown_address + "<option value = "+json_obj[i]+">"+json_obj[i]+"</option>"
									}
									$('.company-address').html(company_dropdown_address);
							     
								},
						 });
					  }else{
						
						
					$.ajax({
							 url: 'index.php?route=customuserdetail/userdetail/vendordetail',
							 type: 'post',
							 data: {"name":vendor_name , "phone":vendor_phone , "email":vendor_email , "sec_address":vendor_sec_address , "address_1":vendor_new_address ,
							 "postcode":vendor_new_postcode , "city":vendor_new_cty , "vendor_doornumber":vendor_door_number ,  "vendor_floor":vendor_new_floor ,
							 "vendor_apartment":vendor_new_apt , "country_id":vendor_new_country , "zone_id":vendor_new_province ,  "vendor_information":vendor_customer_information
							 
						   } ,
						   async: false,

						   success: function(response){
									company_tab = 1;
									
									companyparent = $('.company-tab').attr("aria-expanded","true").parent();
									companyparent.addClass("active");
									$('.vendor-tab').attr("aria-expanded","false").parent().removeClass("active");
									$('#profile').removeClass('active in');
									$('#messages').addClass('active in');
									//$('#step_two').parent().addClass('step-active');
									current_address = window.location.href.split('#')[0];
								   // alert(current_address);
									current_address = current_address + "#companydetail";
									window.location.href = current_address;

									
									return true;
							   },
					 });
						
						$.ajax({
							 url: 'index.php?route=customuserdetail/userdetail/get_user_vendor_address_in_company',
							 type: 'post',
							 //data: {} ,
							 async: false,
								success: function(responses){
									var json_obj = $.parseJSON(responses);//parse JSON
									//alert(json_obj[0]);
									var company_dropdown_address =  '';
									for(i=0;i<json_obj.length;i++)
									{
									company_dropdown_address = company_dropdown_address + "<option value = "+json_obj[i]+">"+json_obj[i]+"</option>"
									}
									$('.company-address').html(company_dropdown_address);
							     },
						  });
			
					  }
					  
					}
					
					
				  }
      
      $(".submit-vendor-detail").click(function(){
       vendordetail();
     });
      
      
      

      /*********vendor detail tab end************/  


      /*********compant detail tab start************/  

      var company_logo_name = '';
      var company_banner_name = '';

      company_new_address_condition = 0;

      $('#new_address1').hide();
      $('.add-new-address1').click(function(){
       
       $('.add-new-address1').hide();	
       $('#new_address1').show();
			//$('#address_hidden1').val('1');
			company_new_address_condition = 1;
		});



      $('.company-no-need-new-address').click(function () {
       $('.add-new-address1').show();
       $('#new_address1').hide();
			company_new_address_condition = 0;//$('#address_hidden').val('0');
    });


      $('.submit-company-detail').click(function () {
       company_detail();
     });
      

      var no_num_val_company = '';
      $('#no_number_company').change(function(){
       
        if(this.checked)
        {
         no_num_val_company = this.value;
       }else{
         no_num_val_company = '';
       }
     });

      
      
      
      
      
      $('.span-company-names').hide();
      $('.span-company-new-address').hide();
      $('.span-company-door-numner').hide();
      $('.span-company-postcode').hide();
      $('.span-company-country').hide();
      $('.span-company-province').hide();
      $('.span-company-city').hide();
      
      function company_detail(){
       var company_error = false;
       var company_name  =$('.company-names').val();
       var company_address =$('.company-address').val();
       
       var company_new_address  =$('.company-new-address').val();
       var company_door_number  =$('.company-door-numner').val();
       var company_floor  =$('.company-floor').val();
       var company_apt  =$('.company-apt').val();
       var company_postcode  =$('.company-postcode').val();
       var company_contry  =$('.company-country').val();
       var company_province  = $('.company-province').val();
       var company_city =$('.company-city').val();
       
       
			//alert(company_new_address_condition);
      if(company_name == ''){
       $('.span-company-names').show();
       company_error =  true;
     }else{
       $('.span-company-names').hide();
     }
     
     
     
     
     if(company_new_address_condition == 1){
      
       if(company_new_address == ''){
        $('.span-company-new-address').show();
        company_error =  true;
      }else{
        $('.span-company-new-address').hide();
      }
      
      if(company_door_number == '' && no_num_val_company == ''){
        $('.span-company-door-numner').shpe();
        company_error =  true;
      }else{
        $('.span-company-door-numner').hide();
      }
      
      if(company_postcode == ''){
        $('.span-company-postcode').show();
        company_error =  true;
      }else{
        $('.span-company-postcode').hide();
      }
      
      
      if(company_contry == ''){
        $('.span-company-country').show();
        company_error =  true;
      }else{
        $('.span-company-country').hide();
      }
      
      if(company_province == ''){
        $('.span-company-province').show();
        company_error =  true;
      }else{
        $('.span-company-province').hide();
      }
      
      if(company_city == '' || company_city == null){
        $('.span-company-city').show();
        company_error =  true;
      }else{
        $('.span-company-city').hide();
      }				
    }else{
     company_contry = '';
     company_province = '';
     company_city = '';
   }
   
   
   
   if(company_name != '' && company_new_address_condition == 0){
    
    $.ajax({
     url: 'index.php?route=customuserdetail/userdetail/companydetail',
     type: 'post',
     data: {"company_name":company_name , "company_address":company_address ,"company_doornumber":company_door_number , "company_floor":company_floor , "company_apartment":company_apt 
     , "address_1":company_new_address , "postcode":company_postcode , "city":company_city , "country_id":company_contry ,  "zone_id":company_province ,
     "company_banner":company_banner_name , "company_logo":company_logo_name
     
   } ,
   async: false,
   success: function(response){
    window.location.href = "<?php echo $base;?>index.php?route=customuserdetail/editaccount";
										//alert(response)
									},
								});
    
    
  }else{
   
   
   if(company_new_address !='' && company_postcode !='' && company_contry !='' && company_province != '' && (company_city != '' || company_city != null) && (company_door_number != '' || no_num_val_company != '')){
    $.ajax({
     url: 'index.php?route=customuserdetail/userdetail/companydetail',
     type: 'post',
     data: {"company_name":company_name , "company_address":company_address ,"company_doornumber":company_door_number , "company_floor":company_floor , "company_apartment":company_apt 
     , "address_1":company_new_address , "postcode":company_postcode , "city":company_city , "country_id":company_contry ,  "zone_id":company_province ,
     "company_banner":company_banner_name , "company_logo":company_logo_name
     
   } ,
   async: false,
   success: function(response){
    window.location.href = "<?php echo $base;?>index.php?route=customuserdetail/editaccount";
  },
});

  }else{
    return false;
  }
  
  
  
  
  
  
}













}



/*********compant detail tab end ************/  








</script>





<script type="text/javascript">
  
   if (window.history && window.history.pushState) {

    //window.history.pushState('forward', null, './#forward');

    $(window).on('popstate', function() {

				if(window.location.hash==='#vendordetail')
				{
					//alert('vendor detasil');
					active_vendor = $('.vendor-tab').attr("aria-expanded","true").parent();
					active_vendor.addClass("active");
					$('.userdetail-tab').attr("aria-expanded","false").parent().removeClass("active");
					$('.company-tab').attr("aria-expanded","false").parent().removeClass("active");
					
					$('#home').removeClass('active in');
					$('#messages').removeClass('active in');
					$('#profile').addClass('active in');
						
				}
				else if(window.location.hash==='#companydetail')
				{
					active_company = $('.company-tab').attr("aria-expanded","true").parent();
					active_company.addClass("active");
					$('.userdetail-tab').attr("aria-expanded","false").parent().removeClass("active");
					$('.vendor-tab').attr("aria-expanded","false").parent().removeClass("active");
					$('#home').removeClass('active in');
					$('#profile').removeClass('active in');
					$('#messages').addClass('active in');

					
					
					//alert('company detail');
				}
				else if(window.location.hash==='')
				{
					
					active_userdetail = $('.userdetail-tab').attr("aria-expanded","true").parent();
					active_userdetail.addClass("active");
					$('.vendor-tab').attr("aria-expanded","false").parent().removeClass("active");
					$('.company-tab').attr("aria-expanded","false").parent().removeClass("active");
					
					$('#profile').removeClass('active in');
					$('#messages').removeClass('active in');
					$('#home').addClass('active in');
				
				}

    });

  }

  
  $(document).ready(function () {
	  
	  
	  
	 /* $(window).on("navigate", function (event, data)
				{
					alert('umer poondar');
					
					var direction = data.state.direction;
					alert(direction);
    				if ( !! direction)
					{
        				if(window.location.hash==='#vendordetail')
						{
							alert('vendor detail');							
						}
						else if(window.location.hash==='#companydetail')
						{
							alert('company detail');
						}
						else if(window.location.hash==='')
						{
							alert('no fucking hash found. Bilal is a choudhary!');							
						}
    				}
				
			});*/
	  
	  
    $("#user_details").click(function () {
      $.ajax({
        type: "POST",
        dataType: "json",
                url: "index.php?route=customuserdetail/vendordetail/user_detail", //Relative or absolute path to response.php file
                contentType: "application/json",
                success: function (response) {
                  $("#name").val(response.name);
                  $("#phone").val(response.phone);
                  $("#email").val(response.email);
                }
              });
    });
  });



</script>



<script>
  
  $('.logohide').hide();
  $('.bannerhide').hide();
  
  
  $('#companylogo').change( function(){
		var file_data = $("#companylogo").prop("files")[0];   // Getting the properties of file from file field
		var form_data = new FormData();                  // Creating object of FormData class
		form_data.append("file", file_data);             // Appending parameter named file with properties of file_field to form_data
		//var formData = new FormData(jQuery('#logo_upload_form11')[0]);
		//console.log(formData);
		//alert($(this).attr("id"));
   $.ajax({
    url: 'index.php?route=customuserdetail/companydetail/uploadlogo',
    type: 'post',
    data: form_data,
		//dataType: 'formData,',
		success: function(data) {
				//alert(data);
				var json = JSON.parse(data);
				var logoss11 = $('.displaylogo').attr("src","<?php echo $base;?>image/companylogo/"+json['encryptedname']+"");
        $('.clogovl').val(json['encryptedname']);
        $('.logohide').show();
        company_logo_name = json['encryptedname'];
        
         $('.clogo-text').text('Change');
      },
      contentType: false,
      processData: false
    });
 });


  $('#companybanner').change( function(){
		var file_data1 = $("#companybanner").prop("files")[0];   // Getting the properties of file from file field
		var form_data1 = new FormData();                  // Creating object of FormData class
		form_data1.append("file", file_data1);             // Appending parameter named file with properties of file_field to form_data
		//var formData = new FormData(jQuery('#logo_upload_form11')[0]);
		//console.log(formData);
		//alert($(this).attr("id"));
    $.ajax({
			url: 'index.php?route=customuserdetail/companydetail/uploadbanner',
			type: 'post',
			data: form_data1,
			
			success: function(res) {
				//alert(res);
		   var json1 = JSON.parse(res);
		   var logoss11 = $('.displaybanner').attr("src","<?php echo $base;?>image/companybanner/"+json1['encryptedbanner']+"");
		   $('.bannerhide').show();
		   company_banner_name =  json1['encryptedbanner'];
		   $('.cbanner-text').text('Change');
		   
		 },
		 contentType: false,
		 processData: false
  });

 });

</script>





<script type="text/javascript">
  <!--
// Sort the custom fields
$('#account .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#account .form-group').length) {
		$('#account .form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('#account .form-group').length) {
		$('#account .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') == $('#account .form-group').length) {
		$('#account .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('#account .form-group').length) {
		$('#account .form-group:first').before(this);
	}
});

$('#address .form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('#address .form-group').length) {
		$('#address .form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('#address .form-group').length) {
		$('#address .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') == $('#address .form-group').length) {
		$('#address .form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('#address .form-group').length) {
		$('#address .form-group:first').before(this);
	}
});

$('input[name=\'customer_group_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=account/register/customfield&customer_group_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			$('.custom-field').hide();
			$('.custom-field').removeClass('required');

			for (i = 0; i < json.length; i++) {
				custom_field = json[i];

				$('#custom-field' + custom_field['custom_field_id']).show();

				if (custom_field['required']) {
					$('#custom-field' + custom_field['custom_field_id']).addClass('required');
				}
			}


		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('input[name=\'customer_group_id\']:checked').trigger('change');
//--></script> 
<script type="text/javascript"><!--
  $('button[id^=\'button-custom-field\']').on('click', function() {
   var node = this;

   $('#form-upload').remove();

   $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

   $('#form-upload input[name=\'file\']').trigger('click');

   if (typeof timer != 'undefined') {
     clearInterval(timer);
   }

   timer = setInterval(function() {
    if ($('#form-upload input[name=\'file\']').val() != '') {
     clearInterval(timer);

     $.ajax({
      url: 'index.php?route=tool/upload',
      type: 'post',
      dataType: 'json',
      data: new FormData($('#form-upload')[0]),
      cache: false,
      contentType: false,
      processData: false,
      beforeSend: function() {
       $(node).button('loading');
     },
     complete: function() {
       $(node).button('reset');
     },
     success: function(json) {
       $(node).parent().find('.text-danger').remove();

       if (json['error']) {
        $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
      }

      if (json['success']) {
        alert(json['success']);

        $(node).parent().find('input').attr('value', json['code']);
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
     alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
   }
 });
   }
 }, 500);
 });
 //--></script> 
 <script type="text/javascript"><!--
  $('.date').datetimepicker({
   pickTime: false
 });

  $('.time').datetimepicker({
   pickDate: false
 });

  $('.datetime').datetimepicker({
   pickDate: true,
   pickTime: true
 });
 //--></script> 
 <script type="text/javascript"><!--
  $('select[name=\'provience_id\']').on('change', function() {
    var data_attribute = this.value;
    $.ajax({
      url: 'index.php?route=customuserdetail/userdetail/cities_lc',
      type:'POST',
      dataType: 'json',
      data: {city_id:data_attribute},
      success: function(data)
      {
       if(data==''){
         $('#input-city').html('<option value="0" selected="selected"><?php echo $text_none; ?></option>');
       }
       var resulted_data =  '';
       for(i=0;i<data.length;i++)
       {
        resulted_data = resulted_data + "<option value = "+data[i].id+">"+data[i].localidad+"</option>"
      }
      $('#input-city').html(resulted_data);
      
    }   
  });
  });

  $('select[name=\'country_id\']').trigger('change');







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




  $('select[name=\'provience_id_company\']').on('change', function() {
    var data_attribute = this.value;
    $.ajax({
      url: 'index.php?route=customuserdetail/userdetail/cities_lc',
      type:'POST',
      dataType: 'json',
      data: {city_id:data_attribute},
      success: function(data)
      {
       if(data==''){
         $('#input-city-company').html('<option value="0" selected="selected"><?php echo $text_none; ?></option>');
       }
       var resulted_data =  '';
       for(i=0;i<data.length;i++)
       {
        resulted_data = resulted_data + "<option value = "+data[i].id+">"+data[i].localidad+"</option>"
      }
      $('#input-city-company').html(resulted_data);
      
    }   
  });
  });










  //--></script> 
  <script src="catalog/view/javascript/assets/js/maskinput.js" type="text/javascript"></script> 
  <script>
    $(function($){
     $("#tax_id").mask("99-99999999-9",{placeholder:""});
   });
 </script> 





<script type="text/javascript">
   $(document).ready(function()
   {
  		$("#user_detail_numbers").keydown(function(e) {
			//console.log(e.keyCode);
    // Allow: backspace, delete, tab, escape, enter and .
    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190, 32, 173, 189, 107, 109]) !== -1 ||
      // Allow: Ctrl+A,Ctrl+C,Ctrl+V, Command+A
      ((e.keyCode == 65 || e.keyCode == 86 || e.keyCode == 67) && (e.ctrlKey === true || e.metaKey === true)) ||
      // Allow: home, end, left, right, down, up
      (e.keyCode >= 35 && e.keyCode <= 40) ||
	  //Allow: +
	  ((e.keyCode == 61 || e.keyCode == 187)&&(e.shiftKey == true))
	  ) {
		//alert(this.value);
      // let it happen, don't do anything
      return;
    }
    // Ensure that it is a number and stop the keypress
    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
      e.preventDefault();
    }
  });
  
  
  
  
	  $(function(){
		   $( ".user_detail_numbers" ).bind( 'paste',function()
		   {
			   setTimeout(function()
			   { 
					//get the value of the input text
					var dataFull= $( '.numbersOnlyphone' ).val() ;
					xyz = Number(dataFull);
				 if(isNaN(xyz))
				 {
					 $('.numbersOnlyphone' ).val(' ')
				 }
				 else
				 {
					$( '.numbersOnlyphone' ).val(dataFull); 
				 }
			   });
		
			});
	 });
  
  
  
  
  
  
  
  
  
  
}); 

	
	user_detail_mouse_event_flag = 0;
	$("#home").mouseenter(function(){
	 user_detail_mouse_event_flag = 1;
	 //alert(user_detail_mouse_event_flag);
		 $(document).keypress(function(e) {
			 if(user_detail_mouse_event_flag == 1){
				if(e.which == 13) {
					 userdetail();
					
				}
			 }
		});
	
	
	});
	
	$("#home").mouseleave(function(){
		//alert(user_detail_mouse_event_flag);
		user_detail_mouse_event_flag = 0;
	});
	


	vendor_detail_mouse_event_flag = 0;
	$("#profile").mouseenter(function(){
	 vendor_detail_mouse_event_flag = 1;
	 //alert(user_detail_mouse_event_flag);
		 $(document).keypress(function(e) {
			 if(vendor_detail_mouse_event_flag == 1){
				if(e.which == 13) {
					 vendordetail();
					//alert("vendor");
				}
			 }
		});
	});
	
	
	
	$("#profile").mouseleave(function(){
		//alert(user_detail_mouse_event_flag);
		vendor_detail_mouse_event_flag = 0;
	});






	company_detail_mouse_event_flag = 0;
	$("#messages").mouseenter(function(){
	 company_detail_mouse_event_flag = 1;
	 //alert(user_detail_mouse_event_flag);
		 $(document).keypress(function(e) {
			 if(company_detail_mouse_event_flag == 1){
				if(e.which == 13) {
					 company_detail();
					//alert("company");
				}
			 }
		});
	});
	
	
	
	$("#messages").mouseleave(function(){
		company_detail_mouse_event_flag = 0;
	});



 






/*$(document).keypress(function(e) {
    if(e.which == 13) {
        alert('You pressed enter!');
    }
});
*/
</script>










 <?php echo $footer; ?>