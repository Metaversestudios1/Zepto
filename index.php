<?php 
require 'include/dbconfig.php';
require 'include/Common.php';

if(isset($_SESSION['username']))
{
	?>
	<script>
	window.location.href="dashboard.php";
	</script>
	<?php 
}
else 
{
}
?>
<!DOCTYPE html>
<html lang="en">


<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
<title>Login Page - <?php echo $set['d_title'];?></title>
<link rel="shortcut icon"  href="<?php echo $set['logo'];?>">
<!-- General CSS Files -->
<link rel="stylesheet" href="assets/modules/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/modules/fontawesome/css/all.min.css">
<link rel="stylesheet" href="assets/modules/izitoast/css/iziToast.min.css">
<!-- CSS Libraries -->
<link rel="stylesheet" href="assets/modules/bootstrap-social/bootstrap-social.css">

<!-- Template CSS -->
<link rel="stylesheet" href="assets/css/style.min.css">
<link rel="stylesheet" href="assets/css/components.min.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/cust.css">
</head>

<body class="layout-4">

<div id="app">
	
<div class='login align'>
  
  <div class='login_fields'>
  	 <form method="POST" action="#">
  	 	<div class='login_title text-center'>
  	<img src="<?php echo $set['logo']; ?>"   class="img-width mb-3"><br>
    <h6>Login to your Dashboard</h6>
  </div>
    <div class='login_fields__user'>
     
      <input placeholder='Username' type='text' name="username" tabindex="1" required autofocus>
       
      </input>
    </div>
    <div class='login_fields__password'>
      
      <input placeholder='Password' type='password' name="password" tabindex="2" required>
      
    </div>
	 <div class='login_fields__password'>
	 <select name="ltype" required>
	 <option value="">Select Role</option>
	 <option value="Admin">Admin</option>
	 <option value="Vendor">Vendor(Store)</option>
	 <option value="D_boy">Delivery Manager</option>
	 </select>
	 </div>
    <div class='login_fields__submit'>
      <input type='submit' value='Log In' class="button" name="sub_login">
      
    </div>
</form>
  </div>
  
</div>

	<?php 
	if(isset($_POST['sub_login']))
	{
	    
		$username = $_POST['username'];
		$password = $_POST['password'];
	
	 $h = new Common();
	 if($_POST['ltype'] == 'Admin')
	 {
	 $count = $h->Login($username,$password,'admin');
 if($count != 0)
 {
	 $_SESSION['username'] = $username;
	 $_SESSION['ltype'] = $_POST['ltype'];
	 ?>
	  <script src="assets/modules/izitoast/js/iziToast.min.js"></script>
	 <script src="js/login.js"></script>
	 <?php 
 }
 else 
 {
	 ?>
	 <script src="assets/modules/izitoast/js/iziToast.min.js"></script>
	 <script src="js/error.js"></script>
	 <?php 
 }
	 }
	 else if($_POST['ltype'] == 'Vendor')
	 {
		$count = $h->Login($username,$password,'vendor');
 if($count != 0)
 {
	 $_SESSION['username'] = $username;
	 $_SESSION['ltype'] = $_POST['ltype'];
	 ?>
	  <script src="assets/modules/izitoast/js/iziToast.min.js"></script>
	 <script src="js/vendor.js"></script>
	 <?php 
 }
 else 
 {
	 ?>
	 <script src="assets/modules/izitoast/js/iziToast.min.js"></script>
	 <script src="js/error.js"></script>
	 <?php 
 } 
	 }
	  else if($_POST['ltype'] == 'D_boy')
	 {
		$count = $h->Login($username,$password,'rider');
 if($count != 0)
 {
	 $_SESSION['username'] = $username;
	 $_SESSION['ltype'] = $_POST['ltype'];
	 ?>
	  <script src="assets/modules/izitoast/js/iziToast.min.js"></script>
	 <script src="js/dboy.js"></script>
	 <?php 
 }
 else 
 {
	 ?>
	 <script src="assets/modules/izitoast/js/iziToast.min.js"></script>
	 <script src="js/error.js"></script>
	 <?php 
 } 
	 }
	 else 
	 {
		 
	 }
		
	}
	?>
</div>

<!-- General JS Scripts -->
<?php require 'include/footer.php';?>

<script type="text/javascript" src="js/index.js"></script>
</body>


</html>