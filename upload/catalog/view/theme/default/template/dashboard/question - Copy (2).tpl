<?php echo $header; ?>

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
      
        if(!empty($user_prodcuts)){
        foreach($user_prodcuts as $user_product){

        ?>
        <div class="col-sm-12 top-brdr">

            <div class="col-sm-4"><img src="" height="50px" width="50px" />&nbsp;<?php echo $user_product['name'];  ?></div>
            <div class="col-sm-3 linehclass">$ &nbsp;<?php echo $user_product['price']; ?></div>
            <div class="col-sm-2 linehclass"><?php $user_product['price'];  ?> Available</div>
            <div class="col-sm-3 linehclass">Ends In 13 Days</div>	  

        </div>

        <br />
     <div class="question-block">
                            <?php
                           // echo "<pre>";
                           // print_r($que_ans_results);
                           
                           // for($i=0; $i< sizeof($que_ans_results['question']); $i++)
                            // {
                                // echo '<br>product id: '.$que_ans_results['other_data'][$i]['id'];
                                // echo '<br>product product_id: '.$que_ans_results['other_data'][$i]['product_id'];
                                // echo '<br>product price: '.$que_ans_results['other_data'][$i]['price'];
                                // echo '<br>product name: '.$que_ans_results['other_data'][$i]['name'];
                                // echo '<br>product product_stock: '.$que_ans_results['other_data'][$i]['product_stock'];
                                // if(!empty($que_ans_results['question'][$i]['questions']))
								// {
									// for($j=0; $j < sizeof($que_ans_results['question'][$i]['questions']); $j++)
									// {
										// echo '<br>question: '.$que_ans_results['question'][$i]['questions'][$j];
										// echo ' time: '.$que_ans_results['question'][$i]['q_datetime'][$j];
										// if(!empty($que_ans_results['question'][$i]['answers']))
										// {
											// for($k=0; $k < sizeof($que_ans_results['question'][$i]['answers']); $k++)
											// {
												// echo '<br>answer: '.$que_ans_results['question'][$i]['answers'][$k][0];
												// echo ' time: '.$que_ans_results['question'][$i]['a_datetime'][$k][0];
											// }
										// }
										
									// }
								// }	
                                
                            // }
                                // exit;
                            if(isset($que_ans_results['question'])){
                                for($i=0; $i< sizeof($que_ans_results['question']); $i++)
                                {
									// echo "<pre>";
                                // print_r($que_ans_results['question']['questions']);
                                
                                 //echo $que_ans_results['customer_id'][$i];
                                 
								 
								  if(!empty($que_ans_results['question'][$i]['questions']))
								 {
									 for($j=0; $j < sizeof($que_ans_results['question'][$i]['questions']); $j++){
										 
									
									 
								 ?>
                                   <div class="first-question">
								  <!-- for message div
                                       <div class="quew-arrow-block">
                                           <img src="<?php echo $base; ?>image/assets/images/ques-comm-arrow.png" alt="">
                                       </div>
									   -->
                                       <div class="ques-txt-block">
                                           <?php echo $que_ans_results['question'][$i]['questions'][$j];?> &nbsp;&nbsp;&nbsp;<span><i class="fa fa-calendar"></i> <?php echo $que_ans_results['question'][$i]['q_datetime'][$j];?>
                                           <!--<a href="javascript:void(0);" style="color:#000;" class="pull-right reply-link" id="<?php echo $i;?>">-->
                                              <i class="fa fa-reply" aria-hidden="true"></i> Reply
										   </a></span> 
                                       </div>
                                      <div id="reply_<?php echo $i;?>" class="reply_form" style="display:none;">
                                       
                                        <form name="reply_answer_form" method="post" id="" action="<?php echo $addanswerAction;?>">
                                        <div class="textarea-que-block">
                                        <textarea rows="" cols="" name="answer" placeholder="Reply to customer" class="ask-que-area" required></textarea>
                                        </div>
                                        <div class="donot-txt">
                                        Do not enter contact details, do not use vulgar language etc.
                                        </div>
                                        <input type="hidden" name="products_ids" value="<?php if(isset($_GET['pxs'])) echo $_GET['pxs'];?>" />
                                        <input type="hidden" name="questions_ids" value="<?php echo $que_ans_results['question_id'][$i];?>" />
                                        <input type="hidden" name="customers_ids" value="<?php echo $que_ans_results['customer_id'][$i];?>" />
                                        <input type="hidden" name="vendor_id" value="<?php echo $check_vendor_id->row['id'];?>" />
                                        <input type="hidden" name="page_uris" value="<?php echo urlencode($_SERVER['REQUEST_URI']);?>" />
                                        <div class="ask-btn">
                                        <button type="submit" name="reply_answer_btn">Reply</button>
                                        </div>
                                        <div><?php echo $ask_suc;?></div>
                                        </form>
                                     </div><!--reply end -->
                                 </div>
									 <?php }
									 }?>
                                <?php
                               if(!empty($que_ans_results['answers'][$i]))
                               {
								   for($k=0; $k < sizeof($que_ans_results['question'][$i]['answers']); $k++)
                                  
                                   {
                                       if(!empty($que_ans_results['question']['answers'][$i][$k]))
                                       { ?>   
                                           <div class="first-question">                                   
                                               <div class="ques-txt-block-white">
                                                   <?php echo $que_ans_results['question'][$i]['answers'][$k][0]; ?> &nbsp;&nbsp;&nbsp;<span><i class="fa fa-calendar"></i> <?php echo $que_ans_results['question'][$i]['a_datetime'][$k][0];?></span>
                                               </div>
											   <!--for message div -->
                                              <!-- <div class="quew-arrow-block-white">
                                                   <img src="<?php //echo $base; ?>image/assets/images/white-msg-block.png" alt="">
                                               </div> -->
                                           </div>
                                        <?php 
                                        }
                                    }
                                }
                                else{
                                    echo '<span style="margin-left:3%;">! Not answered yet.</span>';
                                }
                                ?>                            
                                   <!--<div class="see-more-questions">
                                       <a href="#">See more questions</a>
                                   </div>-->
                                <?php 
                                }
                            }
                            ?>      
                           </div>
        <?php }
        }
        ?>
    </div>
    <!-- /.container -->
    <?php  echo $footer;  ?>


