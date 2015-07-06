<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Enterprise Perspective Analysis</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/stylesCustom.css" rel="stylesheet">
	<link href="css/stylesWordCloud.css" rel="stylesheet">
  </head>
  <script type="text/javascript">
  function onSubmitForm() {
    if(document.mainForm.analysis[0].checked == true) {
      document.mainForm.action = "sentimentalAnalysis.php";
    } else 
      if(document.mainForm.analysis[1].checked == true) {
      document.mainForm.action = "wordCloud.php";
      }

      $.LoadingOverlay("show");
      return true;
  }

  </script>
  <body>
  
  <!--Header Begins-->
  
  <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="http://localhost/epa/">Enterprise Perspective Analysis</a>
    </div> 
	  
	  <!--Right Content-->
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">About</a></li>
      </ul>
	  <!--Right Content-->
	  
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<!--Header Ends-->