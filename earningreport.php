<?php 
require 'include/navbar.php';
require 'include/sidebar.php';
ini_set('display_errors', 1); ini_set('display_startup_errors', 1); error_reporting(E_ALL); 
?>
        <!-- Start main left sidebar menu -->
        

        <!-- Start app main Content -->
        <div class="main-content">
            <section class="section">
                <div class="section-header">
                    <div class="col-md-9 col-lg-9 col-xs-12">
                    <h1>Earning Report</h1>
					</div>
					
                </div>
				<div class="card">
				
                               <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped v_center" id="table-1">
                                                                                   <thead>
                                            <tr>
                                                <th>Order No.</th>
												<th>Order Date</th>
                                                <th>Customer Name</th>
                                                
                                                
                                                
                                                <th>Amount</th>
												<th>Delivery Charge</th>
												
												<th>Admin Commission</th>
												<th>Your Earning</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                           <?php 
										   
										   $rid = $sdata['id'];
											 $stmt = $mysqli->query("SELECT * FROM `tbl_order` where sid=".$rid." and o_status ='Completed'");
	
	
$i = 0;
$total = 0;
while($row = $stmt->fetch_assoc())
{
	$udata = $mysqli->query("select * from tbl_user where id=".$row['uid']."")->fetch_assoc();
											?>
                                                <tr>
                                                <td>
                                                    <?php echo $row['id']; ?>
                                                </td>
                                                <td> <?php echo date("F d, h:i A", strtotime($row['odate'])); ?></td>
                                               <td> <?php echo $udata['fname'].' '.$udata['lname']; ?></td>
											   
											   <td> <?php echo $row['o_total'].' '.$set['currency']; ?></td>
											   <td> <?php echo $row['d_charge'].' '.$set['currency']; ?></td>
											   
											  <td> <?php echo number_format((float)(($row['o_total'] -($row['d_charge'])) * $row['vcommission']/100), 2, '.', '') .''.$set['currency'].'('.$row['vcommission'].'%)'; ?></td>
                                                
                                               <td> <?php 
											   $total = $total + (($row['o_total']-($row['d_charge'])) - ($row['o_total'] -($row['d_charge'])) * $row['vcommission']/100);
											   echo number_format((float)(($row['o_total'] -($row['d_charge']))- ($row['o_total'] -($row['d_charge'])) * $row['vcommission']/100), 2, '.', '') .''.$set['currency']; ?></td>
												
												
												
                                                
												
												</td>
                                                </tr>
<?php } ?>                                           
                                        </tbody>
                                        <tfoot>
										 <td colspan="2">
                                                   <h4> Total Earning: </h4>
                                                </td>
												
												 <td>
                                                   
                                                </td>
												 <td>
                                                   
                                                </td>
												 <td>
                                                    
                                                </td>
												 
												 <td>
                                                </td>
												 <td>
                                                    <?php echo  '<b>'.number_format((float)$total, 2, '.', '').''.$set['currency'].'</b>';?>
                                                </td>
										</tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
            </div>
					
                
            </section>
        </div>
        
       
    </div>
</div>
<?php require 'include/footer.php';?>
</body>


</html>