<?php
if(isset($_POST)) {
	 set_time_limit(600);
	 $handle1 = $_POST['handle1'];
	 $handle1senfile = "plot1.png";
	 $handle1op = "output1.txt";
	 $handle2 = $_POST['handle2'];
	 $handle2senfile = "plot2.png";
	 $handle2op = "output2.txt";
	 $analysis = $_POST['analysis'];
	 if($analysis==1) {
		exec("Rscript .\bin\sentimentalAnalysis.R $handle1 $handle1senfile $handle1op");
		exec("Rscript .\bin\sentimentalAnalysis.R $handle2 $handle2senfile $handle2op");
		}else{
		 echo "Try Again!";
	 }
	 
 }
?>
<?php
 include 'includes/header.php'; ?> 
<html>
<head>
</head>
<body>

  <div id="wrapperWordCloud">
  <div id="cloud1">
	<h2 id="headingCloud1"><?php if(isset($_POST)){ echo ucfirst($_POST['handle1']);}?></h2>
	<img class="img-responsive" id="img-wc1" src="bin\<?php echo $handle1senfile;?>" alt="Sentimental Analysis">
	
	</div>

	<div id="cloud2">
	<h2 id="headingCloud2"><?php if(isset($_POST)){ echo ucfirst($_POST['handle2']);}?></h2>
	<img class="img-responsive" id="img-wc2" src="bin\<?php echo $handle2senfile;?>" alt="Sentimental Analysis">
	
	</div>

	
  </div>
</body>
</html>
<?php include 'includes/footer.php'; ?>