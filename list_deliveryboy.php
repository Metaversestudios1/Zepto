 <?php 
require 'include/navbar.php';
require 'include/sidebar.php';
?>
        <!-- Start main left sidebar menu -->
        

        <!-- Start app main Content -->
        <div class="main-content">
            <section class="section">
			<?php 
			if(isset($_GET['cashid']))
			{
				?>
				<div class="section-header">
				                    <h1>Manage Cash</h1>
				                </div>
				
				<div class="card">
				
				
				                                <form method="post" enctype="multipart/form-data">
                                       <div class="card-body">
									   <?php $sales  = $mysqli->query("select sum(o_total) as full_total from tbl_order where o_status='completed'  and p_method_id=2 and  rid=".$_GET['cashid']."")->fetch_assoc();
             $payout =   $mysqli->query("select sum(amt) as full_payouts from tbl_cash where rid=".$_GET['cashid']."")->fetch_assoc();
                 
				
				$pb = 0;
				 if($sales['full_total'] == ''){$pb =  '0';}else {$pb  = number_format((float)($sales['full_total']) - $payout['full_payouts'], 2, '.', ''); } ?>
				 
									   <div class="form-group">
                                            <label><span class="text-danger">*</span> Remain  Cash</label>
                                            <input type="text" class="form-control" value="<?php echo $pb;?>"  name="remain" required="" readonly>
                                        </div>
										
										 <div class="form-group">
                                            <label><span class="text-danger">*</span> Received Cash</label>
                                            <input type="text" class="form-control" placeholder="Enter Received Cash"  name="rcash" required="">
                                        </div>
										
										 <div class="form-group">
                                            <label><span class="text-danger">*</span> Message</label>
                                            <input type="text" class="form-control" placeholder="Enter Message"  name="message" required="" >
                                        </div>
										
                                     
										
										
										<div class="col-12">
                                                <button type="submit" name="add_cash" class="btn btn-primary mb-2">Add Cash Collection</button>
                                            </div>
											</div>
                                    </form>
				                            </div>
											
											<?php 
	if(isset($_POST['add_cash']))
	{
		$rcash = $_POST['rcash'];
		$message = $_POST['message'];
		$rid = $_GET['cashid'];
$timestamp = date("Y-m-d H:i:s");
	   
	   $table="tbl_cash";
  $field_values=array("rid","message","amt","pdate");
  $data_values=array("$rid","$message","$rcash","$timestamp");
   
      $h = new Common();
	  $checks = $h->Insertdata($field_values,$data_values,$table);
	  
	  if($checks == 1)
{
?>


  <script src="assets/modules/izitoast/js/iziToast.min.js"></script>
 <script src="js/cash.js"></script>
<?php 
}

		}
	?>
				<?php 
			}
			else if(isset($_GET['hid']))
			{
				?>
				  <div class="section-header">
                    <h1>Cash Collection Log</h1>
                </div>
				<div class="card">
				
                               <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped v_center" id="table-1">
                                            <thead>
                                            <tr>
                                                <th>Sr No.</th>
												<th>Partner Name</th>
                                                
												 
												 <th>Received <br>Cash</th>
												 <th>Message</th>
                                                <th>Received <br>Date</th>
                                                

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php 
											 $stmts = $mysqli->query("SELECT * FROM `rider` where id =".$_GET['hid']."")->fetch_assoc();
											 $stmt = $mysqli->query("SELECT * FROM `tbl_cash` where rid =".$_GET['hid']."");
$i = 0;
while($row = $stmt->fetch_assoc())
{
	$i = $i + 1;
											?>
                                                <tr>
                                                <td>
                                                    <?php echo $i; ?>
                                                </td>
                                                <td class="align-middle">
                                                   <?php echo $stmts['name']; ?>
                                                </td>
												
                                                <td class="align-middle">
                                                  <?php echo $row['amt'].' '.$set['currency']; ?>
                                                </td>
                                                
                                               
				 <td class="align-middle">
                                                  <?php echo $row['message']; ?>
                                                </td>
												
												 <td class="align-middle">
                                                  <?php echo date("d M Y, h:i a", strtotime($row['pdate'])); ?>
                                                </td>
												
                                                </tr>
<?php } ?> 
                                        </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
				<?php 
			}
			else 
			{
				?>
                <div class="section-header">
                    <div class="col-md-9 col-lg-9 col-xs-12">
                    <h1>Delivery Boy List</h1>
					</div>
					<div class="col-md-3 col-lg-3 col-xs-12">
					<a href="add_deliveryboy.php" class="btn btn-primary" > Add New Delivery Boy </a>
					</div>
                </div>
				<div class="card">
				
                               <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped v_center" id="table-1">
                                            <thead>
                                                <tr>
                                                <th class="text-center">
                                                    #
                                                </th>
                                                <th>Delivery Boy Name</th>
                                   <th>Delivery Boy Mobile</th>
								    <th>Delivery Boy Email</th>
									
									 <th>Delivery Boy Pincode</th>
									  <th>Delivery Boy Address</th>
									   <th>Delivery Boy Status</th>
									   <th>Delivery Boy App Status(On/Off)</th>
									    <th>Delivery Boy Total Reject</th>
										<th>Delivery Boy Total Accept</th>
										<th>Delivery Boy Total Complete</th>
                                                <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
											<?php 
											 $stmt = $mysqli->query("SELECT * FROM `rider`");
$i = 0;
while($row = $stmt->fetch_assoc())
{
	$i = $i + 1;
											?>
                                                <tr>
                                                <td>
                                                    <?php echo $i; ?>
                                                </td>
                                                <td><?php echo $row['name'];?></td>
                                   <td><?php echo $row['mobile'];?></td>
								   <td><?php echo $row['email'];?></td>

								   <td><?php $ad = $mysqli->query("select * from tbl_pincode where id=".$row['aid']."")->fetch_assoc(); echo $ad['pincode'];?></td>

 <td><?php echo $row['address'];?></td> 


 
 
								  <td><?php if($row['status'] == 1){echo 'Active';}else {echo 'Deactive';}?></td> 
								    <td><?php if($row['a_status'] == 1) {echo 'On';}else {echo 'Off';}?></td> 
								   <td><?php echo $row['reject'];?></td>
								   <td><?php echo $row['accept'];?></td>
								   <td><?php echo $row['complete'];?></td>
                                    <td class="td-width">
									<?php if($row['status'] == 0) {?>
									<a href="?status=1&rid=<?php echo $row['id'];?>"data-toggle="tooltip" data-placement="bottom" title="Make Active" class="btn btn-success shadow btn-xs sharp mr-1"><i class="fas fa-check"></i></a>
									<?php } else { ?>
								<a	href="?status=0&rid=<?php echo $row['id'];?>" class="btn btn-danger shadow btn-xs sharp mr-1" data-toggle="tooltip" data-placement="bottom" title="Make Deactive"><i class="fas fa-times"></i></a>
									<?php } ?>
									<a href="?cashid=<?php echo $row['id']; ?>" data-toggle="tooltip" data-placement="bottom" title="Manage Cash" class="btn btn-info shadow btn-xs sharp mr-1"><i class="fas fa-money-bill-alt"></i></a>
												<a href="?hid=<?php echo $row['id']; ?>" data-toggle="tooltip" data-placement="bottom" title="Cash Collection Log" class="btn btn-danger shadow btn-xs sharp mr-1"><i class="fa fa-history"></i></a>
										</td>
                                                </tr>
<?php } ?>                                           
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
							<?php } ?>
            </div>
					
                
            </section>
        </div>
        
       
    </div>
</div>

<?php 
if(isset($_GET['status']))
{
$status = $_GET['status'];
$id = $_GET['rid'];
$table="rider";
  $field = array('status'=>$status);
  $where = "where id=".$id."";
$h = new Common();
	  $check = $h->UpdateData($field,$table,$where);
	  
if($check == 1)
{
?>
<script src="assets/modules/izitoast/js/iziToast.min.js"></script>
 <script src="js/dst.js"></script>
  
<?php 
}
}
?>

<?php require 'include/footer.php';?>
</body>


</html>