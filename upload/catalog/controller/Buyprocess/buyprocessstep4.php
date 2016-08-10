<?php  
class ControllerBuyprocessbuyprocessstep4 extends Controller {
  public function index() {
    // set title of the page
    $this->document->setTitle("My Custom Page");
     
    // define template file
    if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/buyingprocess/buyprocssstep4.tpl')) {
      $this->template = $this->config->get('config_template') . '/template/buyingprocess/buyprocssstep4.tpl';
    } else {
      $this->template = 'default/template/buyingprocess/buyprocssstep4.tpl';
    }
     
$data['column_left'] = $this->load->controller('common/column_left');
$data['column_right'] = $this->load->controller('common/column_right');
$data['content_top'] = $this->load->controller('common/content_top');
$data['content_bottom'] = $this->load->controller('common/content_bottom');
$data['footer'] = $this->load->controller('common/footer');
$data['header'] = $this->load->controller('common/header');
     
    // set data to the variable
  //$this->data['my_custom_text'] = "This is my custom page.";
 
 $this->response->setOutput($this->load->view('buyingprocess/buyproecessstep4', $data));

  }
}
?>