<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
  <meta charset="UTF-8" />
  <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>xcantidad.com - conviene mas</title>
  <!-- <title><?php echo $title; ?></title> -->
  <base href="<?php echo $base; ?>" />
  <?php if ($description) { ?>
  <meta name="description" content="<?php echo $description; ?>" />
  <?php } ?>
  <?php if ($keywords) { ?>
  <meta name="keywords" content= "<?php echo $keywords; ?>" />
  <?php } ?>
  <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
	<!-- <script src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>-->
	<script src='http://code.jquery.com/ui/1.11.4/jquery-ui.js'></script>
  <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
  <script src="catalog/view/javascript/numbler.js" type="text/javascript"></script>
  <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
  <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
  <link href="catalog/view/javascript/assets/number.css" rel="stylesheet" type="text/css" />
<!--<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">-->
<script src="../upload/catalog/view/javascript/assets/js/easyResponsiveTabs.js" ></script>
<script src="../upload/catalog/view/javascript/assets/js/jquery.hoverIntent.js" ></script>
<link href="catalog/view/javascript/assets/easy-responsive-tabs.css" rel="stylesheet" media="screen" />
<!--<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">-->
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<!--<script src="catalog/view/javascript/common.js" type="text/javascript"></script>-->
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
<link href="catalog/view/javascript/assets/porcantidad.css" rel="stylesheet" type="text/css" />       
<link href="catalog/view/javascript/assets/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!--silder css & js start here-->
<link href="catalog/view/javascript/assets/style.css" rel="stylesheet" type="text/css" />
<!--silder css & js end here-->
<!-- <script src="catalog/view/javascript/assets/js/jquery.min.js" type="text/javascript"></script>-->
<script> 
  $(document).ready(function(){
    $("#flip").click(function(){
      $("#panel").slideToggle("slow");
    });

  });
</script>
<style>
  .tool_tip
  {
    position: relative;
  }
  .tool_tip>.tool_span
  {
    position: absolute;
    top: 70px;
    background: rgba(0,0,0,0.5);
    color: #fff;
    padding: 6px 11px;
    font-size: 12px;
    max-width: 137px;
    border-radius: 3px;
    z-index: 100;
    display: none;
    left: 50%;
    transform: translateX(-50%);
    transition:all 0.25s ease-in-out;
  }
  .tool_tip>.tool_span:after
  {
    content: "";
    border: 8px solid transparent;
    position: absolute;
    top: -16px;
    border-bottom-color: rgba(0,0,0,0.5);
    left: 0;
    right: 0;
    width: 10px;
    margin: 0 auto;
  }
  .tool_tip:hover>.tool_span
  {
    display: block;
    top: 50px;
  }
</style>
</head>
<body style="background-color:#f5f5f5;">
  <!--top bar head start LC-->
  <div class="header-main-block">
   <div class="container">
     <!--   <?php// echo $language; ?> -->
     <div class="row">
       <div class="col-sm-1 col-md-2 col-lg-2">
        <div class="logo-container">
         <a href="<?php echo $base; //echo $home; ?>"><img src="<?php echo $base;?>image/assets/images/logo.png" alt="" /></a>
         <!--<a href="#"><img src="images/logo-2.png" alt="" class="hidden-sm hidden-md hidden-lg" /></a>-->
       </div>
     </div>
     <div class="col-sm-11 col-md-10 col-lg-10">
       <div class="top-icons-container hidden-xs ">
         
          <?php if($search_hide == 0){?>
         
         <ul>
           <?php if ($logged) { ?>
           <li class="pro_drop"><a href="#"><img src="<?php echo $base;?>image/assets/images/user-img.png"></a>
           <div class="drop_opt">
           <i class="fa fa-caret-up" aria-hidden="true"></i>
             <a href="<?php echo $base;?>index.php?route=customuserdetail/editaccount">My Account</a>
             <a href="<?php echo $base;?>index.php?route=customuserdetail/editaccount">My profile</a>
             <a href="<?php echo $base;?>index.php?route=customuserdetail/addressbook">My Adresses</a>
             <a href="<?php echo $base;?>index.php?route=customuserdetail/resetpwd">Change Password</a>
             <a href="<?php echo $base;?>index.php?route=account/logout">Logout</a>
           </div>
           </li>
           <!-- <li class="line-divi"><img alt="" src="<?php echo $base;?>image/assets/images/icon-divi.png"> </li>
           <li><a href="#"  class="tool_tip" data-title="Description"><img  src="<?php echo $base;?>image/assets/images/message0icon-img.png"> <span class="badge">03</span></a></li>
           <li class="line-divi"><img alt="" src="<?php echo $base;?>image/assets/images/icon-divi.png"></li>
           <li><a href="#"  class="tool_tip"  data-title="Description"><img src="<?php echo $base;?>image/assets/images/alarm-icon-img.png"> <span class="badge">10</span></a></li>
           <li class="line-divi"><img alt="" src="<?php echo $base;?>image/assets/images/icon-divi.png"></li>
           <li><a href="#"  class="tool_tip" data-title="Description"><img  src="<?php echo $base;?>image/assets/images/refresh-icon-img.png"></li></a>
           <li class="line-divi"><img alt="" src="<?php echo $base;?>image/assets/images/icon-divi.png"></li>
           <li><a href="#"  class="tool_tip" data-title="Description"><img  src="<?php echo $base;?>image/assets/images/heart-icon-img.png"></a></li> -->
                        <!--<li class="line-divi" ><img alt="" src="<?php echo $base;?>image/assets/images/icon-divi.png"></li>
                        <li><a href="#"><img alt="" src="<?php echo $base;?>image/assets/images/wi-fi-icon-img.png"> <span class="badge">01</span></a></li>-->
                        <li class="line-divi" ><img  src="<?php echo $base;?>image/assets/images/icon-divi.png"></li>
                        <li><a href="<?php echo $base; ?>index.php?route=createlisting/category"  >Sell</a></li>
                        <!-- <li class="line-divi"><img alt="" src="<?php //echo $base;?>image/assets/images/icon-divi.png"></li> -->
                        <!-- <li><a href="#"  class="tool_tip" data-title="Description"><img  src="<?php echo $base;?>image/assets/images/ques-icon-img.png"></a></li> -->
                        <?php } else{ ?>
                        <!-- <li><a href="#"><img alt="" src="<?php echo $base;?>image/assets/images/user-img.png"></a></li> -->
						<!-- <li class="line-divi"><img alt="" src="<?php echo $base;?>image/assets/images/icon-divi.png"></li> -->
						<li><a href="<?php echo $base; ?>index.php?route=account/register/login">Login</a></li>
						<li class="line-divi"><img alt="" src="<?php echo $base;?>image/assets/images/icon-divi.png"></li>
                        <li><a href="<?php echo $base; ?>index.php?route=account/register">Register</a></li>
						<li class="line-divi"><img alt="" src="<?php echo $base;?>image/assets/images/icon-divi.png"></li>
						<li><a href="<?php echo $base; ?>index.php?route=createlisting/category"  >Sell</a></li>
                        <!-- <li class="line-divi"><img alt="" src="<?php // echo $base;?>image/assets/images/icon-divi.png"></li> -->
                        <!-- <li><a href="#" class=""><img alt="Description" src="<?php echo $base;?>image/assets/images/ques-icon-img.png"></a></li> -->
                        <?php } ?>
                        <??>
                      </ul>
                      
                      
                      <?php } ?>
                      
                      <div class="clearfix"></div>
                    </div>
                    <div class="res-menu hidden-lg hidden-md">
                     <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false">
                       <span class="icon-bar"></span>
                       <span class="icon-bar"></span>
                       <span class="icon-bar"></span>
                     </button>
                     <div id="navbar" class="collapse navbar-collapse res-menu1 ">
                      <ul class="nav navbar-nav ">
                       <li> <a href="#"> User</a></li>
                       <!-- <li class="line-divi"><img src="images/icon-divi.png" alt="" /> </li>-->
                       <li> <a href="#"> Messages <span class="badge">03</span></a></li>
                       <!-- <li class="line-divi"><img src="images/icon-divi.png" alt="" /></li>-->
                       <li><a href="#"> Notification <span class="badge">10</span></a></li>
                       <!-- <li class="line-divi"><img src="images/icon-divi.png" alt="" /></li>-->
                       <li><a href="#"> History </a></li>
                       <!--<li class="line-divi"><img src="images/icon-divi.png" alt="" /></li>-->
                       <li><a href="#"> Favorite</a></li>
                       <!-- <li class="line-divi"><img src="images/icon-divi.png" alt="" /></li>-->
                       <li><a href="#"> Sender Notification <span class="badge">01</span></a></li>
                       <!--<li class="line-divi"><img src="images/icon-divi.png" alt="" /></li>-->
                       <li><a href="#"> Vender </a></li>
                       <!-- <li class="line-divi"><img src="images/icon-divi.png" alt="" /></li>-->
                       <li class="last-br"><a href="#" > Help </a></li>
                     </ul>
                   </div>
                 </div>
                 <div class="search-bxx">
                   <div id="flip" class="seacrh-icon"><i class="fa fa-search"></i> </div>
                 </div>
                 <?php if($search_hide == 0){?>
                 
                 <div class="search-bar-container hidden-xs hidden-sm">
                   <div class="search-input-block">
                    <div class="search-txtfild">
                      <?php 
                   
                      if(isset($_GET['search'])){
                      $value_search=$_GET['search'];
                    }else{
                    $value_search="";
                  }
                  
                   if(isset($_GET['quantity'])){
                      $value_quantity=$_GET['quantity'];
                    }else{
                    $value_quantity=1;
                  }
                  
                  
                  ?>
		
                  <input type="text" name="search" value="<?php echo $value_search; ?>" placeholder="Find what you want !" id="input-search" class=" search-enter" />
                </div>
                      <div class="solo-en-block">
                          
                          <?php 
                         if(isset($_GET['category_id'])){
                         global $loader, $registry;
                        $loader->model('catalog/category');
                        $modelCat = $registry->get('model_catalog_category');
                         $category=$_GET['category_id'];
                        if($category>0){
                        $allcategories = $modelCat->getCategory_custom($category);
                        if(!empty($allcategories)){
                         echo "<input type='checkbox' class='check' name='vehicle' value='".$allcategories['category_id']."' />".' '.$allcategories['name']." ";
                        }
                        }
 }?>
                      </div>
                         <div class="clearfix"></div>
                       </div>
                       <!--asif changes -->
                       <div class="search-table-product">
                         <div class="minus-btn-qty">
                           <button id='s_minus_products'><i class="fa fa-caret-down" aria-hidden="true"></i></button>
                         </div>
                         <div class="textbox-qty">
                           <input id='quantity_products_header' type="text" name="quantity" onkeypress=" return isNumber(event);" class="search-enter" placeholder="100" value="<?php echo $value_quantity; ?>" >
                         </div>
                         <div class="minus-btn-qty">
                           <button id='s_add_products'><i class="fa fa-caret-up" aria-hidden="true"></i></button>
                         </div>
                         <div class="search-btn">
                           <button id="btn-search"><i class="fa fa-search"></i></button>
                         </div>
                         <div class="clearfix"></div>
                         <!--asif changes end -->
                         <div class="clearfix"></div>
                       </div>
                     </div>
                     
                     
                     <?php } ?>
                     
                     
                     
                   </div>
                 </div>
               </div>
               <div class="clearfix"></div>
             </div>
             <div class="clr"></div>
             <!--top bar head end LC-->
             <!--top border start-->
<!--
<nav id="top">
  <div class="container">
    <?php echo $currency; ?>
    <?php echo $language; ?>
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
        <li><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span></li>
        <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> <span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-menu-right">
            <?php if ($logged) { ?>
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
            <?php } ?>
          </ul>
        </li>
        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a></li>
        <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a></li>
        <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>
      </ul>
    </div>
  </div>
</nav>-->
<!--top border end-->
<!--<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-4">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-sm-5"><?php echo $search; ?>
      </div>
      <div class="col-sm-3"><?php echo $cart; ?></div>
    </div>
  </div>
</header>-->
<!--<?php if ($categories) { ?>
<div class="container">
  <nav id="menu" class="navbar">
    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav">
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="list-unstyled">
                <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </div>
            <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
      </ul>
    </div>
  </nav>
</div>
<?php } ?>-->
<script type="text/javascript">
$('#btn-search').bind('click', function () {
url = 'index.php?route=product/search';

var search = $('input[name=\'search\']').prop('value');
var quantity = $('input[name=\'quantity\']').prop('value');
var min_price=$('input[name=\'min_price\']').prop('value');
var max_price=$('input[name=\'max_price\']').prop('value');
if (quantity) {
	url += '&quantity=' + encodeURIComponent(quantity);
}
if (search) {
	url += '&search=' + encodeURIComponent(search);
}
if(min_price && max_price ){
url += '&price=' +min_price + '-' + max_price;
}
var category_id = $('select[name=\'category_id\']').prop('value');
if (category_id > 0) {
	url += '&category_id=' + encodeURIComponent(category_id);
}

check_box_available = $('.solo-en-block').children(0);
if (check_box_available.length > 0)
{
	var checked_checkbox = $('input:checkbox[name=vehicle]:checked');
	if (checked_checkbox.length > 0)
	{
		var as = $('input[name=\'vehicle\']').prop('value');
		current_location = window.location.href;
		if (current_location.indexOf("category_id") > 0)
		{
			splitted_location = current_location.split("&category_id=");
			location = splitted_location[0] + '&category_id=' + as;
		}
	}
	else if (checked_checkbox.length == 0)
	{
		var as = $('input[name=\'vehicle\']').prop('value');
		current_location = window.location.href;
		var search = $('input[name=\'search\']').prop('value');
		var a = current_location.replace('&category_id=' + as, '');
		current_url = a;
		splitted_location = current_url.split('search=');
		new_location = splitted_location[0]+"search="+search;
		url = new_location;

	}
}
var sub_category = $('input[name=\'sub_category\']:checked').prop('value');
if (sub_category) {
	url += '&sub_category=true';
}

var filter_description = $('input[name=\'description\']:checked').prop('value');
if (filter_description) {
	url += '&description=true';
}
location = url;
});
$('.search-enter').bind('keydown', function (e) {
if (e.keyCode == 13) {
	$('#btn-search').trigger('click');
}
});
$('select[name=\'category_id\']').on('change', function () {
if (this.value == '0') {
	$('input[name=\'sub_category\']').prop('disabled', true);
} else {
	$('input[name=\'sub_category\']').prop('disabled', false);
}
});
$('select[name=\'category_id\']').trigger('change');
</script>

<script type="text/javascript">
 function isNumber(evt)
 {
   var iKeyCode = (evt.which) ? evt.which : evt.keyCode
   if (iKeyCode != 46 && iKeyCode > 31 && (iKeyCode < 48 || iKeyCode > 57))
   {
    return false;
  }
  return true;
}
</script>
<script type="text/javascript">
  $('#s_minus_products').click(function()
  {
    quantity_products_header_val = $('#quantity_products_header').val();
    if(quantity_products_header_val > 0)
    {
     quantity_products_header_val--;
     $('#quantity_products_header').val(quantity_products_header_val);
   }
 });
  $('#s_add_products').click(function(){
    quantity_products_header_val = $('#quantity_products_header').val();
    quantity_products_header_val++;
    $('#quantity_products_header').val(quantity_products_header_val);
  });
</script>
<!-- hadi code -->
<script type="text/javascript">
  $('body').on('click','.dropdown-toggle' ,function(){
 ///alert("ok");

    if($('.btn-group').hasClass('open')){
      $('.btn-group').removeClass('open');
    }else{
      $(".btn-group").addClass("open");
      $('.dropdown-toggle').attr("aria-expanded","true");
    }        
  });    
  $('.language-select').click(function(){
    var long_code = "";
    long_code = $(this).attr("name");
    $("#lang_code").val(long_code);
    $("#form-language").submit();
  });
</script>
<!-- hadi code end -->
<script src="catalog/view/javascript/jquery.flexisel.js" type="text/javascript"></script>