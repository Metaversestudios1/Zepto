<?php 
require 'include/navbar.php';
require 'include/sidebar.php';
?>
        <!-- Start main left sidebar menu -->
        <?php 
		if(isset($_POST['icat']))
		{
			$dname = $_POST['pincode'];
			$dcharge = $_POST['dcharge'];
			$okey = $_POST['status'];
			
		
				


  $table="tbl_pincode";
  $field_values=array("pincode","d_charge","status");
  $data_values=array("$dname","$dcharge","$okey");
  
$h = new Common();
	  $check = $h->InsertData($field_values,$data_values,$table);
if($check == 1)
{
?>
<script src="assets/modules/izitoast/js/iziToast.min.js"></script>
 <script src="js/pincode-insert.js"></script>
  
<?php 
}
		
		
		}
		?>
		
		<?php 
		if(isset($_POST['ucat']))
		{
			$dname = $_POST['pincode'];
			$dcharge = $_POST['dcharge'];
			$okey = $_POST['status'];
			
			
$table="tbl_pincode";
  $field = array('pincode'=>$dname,'status'=>$okey,'d_charge'=>$dcharge);
  $where = "where id=".$_GET['id']."";
$h = new Common();
	  $check = $h->UpdateData($field,$table,$where);
	  
if($check == 1)
{
?>
<script src="assets/modules/izitoast/js/iziToast.min.js"></script>
 <script src="js/pincode-update.js"></script>
  
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
					<h1>Edit Pincode</h1>
					<?php 
				}
				else 
				{
				?>
                    <h1>Add Pincode</h1>
				<?php } ?>
                </div>
				
				<div class="card">
				
				
				<?php 
				if(isset($_GET['id']))
				{
					$data = $mysqli->query("select * from tbl_pincode where id=".$_GET['id']."")->fetch_assoc();
					?>
					<form method="post" enctype="multipart/form-data">
                                    
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label>Pincode</label>
                                            <input type="text"  value="<?php echo $data['pincode'];?>" class="form-control" placeholder="Enter Pincode" name="pincode" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Delivery Charge</label>
                                            <input type="number" class="form-control" value="<?php echo $data['d_charge'];?>" step="any" placeholder="Enter Delivery Charge" name="dcharge" required="">
                                        </div>
										  <div class="form-group">
                                            <label>Pincode Status</label>
                                            <select name="status" class="form-control">
											<option value="1" <?php if($data['status'] == 1){echo 'selected';}?>>Publish</option>
											<option value="0" <?php if($data['status'] == 0){echo 'selected';}?> >UnPublish</option>
											</select>
                                        </div>
                                        
										
                                    </div>
                                    <div class="card-footer text-left">
                                        <button name="ucat" class="btn btn-primary">Update Pincode</button>
                                    </div>
                                </form>
					<?php 
				}
				else 
				{
					?>
                                <form method="post">
                                    
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label>Pincode</label>
                                            <input type="text"   class="form-control" placeholder="Enter Pincode" name="pincode" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Delivery Charge</label>
                                            <input type="number" class="form-control" step="any" placeholder="Enter Delivery Charge" name="dcharge" required="">
                                        </div>
										 <div class="form-group">
                                            <label>Pincode Status</label>
                                            <select name="status" class="form-control">
											<option value="1">Publish</option>
											<option value="0">UnPublish</option>
											</select>
                                        </div>
                                        
										
                                    </div>
                                    <div class="card-footer text-left">
                                        <button name="icat" class="btn btn-primary">Add Pincode</button>
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