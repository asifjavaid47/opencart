<?php 
    echo $header;
?>


      <div class="search-product-head-container">
         <div class="container">
            <div class="search-produ-head">
               <div class="breadcum-block product-detai-bread">
                  <ul>
                     <li>Home</li>
                     <li>></li>
                     <li>Registration</li>
                  </ul>
               </div>
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
                        <div class="col-sm-14 col-md-9 col-md-offset-3">
                            <div class="buying-process-main">
                                <div class="cart-section-block register">
                                    <div class="cart-step-one">
                                        <div class="step-one step-active">
                                            <span class="num-step num-step">1</span>
                                            <!-- <span class="step-tick"><img alt="" src="images/step-img-tick.png"> </span>-->
                                            <span class="name-step step-txt-acit">basic details</span>
                                        </div>
                                        <div class="arrow-shoping">
                                            <img alt="" src="<?php echo $base;?>image/assets/images/step-1-divi.png">
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="cart-step-one">
                                        <div class="step-one step-active">
                                            <span class="num-step">2</span>
                                            <span class="name-step-confirm">user details</span>
                                        </div>
                                        <div class="arrow-shoping">
                                            <img alt="" src="<?php echo $base;?>image/assets/images/step-1-divi.png">
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="cart-step-one">
                                        <div class="step-one step-active">
                                            <span class="num-step ">3</span>
                                            <span class="name-step-confirm">vendor details</span>
                                        </div>
                                        <div class="arrow-shoping">
                                            <img alt="" src="<?php echo $base;?>image/assets/images/step-1-divi.png">
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="cart-step-one last">
                                        <div class="step-one last-cart-step">
                                            <span class="num-step">4</span>
                                            <span class="name-step-secu">company details</span>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="clr"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                <div class="sideoptions">
                    <ul>
                        <li><a href="<?php echo $base;?>index.php?route=customuserdetail/myaccount"><i class="fa fa-user" aria-hidden="true"></i> My account</a></li>
                        <li><a href="<?php echo $base.'index.php?route=customuserdetail/editaccount'; ?>"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> edit account</a></li>
                        <li><a href="<?php echo $base;?>index.php?route=customuserdetail/resetpwd"><i class="fa fa-key" aria-hidden="true"></i> password</a></li>
                        <li><a href="<?php echo $base;?>index.php?route=customuserdetail/addressbook"><i class="fa fa-book" aria-hidden="true"></i> address book</a></li>
                        <!--<li><a href=""><i class="fa fa-envelope-o" aria-hidden="true"></i> my enquiry</a></li>
                        <li><a href=""><i class="fa fa-star-half-o" aria-hidden="true"></i> reward points</a></li>-->
                       <!-- <li><a href="<?php echo $base;?>index.php?route=account/logout"><i class="fa fa-sign-out" aria-hidden="true"></i> logout</a></li>-->
                    </ul>
                </div>
            </div>
            
            <?php //echo "<pre>";print_r($vendor_new_address);echo "</pre>";?>
            
            
            
          <?php  
               $address = isset($get_address->row['address_1'])?$get_address->row['address_1']:'';
               $door_number = isset($get_address->row['door_number'])?$get_address->row['door_number']:'';
               //$floor = isset($get_address->row['floor'])?$get_address->row['floor']:'';
               

              if(!empty($get_address->row['floor'])){
                 $floor = ', floor '.$get_address->row['floor']." ";
              }else{
                 $floor = '';
              }
               
               $apartment = isset($get_address->row['apartment'])?$get_address->row['apartment']:'';
               
               
               $city = isset($get_city->row['localidad'])?$get_city->row['localidad']:'';
               
               $province = isset($get_province->row['provincia'])?$get_province->row['provincia']:'';
               $countrys = isset($get_country->row['name'])?$get_country->row['name']:'';
          
          
               //echo "<br />";
              // echo  $address." ". $door_number.","." "."floor ".$floor .$apartment.","." ".$city.", ".$province.", ".$countrys;
               //echo "<br />";
               
               $new_address = isset($vendor_new_address->row['new_address'])?$vendor_new_address->row['new_address']:$vendor_new_address->row['v_address'];
               
               $new_door_number = isset($vendor_new_address->row['vendor_door_number'])?$vendor_new_address->row['vendor_door_number']:'';
               
               
               //$new_floor = isset($vendor_new_address->row['vendor_floor'])?$vendor_new_address->row['vendor_floor']:'';
               
              if(!empty($vendor_new_address->row['floor'])){
                 $new_floor = ', floor '.$vendor_new_address->row['floor']." ";
              }else{
                 $new_floor = '';
              }

               
               $new_apartment = isset($vendor_new_address->row['vendor_apartment'])?$vendor_new_address->row['vendor_apartment']:'';
               $new_city = isset($get_new_city->row['localidad'])?$get_new_city->row['localidad']:'';
               
               $new_province = isset($get_new_province->row['provincia'])?$get_new_province->row['provincia']:'';
               $new_country = isset($get_new_country->row['name'])?$get_new_country->row['name']:'';
               
               if(isset($vendor_new_address->row['new_address'])){
                    $complete_address =  $new_address." ". $new_door_number." ".$new_floor .$new_apartment.","." ".$new_city.", ".$new_province.", ".$new_country;
               }else{
                    $complete_address =  $vendor_new_address->row['v_address'];
               
               }
               
          ?>
            
            <?php //echo isset ($vendor_new_address)?$vendor_new_address:''; ?>
            
            
            <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
                <div class="common-content">
                    <div class="section-heading" style="padding:15px;">company details</div>
                    
                                        <form id="appendhash1" action="<?php echo $action; ?>"  method="post" enctype="multipart/form-data">

                    
                    <div class="form-group col-sm-6  height_75">
                    	<label for="companyname"><?php echo $company_name_labl;?></label>
                        <input type="text" name="company_name" value="<?php echo $company_name;?>" class="form-control" id="companyname" placeholder="<?php echo $company_name_labl;?>" />
                       <?php if ($error_userdet_companyname) { ?>
                       <div class="text-danger"><?php echo $error_userdet_companyname; ?></div>
                       <?php } ?>                      

                    </div>
                    
                    <div class="form-group col-sm-6">
                    	<label for="companyaddress"><?php echo $company_address_labl;?></label>
                        <select class="form-control" name="company_address">
                        	<option><?php echo  $address." ". $door_number." ".$floor .$apartment.","." ".$city.", ".$province.", ".$countrys; ?></option>
                            <option><?php echo isset ($complete_address)?$complete_address:''; ?></option>
                        </select>
                        
                    <div class="clr"><br /></div>
                         <button id="newaddress1" type="button" class="btn btn-blue add-new-address1">+ new address</button>
                    </div>
                    
                    
                    
                    
                    
                    
                    
                    <div id="new_address1">
                      
                     <div class="form-group col-sm-6 height_75">
                    	<label for="address">Street *</label>
                        <input name="address_1" type="text" class="form-control"  value="<?php echo $address_1;?>"  placeholder="Street"  id="input-address-1"/>
                          <?php if ($error_userdet_address_1) { ?>
                          <div class="text-danger"><?php echo $error_userdet_address_1; ?></div>
                          <?php } ?>
                    </div>
                    



             
       
    







                    <!--<div class="form-group col-sm-6 height_75">
                    	<label for="zip"><?php echo $zipcode_labl;?></label>
                        <input type="text"  name="postcode" value="<?php echo $postcode; ?>" class="form-control" placeholder="Zip Code"  id="input-postcode"/>
                        <?php if ($error_userdet_postcode) { ?>
                        <div class="text-danger"><?php echo $error_userdet_postcode; ?></div>
                        <?php } ?>
                    </div>-->
                    
                    
                    
                    
                    
                    
                    <div class="form-group col-sm-6 height_75">
                        <div class="row">
                        	<div class="col-xs-3 pad_r_0">
                    	<label for="zip">Number *</label>
                        	<input type="text"  name="company_doornumber" value="<?php echo $company_doornumber; ?>" class="form-control" placeholder="Number"/>
                            <?php if ($error_userdet_company_doornumber) { ?>
                            <div class="text-danger"><?php echo $error_userdet_company_doornumber; ?></div>
                            <?php } ?>
                        </div>
                        <div class="col-xs-3 pad_r_0">
                    	<label for="zip">Floor</label>
                        	<input type="text"  name="company_floor" value="<?php echo isset($vendor_floor)?$vendor_floor:''; ?>" class="form-control" placeholder="Floor"  id="input-postcode"/>
                        </div>
                        <div class="col-xs-3 pad_r_0">
                    	<label for="zip">Apartment</label>
                        	<input type="text"  name="company_apartment" value="<?php echo isset($vendor_apartment)?$vendor_apartment:''; ?>" class="form-control" placeholder="Apartment"  id="input-postcode"/>
                        </div>
                        <div class="col-xs-3 pad_r_0">
                    	<label for="zip"><?php echo $zipcode_labl;?></label>
                        	<input type="text"  name="postcode" value="<?php echo isset($postcode)?$postcode:''; ?>" class="form-control" placeholder="Zip Code"  id="input-postcode"/>
                        </div>
                        </div>
                    </div>
                    
                    
                    <input id="address_hidden1" type="hidden" name="new_address_condition1" value="0" class="address_hidden1">

                    
                    
                    
                    
                    <div class="form-group col-sm-6 height_75">
                    	<label for="country">Country</label>
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
                      
                            <?php if ($error_userdet_country) { ?>
                            <div class="text-danger"><?php echo $error_userdet_country; ?></div>
                            <?php } ?>
                    </div>
    
        
        
                  <div class="form-group col-sm-6 height_75">
                    	<label for="country"><?php echo $province_labl; ?></label>
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
              
                    <?php if ($error_userdet_country) { ?>
                    <div class="text-danger"><?php echo $error_userdet_country; ?></div>
                    <?php } ?>

              
                    </div>


                     <div class="form-group col-sm-6 height_75">
                       <label for="city"><?php echo $city_labl;?> *</label>
                       <select name="city" id="input-city" class="form-control">
                       </select>
                       <?php if ($error_userdet_city) { ?>
                        <div class="text-danger"><?php echo $error_userdet_city; ?></div>
                        <?php } ?>                  
                    </div>




                        
                        
                        </div>
                    
                    
                    
                    <div class="clearfix"></div>
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    

                    
                    <div class="form-group col-sm-6   ">
                        <label for="companyname"><?php echo $company_logo_labl;?></label>
                        <div class="input-group">
                            <input type="text" class="form-control clogovl" value="<?php echo isset($get_images->row['company_logo'])?$get_images->row['company_logo']:'no_image.png'; ?>" placeholder="<?php echo $company_logo_labl;?>">
                              <span class="input-group-btn">
                                <span class="btn btn-secondary input_btn22 " type="button">Browse 
                                 
                                	<input type="file" id="companylogo"  name="upload_company_logo" accept="img/*" value=""  class="clogo"/>
                                 
                                  </span>
                             
                              </span>
                        </div>
                        
                        
                        
                                    <div class="img-holder <?php echo isset($get_images->row['company_logo'])?'':logohide ?>">
                                        <img class="displaylogo" src="<?php echo $base;?>image/companylogo/<?php echo !empty($get_images->row['company_logo'])?$get_images->row['company_logo']:'no_image.png'; ?>" alt="">
                                    </div>
                              

   
                        
                        
                    </div>


                    
                    
                    
                    
                    

                    <div class="form-group col-sm-6 ">
                        <label for="companyaddress"><?php echo $company_banner_labl;?></label>
                        <div class="input-group">
                            <input type="text" class="form-control bannerval" value="<?php echo isset($get_images->row['company_banner'])?$get_images->row['company_banner']:'no_image.png'; ?>"  placeholder="<?php echo $company_banner_labl;?>">
                              <span class="input-group-btn">
                                <span class="btn btn-secondary input_btn22 " type="button">Browse 
                                
                                
                                     <input type="file" id="companybanner" class="cbanner" name="company_banner" accept="img/*"   />  </span>
                                 
                              
                              </span>
                        </div>
                        
                                    <div class="<?php echo isset($get_images->row['company_logo'])?'':bannerhide ?>" >
                                        <img style="width:100%;" class="displaybanner" src="<?php echo $base;?>image/companybanner/<?php echo !empty($get_images->row['company_banner'])?$get_images->row['company_banner']:'no_image.png'; ?>" alt="">
                                    </div>
                   

                        
                        
                        
                    </div>
                    
                    
   



                    

                    <!--<div class="row">
                        <div class="table_handler">
                            <div class="col-md-8">
                                <div class="text-right">

                                    <table class="table  table_224 table-responsive">
                                        <tr>
                                            <td> User Categories </td>
                                            <td> FREE </td>
                                            <td> PREMIUM <strong>$1000</strong></td>
                                        </tr>
                                        <tr>
                                            <td> can buy and sell </td>
                                            <td><img src="<?php echo $base;?>image/assets/images/mark-green.png" alt=""> </td>
                                            <td><img src="<?php echo $base;?>image/assets/images/mark-green.png" alt=""> </td>
                                        </tr>
                                        <tr>
                                            <td> Have a company homepage </td>
                                            <td><img src="<?php echo $base;?>image/assets/images/mark-green.png" alt=""> </td>
                                            <td><img src="<?php echo $base;?>image/assets/images/mark-green.png" alt=""> </td>
                                        </tr>
                                        <tr>
                                            <td> Get 2% discounts in commisions </td>
                                            <td>&nbsp; </td>
                                            <td><img src="<?php echo $base;?>image/assets/images/mark-green.png" alt=""> </td>
                                        </tr>
                                        <tr>
                                            <td> get discounts in ads and listings  </td>
                                            <td>&nbsp; </td>
                                            <td><img src="<?php echo $base;?>image/assets/images/mark-green.png" alt=""> </td>
                                        </tr>
                                    </table>


                                    <button type="button" class="btn btn-blue">Get Free</button>
                                    <button type="button" class="btn btn-blue">Be Premium</button>

                                </div>
                            </div>
                        </div>
                    </div>-->
                      <input type="submit" value="Finish" class="continu pull-left" />
                      <a href="<?php echo $base;?>index.php?route=customuserdetail/editaccount" class="pull-right" >Continue later</a>
                    
</form>

                </div>
            </div>
            <div class="hidden-xs hidden-sm col-md-2 col-lg-2">&nbsp;</div>
        </div>
    </div>
</div>


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
                       $('#input-city').html('<option value="0" selected="selected">none</option>');
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
//--></script>



<script type="text/javascript"><!--
/*$('select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=account/account/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('input[name=\'postcode\']').parent().parent().removeClass('required');
			}

			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
						html += ' selected="selected"';
					}

					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change'); */
//--></script>















<script type="text/javascript">


var hash = window.location.hash.substr(1);
//alert(hash);
if(hash == 'newaddress1'){
   $('#address_hidden1').val('1');
	
   $("#newaddress1").trigger( "click" );
   $('.add-new-address1').hide();
   $('#new_address1').show();
   	$('#appendhash1').each(function() {
		 console.log($(this).attr("action", $(this).attr("action") + "#newaddress1"));
	});

   
   
}else{
$('#new_address1').hide();
}




$('.add-new-address1').click(function(){
	
   $('.add-new-address1').hide();	
	$('#new_address1').show();
	
	
	$('#appendhash1').each(function() {
		 console.log($(this).attr("action", $(this).attr("action") + "#newaddress1"));
	});
	
	$('#address_hidden1').val('1');
	
	
	window.location.hash = $(this).attr("id");
	//e.preventDefault();
});



















/*  $(function()
  {
    $('.clogo').change( function(){
	  $('.clogovl').val($(this).val());
    });


    $('.cbanner').change( function()
    {
	  $('.bannerval').val($(this).val());
    });

  });
  */
  
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
	   $('.bannerval').val(json1['encryptedbanner']);
	   $('.bannerhide').show();
	   
		},
		contentType: false,
		processData: false
	});

    });





  
  
  
  
  </script>




<?php echo $footer; ?>