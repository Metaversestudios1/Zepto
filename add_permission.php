<?php 
require 'include/navbar.php';
require 'include/sidebar.php';
?>
        <!-- Start main left sidebar menu -->
       
		
		<?php 
		if(isset($_POST['icat']))
		{
			
			
			$okey = $_POST['status'];
			
			
	
		
		$table="vendor";
  $field = array('s_type'=>$okey);
  $where = "where id=".$sdata['id']."";
$h = new Common();
	  $check = $h->UpdateData($field,$table,$where);
if($check == 1)
{
?>
<script src="assets/modules/izitoast/js/iziToast.min.js"></script>
 <script src="js/peup.js"></script>
  
<?php 
}	
		}
		?>
		

        <!-- Start app main Content -->
        <div class="main-content">
            <section class="section">
                <div class="section-header">
				
                    <h1>Set Permission Section</h1>
				
                </div>
				
				<div class="card">
				
				
				
                                <form method="post" enctype="multipart/form-data">
                                    
                                    <div class="card-body">
                                        <div class="form-body">
								

								

								
								
										
										
										
										<div class="form-group">
											<label for="projectinput6">Show Delivery /Pickup?</label>
											<select  name="status" class="form-control" required>
												<option value="" selected="">Select Status</option>
												<option value="1" <?php if($sdata['s_type'] == 1){echo 'selected';}?>>Yes</option>
												<option value="0" <?php if($sdata['s_type'] == 0){echo 'selected';}?>>No</option>
												
												
											</select>
										</div>
										
										

								
								
							</div>
                                        
										
                                    </div>
                                    <div class="card-footer text-left">
                                        <button name="icat" class="btn btn-primary">Set Permission</button>
                                    </div>
                                </form>
				
                            </div>
            </div>
					
                
            </section>
        </div>
        
       
    </div>
</div>

<?php require 'include/footer.php';?>
</body>


</html>