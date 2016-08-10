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
                     <li>Edit Account</li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
      
      
 <!--modal-box Name start-->

<div class="modal_box22 modal_name">

    <div class="modall_content11 text-center">
        <a href="javascript:void(0);" class="close_11" id="modal_name_close"><i class="fa fa-close"></i></a>
        <h2>
            Change Name
            <div class="orange_mail">
                <label for="">Old Name :</label>
                <span><?php echo isset($get_basic_detail->row['firstname'])?$get_basic_detail->row['firstname']:''; ?> </span>
            </div>
        </h2>

        

        <div class="row">
            <label class="col-md-3 text-right">
               New Name *:
            </label>
            <div class="col-md-5">
                <input type="text" name="name" class="form-control name-val">
            </div>
        </div>

        <div class="row text-left">
            <div class="col-md-5 col-md-offset-3">
                <button class="btn_pur name_save">Save</button>
                <button class="khali_11" id="modal_name_close">cancle</button>
            </div>
        </div>

    </div>

</div>

<!--modal-box name end-->

      
      
 <!--modal-box Sure Name start-->

<div class="modal_box22 modal_surename">

    <div class="modall_content11 text-center">
        <a href="javascript:void(0);" class="close_11" id="modal_surename_close"><i class="fa fa-close"></i></a>
        <h2>
            Change Surename
            <div class="orange_mail">
                <label for="">Old Surename :</label>
                <span><?php echo isset($get_basic_detail->row['lastname'])?$get_basic_detail->row['lastname']:''; ?> </span>
            </div>
        </h2>

        

        <div class="row">
            <label class="col-md-3 text-right">
                New Surename:
            </label>
            <div class="col-md-5">
                <input type="text" name="surename" class="form-control surename-val">
            </div>
        </div>

        <div class="row text-left">
            <div class="col-md-5 col-md-offset-3">
                <button class="btn_pur surename_save">Save</button>
                <button class="khali_11" id="modal_surename_close">cancle</button>
            </div>
        </div>

    </div>

</div>

<!--modal-box Sure name end-->

      
      
      <!--modal-box---------->

<div class="modal_box22 modal_email">

    <div class="modall_content11 text-center">
        <a href="javascript:void(0);" class="close_11" id="close_11"><i class="fa fa-close"></i></a>
        <h2>
            Change Email
            <div class="orange_mail">
                <label for="">Old Email :</label>
                <span><?php echo isset($get_basic_detail->row['email'])?$get_basic_detail->row['email']:''; ?></span>
            </div>
        </h2>

        
        <div class="row">
            <label for="" class="col-md-3 text-right">New Email:</label>
            <div class="col-md-5">
                <input type="text" name="email" class="form-control email-val">
                <span class="small">This will be your new Email</span>
            </div>
        </div>

        <div class="row">
            <label class="col-md-3 text-right">
                Repeat New Email:
            </label>
            <div class="col-md-5">
                <input type="text" name="repeat_newemail" class="form-control repeat-email-val">
            </div>
        </div>

        <div class="row text-left">
            <div class="col-md-5 col-md-offset-3">
                <button class="btn_pur email_save">Save</button>
                <button class="khali_11" id="close_11">cancle</button>
            </div>
        </div>

    </div>

</div>

<!--modal-box---------->






 <!--modal-box Phone start-->

<div class="modal_box22 modal_phone">

    <div class="modall_content11 text-center">
        <a href="javascript:void(0);" class="close_11" id="modal_phone_close"><i class="fa fa-close"></i></a>
        <h2>
            Change Phone
            <div class="orange_mail">
                <label for="">Old Phone:</label>
                <span><?php echo isset($get_basic_detail->row['fax'])?$get_basic_detail->row['fax']:''; ?></span>
            </div>
        </h2>

        

        <div class="row">
            <label class="col-md-3 text-right">
                New Phone:
            </label>
            <div class="col-md-5">
                <input type="text" name="phone" class="form-control phone-val edit-phone-only">
            </div>
        </div>

        <div class="row text-left">
            <div class="col-md-5 col-md-offset-3">
                <button class="btn_pur save_phone">Save</button>
                <button class="khali_11" id="modal_phone_close">cancle</button>
            </div>
        </div>

    </div>

</div>

<!--modal-box Phone end-->

      
      
  


 <!--modal-box Tax ID start-->

<div class="modal_box22 modal_taxid">

    <div class="modall_content11 text-center">
        <a href="javascript:void(0);" class="close_11" id="modal_taxid_close"><i class="fa fa-close"></i></a>
        <h2>
            Change Tax ID
		</h2>
			<span id='error_message_tax_id_update' style='display:none;' class='alert alert-danger'></span>
            
			<h2>
			<div class="orange_mail">
                <label for="">Old Tax ID:</label>
                <span><?php echo isset($get_tax_id->row['lc_tax_id'])?$get_tax_id->row['lc_tax_id']:''?></span>
            </div>
       </h2>

        

        <div class="row">
            <label class="col-md-3 text-right">
                New Tax ID:
            </label>
            <div class="col-md-5">
                <input type="text" name="taxid" class="form-control taxid-val" id="taxid_mask">
            </div>
        </div>

        <div class="row text-left">
            <div class="col-md-5 col-md-offset-3">
                <button class="btn_pur save_txid">Save</button>
                <button class="khali_11" id="modal_taxid_close">cancle</button>
            </div>
        </div>

    </div>

</div>

<!--modal-box Tax ID end-->



























 <!--modal-box Contact name start-->

<div class="modal_box22 modal_contactname">

    <div class="modall_content11 text-center">
        <a href="javascript:void(0);" class="close_11" id="modal_contactname_close"><i class="fa fa-close"></i></a>
        <h2>
            Change Contact Name
            <div class="orange_mail">
                <label for="">Old Contact Name:</label>
                <span><?php echo isset($get_contact_detail->row['v_name'])?$get_contact_detail->row['v_name']:''; ?> </span>
            </div>
        </h2>

        

        <div class="row">
            <label class="col-md-3 text-right">
                New Contact Name:
            </label>
            <div class="col-md-5">
                <input type="text" name="contactname" class="form-control contactname-val">
            </div>
        </div>

        <div class="row text-left">
            <div class="col-md-5 col-md-offset-3">
                <button class="btn_pur save_contactname">Save</button>
                <button class="khali_11" id="modal_contactname_close">cancle</button>
            </div>
        </div>

    </div>

</div>

<!--modal-box Contact name end-->









 <!--modal-box Contact phone start-->

<div class="modal_box22 modal_contactphone">

    <div class="modall_content11 text-center">
        <a href="javascript:void(0);" class="close_11" id="modal_contactphone_close"><i class="fa fa-close"></i></a>
        <h2>
            Change Contact Phone
            <div class="orange_mail">
                <label for="">Old Contact Phone:</label>
                <span><?php echo isset($get_contact_detail->row['v_phone'])?$get_contact_detail->row['v_phone']:''?>  </span>
            </div>
        </h2>

        

        <div class="row">
            <label class="col-md-3 text-right">
                New Contact Phone:
            </label>
            <div class="col-md-5">
                <input type="text" name="contactphone" class="form-control contactphone-val edit-contact-phone-only">
            </div>
        </div>
        <div class="row text-left">
            <div class="col-md-5 col-md-offset-3">
                <button class="btn_pur contact_phone">Save</button>
                <button class="khali_11" id="modal_contactphone_close">cancle</button>
            </div>
        </div>

    </div>

</div>

<!--modal-box  Contact phone end-->










 <!--modal-box  Contact email start-->

<div class="modal_box22 modal_contactemail">

    <div class="modall_content11 text-center">
        <a href="javascript:void(0);" class="close_11" id="modal_contactemail_close"><i class="fa fa-close"></i></a>
        <h2>
            Change Contact Email
            <div class="orange_mail">
                <label for="">Old Contact Email:</label>
                <span><?php echo isset($get_contact_detail->row['v_email'])?$get_contact_detail->row['v_email']:''; ?></span>
            </div>
        </h2>

        

        <div class="row">
            <label class="col-md-3 text-right">
                New Contact Email:
            </label>
            <div class="col-md-5">
                <input type="text" name="contactemail" class="form-control contactemail-val">
            </div>
        </div>

        <div class="row text-left">
            <div class="col-md-5 col-md-offset-3">
                <button class="btn_pur save_contactemail">Save</button>
                <button class="khali_11" id="modal_contactemail_close">cancle</button>
            </div>
        </div>

    </div>

</div>

<!--modal-box  Contact email end-->









 <!--modal-box  Company Name start-->

<div class="modal_box22 modal_companyname">

    <div class="modall_content11 text-center">
        <a href="javascript:void(0);" class="close_11" id="modal_companyname_close"><i class="fa fa-close"></i></a>
        <h2>
            Change Company Name
            <div class="orange_mail">
                <label for="">Old Company Name:</label>
                <span><?php echo isset($get_company_detail->row['company_name'])?$get_company_detail->row['company_name']:'';?> </span>
            </div>
        </h2>

        

        <div class="row">
            <label class="col-md-3 text-right">
                New Company Name:
            </label>
            <div class="col-md-5">
                <input type="text" name="companyname" class="form-control companyname-val">
            </div>
        </div>

        <div class="row text-left">
            <div class="col-md-5 col-md-offset-3">
                <button class="btn_pur save_companyname">Save</button>
                <button class="khali_11" id="modal_companyname_close">cancle</button>
            </div>
        </div>

    </div>

</div>

<!--modal-box Company Name  end-->


























<div class="min-height">
    <div class="container">
        <div class="row">

            <!-- sidebar-->
           <!-- <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                <div class="sideoptions">
                    <ul>
                        <li><a href="<?php //echo $base;?>index.php?route=customuserdetail/myaccount"><i class="fa fa-user" aria-hidden="true"></i> My account</a></li>
                        <li class="active"><a href="<?php //echo$base.'index.php?route=customuserdetail/editaccount'; ?>"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> edit account</a></li>
                        <li><a href="<?php //echo $base;?>index.php?route=customuserdetail/resetpwd"><i class="fa fa-key" aria-hidden="true"></i> password</a></li>
                        <li><a href="<?php //echo $base;?>index.php?route=customuserdetail/addressbook"><i class="fa fa-book" aria-hidden="true"></i> address book</a></li>
                        <!--<li><a href=""><i class="fa fa-envelope-o" aria-hidden="true"></i> my enquiry</a></li>
                        <li><a href=""><i class="fa fa-star-half-o" aria-hidden="true"></i> reward points</a></li>
                        <!--<li><a href="<?php //echo $base;?>index.php?route=account/logout"><i class="fa fa-sign-out" aria-hidden="true"></i> logout</a></li>
                    </ul>
                </div>
            </div>
    -->

            <!-- sidebar-->

    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
    </div>
            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">


                <div class="common-content edit_account row">

                    <h1 class="section-heading">EDIT ACCOUNT</h1>

                    <div class="details col-md-9">
                        <h2>Basic Details</h2>

                        <table class="table">

                            <tr>
                                <td>Name :</td>
                                <td><span class="nameupdate"><?php echo isset($get_basic_detail->row['firstname'])?$get_basic_detail->row['firstname']:''; ?> </span><a class="modify_name" href="javascript:void(0);"> Modify</a></td>
                            </tr>

                            <tr>
                                <td>Surname :</td>
                                <td><span class="updatesurename"><?php echo isset($get_basic_detail->row['lastname'])?$get_basic_detail->row['lastname']:''; ?></span> <a class="modify_surename" href="javascript:void(0);"> Modify</a></td>
                            </tr>

                            <tr>
                                <td>Main Email :</td>
                                <td><span class="updateemail"><?php echo isset($get_basic_detail->row['email'])?$get_basic_detail->row['email']:''; ?></span><a href="javascript:void(0);" class="Edit_email11"> Modify</a></td>
                            </tr>

                            <tr>
                                <td>Phone :</td>
                                <td><span class="updatephone"><?php echo isset($get_basic_detail->row['fax'])?$get_basic_detail->row['fax']:''; ?></span><a class="modify_phone"href="javascript:void(0);"> Modify</a></td>
                            </tr>
                            <tr>
                                <td>Tax ID :</td>
                                <td><span class="updatetax"><?php echo isset($get_tax_id->row['lc_tax_id'])?$get_tax_id->row['lc_tax_id']:''?></span> <a class="modify_taxid" href="javascript:void(0);"> Modify</a></td>
                            </tr>

                        </table>
                    </div>


                    <div class="details col-md-9">
                        <h2>Contact Details</h2>

                        <table class="table">

                              <tr>
                                  <td>Contact Name:</td>
                                  <td><span class="updatecontactname"><?php echo isset($get_contact_detail->row['v_name'])?$get_contact_detail->row['v_name']:''; ?> </span><a class="modify_contactname" href="javascript:void(0);"> Modify</a></td>
                              </tr>
                              <tr>
                                  <td>Contact Phone:</td>
                                  <td><span class="updatecontactphone"><?php echo isset($get_contact_detail->row['v_phone'])?$get_contact_detail->row['v_phone']:''?> </span> <a class="modify_contactphone" href="javascript:void(0);"> Modify</a></td>
                              </tr>
                              <tr>
                                  <td>Contact Email:</td>
                                  <td><span class="updatecontactemail"><?php echo isset($get_contact_detail->row['v_email'])?$get_contact_detail->row['v_email']:''; ?></span> <a class="modify_contactemail" href="javascript:void(0);"> Modify</a></td>
                              </tr>

                        </table>
                    </div>


                    <div class="details col-md-9">
                        <h2>Company Details</h2>

                        <table class="table">

                            <tr>
                                <td>Company Name:</td>
                                <td><span class="updatecompanyname"><?php echo isset($get_company_detail->row['company_name'])?$get_company_detail->row['company_name']:'';?></span> <a class="modify_companyname" href="javascript:void(0);"> Modify</a></td>
                            </tr>

                            <tr>
                                <td>logo:</td>
                                <td>

                                    <div class="input-group">
                                        <input type="text" class="form-control clogovl" value="<?php echo isset($get_company_detail->row['company_logo'])?$get_company_detail->row['company_logo']:''; ?>" placeholder="Company Logo">
                                              <span class="input-group-btn">
                                                <span class="btn btn-secondary input_btn22 " type="button">Browse 
                                                
                                                    <form id='image_upload_form' enctype="multipart/form-data">
                                                           <input type="file" name="company_logo" accept="img/*" value="" class="clogo updatelogoimg">  </span>
                                                    </form>
                                                
                                              </span>
                                    </div>

                                    <div class="img-holder">
                                        <img class="displaylogo" src="<?php echo $base;?>image/companylogo/<?php echo isset($get_company_detail->row['company_logo'])?$get_company_detail->row['company_logo']:'no_image.png'; ?>" alt="">
                                    </div>

                                </td>
                            </tr>

                            <tr>
                                <td>banner:</td>
                                <td>

                                    <div class="input-group">
                                        <input type="text" class="form-control clogovl logoval"  value="<?php echo isset($get_company_detail->row['company_banner'])?$get_company_detail->row['company_banner']:''?>"placeholder="Company Banner">
                                              <span class="input-group-btn">
                                                <span class="btn btn-secondary input_btn22 " type="button">Browse 
                                                
                                                    <form id='image_upload_form1' enctype="multipart/form-data">
                                                <input type="file" name="company_banner" accept="img/*" value="" class="clogo combanner">  </span>
                                                    </form>

                                              </span>
                                    </div>

                                    <div class="banner-holder ">
                                        <img class="displaybanner" src="<?php echo $base;?>image/companybanner/<?php echo isset($get_company_detail->row['company_banner'])?$get_company_detail->row['company_banner']:'no_image.png'; ?>" alt="">
                                    </div>

                                </td>
                            </tr>


                        </table>
                    </div>

                </div>


            </div>
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
</div>

            <div class="hidden-xs hidden-sm col-md-2 col-lg-2">&nbsp;</div>
        </div>
    </div>
</div>

 <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script> 
<!--modal -js-->
<script type="">
$(document).ready(function(){

    $("body").on("click",".Edit_email11",function(){
        $(".modal_email").fadeIn(500);
    });

    $("body").on("click","#close_11",function(){
        $(".modal_email").fadeOut(500);
    });




    $("body").on("click",".modify_name",function(){
        $(".modal_name").fadeIn(500);
    });

    $("body").on("click","#modal_name_close",function(){
        $(".modal_name").fadeOut(500);
    });



    $("body").on("click",".modify_surename",function(){
        $(".modal_surename").fadeIn(500);
    });

    $("body").on("click","#modal_surename_close",function(){
        $(".modal_surename").fadeOut(500);
    });


    $("body").on("click",".modify_phone",function(){
        $(".modal_phone").fadeIn(500);
    });

    $("body").on("click","#modal_phone_close",function(){
        $(".modal_phone").fadeOut(500);
    });


    $("body").on("click",".modify_taxid",function(){
		$('#error_message_tax_id_update').css('display', 'none');
        $(".modal_taxid").fadeIn(500);
    });

    $("body").on("click","#modal_taxid_close",function(){
        $(".modal_taxid").fadeOut(500);
    });




    $("body").on("click",".modify_contactname",function(){
        $(".modal_contactname").fadeIn(500);
    });

    $("body").on("click","#modal_contactname_close",function(){
        $(".modal_contactname").fadeOut(500);
    });



    $("body").on("click",".modify_contactphone",function(){
        $(".modal_contactphone").fadeIn(500);
    });

    $("body").on("click","#modal_contactphone_close",function(){
        $(".modal_contactphone").fadeOut(500);
    });




    $("body").on("click",".modify_contactemail",function(){
        $(".modal_contactemail").fadeIn(500);
    });

    $("body").on("click","#modal_contactemail_close",function(){
        $(".modal_contactemail").fadeOut(500);
    });






    $("body").on("click",".modify_companyname",function(){
        $(".modal_companyname").fadeIn(500);
    });

    $("body").on("click","#modal_companyname_close",function(){
        $(".modal_companyname").fadeOut(500);
    });







});
</script>

<!--modal -js-->


<script type="text/javascript"><!--
$('.name_save').click(function() {
	
	var form_error = false;
	
	var nameval = $('.name-val').val();
	if(nameval == ''){	
		$('.name-val').css('border','1px solid red');
		form_error =  true;
		return false;
	}else{
		$('.name-val').css('border','1px solid green');
	}
		
	$.ajax({
		url: 'index.php?route=customuserdetail/editaccount/save_name',
		type: 'post',
		data: {"name":nameval},
		dataType: 'text',
		success: function(response) {
			$('.nameupdate').text(nameval);
			 window.location.href="index.php?route=customuserdetail/editaccount";
			//alert(response);
		}
	});
	
	
	
 });


$('.surename_save').click(function() {
	
	var form_error = false;
	
	var surenameval = $('.surename-val').val();
	if(surenameval == ''){	
		$('.surename-val').css('border','1px solid red');
		form_error =  true;
		return false;
	}else{
		$('.surename-val').css('border','1px solid green');
	}
		
	$.ajax({
		url: 'index.php?route=customuserdetail/editaccount/save_surename',
		type: 'post',
		data: {"surename":surenameval},
		dataType: 'text',
		success: function(response) {
			$('.updatesurename').text(surenameval);
			 window.location.href="index.php?route=customuserdetail/editaccount";
			//alert(response);
		}
	});

});




$('.email_save').click(function() {
	
	var form_error = false;
	
	var emailval = $('.email-val').val();
	if(emailval == ''){	
		$('.email-val').css('border','1px solid red');
		form_error =  true;
		return false;
	}
	
	var emailrept = $('.repeat-email-val').val();
		
	$.ajax({
		url: 'index.php?route=customuserdetail/editaccount/save_newemail',
		type: 'post',
		data: {"email":emailval,"repeat_newemail":emailrept},
		dataType: 'text',
		success: function(response) {
			if(response == 'Not Valid'){
				$('.email-val').css('border','1px solid red');
				alert("Please enter valid email");
			}else if(response == 'already available'){
				$('.email-val').css('border','1px solid red');
			    alert("already available");
			}else if(response == 'required'){
				alert("Please repeat new email");
			}else if(response == 'not match'){
				
				$('.repeat-email-val').css('border','1px solid red');
				alert("both email should match");
			}else{
				$('.email-val').css('border','1px solid green');
				$('.repeat-email-val').css('border','1px solid green');
				$('.updateemail').text(emailval);
				 window.location.href="index.php?route=customuserdetail/editaccount";
			}
			
			
			//alert(response);
		}
	});

});





$('.save_phone').click(function() {
	
	var form_error = false;
	
	var phoneval = $('.phone-val').val();
	if(phoneval == ''){	
		$('.phone-val').css('border','1px solid red');
		form_error =  true;
		return false;
	}else{
		$('.phone-val').css('border','1px solid green');
	}
		
	$.ajax({
		url: 'index.php?route=customuserdetail/editaccount/update_phone',
		type: 'post',
		data: {"phone":phoneval},
		dataType: 'text',
		success: function(response) {
			$('.updatephone').text(phoneval);
			//alert(response);
			 window.location.href="index.php?route=customuserdetail/editaccount";
		}
	});

});




/*$('.save_txid').click(function() {
	
	var form_error = false;
	
	var taxval = $('.taxid-val').val();
	if(taxval == ''){	
		$('.taxid-val').css('border','1px solid red');
		form_error =  true;
		return false;
	}else{
		$('.taxid-val').css('border','1px solid green');
	}
		
	$.ajax({
		url: 'index.php?route=customuserdetail/editaccount/update_taxid',
		type: 'post',
		data: {"taxid":taxval},
		dataType: 'text',
		success: function(response) {
			$('.updatetax').text(taxval);
			 window.location.href="index.php?route=customuserdetail/editaccount";
			//alert(response);
		}
	});

});
*/






$('.save_txid').click(function()
{
	$('#error_message_tax_id_update').css('display', 'none');
	var form_error = false;
	
	var taxval = $('.taxid-val').val();
	if(taxval == '')
	{	
		$('.taxid-val').css('border','1px solid red');
		form_error =  true;
		return false;
	}
	else
	{
		$('.taxid-val').css('border','1px solid green');
	}
		
	$.ajax(
	{
		url: 'index.php?route=customuserdetail/editaccount/update_taxid',
		type: 'post',
		data: {"taxid":taxval},
		dataType: 'text',
		success: function(response)
		{
			if(response == '0')
			{
				$('#error_message_tax_id_update').text('Tax ID is not valid!');
				$('#error_message_tax_id_update').css('display', 'block');
				$('.taxid-val').css('border','1px solid red');
			}
			else if(response == '1')
			{
				$('.taxid-val').css('border','1px solid green');
				$('.updatetax').text(taxval);
			    window.location.href="index.php?route=customuserdetail/editaccount";
			}
			
			else if(response == '2')
			{
				$('#error_message_tax_id_update').text('This Tax ID already exist. Use an other one.');
				$('#error_message_tax_id_update').css('display', 'block');
				$('.taxid-val').css('border','1px solid red');
			}
		}
	});

});







$('.save_contactname').click(function() {
	
	var form_error = false;
	
	var contactname = $('.contactname-val').val();
	if(contactname == ''){	
		$('.contactname-val').css('border','1px solid red');
		form_error =  true;
		return false;
	}else{
		$('.contactname-val').css('border','1px solid green');
	}
		
	$.ajax({
		url: 'index.php?route=customuserdetail/editaccount/save_contact_name',
		type: 'post',
		data: {"contactname":contactname},
		dataType: 'text',
		success: function(response) {
			$('.updatecontactname').text(contactname);
			 window.location.href="index.php?route=customuserdetail/editaccount";
			 //alert(response);
		}
	});

});



$('.contact_phone').click(function() {
	
	var form_error = false;
	
	var contactphone = $('.contactphone-val').val();
	if(contactphone == ''){	
		$('.contactphone-val').css('border','1px solid red');
		form_error =  true;
		return false;
	}else{
		$('.contactphone-val').css('border','1px solid green');
	}
		
	$.ajax({
		url: 'index.php?route=customuserdetail/editaccount/save_contact_phone',
		type: 'post',
		data: {"contactphone":contactphone},
		dataType: 'text',
		success: function(response) {
			$('.updatecontactphone').text(contactphone);
			 window.location.href="index.php?route=customuserdetail/editaccount";
			//alert(response);
		}
	});

});




$('.save_contactemail').click(function() {
	
	var form_error = false;
	
	var contactemail = $('.contactemail-val').val();
	if(contactemail == ''){	
		$('.contactemail-val').css('border','1px solid red');
		form_error =  true;
		return false;
	}else{
		$('.contactemail-val').css('border','1px solid green');
	}
		
	$.ajax({
		url: 'index.php?route=customuserdetail/editaccount/save_contact_email',
		type: 'post',
		data: {"contactemail":contactemail},
		dataType: 'text',
		success: function(response) {
			if(response == 'Not Valid'){
				$('.contactemail-val').css('border','1px solid red');
				alert("Please enter valid email");
			}else{
				$('.contactemail-val').css('border','1px solid green');
				$('.updatecontactemail').text(contactemail);
				 window.location.href="index.php?route=customuserdetail/editaccount";
			}
		}
	});

});


      $("body").keydown(function(e){

               var hell=e.keyCode;
               if( hell == 27 ){
                   $(".modal_box22").fadeOut(500);
               }
            });

      $('.modal_box22').click(function(evt){

            if($(evt.target).closest('.modall_content11').length)
                return;
            $('.modal_box22').fadeOut(500);
        });





$('.save_companyname').click(function() {
	
	var form_error = false;
	
	var companyname = $('.companyname-val').val();
	if(companyname == ''){	
		$('.companyname-val').css('border','1px solid red');
		form_error =  true;
		return false;
	}else{
		$('.companyname-val').css('border','1px solid green');
	}
		
	$.ajax({
		url: 'index.php?route=customuserdetail/editaccount/save_company_name',
		type: 'post',
		data: {"companyname":companyname},
		dataType: 'text',
		success: function(response) {
			$('.updatecompanyname').text(companyname);
			window.location.href="index.php?route=customuserdetail/editaccount";
			//alert(response);
		}
	});

});

    $('.updatelogoimg').change( function(){
		
		//var logovalues = $(this).val();
		//alert(logovalues);
		var formData = new FormData(jQuery('#image_upload_form')[0]);
	$.ajax({
		url: 'index.php?route=customuserdetail/editaccount/updatelogo',
		type: 'post',
		data: formData,
		//dataType: 'formData,',
		success: function(data) {
		
		var json = JSON.parse(data);
        var logoss11 = $('.displaylogo').attr("src","<?php echo $base;?>image/companylogo/"+json['encryptedname']+"");
			$('.clogovl').val(json['logoname']);
		},
		contentType: false,
		processData: false
	});

    });







    $('.combanner').change( function(){
		
		//var logovalues = $(this).val();
		//alert(logovalues);
		var formData = new FormData(jQuery('#image_upload_form1')[0]);
	$.ajax({
		url: 'index.php?route=customuserdetail/editaccount/updatebanner',
		type: 'post',
		data: formData,
		//dataType: 'formData,',
		success: function(data) {
		
		var json = JSON.parse(data);
        var logoss11 = $('.displaybanner').attr("src","<?php echo $base;?>image/companybanner/"+json['encryptedbanner']+"");
		    $('.combanner').val(json['encryptedbanner']);
		},
		contentType: false,
		processData: false
	});

    });












$(".edit-phone-only").keydown(function(event) {
		// Allow only backspace and delete
		if ( event.keyCode == 46 || event.keyCode == 8 ) {
			// let it happen, don't do anything
		}
		else {
			// Ensure that it is a number and stop the keypress
			if (event.keyCode < 48 || event.keyCode > 57 ) {
				event.preventDefault();	
			}	
		}
})




$(".edit-contact-phone-only").keydown(function(event) {
		// Allow only backspace and delete
		if ( event.keyCode == 46 || event.keyCode == 8 ) {
			// let it happen, don't do anything
		}
		else {
			// Ensure that it is a number and stop the keypress
			if (event.keyCode < 48 || event.keyCode > 57 ) {
				event.preventDefault();	
			}	
		}
})





//--></script>

<script src="catalog/view/javascript/assets/js/maskinput.js" type="text/javascript"></script>
<script>
$(function($){
   $("#taxid_mask").mask("99-99999999-9",{placeholder:""});
});
</script>

<?php echo $footer; ?>