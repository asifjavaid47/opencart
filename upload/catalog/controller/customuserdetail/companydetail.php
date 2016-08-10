<?php  
class ControllerCustomuserdetailCompanydetail extends Controller {
	
	private $error = array();
	
  public function index() {
       // set title of the page
        $this->document->setTitle("Company Detail");
	
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');

	    $this->load->language('customuserdetail/companydetail');
	 	 	if (!$this->customer->isLogged()) {     
			   $this->response->redirect($this->url->link('account/register', '', 'SSL'));
	    }

		// define template file
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/customuserdetail/companydetail.tpl')) {
		  $this->template = $this->config->get('config_template') . '/template/customuserdetail/companydetail.tpl';
		} else {
		  $this->template = 'default/template/customuserdetail/companydetail.tpl';
		}
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
     	
		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
	 
	 
	         $data['company_logo'] ='';

		$uploads_dir = 'image/companylogo/'; 
		
		if (isset($_FILES["company_logo"] ) && is_uploaded_file($this->request->files['company_logo']['tmp_name'])) {
			$handle = fopen($this->request->files['company_logo']['tmp_name'] , "rw");
			
			  move_uploaded_file($this->request->files['company_logo']['tmp_name'],$uploads_dir.$this->request->files['company_logo']['name']);
			  $data['company_logo'] = $this->request->files['company_logo']['name'];
			
			fclose($handle);
		} else {
			$data['company_logo'] = array();
		}



		$data['company_banner'] ='';
		$uploads_dir = 'image/companybanner/'; 
		if (isset($_FILES["company_banner"] ) && is_uploaded_file($this->request->files['company_banner']['tmp_name'])) {
			$handle = fopen($this->request->files['company_banner']['tmp_name'] , "rw");
			
			  move_uploaded_file($this->request->files['company_banner']['tmp_name'],$uploads_dir.$this->request->files['company_banner']['name']);
			  $data['company_banner'] = $this->request->files['company_banner']['name'];
			
			fclose($handle);
		} else {
			$data['company_banner'] = array();
		}


	 
	 
	 
	 
	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
	         // die('okokokokokok');
			  //echo $data['company_banner'];
			 // echo $data['company_logo'];exit;
			 //echo "<pre>";print_r($this->request->post);echo "</pre>";
			 //exit;
			  		if (null !== $this->customer->isLogged()) { 
		                 $cid = $this->customer->getId();
		            }
			  
		 $this->load->model('customuserdetail/companydetail');
		$get_customer_id_sees = $this->model_customuserdetail_companydetail->add_compant_detail($cid , $this->request->post , $data['company_banner'] ,$data['company_logo'] );
		
		$this->response->redirect($this->url->link('customuserdetail/editaccount', '', 'SSL'));
	    
	}
	
    
	
	
		  $data['action'] = $this->url->link('customuserdetail/companydetail', '', true);

	
	
		
		$data['address_labl'] =  $this->language->get('address_labl');
		$data['zipcode_labl'] =  $this->language->get('zipcode_labl');
		$data['city_labl'] =  $this->language->get('city_labl');
		$data['country_labl'] =  $this->language->get('country_labl');
		$data['province_labl'] =  $this->language->get('province_labl');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_none'] = $this->language->get('text_none');

	
		$data['company_name_labl'] =  $this->language->get('company_name_labl');
		$data['company_address_labl'] =  $this->language->get('company_address_labl');
		$data['company_logo_labl'] =  $this->language->get('company_logo_labl');
		$data['company_banner_labl'] =  $this->language->get('company_banner_labl');
	
	
	
	

		if (isset($this->error['company_name'])) {
			$data['error_userdet_companyname'] = $this->error['company_name'];
		} else {
			$data['error_userdet_companyname'] = '';
		}
		
		
		if (isset($this->error['address_1'])) {
			$data['error_userdet_address_1'] = $this->error['address_1'];
		} else {
			$data['error_userdet_address_1'] = '';
		}

		if (isset($this->error['city'])) {
			$data['error_userdet_city'] = $this->error['city'];
		} else {
			$data['error_userdet_city'] = '';
		}


		if (isset($this->error['postcode'])) {
			$data['error_userdet_postcode'] = $this->error['postcode'];
		} else {
			$data['error_userdet_postcode'] = '';
		}

		if (isset($this->error['company_doornumber'])) {
			$data['error_userdet_company_doornumber'] = $this->error['company_doornumber'];
		} else {
			$data['error_userdet_company_doornumber'] = '';
		}



		if (isset($this->error['country_id'])) {
			$data['error_userdet_country'] = $this->error['country_id'];
		} else {
			$data['error_userdet_country'] = '';
		}


		if (isset($this->error['zone_id'])) {
			$data['error_userdet_zone'] = $this->error['zone_id'];
		} else {
			$data['error_userdet_zone'] = '';
		}

		


  
  		if (isset($this->request->post['company_name'])) {
			$data['company_name'] = $this->request->post['company_name'];
		} else {
			$data['company_name'] = '';
		}
		
		
		if (isset($this->request->post['company_doornumber'])) {
			$data['company_doornumber'] = $this->request->post['company_doornumber'];
		} else {
			$data['company_doornumber'] = '';
		}
		
		 
  		if (isset($this->request->post['company_floor'])) {
			$data['company_floor'] = $this->request->post['company_floor'];
		} else {
			$data['company_floor'] = '';
		}

  		if (isset($this->request->post['company_apartment'])) {
			$data['company_apartment'] = $this->request->post['company_apartment'];
		} else {
			$data['company_apartment'] = '';
		}


		if (isset($this->request->post['new_address_condition1'])) {
			$data['new_address_condition1'] = $this->request->post['new_address_condition1'];
		} else {
			$data['new_address_condition1'] = '';
		}


				
  		if (isset($this->request->post['address_1'])) {
			$data['address_1'] = $this->request->post['address_1'];
		} else {
			$data['address_1'] = '';
		}


	   
		if (isset($this->request->post['postcode'])) {
			$data['postcode'] = $this->request->post['postcode'];
		} elseif (isset($this->session->data['shipping_address']['postcode'])) {
			$data['postcode'] = $this->session->data['shipping_address']['postcode'];
		} else {
			$data['postcode'] = '';
		}

		if (isset($this->request->post['city'])) {
			$data['city'] = $this->request->post['city'];
		} else {
			$data['city'] = '';
		}

		if (isset($this->request->post['country_id'])) {
			$data['country_id'] = (int)$this->request->post['country_id'];
		} elseif (isset($this->session->data['shipping_address']['country_id'])) {
			$data['country_id'] = $this->session->data['shipping_address']['country_id'];
		} else {
			$data['country_id'] = $this->config->get('config_country_id');
		}

		if (isset($this->request->post['zone_id'])) {
			$data['zone_id'] = (int)$this->request->post['zone_id'];
		} elseif (isset($this->session->data['shipping_address']['zone_id'])) {
			$data['zone_id'] = $this->session->data['shipping_address']['zone_id'];
		} else {
			$data['zone_id'] = '';
		}

		$this->load->model('localisation/country');

		$data['countries'] = $this->model_localisation_country->getCountries();



	    $this->load->model('customuserdetail/companydetail');
		
		
		$this->load->model('customuserdetail/userdetail');
        $data['provience'] = $this->model_customuserdetail_userdetail->get_provence();

		
		if (null !==  $this->customer->isLogged()) { 
				 $cid = $this->customer->getId();
					$get_customer_id_sees = $this->model_customuserdetail_companydetail->get_address($cid);
					$get_province = $this->model_customuserdetail_companydetail->get_province($get_customer_id_sees->row['zone_id']);
					//$get_province = $this->model_customuserdetail_companydetail->get_province($get_customer_id_sees->row['zone_id']);
					$get_city = $this->model_customuserdetail_companydetail->get_citys1($get_customer_id_sees->row['city']);
					
					$get_country = $this->model_customuserdetail_companydetail->get_country($get_customer_id_sees->row['country_id']);

				
					
					$get_customer_vendor_address = $this->model_customuserdetail_companydetail->get_new_address_vendor($cid);
					//echo "<pre>";print_r($get_customer_vendor_address);echo "</pre>";
					$get_new_province = $this->model_customuserdetail_companydetail->get_new_province($get_customer_vendor_address->row['province']);
					$get_new_city = $this->model_customuserdetail_companydetail->get_new_city($get_customer_vendor_address->row['city']);
					$get_new_country = $this->model_customuserdetail_companydetail->get_new_country($get_customer_vendor_address->row['country']);
					//echo "<pre>";print_r($get_new_province);echo "</pre>";
					
					
					
					if($get_customer_vendor_address->num_rows > 0){
						$data['vendor_new_address'] = $get_customer_vendor_address;
						$data['get_new_province'] = $get_new_province;
						$data['get_new_city'] = $get_new_city;
						$data['get_new_country'] = $get_new_country;
					}
						
        //print_r($get_customer_id_sees);exit;
        $data['get_address'] = $get_customer_id_sees;
		$data['get_province'] = $get_province;
		$data['get_city'] = $get_city;
		$data['get_country'] = $get_country;
		
		
		
		$data['get_images'] = $this->model_customuserdetail_companydetail->getImages($cid);
       //print_r($data['get_images']);
	    }


    //print_r($this->request->post);

        $this->response->setOutput($this->load->view('customuserdetail/companydetail', $data));
  }
  
  		public function uploadlogo(){
			
			
			//print_r($this->request->files['file']['name']);exit;
			
			
			$data['company_logo'] ='';
	
			$uploads_dir = 'image/companylogo/'; 
			$rand = rand(5, 15);;
			
			if (isset($_FILES["file"] ) && is_uploaded_file($this->request->files['file']['tmp_name'])) {
				$handle = fopen($this->request->files['file']['tmp_name'] , "rw");
				$moveto = microtime().'_'.$rand.$this->request->files['file']['name'];
				  move_uploaded_file($this->request->files['file']['tmp_name'],$uploads_dir.$moveto);
				  $data['company_logo'] = $this->request->files['file']['name'];
				
				fclose($handle);
			} else {
				$data['company_logo'] = array();
			}
                
				$this->load->model('customuserdetail/companydetail');
				$cid = $this->customer->getId();
				$get_company_detail = $this->model_customuserdetail_companydetail->save_companylogo($moveto, $cid); 
				
				echo json_encode(array('logoname'=>$data['company_logo'],'encryptedname'=>$moveto));
			
		}

  
    		public function uploadbanner(){
			//print_r($this->request->files['file']);exit;
			
			$data['company_banner'] ='';
	
			$uploads_dir = 'image/companybanner/'; 
			$rand = rand(5,15);;
			
			if (isset($_FILES["file"] ) && is_uploaded_file($this->request->files['file']['tmp_name'])) {
				$handle = fopen($this->request->files['file']['tmp_name'] , "rw");
				$moveto = microtime().'_'.$rand.$this->request->files['file']['name'];
				  move_uploaded_file($this->request->files['file']['tmp_name'],$uploads_dir.$moveto);
				  $data['company_banner'] = $this->request->files['file']['name'];
				
				fclose($handle);
			} else {
				$data['company_banner'] = array();
			}
                
				$this->load->model('customuserdetail/companydetail');
				$cid = $this->customer->getId();
				$get_company_detail = $this->model_customuserdetail_companydetail->save_companybanner(trim($moveto), $cid); 
				
				echo json_encode(array('bannername'=>$data['company_banner'],'encryptedbanner'=>trim($moveto)));
			
		}

  

  
  
  
  	private function validate() {
	
	    if ((utf8_strlen(trim($this->request->post['company_name'])) < 3) || (utf8_strlen(trim($this->request->post['company_name'])) > 128)) {
			$this->error['company_name'] = $this->language->get('error_userdet_companyname');
		}
		
		if($this->request->post['new_address_condition1'] == 1){
			if ((utf8_strlen(trim($this->request->post['company_doornumber'])) < 1 || utf8_strlen(trim($this->request->post['company_doornumber'])) > 10)) {
				$this->error['company_doornumber'] = $this->language->get('error_userdet_company_doornumber');
			}
		}

       return !$this->error;

	}
  

  
  
}
?>