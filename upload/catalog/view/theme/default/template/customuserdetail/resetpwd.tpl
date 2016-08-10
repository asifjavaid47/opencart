
<?php echo $header; ?>


<style>

    .control-label
    {
        padding:8px;
    }

    .address-2
    {
        display: block;
    }
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
            <div class="breadcum-block product-detai-bread">
                <ul>
                    <li>Home</li>
                    <li>&gt;</li>
                    <li>CHANGE PASSWORD</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-8  col-md-offset-1'; ?>
        <?php } ?>


        <div class="row">

            <!-- sidebar-->
            <!--<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                <div class="sideoptions">
                    <ul>
                        <li><a href=""><i class="fa fa-user" aria-hidden="true"></i> My account</a></li>
                        <li><a href="index.php?route=customuserdetail/editaccount"><i
                                        class="fa fa-pencil-square-o" aria-hidden="true"></i> edit account</a></li>
                        <li class="active"><a href="index.php?route=customuserdetail/resetpwd"><i class="fa fa-key" aria-hidden="true"></i> password</a></li>
                        <li>
                            <a href="index.php?route=customuserdetail/addressbook"><i class="fa fa-book" aria-hidden="true"></i> address book</a></li>
                        <!--<li><a href=""><i class="fa fa-envelope-o" aria-hidden="true"></i> my enquiry</a></li>
                        <li><a href=""><i class="fa fa-star-half-o" aria-hidden="true"></i> reward points</a></li>
                        <!--<li><a href="index.php?route=account/logout"><i class="fa fa-sign-out" aria-hidden="true"></i>logout</a></li>
                    </ul>
                </div>
            </div>
-->
            <!-- sidebar-->
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
    </div>
            <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">


                <div class="common-content edit_account row">
                    <h1 class="section-heading"><?php echo $heading_title; ?></h1>
                    <div id="content" class="<?php echo $class; ?>">

                        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data"
                              class="form-horizontal">
                            <fieldset>
                                <legend><?php echo $text_password; ?></legend>
                                <div class="form-group required">
                                    <label class="col-sm-3 control-label"
                                           for="input-password"><?php echo $old_password; ?></label>

                                    <div class="col-sm-9">
                                        <input type="password" name="old_password" value="<?php echo $password; ?>"
                                               placeholder="<?php echo $old_password; ?>" id="input-password"
                                               class="form-control"/>
                                        <?php if ($error_old_password) { ?>
                                        <div class="text-danger"><?php echo $error_old_password; ?></div>
                                        <?php } ?>
                                       
                                    </div>
                                </div>
                                <div class="form-group required">
                                    <label class="col-sm-3 control-label"
                                           for="input-password"><?php echo $entry_password; ?></label>

                                    <div class="col-sm-9">
                                        <input type="password" name="password" value="<?php echo $password; ?>"
                                               placeholder="<?php echo $entry_password; ?>" id="input-password"
                                               class="form-control"/>
                                        <?php if ($error_password) { ?>
                                        <div class="text-danger"><?php echo $error_password; ?></div>
                                        <?php } ?>
                                    </div>
                                </div>
                                <div class="form-group required">
                                    <label class="col-sm-3 control-label"
                                           for="input-confirm"><?php echo $entry_confirm; ?></label>

                                    <div class="col-sm-9">
                                        <input type="password" name="confirm" value="<?php echo $confirm; ?>"
                                               placeholder="<?php echo $entry_confirm; ?>" id="input-confirm"
                                               class="form-control"/>
                                        <?php if ($error_confirm) { ?>
                                        <div class="text-danger"><?php echo $error_confirm; ?></div>
                                        <?php } ?>
                                    </div>
                                </div>
                            </fieldset>
                            <div class="buttons clearfix">
                                <div class="pull-left"><a href="<?php echo $back; ?>"
                                                          class="address-2"><?php echo $button_back; ?></a></div>
                                <div class="pull-right">
                                    <input type="submit" value="<?php echo $button_continue; ?>"
                                           class="address-2"/>
                                </div>
                            </div>
                        </form>
                        <?php echo $content_bottom; ?></div>
                </div>
            </div>
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
    </div>
            <div class="hidden-xs hidden-sm col-md-2 col-lg-2">&nbsp;</div>
        </div>


        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>