<?php
class ControllerCustompagecontr extends Controller {  
    public function index() { 
       
	   $name=$_POST['action'];
	  $rs = $this->db->query("SELECT *  FROM ".DB_PREFIX."countrylc WHERE zipcode = '".$this->db->escape($name)."'");

 $rowRsl=-1;
 if(!$rs->num_rows){
	 echo "null";  
	   
 }
	else
	{
		$all_data='';
		$alldata='argentena';
		$number_of_results = sizeof($rs->rows);
		//print_r($rs->rows);
		for($i = 0 ; $i<$number_of_results ; $i++)
		{
			//print_r($rs->rows[$i]);
			$current_val = $rs->rows[$i]['city'];
			$current_data = '<option value="'.$current_val.'">'.$current_val.'</option>';
			$all_data = $all_data . $current_data;
		}
		 $all_data;
	
		 $sending_array= array();
		 $sending_array[0] = $all_data;
		 $sending_array[1] = $alldata=$rs->rows[0]['state'];
		
		echo json_encode($sending_array);
		}
		
	}   
	   
	   
	   
	   
	   
    }
}   
?>