<?php echo $header; ?>
<style type="text/css">
/*  .footer-main{
    position: absolute;
    bottom: 36px;
    width: 100%;
  }
  .copyright{
    position: absolute;
    bottom: 0;
    width: 100%;
  }
  */
  
  
</style>
        <div class="search-product-head-container">
           <div class="container">
               <div class="search-produ-head">
                   <div class="breadcum-block">
                        <ul>
                            <li>Home</li>
                            <li>></li>
                            <li>Login</li>
                       </ul>
                   </div>
               </div>
           </div>
       </div>


<div class="container">
 <div class="row col-sm-4 product-main-container midbox">

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
                    <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control btn-inp-rad" />
                </div>
                <div class="form-group required">
                        <!--<label for="password"><?php //echo $entry_password; ?> *</label>-->
                    <input type="password"  name="password" value="" id="input-password"  placeholder="<?php echo $entry_password; ?>" class="form-control pass btn-inp-rad" />
                </div>
                <div class="form-group">
                <button type="button" class="continu loginaccount col-sm-12 btn-reg-rad"  data-loading-text="<?php echo $text_loading; ?>"><?php echo $button_login ?></button>
                <span class="pull-left" style="color:black;"><input type="checkbox" /> Don't close session</span>
                <a href="index.php?route=account/forgotten" class="pull-right" style="color:#312783;">
                 <?php echo $forget_password; ?> ?</a>
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
            
            
            
 <script type="text/javascript"><!--


 $('#input-password').keypress(function(e) {
        if(e.which == 13) {
            //alert('You pressed enter!');
           	user_login();
        }
    });




$('#quick-login .loginaccount').click(function() {
	user_login();
 });



     function user_login(){
	
		  $.ajax({
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
						 window.location.href='<?php echo $base;?>';//"index.php?route=customuserdetail/editaccount";
					}
                                        if(json['isblock']){
                                          
                                            $('.error-login').html('<div class="col-sm-12 alert alert-danger" style="margin:5px;"><i class="fa fa-exclamation-circle"></i>YOu are blocked</div>');
                                        }
					if (json['error']) {
						$('.error-login').html('<div class="col-sm-12 alert alert-danger" style="margin:5px;"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
						$('#quick-login #input-email').parent().addClass('has-error');
						$('#quick-login #input-password').parent().addClass('has-error');
						$('#quick-login #input-email').focus();
					}
                                         
					if(json['success']){
						loacation();
						$('#modal-quicksignup').modal('hide');
					}
				}
			});
     }
	user_login_mouse_flag = 0;
	$("#quick-login").mouseenter(function(){
	 user_login_mouse_flag = 1;
	 //alert(user_detail_mouse_event_flag);
		 $(document).keypress(function(e) {
			 if(user_login_mouse_flag == 1){
				if(e.which == 13) {
					user_login();
					//alert("company");
				}
			 }
		});
	});
	$("#quick-login").mouseleave(function(){
		user_login_mouse_flag = 0;
	});

//--></script>

<script type="text/javascript"><!--
function loacation() {
	window.location.href='<?php echo $base;?>';//"index.php?route=customuserdetail/editaccount";
	//location.reload();
}
//--></script>


<?php echo $footer;?>


