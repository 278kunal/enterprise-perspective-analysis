<?php include 'includes/header.php'; ?>

    <h1 id="headline">Welcome to Text Mining and Analytics Application</h1>
	
	<div id="wrapper">
	    
		<div id="mainForm">
		<h2 id="formHeading"><span class="glyphicon glyphicon-play-circle glyphshft" aria-hidden="true"></span>Run Analysis</h2>
		<form class="form-horizontal" name="mainForm" id="form" onsubmit="return onSubmitForm();" method="post">
		
			<div class="form-group">
			<label for="inputEmail3" class="col-sm-4 control-label">Enter Handle#1</label>
			<div class="col-sm-6">
			<div class="input-group">
			<div class="input-group-addon"><span class="glyphicon glyphicon-tags"></span></div>
			<input type="text" class="form-control" name="handle1" placeholder="Handle#1">
			</div>
			</div>
			</div>
			
			<div class="form-group">
			<label for="inputPassword3" class="col-sm-4 control-label">Enter Handle#2</label>
			<div class="col-sm-6">
			<div class="input-group">
			<div class="input-group-addon"><span class="glyphicon glyphicon-tags"></span></div>
			<input type="text" class="form-control" name="handle2" placeholder="Handle#2">
			</div>
			</div>
			</div>
			
			<div class="form-group">
			<label for="analysisType" class="col-sm-4 control-label">Select Analysis type :</label>
			<div class="col-sm-8">
			<div class="radio">
			<label>
			<input type="radio" name="analysis" id="optionsRadios1" value="1" checked>
			Sentimental Analysis
			</label>
			</div>
			</div>
			
			<div class="col-sm-offset-4 col-sm-8">
			<div class="radio">
			<label>
			<input type="radio" name="analysis" id="optionsRadios2" value="2">
			Word Cloud
			</label>
			</div>
			</div>
			
			<div class="col-sm-offset-4 col-sm-8">
			<div class="radio">
			<label>
			<input type="radio" name="analysis" id="optionsRadios3" value="3">
			Trending Products
			</label>
			</div>
			</div>
			
			<div class="col-sm-offset-4 col-sm-8">
			<div class="radio">
			<label>
			<input type="radio" name="analysis" id="optionsRadios3" value="4">
			Company Ranking
			</label>
			</div>
			</div>
			
			<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-primary btnshft">Analyse !</button>
			</div>
			</div>
			
			
	</form>
	</div>
	
	
	</div>
	
<?php include 'includes/footer.php'; ?>
   