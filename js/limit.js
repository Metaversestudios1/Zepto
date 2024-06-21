var currency = "<?php echo $set['currency'];?>";
	var limit = "<?php echo $set['p_limit']; ?>";
 iziToast.error({
    title: 'Limit Cross REQUEST!!',
    message: 'Minimum '+limit+currency+' for withdraw amount.!!',
    position: 'topRight'
  });