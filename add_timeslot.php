<?php 
require 'include/navbar.php';
require 'include/sidebar.php';
?>
        <!-- Start main left sidebar menu -->
        <?php 
		if(isset($_POST['sub_time']))
		{
			
			
			$maxtime = $_POST['maxtime'];
			$mintime = $_POST['mintime'];
			
			
				


  $table="timeslot";
  $store_id = $sdata['id'];
  $field_values=array("mintime","maxtime","vid");
  $data_values=array("$mintime","$maxtime","$store_id");
  
$h = new Common();
	  $check = $h->InsertData($field_values,$data_values,$table);
if($check == 1)
{
?>
<script src="assets/modules/izitoast/js/iziToast.min.js"></script>
 <script src="js/timein.js"></script>
  
<?php 
}

		
		
		}
		?>
		
		<?php 
		if(isset($_POST['edt_time']))
		{
			
			
			$maxtime = $_POST['maxtime'];
			$mintime = $_POST['mintime'];
			
	
		
		$table="timeslot";
  $field = array('mintime'=>$mintime,'maxtime'=>$maxtime);
  $where = "where id=".$_GET['id']."";
$h = new Common();
	  $check = $h->UpdateData($field,$table,$where);
if($check == 1)
{
?>
<script src="assets/modules/izitoast/js/iziToast.min.js"></script>
 <script src="js/timeup.js"></script>
  
<?php 
}
	
		}
		?>
		

        <!-- Start app main Content -->
        <div class="main-content">
            <section class="section">
                <div class="section-header">
				<?php 
				if(isset($_GET['id']))
				{
					?>
					<h1>Edit Timeslot Section</h1>
					<?php 
				}
				else 
				{
				?>
                    <h1>Add Timeslot Section</h1>
				<?php } ?>
                </div>
				
				<div class="card">
				
				
				<?php 
				if(isset($_GET['id']))
				{
					$data = $mysqli->query("select * from timeslot where id=".$_GET['id']."")->fetch_assoc();
					?>
					<form class="form" method="post" enctype="multipart/form-data">
								<div class="card-body">
							<div class="form-body">
								

								

								<div class="form-group">
									<label for="cname">Min Time Slot</label>
									<input type="time" id="mintime" class="form-control"  value="<?php echo $data['mintime'];?>" name="mintime" required >
								</div>
								
								<div class="form-group">
									<label for="cname">Max Time Slot</label>
									<input type="time" id="maxtime" class="form-control"  value="<?php echo $data['maxtime'];?>"  name="maxtime" required >
								</div>

									


							

								
							</div>
                                        
										
                                    </div>

							<div class="card-footer text-left">
								
								<button type="submit" name="edt_time" class="btn btn-raised btn-raised btn-primary">
									<i class="fa fa-check-square-o"></i> Update Time Slot
								</button>
							</div>
							
							
						</form>
					<?php 
				}
				else 
				{
					?>
                                <form class="form" method="post" enctype="multipart/form-data">
								<div class="card-body">
							<div class="form-body">
								

								

								<div class="form-group">
									<label for="cname">Min Time Slot</label>
									<input type="time" id="mintime" class="form-control"  name="mintime" required >
								</div>
								
								<div class="form-group">
									<label for="cname">Max Time Slot</label>
									<input type="time" id="maxtime" class="form-control"  name="maxtime" required >
								</div>

									


							

								
							</div>
                                        
										
                                    </div>

							<div class="card-footer text-left">
								
								<button type="submit" name="sub_time" class="btn btn-raised btn-raised btn-primary">
									<i class="fa fa-check-square-o"></i> Save Time Slot
								</button>
							</div>
							
							
						</form>
				<?php } ?>
                            </div>
            </div>
					
                
            </section>
        </div>
        
       
    </div>
</div>

<?php require 'include/footer.php';?>
</body>


</html>