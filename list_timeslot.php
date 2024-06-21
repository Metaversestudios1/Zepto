<?php 
require 'include/navbar.php';
require 'include/sidebar.php';
?>
        <!-- Start main left sidebar menu -->
        
<?php 
if(isset($_GET['did']))
{
	$id = $_GET['did'];

$table="timeslot";
$where = "where id=".$id." and vid=".$sdata['id']."";
$h = new Common();
	$check = $h->Deletedata($where,$table);

if($check == 1)
{
?>
<script src="assets/modules/izitoast/js/iziToast.min.js"></script>
 <script src="js/tidel.js"></script>
  
<?php 
}
}
?>
        <!-- Start app main Content -->
        <div class="main-content">
            <section class="section">
                <div class="section-header">
                    <div class="col-md-9 col-lg-9 col-xs-12">
                    <h1>Home Section List</h1>
					</div>
					<div class="col-md-3 col-lg-3 col-xs-12">
					<a href="add_home_section.php" class="btn btn-primary" > Add New Home Section </a>
					</div>
                </div>
				<div class="card">
				
                               <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped v_center" id="table-1">
                                            <thead>
                                <tr>
								 <th>Sr No.</th>
                                    <th>Timesloat Min Time</th>
                                   <th>Timesloat Max Time</th>
                                    <th>Action</th>

                                </tr>
                            </thead>
                            <tbody>
                                <?php 
                                $sel = $mysqli->query("select * from timeslot");
                                $i=0;
                                while($row = $sel->fetch_assoc())
                                {
                                    $i= $i + 1;
                                ?>
                                <tr>
                                    
                                    <td><?php echo $i; ?></td>
                                    <td><?php  echo date("g:i A", strtotime($row['mintime']));?></td>
                                   <td><?php echo date("g:i A", strtotime($row['maxtime']));?></td>
												
																								
												
                                                <td><a href="add_timeslot.php?id=<?php echo $row['id']; ?>" class="btn btn-info">Edit</a>
												<a href="?did=<?php echo $row['id']; ?>" class="btn btn-danger">Delete</a>
												</td>
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


</html>