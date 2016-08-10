<?php

 echo $header; ?>

<style>
    .navbar-inverse {

        background-color: #312783;
        border-color: #312783;

    }
    .nav.navbar-nav.pull-right li a{
        color: #ddd;
        font-weight:bold;
    }

    .navbar-brand span{
        color:#ddd;
    }

    .mrtop32{
        margin-top: 32px;
    }

    .brdr{
        border-bottom: 2px solid;
        margin-bottom: 19px;
    }
    .textarea{
        width: 100%;
        height: 152px;
        border-color: #ddd;
        border-radius: 13px;
    }

    .midbox{
        margin: 30px auto;
        float: none;
        display: block;
    }
    .linehclass{
        line-height: 48px;
    }
    .margin_20{

        margin-top: 50px;

    }

    .answer-margin{

        margin-top:19px;
        font-weight: bold;
    }

    .ques-txt-block {
        background: #fce7c2;
        border: 1px solid #ececec;
        border-radius: 20px;
        width: 97%;
        float: left;
        padding: 20px 15px;
        margin: 15px 0;
    }

    .mar27{

        margin-top: 27px;

    }
    
    .top-brdr{
        border-top: 2px solid;
        margin-top: 30px;
        padding-top: 27px;
        border-top-color: #f9b233;
    
    }
</style>
<!-- Navigation -->
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="summary.html"><i class="glyphicon glyphicon-dashboard" style="color:white;">&nbsp</i><span>DASHBOARD</span></a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav pull-right">
                <li>
                    <a href="summary.html">Summary</a>
                </li>
                <li>
                    <a href="questions.html">Questions</a>
                </li>
                <li>
                    <a href="Purchase.html">Purchases</a>
                </li>
                <li>
                    <a href="#">My Products</a>
                </li>
                <li>
                    <a href="#">Answers</a>
                </li>
                <li>
                    <a href="#">Sales</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>

<div class="col-sm-9 midbox">

    <div class="col-sm-9 midbox">

        <div class="col-sm-12">
            <div class="col-sm-6 pull-left"><h2>Questions</h2></div>
            <div class="col-sm-6 text-right mrtop32"><span>Questions of the last 40 days</span></div>

        </div>
        <br />

        <?php
        $aa=0;
		// echo "<pre>";
     // print_r($user_pro_que_ans);
	 // exit;
        if(!empty($user_pro_que_ans)){
			$i=0;
        foreach($user_pro_que_ans as $user_product){
			
			        ?>
        <div class="col-sm-12 top-brdr">

            <div class="col-sm-4"><img src="<?php echo	$base.'/image/'.$user_product['image'];   ?>" height="50px" width="40px" />&nbsp;&nbsp;&nbsp;<?php echo $user_product['name'];  ?></div>
            <div class="col-sm-3 linehclass">$ &nbsp;<?php echo $user_product['price']; ?></div>
            <?php 
            if($user_product['product_stock']=='In Stock'){
            
            $stock="Avaiable";
            }else{
            $stock="Unavaiable";
            }
            
            ?>
            
            
            
            <div class="col-sm-2 linehclass"><?php $user_product['product_stock'];  ?> Available</div>
            <div class="col-sm-3 linehclass">Ends In 13 Days</div>	  

        </div>

        <br />
      <div class="question-block">
                    <?php
                        
                        if(isset($user_product['ans_que']))
                        {
							
                            for($i=0; $i< sizeof($user_product['ans_que']); $i++)
                            {   
                                if(isset($user_product['ans_que'][$i]['question']))
                                {
                                    ?>
                                    <div class="first-question">
                                        <div class="quew-arrow-block">
                                            <img src="<?php echo $base; ?>image/assets/images/ques-comm-arrow.png" alt="">
                                        </div>
                                        <div id="<?php echo $user_product['ans_que'][$i]['question_id']; ?>" class="get_question_id ques-txt-block">
                                            <?php
                                                echo $user_product['ans_que'][$i]['question'];
                                            ?>
                                            &nbsp;&nbsp;&nbsp;
                                            <span>
                                                <i class="fa fa-calendar"></i>
                                                <?php  
                                                
                                                
                                                $added_time = new DateTime($user_product['ans_que'][$i]['date_time']);
                                                $ptime = $added_time->getTimestamp();
                                                $date = new DateTime();
                                                $timestamp_now = $date->getTimestamp();
                                                $etime = $timestamp_now - $ptime;
                                                if($etime >= 0 and $etime <= 60)
                                                {
                                                    $message = $etime. 'seconds ago';
                                                }
                                                else if($etime > 60 and $etime <= 3600)
                                                {
                                                    $message = round(($etime/60)). 'minutes ago';
                                                }
                                                else if($etime > 3600 and $etime <= 86400)
                                                {
                                                    $message = round(($etime/3600)). 'hours ago';
                                                }
                                                else if($etime > 86400)
                                                {
                                                    $message = round(($etime/(3600*24))). 'Days ago';
                                                }
                                                
                                                  echo $message;
                                                ?>
                                                
                                            </span>
                                            <span style="float:right;">
                                                <?php echo $user_product['ans_que'][$i]['q_role'];?>
                                            </span>
                                        </div>
                                    </div>
                                    <?php
                                }
                                else if(isset($user_product['ans_que'][$i]['answer']))
                                {
                                    ?>
                                    <div class="first-question">
                                        <div class="ques-txt-block-white">
                                                <?php
                                                    echo $user_product['ans_que'][$i]['answer'];
                                                ?>
                                                &nbsp;&nbsp;&nbsp;
                                                <span>
                                                    <i class="fa fa-calendar"></i>
                                                    <?php 
                                                    
                                                    echo strtotime($user_product['ans_que'][$i]['date_time']);
                                                    exit;
                                                    
                                                    ?>
                                                    
                                                    
                                                    
                                                    
                                                    <?php echo strtotime($user_product['ans_que'][$i]['date_time']);?>
                                                </span>
                                                <span style="float:right;">
                                                    <?php echo $user_product['ans_que'][$i]['a_role'];?>
                                                </span>
                                        </div>
                                        <div class="quew-arrow-block-white">
                                            <img src="<?php echo $base; ?>image/assets/images/white-msg-block.png" alt="">
                                        </div>
                                    </div>
                                    <?php
                                }
                            }
                        }
                    ?>
                </div>
				<form action="<?php echo $addQuesAction;?>" name="" method="POST">
				<div class="col-sm-12 margin_20">
		
			<div class="col-sm-9">
				<textarea name="question"  class="ask-que-area" required placeholder="May I pay cash"></textarea>
			</div>
			<input type="hidden" name="product_id" value="<?php echo $user_product['product_id']; ?>">
            <input type="hidden" name="page_uri" value="<?php echo urlencode($_SERVER['REQUEST_URI']);?>">
			<div class="col-sm-3">		
				<button type="submit" class="btn btn-default">Ask</button>
			
			</div>
		</div>
		</form>
        <?php }
        }
        ?>
		
    </div>
    <!-- /.container -->
    <?php  echo $footer;  ?>


