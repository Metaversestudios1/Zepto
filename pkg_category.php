 <?php 
require 'include/navbar.php';
require 'include/sidebar.php';
?>
        <!-- Start main left sidebar menu -->
        <?php 
		if(isset($_POST['icat']))
		{
			$dname = mysqli_real_escape_string($mysqli,$_POST['cname']);
			
			$okey = $_POST['status'];
			$target_dir = "assets/category/catimg/";
			$temp = explode(".", $_FILES["cat_img"]["name"]);
$newfilename = round(microtime(true)) . '.' . end($temp);
$target_file = $target_dir . basename($newfilename);
			
			
   if(end($temp) != "jpg" && end($temp) != "png" && end($temp) != "jpeg") {
?>
<script src="assets/modules/izitoast/js/iziToast.min.js"></script>
 <script src="js/imgerror.js"></script> 
<?php 
}
else 
{
			
		move_uploaded_file($_FILES["cat_img"]["tmp_name"], $target_file);
				


  $table="pkg_category";
  $field_values=array("cat_name","cat_img","cat_status");
  $data_values=array("$dname","$target_file","$okey");
  
$h = new Common();
	  $check = $h->InsertData($field_values,$data_values,$table);
if($check == 1)
{
?>
<script src="assets/modules/izitoast/js/iziToast.min.js"></script>
 <script src="js/catin.js"></script>
  
<?php 
}

}
		}
		?>
		
		<?php 
		if(isset($_POST['ucat']))
		{
			$dname = mysqli_real_escape_string($mysqli,$_POST['cname']);
			
			$okey = $_POST['status'];
			$target_dir = "assets/category/catimg/";
			$temp = explode(".", $_FILES["cat_img"]["name"]);
$newfilename = round(microtime(true)) . '.' . end($temp);
$target_file = $target_dir . basename($newfilename);
			
	if($_FILES["cat_img"]["name"] != '')
	{		
    
		if(end($temp) != "jpg" && end($temp) != "png" && end($temp) != "jpeg") {
?>
<script src="assets/modules/izitoast/js/iziToast.min.js"></script>
 <script src="js/imgerror.js"></script> 
<?php 
}
else 
{	
		move_uploaded_file($_FILES["cat_img"]["tmp_name"], $target_file);
				 
$table="pkg_category";
  $field = array('cat_name'=>$dname,'cat_status'=>$okey,'cat_img'=>$target_file);
  $where = "where id=".$_GET['id']."";
$h = new Common();
	  $check = $h->UpdateData($field,$table,$where);
	  
if($check == 1)
{
?>
<script src="assets/modules/izitoast/js/iziToast.min.js"></script>
 <script src="js/catup.js"></script>
 <?php 
}

		
}	
	}
	else 
	{
		
		$table="pkg_category";
  $field = array('cat_name'=>$dname,'cat_status'=>$okey);
  $where = "where id=".$_GET['id']."";
$h = new Common();
	  $check = $h->UpdateData($field,$table,$where);
if($check == 1)
{
?>
<script src="assets/modules/izitoast/js/iziToast.min.js"></script>
 <script src="js/catup.js"></script>
  
<?php 
}
 
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
					<h1>Edit Package Category</h1>
					<?php 
				}
				else 
				{
				?>
                    <h1>Add Package Category</h1>
				<?php } ?>
                </div>
				
				<div class="card">
				
				
				<?php 
				if(isset($_GET['id']))
				{
					$data = $mysqli->query("select * from pkg_category where id=".$_GET['id']."")->fetch_assoc();
					?>
					<form method="post" enctype="multipart/form-data">
                                    
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label>Package Category Name</label>
                                            <input type="text" class="form-control" placeholder="Enter Category Name" value="<?php echo $data['cat_name'];?>" name="cname" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Package Category Image</label>
                                            <input type="file" class="form-control" name="cat_img">
											<img src="<?php echo $data['cat_img']?>" width="100px"/>
                                        </div>
										 <div class="form-group">
                                            <label>Package Category Status</label>
                                            <select name="status" class="form-control">
											<option value="1" <?php if($data['cat_status'] == 1){echo 'selected';}?>>Publish</option>
											<option value="0" <?php if($data['cat_status'] == 0){echo 'selected';}?> >UnPublish</option>
											</select>
                                        </div>
                                        
										
                                    </div>
                                    <div class="card-footer text-left">
                                        <button name="ucat" class="btn btn-primary">Update Package Category</button>
                                    </div>
                                </form>
					<?php 
				}
				else 
				{
					?>
                                <form method="post" enctype="multipart/form-data">
                                    
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label>Package Category Name</label>
                                            <input type="text" class="form-control" placeholder="Enter Category Name" name="cname" required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Package Category Image</label>
                                            <input type="file" class="form-control" name="cat_img"  required="">
                                        </div>
										 <div class="form-group">
                                            <label>Package Category Status</label>
                                            <select name="status" class="form-control">
											<option value="1">Publish</option>
											<option value="0">UnPublish</option>
											</select>
                                        </div>
                                        
										
                                    </div>
                                    <div class="card-footer text-left">
                                        <button name="icat" class="btn btn-primary">Add Package Category</button>
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