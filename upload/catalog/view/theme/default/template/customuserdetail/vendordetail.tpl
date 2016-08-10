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
                                        <div class="step-one">
                                            <span class="num-step">3</span>
                                            <span class="name-step-confirm">vendor details</span>
                                        </div>
                                        <div class="arrow-shoping">
                                            <img alt="" src="<?php echo $base;?>image/assets/images/step-1-divi2.png">
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
                        <!--<li><a href="<?php echo $base;?>index.php?route=account/logout"><i class="fa fa-sign-out" aria-hidden="true"></i> logout</a></li>-->
                    </ul>
                </div>
            </div>
            <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
                <div class="common-content">
                    <div class="section-heading" style="padding:15px;">vendor details</div>









                    <form id="appendhash" action="<?php echo $action; ?>"  method="post" enctype="multipart/form-data">

                        <!-- <div class="form-group col-sm-6">
                             <label for="companyname">Company Name</label>
                             <input type="text" name="company_name" value="<?php echo $company_name;?>" class="form-control" id="companyname" placeholder="Company Name" />
                            <?php if ($error_userdet_companyname) { ?>
                            <div class="text-danger"><?php echo $error_userdet_companyname; ?></div>
                            <?php } ?>                      
     
                         </div>
                         
                         <div class="form-group col-sm-6">
                             <label for="companyaddress">Company Address</label>
                             <select class="form-control" name="company_address">
                                     <option><?php echo $get_address;?></option>
                             </select>
                             <div class="clr"></div>
                             <br />
                             <button type="button" class="btn btn-blue">+ new address</button>
                         </div>-->

                        <div class="col-sm-12">
                            <p class="payment_cnfrm">Payment Method Accepted</p>
                            <div class="clr"><br /></div>

                            <?php if ($error_payment_method_mandatory) { ?>
                            <div class="text-danger"><?php echo $error_payment_method_mandatory; ?></div>
                            <?php } ?>                      

                            <input id="credit_card" class="credit_card" type="checkbox" name="credit_card" value="Credit Card"/>
                            <label for="credit_card">Credit Card</label>

                            <input type="checkbox" id="wire_transfer"  name="wire_transfer" value="Wire Transfer" />
                            <label for="wire_transfer">Wire Transfer</label>

                            <input type="checkbox" id="cash" name="cash" value="Cash" />
                            <label for="cash">Cash</label>
                            
                            <input type="button" style="font-size: 1.2em;" class='continu pull-right' id="user_details" value='Load user details'>
                            <div class="clearfix"></div>
                        </div>
                        <div class="clr"><br /></div>
                        <div class="section-heading" style="padding:15px;">contact details</div>
                        <div class="form-group col-sm-6 height_75">
                            <label for="name">Name *</label>
                            <input type="text" class="form-control" id="name" placeholder="Name"  name="name" value="<?php echo $name;?>"/>
                            <?php if ($error_userdet_name) { ?>
                            <div class="text-danger"><?php echo $error_userdet_name; ?></div>
                            <?php } ?>                      

                        </div>




                        <div class="form-group col-sm-6 height_75">
                            <label for="phone">Phone *</label>
                            <input type="text" class="form-control vnumbersOnlyphone" id="phone" onkeypress=" return isNumber(event);" placeholder="Phone"  name="phone" value="<?php echo $phone;?>" />
                            <?php if ($error_userdet_phone) { ?>
                            <div class="text-danger"><?php echo $error_userdet_phone; ?></div>
                            <?php } ?>                      

                        </div>

                        <div class="form-group col-sm-6 height_75">
                            <label for="email">Email *</label>
                            <input type="text" class="form-control" id="email" placeholder="Email" name="email"  value="<?php echo $email;?>" />
                            <?php if ($error_userdet_email) { ?>
                            <div class="text-danger"><?php echo $error_userdet_email; ?></div>
                            <?php } ?>                      

                        </div>

                        <div class="form-group col-sm-6 height_75">
                            <label for="address">Street </label>
                            <select class="form-control" name="sec_address">
                                <option><?php echo $get_address;?></option>

                            </select>
                            <div class="clr"><br /></div>
                            <a  href"javascript:void(0);"  class="btn btn-blue add-new-address" id="newaddress">+ new address</a>
                        </div>


                        <div id="new_address">

                            <div class="form-group col-sm-6 height_75">
                                <label for="address">Street<?php //echo $address_labl;?></label>
                                <input name="address_1" type="text" class="form-control"  value="<?php echo $address_1;?>"  placeholder="Address"  id="input-address-1"/>
                                <?php if ($error_userdet_address_1) { ?>
                                <div class="text-danger"><?php echo $error_userdet_address_1; ?></div>
                                <?php } ?>
                            </div>





                            <div class="form-group col-sm-6 height_75">
                                <div class="row">
                                    <div class="col-xs-3 pad_r_0">
                                        <label for="zip">Number *</label>
                                        <input type="text"  name="vendor_doornumber" value="<?php echo $vendor_doornumber; ?>" class="form-control" placeholder="Number"/>
                                        <?php if ($error_userdet_vendor_doornumber) { ?>
                                        <div class="text-danger"><?php echo $error_userdet_vendor_doornumber; ?></div>
                                        <?php } ?>

                                    </div>
                                    <div class="col-xs-3 pad_r_0">
                                        <label for="zip">Floor</label>
                                        <input type="text"  name="vendor_floor" value="<?php echo isset($vendor_floor)?$vendor_floor:''; ?>" class="form-control" placeholder="Floor"  id="input-postcode"/>
                                    </div>
                                    <div class="col-xs-3 pad_r_0">
                                        <label for="zip">Apartment</label>
                                        <input type="text"  name="vendor_apartment" value="<?php echo isset($vendor_apartment)?$vendor_apartment:''; ?>" class="form-control" placeholder="Apartment"  id="input-postcode"/>
                                    </div>
                                    <div class="col-xs-3 pad_r_0">
                                        <label for="zip"><?php echo $zipcode_labl;?></label>
                                        <input type="text"  name="postcode" value="<?php echo isset($postcode)?$postcode:''; ?>" class="form-control" placeholder="Zip Code"  id="input-postcode"/>
                                    </div>
                                </div>
                            </div>


                            <input id="address_hidden" type="hidden" name="new_address_condition" value="0" class="address_hidden">







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
                       <label for="city"><?php echo $city_labl;?></label>
                       <select name="city" id="input-city" class="form-control">
                       </select>
                       <?php if ($error_userdet_city) { ?>
                        <div class="text-danger"><?php echo $error_userdet_city; ?></div>
                        <?php } ?>                  
                    </div>


                          
                        </div>	




                        <div class="clr"><br /><br /><br /></div>
                        <div class="ask-btn alert">
                            <input type="submit" value="Continue" class="continu pull-left" />
                            <a href="<?php echo $base;?>index.php?route=customuserdetail/editaccount" class="pull-right" >Continue later</a>

                        </div>



                    </form>







                </div>
            </div>
            <div class="hidden-xs hidden-sm col-md-2 col-lg-2">&nbsp;</div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
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


<script type="text/javascript">
<!--
// Sort the custom fields
    $('#account .form-group[data-sort]').detach().each(function () {
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

    $('#address .form-group[data-sort]').detach().each(function () {
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

    $('input[name=\'customer_group_id\']').on('change', function () {
        $.ajax({
            url: 'index.php?route=account/register/customfield&customer_group_id=' + this.value,
            dataType: 'json',
            success: function (json) {
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
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    $('input[name=\'customer_group_id\']:checked').trigger('change');
//--></script>
<script type="text/javascript"><!--
$('button[id^=\'button-custom-field\']').on('click', function () {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }

        timer = setInterval(function () {
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
                    beforeSend: function () {
                        $(node).button('loading');
                    },
                    complete: function () {
                        $(node).button('reset');
                    },
                    success: function (json) {
                        $(node).parent().find('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').attr('value', json['code']);
                        }
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
//--></script>
<script type="text/javascript"><!--


    var hash = window.location.hash.substr(1);
//alert(hash.substr(1));
    if (hash == 'newaddress') {
		//alert("Got it");
        $('#address_hidden').val('1');

        $("#newaddress").trigger("click");
        $('.add-new-address').hide();
        $('#new_address').show();
        $('#appendhash').each(function () {
            console.log($(this).attr("action", $(this).attr("action") + "#newaddress"));
        });



    } else {
        $('#new_address').hide();
    }






    $('.add-new-address').click(function () {

        $('.add-new-address').hide();
        $('#new_address').show();


        $('#appendhash').each(function () {
            console.log($(this).attr("action", $(this).attr("action") + "#newaddress"));
        });

        $('#address_hidden').val('1');



        window.location.hash = $(this).attr("id");
        //e.preventDefault();
    });


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
/*$('select[name=\'country_id\']').on('change', function () {
        $.ajax({
            url: 'index.php?route=account/account/country&country_id=' + this.value,
            dataType: 'json',
            beforeSend: function () {
                $('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
            },
            complete: function () {
                $('.fa-spin').remove();
            },
            success: function (json) {
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
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    $('select[name=\'country_id\']').trigger('change');*/
//--></script>


<script>

function isNumber(evt)
{
	var iKeyCode = (evt.which) ? evt.which : evt.keyCode
	if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
	{
		return false;
	}
	return true;
}


/*
$(".vnumbersOnlyphone").keydown(function (event) {
        // Allow only backspace and delete
        if (event.keyCode == 46 || event.keyCode == 8) {
            // let it happen, don't do anything
        }
        else {
            // Ensure that it is a number and stop the keypress
            if (event.keyCode < 48 || event.keyCode > 57) {
                event.preventDefault();
            }
        }
    });
*/

</script>


<?php echo $footer; ?>