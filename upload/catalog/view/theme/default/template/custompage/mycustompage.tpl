<?php 
    echo $header;
    echo $column_left;
    echo $column_right;
?>
    <div id="content">
        <?php 
           
            echo $my_custom_text;
       
        ?>
        
       Zipcode <input type="text" name="zip" id="zip" />
        city<select id="mycid">
        
        </select>
        country<input type="text" name="country" id="country" />
    </div>




<?php echo $footer; ?>
<script>

$( document ).ready(function() {
   
   $( "#zip" ).keyup(function() {


 var dInput = this.value;
    	
			var data1 = {"action": dInput};
      
		
        $.ajax({
            type: "POST",
            
            url: "index.php?route=custompage/contr/index",
            data: data1,
            success: function(data)
			{
				$('#mycid').empty();
				//console.log(data);
				parsed_data = JSON.parse(data);
				console.log(parsed_data);
				
				$('#mycid').append(parsed_data[0]);
				$('#country').val(parsed_data[1]);
				
				
				
			
				//console.log(data);
				//splitted_string = data.split("/option>");
			
			
				
            }
        });
		
        return false;






});
   
   
   
   
   
});
</script>