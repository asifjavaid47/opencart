<?php
class ControllerProductUpdateListingType extends Controller
{
	public function index()
	{
		$this->load->language('product/category');
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		
		
				// The message
$message = "Cron Job Script Ran!";

// In case any of our lines are larger than 70 characters, we should use wordwrap()
$message = wordwrap($message, 70, "\r\n");

// Send
mail('umersurkhail@gmail.com', 'My Subject', $message);
		
		
		
		$current_timestamp = time();
		$one_day_before_timestamp = time() + (3 * 24 * 60 * 60);
		
		$query = $this->db->query("UPDATE oc_product SET listing_type = 2 where listing_type = 3 AND UNIX_TIMESTAMP(date_added) < ".$one_day_before_timestamp);
	}
}