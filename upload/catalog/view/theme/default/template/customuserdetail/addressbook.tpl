<?php
echo $header; 

?>



<style>
.drop_selector.open > .dropdown-menu{
   display:block;
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
                    <li>T-Shirt</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="modal_box22 modal_name">
    <div class="modall_content11 text-center">
        <a href="javascript:void(0);" class="close_11" id="close"><i class="fa fa-close"></i></a>
        <h2>
            Update Address
        </h2>
        <div class="row" id="">
            <div class="form-group col-sm-6 height_75">
                <label for="address">Street *</label>
                <input name="update_address" type="text" class="form-control update_address"  value=""  placeholder="Address"  id="input-address-1"/>

                <div class="text-danger update-address">Please Add Address Field!</div>
            </div>
            <div class="form-group col-sm-6 height_75">
                <div class="row">
                    <div class="col-xs-3 pad_r_0">
                        <label for="zip">Number *</label>
                        <input type="text"  name="update_doornumber" value="" class="form-control update_doornumber" placeholder="Number"/>
                        <div class="text-danger update-doornumber">Number Required</div>
                    </div>
                    <div class="col-xs-3 pad_r_0">
                        <label for="zip">Floor</label>
                        <input type="text"  name="update_floor" value="" class="form-control update_floor" placeholder="Floor"  id="input-postcode"/>
                    </div>
                    <div class="col-xs-3 pad_r_0">
                        <label for="zip">Apartment</label>
                        <input type="text"  name="update_apartment" value="" class="form-control update_apartment" placeholder="Apartment"  id="input-postcode"/>
                    </div>
                    <div class="col-xs-3 pad_r_0">
                        <label for="zip">Postcode</label>
                        <input type="text"  name="update_postcode" value="" class="form-control update_postcode" placeholder="Zip Code"  id="input-postcode"/>
                    </div>
                </div>
            </div>
            <div class="form-group col-sm-6 height_75">
                <label for="country">Country</label>
                <select name="country_id" id="input-country" class="form-control update_country_id">
                    <option value=""><?php echo $text_select; ?></option>
                    <?php foreach ($countries as $country) { ?>
                    <?php if ($country['country_id'] == $country_id) { ?>
                    <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                </select>
            </div>
            <div class="form-group col-sm-6 height_75">
                <label for="country">Province</label>
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
                <label for="city">City</label>
                <select name="city" id="input-city" class="form-control">
                </select>
            </div>
        </div>
        <div class="row text-left">
            <div class="col-md-5 col-md-offset-7 text-right">
                <button class="btn_pur update_current_address">Save</button>
                <button class="khali_11" id="close">cancle</button>
            </div>
        </div>
    </div>
</div>
<div class="min-height">
    <div class="container">
        <div class="row">
            <!-- sidebar-->
           <!-- <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                <div class="sideoptions">
                    <ul>
                        <li><a href="<?php echo $base;?>index.php?route=customuserdetail/myaccount"><i class="fa fa-user" aria-hidden="true"></i> My account</a></li>
                        <li><a href="<?php echo $base.'index.php?route=customuserdetail/editaccount'; ?>"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> edit account</a></li>
                        <li><a href="<?php echo $base;?>index.php?route=customuserdetail/resetpwd"><i class="fa fa-key" aria-hidden="true"></i> password</a></li>
                        <li class="active"><a href="<?php echo $base;?>index.php?route=customuserdetail/addressbook"><i class="fa fa-book" aria-hidden="true"></i> address book</a></li>
                       <li><a href=""><i class="fa fa-envelope-o" aria-hidden="true"></i> my enquiry</a></li>
                        <li><a href=""><i class="fa fa-star-half-o" aria-hidden="true"></i> reward points</a></li>
                        <li><a href="<?php echo $base;?>index.php?route=account/logout"><i class="fa fa-sign-out" aria-hidden="true"></i> logout</a></li>
                    </ul>
                </div>
            </div>-->
            <!-- sidebar-->
            <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12 midbox">
                <div class="common-content address_book row">
                    <h1 class="section-heading">Address book</h1>
                    <?php if($get_from_address->num_rows > 0){?>
<?php
//echo "<pre>";print_r($get_from_address);echo "</pre>";
//exit;
          $door_number = isset($get_from_address->row['door_number'])?$get_from_address->row['door_number']:'';
		  $floor = isset($get_from_address->row['floor'])?$get_from_address->row['floor']:'';
		  $apartment = isset($get_from_address->row['apartment'])?$get_from_address->row['apartment']:'';
          $city = isset($get_from_address->row['city'])?$get_from_address->row['city']:'';
          $province = isset($get_provice_from_zone->row['name'])?$get_provice_from_zone->row['name']:'';
          $country = isset($get_country_from_country->row['name'])?$get_country_from_country->row['name']:'';
          $i=1;
foreach($get_from_address->rows as  $key=> $addr){
          $address = !empty($addr['new_address'])?$addr['new_address']:$addr['address'];
		  $door = isset($addr['door_number'])?$addr['door_number']:'';
          $floor = isset($addr['floor'])?$addr['floor']:'';
          $apartment = isset($addr['apartment'])?$addr['apartment']:'';
          //$city = isset($addr['city'])?$addr['city']:'';
          $city = isset($get_city[$key]->row['localidad'])?$get_city[$key]->row['localidad']:'';
         // echo "<br />";
          //echo $address;
         // echo "<br />";
       
?>
                    <div class="block_22 col-md-11">
                        <div class="row margin_0 ">
                            <div class="col-md-5">

                           <?php if(!empty($door)){?>
                                  <strong><?php echo $address." ".$door;?> </strong>
                                  <p><?php echo "floor"." ".$floor." ".$apartment;?></p>
                                  <!-- <p><?php //echo $get_from_province[$key]->row['provincia'].", ".$city;?></p>-->
                                  <p><?php echo isset($get_from_province[$key]->row['provincia'])?$get_from_province[$key]->row['provincia'].", ".$city: $addr['address']; ?></p>
                           <?php }else{?>
                                  <p><?php echo str_replace(", Argentina" , "" , $address);?> </p>
                           <?php } ?>
                                <input type="hidden" name="address_id" value="<?php echo $addr['id'];?>" />
                            </div>
                            <div class="col-md-5">
                                <div class="boot_addr get-selected-<?php echo $addr['id'];?>">                                   
                                   <?php //$check_val = unserialize($addr['use_as']);?>
                                	
                                   <?php if(isset($addr['use_as'])){
                                   $all_addresses = explode(',', $addr['use_as']);
                                   $all_addresses_number = sizeof($all_addresses);
                                   for($i = 0; $i <$all_addresses_number; $i++)
                                   { 
                                   if(!empty($all_addresses[$i]))
                                   {?>
                                   		<span class="company_address bott_1"><?php echo $all_addresses[$i];?></span>
                                   <?php } 
                                   }
                                        }?>
                </div>
            </div>
            <div class="col-md-2 ">
                <div class="dropdown drop_selector btn-group" >
                    <button class="btn btn-default dropdown-toggle " type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                        <i class="glyphicon glyphicon-cog"></i>
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu drop_btn_adrs" aria-labelledby="dropdownMenu1" id="unique_<?php echo $addr['id']; ?>">
                        <li><a href="javascript:void(0);" class="modify22" title="modify" id="<?php echo $addr['id'];?>">Modify</a></li>
                        <li><a href="javascript:void(0);" class="add"      title="Company" id="<?php echo $addr['id'];?>">Use as Company</a></li>
                       <!-- <li><a href="javascript:void(0);" class="add"      title="Vendor" id="<?php //echo $addr['id'];?>">Use as Vendor</a></li>-->
                        <li><a href="javascript:void(0);" class="add"      title="Delivery" id="<?php echo $addr['id'];?>">Use as Delivery</a></li>
                        <li><a href="javascript:void(0);" class="add"      title="Contact" id="<?php echo $addr['id'];?>">Use as Contact</a></li>
                        <li><a href="javascript:void(0);" class="remove_adr" title="Remove" id="<?php echo $addr['id'];?>">Remove</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <?php 
    $i = $i + 1;
    }?>
    <?php } ?>
    <button class="address-2 add-new-address1"> <i class="fa fa-plus"> </i> New Address</button>
    <form id="appendhash1" method="post" action="<?php  echo $action; ?>" enctype="multipart/form-data">

        <div id="new_address1">

            <div class="form-group col-sm-6 height_75">
                <label for="address">Street *</label>
                <input name="new_address" type="text" class="form-control"  value="<?php echo isset($new_address)?$new_address:'';?>"  placeholder="Address"  id="input-address-1"/>
                <?php if ($error_new_address) { ?>
                <div class="text-danger"><?php echo $error_new_address; ?></div>
                <?php } ?>                      
            </div>
            <div class="form-group col-sm-6 height_75">
                <div class="row">
                    <div class="col-xs-3 pad_r_0">
                        <label for="zip">Number *</label>
                        <input type="text"  name="address_doornumber" value="<?php echo isset($address_doornumber)?$address_doornumber:''; ?>" class="form-control" placeholder="Number"/>
                        <?php if ($error_door_number) { ?>
                        <div class="text-danger"><?php echo $error_door_number; ?></div>
                        <?php } ?>                      
                    </div>
                    <div class="col-xs-3 pad_r_0">
                        <label for="zip">Floor</label>
                        <input type="text"  name="address_floor" value="<?php echo isset($address_floor)?$address_floor:''; ?>" class="form-control" placeholder="Floor"  id="input-postcode"/>
                    </div>
                    <div class="col-xs-3 pad_r_0">
                        <label for="zip">Apartment</label>
                        <input type="text"  name="address_apartment" value="<?php echo isset($address_apartment)?$address_apartment:''; ?>" class="form-control" placeholder="Apartment"  id="input-postcode"/>
                    </div>
                    <div class="col-xs-3 pad_r_0">
                        <label for="zip">Postcode</label>
                        <input type="text"  name="postcode" value="<?php echo isset($postcode)?$postcode:''; ?>" class="form-control" placeholder="Zip Code"  id="input-postcode"/>
                    </div>
                </div>
            </div>
            <input id="address_hidden1" type="hidden" name="new_address_condition1" value="0" class="address_hidden1">
            <div class="form-group col-sm-6 height_75">
                <label for="country">Country</label>
                <select name="country_id" id="input-country" class="form-control new-address-append">
                    <option value=""><?php echo $text_select; ?></option>
                    <?php foreach ($countries as $country) { ?>
                    <?php if ($country['country_id'] == $country_id) { ?>
                    <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                </select>
            </div>
            <div class="form-group col-sm-6 height_75">
                <label for="country">Province</label>
                <select name="proviences_id" id="proviences_id" class="form-control">
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
                <label for="city">City</label>
                <select name="city" id="list-city" class="form-control">
                </select>
            </div>
            <div class="clearfix"></div>
            <input type="submit" value="Finish" class="continu pull-left" />
            <a href="<?php echo $base;?>index.php?route=customuserdetail/addressbook" class="pull-right" >Not need to add adddress click here</a>
        </div>
    </form>           
</div>
</div>
<div class="hidden-xs hidden-sm col-md-2 col-lg-2">&nbsp;</div>
</div>
</div>
</div>


<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script>


$('.new-address-append :eq(1)').prop('selected', true);
$('select.new-address-append').find('option:first').remove();

    $("body").on("click", ".drop_btn_adrs li a.add", function (e) {

        var id = $(this).attr("id");

        e.preventDefault();
        var title = $(this).attr("title");

        var hf = $(this).parents(".block_22").find(".row").find(".boot_addr");
		var use_as = hf.append("<span class='contact_address bott_1'> " + title + " Address</span>");
        console.log(hf);
       /* if (title === 'Company')
        {}
        else if (title === 'Vendor')
        {}

        if (title === 'Delivery')
        {}
        else if (title === 'Contact')
        {}
        function hasClass(element, cls)
        {
            return (' ' + element.className + ' ').indexOf(' ' + cls + ' ') > -1;
        }*/

        var store_select = [];
        $(".get-selected-" + id + "> span").each(function (index) {

            store_select[index] = $(this).text();
            console.log(index + ": " + $(this).text());
        });
        //alert(store_select);
		store_select_str = store_select.toString();
		splitted_addresses = store_select_str.split(',');
		data = [];
		console.log(splitted_addresses);
		number_of_addresses = splitted_addresses.length;
		for(i=0; i < number_of_addresses; i++)
		{
			data[i] = splitted_addresses[i];
		}

        $.ajax({
            url: 'index.php?route=customuserdetail/addressbook/save_use_as',
            type: 'post',
            data: {"id":id , "address":data, "number_of_addresses":number_of_addresses},
            dataType: 'text',
            success: function (response) {
				window.location.reload();
                //alert("save use as");
                //alert(response);
            }
        });


        //$(this).prop('disabled', true);
        e.stopPropagation();

    });









    // $("body").on("click" , ".drop_btn_adrs li a.remove_adr",function(e){
    $("body").on("click", ".remove_adr", function (e) {

        var id = $(this).attr("id");
        e.preventDefault();
        //$(".drop_btn_adrs li a").prop('disabled', false);

        var hf = $(this).parents(".block_22").find(".row").find(".boot_addr");


        $.ajax({
            url: 'index.php?route=customuserdetail/addressbook/remove_addresses',
            type: 'post',
            data: {"id":id},
            dataType: 'text',
            success: function (response) {
                //alert("save use as");
               // alert(response);
            }
        });




        $(hf).html("");



    });




    var hash = window.location.hash;
//alert(hash);
    if (hash) {
        $('#address_hidden1').val('1');

        $("#newaddress1").trigger("click");
        $('.add-new-address1').hide();
        $('#new_address1').show();
        $('#appendhash1').each(function () {
            console.log($(this).attr("action", $(this).attr("action") + "#newaddress1"));
        });



    } else {
        $('#new_address1').hide();
    }




    $('.add-new-address1').click(function () {

        $('.add-new-address1').hide();
        $('#new_address1').show();


        $('#appendhash1').each(function () {
            console.log($(this).attr("action", $(this).attr("action") + "#newaddress1"));
        });

        $('#address_hidden1').val('1');

        window.location.hash = $(this).attr("id");
        //e.preventDefault();
    });

    var matches = /param=([^&#=]*)/.exec(window.location.search);
    var param1 = matches[1];
    if (param1 == 10) {
        window.location.hash = "";
        window.location.href = "<?php echo $base;?>index.php?route=customuserdetail/addressbook";
        //document.location.reload(true);
    }






</script>


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
<script type="text/javascript"><!--
$('select[name=\'proviences_id\']').on('change', function () {
        var data_attribute = this.value;
        $.ajax({
            url: 'index.php?route=customuserdetail/userdetail/cities_lc',
            type: 'POST',
            dataType: 'json',
            data: {city_id:data_attribute},
            success: function (data)
            {
                if (data == '') {
                    $('#list-city').html('<option value="0" selected="selected">none</option>');
                }
                var resulted_data = '';
                for (i = 0; i < data.length; i++)
                {
                    resulted_data = resulted_data + "<option value = " + data[i].id + ">" + data[i].localidad + "</option>"
                }
                $('#list-city').html(resulted_data);

            }
        });
    });

    $('select[name=\'country_id\']').trigger('change');
//--></script>




<script>

    var current_id = ''
    $("body").on("click", ".modify22", function () {
        current_id = $(this).attr("id");

        $('.update_address').val('');
		$('.update_doornumber').val('');
		$('.update_floor').val('');
		$('.update_apartment').val('');
		$('.update_postcode').val('');
		$('#input-city').val('');
		$('.update_country_id').val('');
		

		
        $.ajax({
            url: 'index.php?route=customuserdetail/addressbook/get_current_address_addressbook',
            type: 'post',
            data: {"id":current_id},
            dataType: 'text',
			async:false,
            success: function (response) {
                //alert("save use as");
               json_parse = JSON.parse(response);
			   
			   var vv_floor = 'floor';
			   
			   if(json_parse[0].get_from === 'user detail')
			   {
				   json_address = json_parse[0].address;
			   }
			   else
			   {
				   json_address = json_parse[0].new_address;
			   }

				$('.update_address').val(json_address);
				$('.update_doornumber').val(json_parse[0].door_number);
				$('.update_floor').val(json_parse[0].floor);
				$('.update_apartment').val(json_parse[0].apartment);
				$('.update_postcode').val(json_parse[0].postcode);
				$('.update_country_id :eq(1)').prop('selected', true);
			 
			    $('select.update_country_id').find('option:first').remove();
				$('select#provience_id').find('option[value="'+ json_parse[0].province + '"]').prop('selected', true); 
				
				
				var data_attribute = json_parse[0].province;
				$.ajax({
					url: 'index.php?route=customuserdetail/userdetail/cities_lc',
					type: 'POST',
					dataType: 'json',
					data: {city_id:data_attribute},
					async:false,
					success: function (data)
					{
						console.log(data);
						if (data == '') {
							$('#list-city').html('<option value="0" selected="selected">none</option>');
						}
						var resulted_data = '';
						for (i = 0; i < data.length; i++)
						{
							resulted_data = resulted_data + "<option value = " + data[i].id + ">" + data[i].localidad + "</option>"
						}
						$('#input-city').html(resulted_data);
						$('select#input-city').find('option[value="'+ json_parse[0].city + '"]').prop('selected', true); 
		
					}
				});

				
				
				
				
				
				
				
				
				
				
				
				
				
			    console.log(json_parse);
            }
        });





        $(".modal_name").fadeIn(500);

    });

    $("body").on("click", "#close", function () {
        $(".modal_name").fadeOut(500);
    });


    $('.update-address').hide();
    $('.update-doornumber').hide();


    $('.update_current_address').click(function () {

//alert(current_id);
        var form_error = false;

        var addr = $('.update_address').val();
        if (addr == '') {
            $('.update-address').show();
            form_error = true;
            //return false;
        } else {
            $('.update-address').hide();
        }



        var door_number = $('.update_doornumber').val();
        if (door_number == '') {
            $('.update-doornumber').show();
            form_error = true;
            //return false;
        } else {
            $('.update-doornumber').hide();
        }

        var floors_val = $('.update_floor').val();
        var apt = $('.update_apartment').val();
        var postcde = $('.update_postcode').val();
        var city = $('#input-city').val();
        var country_id = $('.update_country_id').val();
        var province = $('#provience_id').val();


        if (addr == '' || door_number == '') {
            return false;
        }

        $.ajax({
            url: 'index.php?route=customuserdetail/addressbook/update_current_address',
            type: 'post',
            data: {"id":current_id , "address":addr , "door_number":door_number, "floors_val":floors_val, "apt":apt,
                                 "postcde":postcde, "city":city, "country_id":country_id, "province":province},
            dataType: 'text',
            success: function (response) {
                //alert("save use as");
                //alert(response);
                window.location.href = "index.php?route=customuserdetail/addressbook";
            }
        });
    });





</script>


<?php
echo $footer; 
?>