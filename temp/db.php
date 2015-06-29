<?php
	error_reporting(0);
	$db = new mysqli('127.0.0.1','root','ixarstfz','wordcloud');
	if($db->connect_errno) {
		die('Sorry , we are having some problems.');
	}
	
	$result = $db->query("SELECT * FROM ms") or die($db->error);

?>
<?php if($result) :?>
	<?php while($row = $result->fetch_object()):?>
	<?php echo $row->text , ' ', $row->created,'<br>';?>
	<?php endwhile;?>

<?php else:?>
	<p>There are no tweets yet</p>

<?php endif;?>