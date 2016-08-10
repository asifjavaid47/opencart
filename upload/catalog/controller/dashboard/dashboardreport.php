<?php

class ControllerDashboardDashboardreport extends Controller {

    public function index() {
        $this->load->model('dashboard/reportlist');
        $this->load->model('catalog/category');
        $this->document->setTitle("Report List");
        $data['addQuesAction'] = $this->url->link('dashboard/dashboardreport/addquestions');
        $data['addanswerAction'] = $this->url->link('dashboard/dashboardreport/addAnswer');
        $data['ask_suc'] = '';
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
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/dashboard/dashboardreport.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/dashboard/dashboardreport.tpl';
        } else {
            $this->template = 'default/template/dashboard/dashboardreport.tpl';
        }
        if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }
        if (isset($this->request->get['xds'])) {
            $product_id = $this->request->get['xds'];
        } else {
            $product_id = 0;
        }
        $custmr_id = $this->customer->isLogged();
        if ($custmr_id) {

            $data['check_vendor_id'] = $this->model_catalog_category->get_vendor_id($this->customer->isLogged());
        } else {
            $data['check_vendor_id'] = '';
        }
        $que_ans_results = $this->model_dashboard_reportlist->getQuestionAnswer($product_id);
        $data['que_ans_results'] = $que_ans_results;
        $data['reported_products'] = $this->model_dashboard_reportlist->reported_single_product($product_id);
        $data['reported_user'] = $this->model_dashboard_reportlist->get_repoter_user($data['reported_products']['reporter_id']);
        $data['reported_address'] = $this->model_dashboard_reportlist->reported_seller_address_single_user($data['reported_products']['seller_id']);
         $data['reported_user'] = $this->model_custom_reportlist->get_repoter_user($data['reported_products']['reporter_id']);
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');
        $this->response->setOutput($this->load->view('dashboard/dashboardreport', $data));
    }

    public function addQuestions() {
        $this->load->model('catalog/category');
        $data['ask_suc'] = '';
        if ($this->customer->isLogged()) {
            $cust_id = $this->customer->isLogged();
            $prod_id = $this->request->post['product_id'];
            $question = $this->request->post['commentbox'];
            $page_uri = $this->request->post['page_uri'];
            $datetime = date("Y-m-d H:i:s");
            $addData = array(
                'customer_id' => $cust_id,
                'product_id' => $prod_id,
                'question' => $question,
                'date_time' => $datetime,
                'report_id' => 1
            );

            $data['seller_id'] = $this->model_catalog_category->getsellerids($prod_id);
            $data['seller_email'] = $this->model_catalog_category->get_seller_email($data['seller_id']);
            $this->sendemail($data['seller_email'], $prod_id, $question, 'question');
            $reporter_email = $this->customer->getEmail();
            $this->sendemail($reporter_email, $prod_id, $question, 'question');
            $this->model_catalog_category->getsellerid($addData['product_id']);
            $this->model_catalog_category->addQuestion($addData);
            //$this->reported_email_to_reporter($reporter_email, $reporter_email);
            header('Location: ' . urldecode($page_uri) . '#que');
            exit();
        } else {
            $page_uri = $this->request->post['page_uri'];
            echo '<script>alert("Signin Please!")</script>';
            header('Location: ' . urldecode($page_uri) . '#que');
            exit();
        }
    }

    public function addAnswer() {
        $this->load->model('catalog/category');
        $this->load->model('dashboard/reportlist');
        $questions_ids = $this->request->post['questions_ids'];
        $answer = $this->request->post['answer'];
        $vendor_id = $this->request->post['vendor_id'];
        //$datetime = date("Y-m-d H:i:s"); 
        $addData = array(
            'question_id' => $questions_ids,
            'vendor_id' => $vendor_id,
            'answer' => $answer,
        );
        $page_uri = $this->request->post['page_uris'];
        // for email of questioner
        $question_emailer = $this->model_dashboard_reportlist->questioner_email($questions_ids);
        $this->sendemail($question_emailer, $this->request->post['products_ids'], $answer, 'answer');
        $getcustomeremail = $this->model_catalog_category->getcustomeremail($this->request->post['customers_ids']);
        // for email of Answer
        $this->sendemail($getcustomeremail->row['email'], $this->request->post['products_ids'], $answer, 'answer');
        $this->model_catalog_category->add_answer($addData);

        header('Location: ' . urldecode($page_uri) . '#que');
        exit();
    }

    public function getQuestionAnswer($product_id) {
        $all_questions = $this->db->query("select * from oc_question where product_id = $product_id AND report_id=1 ");
        $questions_answers = array();
        for ($i = 0; $i < $all_questions->num_rows; $i++) {
            $answers_data = $this->db->query("select * from oc_answer where report_id=1 AND question_id = " . $all_questions->rows[$i]['question_id']);
            $questions_answers['questions'][$i] = $all_questions->rows[$i]['question'];
            $questions_answers['q_datetime'][$i] = $all_questions->rows[$i]['date_time'];
            $questions_answers['customer_id'][$i] = $all_questions->rows[$i]['customer_id'];
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

    public function block_products() {
        $this->load->model('dashboard/reportlist');
        $product_id = $this->request->post['product_id'];
        $this->model_dashboard_reportlist->blockproducts($product_id);
    }

    public function block_user() {
        $this->load->model('dashboard/reportlist');
        $product_id = $this->request->post['product_id'];
        $seller_id = $this->model_dashboard_reportlist->getseller_id_to_block($product_id);
        $customer_id = $this->model_dashboard_reportlist->seller_id_user_block($seller_id);
        $this->model_dashboard_reportlist->user_block($customer_id);
    }

    //for qusteion answer email
    public function sendemail($emailToSeller, $prodict_id, $question_or_answer, $flag) {
        //echo $this->config->get('config_mail_protocol');
        if ($flag == 'question') {
            $message = sprintf('Ask question by customer: ' . $question_or_answer) . "\n\n";
            $message .= 'http://porcantidad.leadconcept.biz/upload/index.php?route=dashboard/dashboardreport&xds='.$prodict_id.''. "\n\n";
        } else {
            $message = sprintf('Reply From Seller: ' . $question_or_answer) . "\n\n";
            $message .= 'http://porcantidad.leadconcept.biz/upload/index.php?route=dashboard/dashboardreport&xds='.$prodict_id.''."\n\n";
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

}

?>