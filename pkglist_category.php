 <?php 
require 'include/navbar.php';
require 'include/sidebar.php';
?>
        <!-- Start main left sidebar menu -->
        
<?php 
if(isset($_GET['did']))
{
	$id = $_GET['did'];

$table="pkg_category";
$where = "where id=".$id."";
$h = new Common();
	$check = $h->Deletedata($where,$table);

if($check == 1)
{
?>
<script src="assets/modules/izitoast/js/iziToast.min.js"></script>
 <script src="js/pkcdel.js"></script>
  
<?php 
} 
}
?>
        <!-- Start app main Content -->
        <div class="main-content">
            <section class="section">
                <div class="section-header">
				<div class="col-md-9 col-lg-9 col-xs-12">
                    <h1>Package Category List</h1>
					</div>
					<div class="col-md-3 col-lg-3 col-xs-12">
					<a href="pkg_category.php" class="btn btn-primary" > Add New Package Category </a>
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
                                                <th>Package Category Name</th>
                                                <th>Package Category Image</th>
                                                
                                                
                                                <th>Status</th>
                                                <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
											<?php 
											 $stmt = $mysqli->query("SELECT * FROM `pkg_category`");
$i = 0;
while($row = $stmt->fetch_assoc())
{
	$i = $i + 1;
											?>
                                                <tr>
                                                <td>
                                                    <?php echo $i; ?>
                                                </td>
                                                <td> <?php echo $row['cat_name']; ?></td>
                                                <td class="align-middle">
                                                   <img src="<?php echo $row['cat_img']; ?>" width="60" height="60"/>
                                                </td>
                                                
                                               
												<?php if($row['cat_status'] == 1) { ?>
                                                <td><div class="badge badge-success">Publish</div></td>
												<?php } else { ?>
												<td><div class="badge badge-danger">Unpublish</div></td>
												<?php } ?>
                                                <td><a href="pkg_category.php?id=<?php echo $row['id']; ?>" class="btn btn-info">Edit</a>
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