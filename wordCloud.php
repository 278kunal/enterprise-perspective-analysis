<?php 

 if(isset($_POST)) {
	 set_time_limit(1000000000);
	 $handle1 = $_POST['handle1'];
	 $handle1wcfile = "handle1wc.png";
	 $handle1freqfile = "handle1freq.png";
	 $table1 = "handle1";
	 $handle2 = $_POST['handle2'];
	 $handle2wcfile = "handle2wc.png";
	 $handle2freqfile = "handle2freq.png";
	 $table2 = "handle2";
	 $analysis = $_POST['analysis'];
	 if($analysis==2) {
		exec("Rscript .\bin\wordCloud.R $handle1 $handle1wcfile $handle1freqfile $table1");
		exec("Rscript .\bin\wordCloud.R $handle2 $handle2wcfile $handle2freqfile $table2");
	 }else{
		 echo "Try Again!";
	 }
	 
 }
 
 ?>
 <?php
	error_reporting(0);
	$db = new mysqli('127.0.0.1','root','','wordcloud');
	if($db->connect_errno) {
		die('Sorry , we are having some problems.');
	}
	
	$result1 = $db->query("SELECT * FROM handle1") or die($db->error);
	$result2 = $db->query("SELECT * FROM handle2") or die($db->error);
?>

<?php include 'includes/header.php'; ?> 
<?php $s1=1;?>
<html>
<head>
</head>
<body>

  <div id="wrapperWordCloud">

	<div id="cloud1">
	<h2 id="headingCloud1"><?php if(isset($_POST)){ echo ucfirst($_POST['handle1']);}?></h2>
	<img class="img-responsive" id="img-wc1" src="bin\<?php echo $handle1wcfile;?>" alt="wordcloud1">
	<img class="img-responsive" id="img-freq1" src="bin\<?php echo $handle1freqfile;?>" alt="freqwordcloud1">
	<h3 id="table1heading">Last few tweets of <?php echo $handle1;?></h3>
	<table class="table table-hover" id="tablecloud1">
  		<tr class="info">
  			<th>S.No</th>
  			<th>Tweets</th>
  			<th>Created</th>
  		</tr>
  		<?php if($result1) :?>
  			<?php while($row = $result1->fetch_object()):?>
  			<tr>
  			<td><?php echo $s1; $s1++;?></td>
  			<td><?php echo $row->text;?></td>
  			<td><?php echo $row->created;?></td>
  			<?php endwhile;?>
  		</tr>
  		<?php else:?>
		<p>There are no tweets yet</p>
  		<?php endif;?>

  		</table>
	</table>
	</div>
	<?php $s1=1;?>
	<div id="cloud2">
	<h2 id="headingCloud2"><?php if(isset($_POST)){ echo ucfirst($_POST['handle2']);}?></h2>
	<img class="img-responsive" id="img-wc2" src="bin\<?php echo $handle2wcfile;?>" alt="wordcloud1">
	<img class="img-responsive" id="img-freq2" src="bin\<?php echo $handle2freqfile;?>" alt="freqwordcloud2">
	<h3 id="table2heading">Last few tweets of <?php echo $handle2;?></h3>
	<table class="table table-hover" id="tablecloud2">
  		<tr class="info">
  			<th>S.No</th>
  			<th>Tweets</th>
  			<th>Created</th>
  		</tr>
  		<?php if($result2) :?>
  			<?php while($row = $result2->fetch_object()):?>
  			<tr>
  			<td><?php echo $s1; $s1++;?></td>
  			<td><?php echo $row->text;?></td>
  			<td><?php echo $row->created;?></td>
  			<?php endwhile;?>
  		</tr>
  		<?php else:?>
		<p>There are no tweets yet</p>
  		<?php endif;?>

  		</table>
	</table>
	</div>
  </div>
</body>
</html>
<?php include 'includes/footer.php'; ?>