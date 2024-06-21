<?php 
require 'include/navbar.php';
require 'include/sidebar.php';
$getkey = $mysqli->query("select * from setting")->fetch_assoc();
ini_set('display_errors', 1); ini_set('display_startup_errors', 1); error_reporting(E_ALL);
define('ONE_KEY',$getkey['one_key']);
define('ONE_HASH',$getkey['one_hash']);
define('r_key',$getkey['r_key']);
define('r_hash',$getkey['r_hash']);

function siteURL() {
  $protocol = ((!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') || 
    $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
  $domainName = $_SERVER['HTTP_HOST'];
  return $protocol.$domainName;
}

?>
        <!-- Start main left sidebar menu -->
        



		 
		
		
        <!-- Start app main Content -->
        <div class="main-content">
            <section class="section">
                <div class="section-header">
				
				
                    <h1>Store Order List</h1>
               
				</div>
				<div class="card">
				
                               <div class="card-body">
					
                                    <div class="table-responsive">
									
                                        <table class="table table-striped v_center" id="table-1">
                                            <thead>
                                                <tr>
                                               <th>#</th>
												 <th>Order Id</th>
                                                 <th>Order Date </th>
												 <th>Delivery Boy Name</th>
												 <th>Store Name</th>
                                                 <th>Current Status</th>
												 <th>Order Flow</th>
                                                 <th>Preview Data</th>
												
                                                </tr>
                                            </thead>
                                            <tbody>
											<?php 
											
											 $stmt = $mysqli->query("SELECT * FROM `tbl_order`  order by id desc");

while($row = $stmt->fetch_assoc())
{
	
											?>
                                                <tr>
												
												<?php 
												if($row['o_status'] == 'Pending')
												{
													?>
												<td class="beep">  </td>
                                                <?php } else if($row['o_status'] == 'Processing') {?>
												<td class="beeps">  </td>
                                                <?php } else {?>
												<td class="beepss">  </td>
												<?php }?>
												
												<td> <?php echo $row['id']; ?> </td>
                                                
                                                
                                               <td> <?php 
											   $date=date_create($row['odate']);
echo date_format($date,"d-m-Y");
											   ?></td>
											   <td><?php $rdata = $mysqli->query("select * from rider where id=".$row['rid']."")->fetch_assoc(); if($rdata['name'] == '') {echo '';}else {echo $rdata['name'];}?></td>
											   <td><?php $rdata = $mysqli->query("select * from vendor where id=".$row['sid']."")->fetch_assoc(); echo $rdata['name'];?></td>
											   <td> <?php echo $row['o_status']; ?></td>
											   <td><?php 
											   if($row['order_status'] == 0)
											   {
												   ?>
												   <span class="badge badge-primary">Waiting For Decision</span>
												   <?php 
											   }
											   else if($row['order_status'] == 1)
											   {
												  ?>
												   <span class="badge badge-primary">Accepted Waiting For Assign</span>
												   <?php  
											   }
											   else if($row['order_status'] == 2)
											   {
												  ?>
												   <span class="badge badge-danger">Cancelled By You</span>
												   <?php  
											   }
											   else if($row['order_status'] == 3)
											   {
												  ?>
												   <span class="badge badge-primary">Waiting For Delivery Boy Decision</span>
												   <?php  
											   }
											   else if($row['order_status'] == 4)
											   {
												  ?>
												   <span class="badge badge-primary">Delivery Boy Accepted Order</span>
												   <?php  
											   }
											   else if($row['order_status'] == 5)
											   {
												  ?>
												   <span class="badge badge-primary">Delivery Boy Reject Order</span>
												   <?php  
											   }
											   else if($row['order_status'] == 6)
											   {
												  ?>
												   <span class="badge badge-primary">Delivery Boy PickUp Order</span>
												   <?php  
											   }
											   else if($row['order_status'] == 7)
											   {
												  ?>
												   <span class="badge badge-primary">Delivery Boy Completed Order</span>
												   <?php  
											   }
											   else if($row['order_status'] == 8)
											   {
												  ?>
												   <span class="badge badge-primary">Cancelled By Customer</span>
												   <?php  
											   }
											   else if($row['order_status'] == 9)
											   {
												  ?>
												   <span class="badge badge-primary">Delivery Boy Cancelled Order</span>
												   <?php  
											   }
											   else 
											   {
											   }
											   ?></td>
												 <td> <button class="preview_d btn btn-primary" data-id="<?php echo $row['id'];?>" data-toggle="modal" data-target="#myModal">Preview</button></td>
                                               
												
                                                </tr>
<?php } ?>                                           
                                            </tbody>
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
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg ">

    
    <div class="modal-content gray_bg_popup">
      <div class="modal-header">
        <h4>Order Preivew</h4>
        <button type="button" class="close btn-close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body p_data">
      
      </div>
     
    </div>

  </div>
</div>

 <?php 
 echo $main['pendingfile'];
 ?>
 <script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
<script type="text/javascript" src="js/custom.js"></script>

</html>