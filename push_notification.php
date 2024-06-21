<?php 
require 'include/navbar.php';
require 'include/sidebar.php';
?>
        <!-- Start main left sidebar menu -->
        <?php 
		if(isset($_POST['icat']))
		{
			
			
			$ntitle = $_POST['ntitle'];
			$nmessage = $_POST['nmessage'];
			$nurl = $_POST['nurl'];
			$content = array(
       "en" => $nmessage
   );
$heading = array(
   "en" => $ntitle
);

if($nurl != '')
{
$fields = array(
'app_id' => $set['one_key'],
'included_segments' =>  array("Active Users"),
'contents' => $content,
'headings' => $heading,
'big_picture' => $nurl
);
$fields = json_encode($fields);
}
else {
	$fields = array(
'app_id' => $set['one_key'],
'included_segments' =>  array("Active Users"),
'contents' => $content,
'headings' => $heading
);
$fields = json_encode($fields);
}
 
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "https://onesignal.com/api/v1/notifications");
curl_setopt($ch, CURLOPT_HTTPHEADER, 
array('Content-Type: application/json; charset=utf-8',
'Authorization: Basic '.$set['one_hash']));
curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
curl_setopt($ch, CURLOPT_HEADER, FALSE);
curl_setopt($ch, CURLOPT_POST, TRUE);
curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
 
$response = curl_exec($ch);
curl_close($ch);
?>
<script src="assets/modules/izitoast/js/iziToast.min.js"></script>
 <script src="js/push.js"></script>
<?php 
		
		
		}
		?>
		
		

        <!-- Start app main Content -->
        <div class="main-content">
            <section class="section">
                <div class="section-header">
				
                    <h1>Send Notification</h1>
				
                </div>
				
				<div class="card">
				
				
				
                                <form method="post" enctype="multipart/form-data">
                                    
                                    <div class="card-body">
                                        
                                        <div class="form-group">
                                            <label>Notification Title</label>
                                            <input type="text" class="form-control" name="ntitle" placeholder="Enter Notification Title" required="">
                                        </div>
										
										<div class="form-group">
                                            <label>Notification Message</label>
                                            <input type="text" class="form-control" name="nmessage" placeholder="Enter Notification Message"  required="">
                                        </div>
										
										<div class="form-group">
                                            <label>Notification Image Url(Optional)</label>
                                            <input type="url" class="form-control" name="nurl" placeholder="Enter Notification Url">
                                        </div>
										 
                                        
										
                                    </div>
                                    <div class="card-footer text-left">
                                        <button name="icat" class="btn btn-primary">Send Notification</button>
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