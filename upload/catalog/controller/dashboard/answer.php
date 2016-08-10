<?php

class ControllerDashboardAnswer extends Controller {

    public function index() {
        $this->load->model('dashboard/answer');
        $this->load->model('catalog/category');
        $this->document->setTitle("Answers");

        $data['addQuesAction'] = $this->url->link('dashboard/question/addQuestion');
        $data['ask_suc'] = '';
        $data['addanswerAction'] = $this->url->link('dashboard/answer/add_answer');
        if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }
        $data['base'] = $server;
        if (!$this->customer->isLogged()) {
            $this->response->redirect($this->url->link('account/register/login', '', 'SSL'));
        }
        // define template file
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/dashboard/answer.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/dashboard/answer.tpl';
        } else {
            $this->template = 'default/template/dashboard/answer.tpl';
        }

        $cid = $this->customer->getId();
        $res = $this->model_dashboard_answer->userproducts($cid);
        //$que =  $this->model_dashboard_question->get_ans_question();
        for ($i = 0; $i < sizeof($res); $i++) {
            $que = $this->model_dashboard_answer->get_ans_question($res[$i]['product_id']);
            if (!empty($que)) {
                $res[$i]['ans_que'] = $que;
            }
        }
        $data['user_pro_que_ans'] = $res;
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');
        $this->response->setOutput($this->load->view('dashboard/answer', $data));
    }

    public function getQuestionAnswer($product_id) {
        $all_questions = $this->db->query("select * from oc_question where product_id = $product_id AND report_id=0 ");
        $questions_answers = array();
        for ($i = 0; $i < $all_questions->num_rows; $i++) {
            $answers_data = $this->db->query("select * from oc_answer where report_id=0 AND question_id = " . $all_questions->rows[$i]['question_id']);
            $questions_answers['questions'][$i] = $all_questions->rows[$i]['question'];
            $questions_answers['q_datetime'][$i] = $all_questions->rows[$i]['date_time'];
            $questions_answ1ers['customer_id'][$i] = $all_questions->rows[$i]['customer_id'];
            $questions_answers['question_id'][$i] = $all_questions->rows[$i]['question_id'];
            if (!empty($answers_data)) {
                for ($k = 0; $k < $answers_data->num_rows; $k++) {
                    $questions_answers['answers'][$i][$k] = $answers_data->rows[$k]['answer'];
                    $questions_answers['a_datetime'][$i][$k] = $answers_data->rows[$k]['date_time'];                                   //$questions_answers['customer_id'][$i][$k] = $answers_data->rows[$k]['customer_id'];
                }
            }
        }
        return $questions_answers;
    }

    //for qusteion answer email
    public function sendemail($emailToSeller, $prodict_id, $question_or_answer, $flag) {
        //echo $this->config->get('config_mail_protocol');
        if ($flag == 'question') {
            $message = sprintf('Ask question by customer: ' . $question_or_answer) . "\n\n";
            $message .= 'http://localhost/xcantidad/upload/?route=dashboard/question \n\n';
        } else {
            $message = sprintf('Reply From Seller: ' . $question_or_answer) . "\n\n";
            $message .= 'http://localhost/xcantidad/upload/?route=dashboard/question \n\n';
        }
        //$email_to = $emailToSeller; //"bilalahmadue@gmail.com";//
        $email_to = $emailToSeller; //"bilalahmadue@gmail.com";//
        $mail = new Mail();
        $mail->protocol = $this->config->get('config_mail_protocol');
        $mail->parameter = $this->config->get('config_mail_parameter');
        $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
        $mail->smtp_username = $this->config->get('config_mail_smtp_username');
        $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
        $mail->smtp_port = $this->config->get('config_mail_smtp_port');
        $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
        $mail->setTo($email_to);
        $mail->setFrom($this->config->get('config_name'));
        $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
        if ($flag == 'question') {
            $mail->setSubject("Customer QUestion");
        } else {
            $mail->setSubject("Seller Answer");
        }
        $mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
        $mail->send();
    }

    public function addQuestion() {
        $this->load->model('catalog/category');
        $data['ask_suc'] = '';
        if ($this->customer->isLogged()) {
            $cust_id = $this->customer->isLogged();
            $prod_id = $this->request->post['product_id'];

            $question = $this->request->post['question'];
            $page_uri = $this->request->post['page_uri'];
            $datetime = date("Y-m-d H:i:s");
            $addData = array(
                'customer_id' => $cust_id,
                'product_id' => $prod_id,
                'question' => $question,
                'date_time' => $datetime,
            );
            //echo "<pre>";print_r($addData); echo "</pre>";
            $vendorid = $this->model_catalog_category->getsellerid($addData['product_id']);
            $getselleremail = $this->model_catalog_category->getselleremail($vendorid->row['seller_id']);
            $SendEmailToSeller = $this->sendemail($getselleremail->row['v_email'], $addData['product_id'], $addData['question'], 'question');
            //echo "<pre>";print_r($getselleremail->row['v_email']); echo "</pre>";
            //exit;
            $addQuestion = $this->model_catalog_category->addQuestion($addData);

            header('Location: ' . urldecode($page_uri) . '#que');
            exit();
        } else {
            $page_uri = $this->request->post['page_uri'];
            echo '<script>alert("Signin Please!")</script>';
            header('Location: ' . urldecode($page_uri) . '#que');
            exit();
        }
    }

    public function delete_question() {
        
        $question_id = $this->request->post['del_question_id'];
       $this->load->model('dashboard/answer');
        $this->model_dashboard_answer->question_delete($question_id);
        echo 'sussess';
    }
     public function add_answer(){
        $this->load->model('dashboard/answer');
          if ($this->customer->isLogged()) {
            $cust_id = $this->customer->isLogged();
            $prod_id = $this->request->post['product_id'];
            $question_id = $this->request->post['question_id'];
            $answer = $this->request->post['question'];
            $page_uri = $this->request->post['page_uri'];
            $datetime = date("Y-m-d H:i:s");
                $addData = array(
                'question_id' => $question_id,
                 'answer' => $answer,
                'date_time' => $datetime,
                 );
            $vendeor_id=$this->model_dashboard_answer->get_seller_id($cust_id);
            print_r($vendeor_id);
            exit;
           //$this->sendemail($getselleremail->row['v_email'], $addData['product_id'], $addData['question'], 'question');
            //echo"<pre>";print_r($getselleremail->row['v_email']); echo "</pre>";
            //exit;
           $this->model_catalog_category->add_answer($addData);

            header('Location: ' . urldecode($page_uri) . '#que');
            exit();
        } else {
            $page_uri = $this->request->post['page_uri'];
            echo '<script>alert("Signin Please!")</script>';
            header('Location: ' . urldecode($page_uri) . '#que');
            exit();
        }
        
        
    }
   

}

?>