<?php include 'includes/header.php'; ?>
<div class="content">
</div>
<div class="row">
          <div class="col-lg-6 shftNew">
            <div class="well bs-component">
              <form class="form-horizontal" name="mainForm" id="form" onsubmit="return onSubmitForm();" method="post">
                <fieldset>
                  <legend>Analysis Setup</legend>
                  <div class="form-group">
                    <label for="handle1" class="col-lg-2 control-label">Handle #1</label>
                    <div class="col-lg-10">
                      <input type="text" class="form-control" name="handle1" placeholder="Handle#1">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputPassword" class="col-lg-2 control-label">Handle #2</label>
                    <div class="col-lg-10">
                      <input type="text" class="form-control" name="handle2" placeholder="Handle#2">
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"> Checkbox
                        </label>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="textArea" class="col-lg-2 control-label">Textarea</label>
                    <div class="col-lg-10">
                      <textarea class="form-control" rows="3" id="textArea"></textarea>
                      <span class="help-block">A longer block of help text that breaks onto a new line and may extend beyond one line.</span>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-lg-2 control-label">Analysis :</label>
                    <div class="col-lg-10">
                      <div class="radio">
                        <label>
                          <input type="radio" name="analysis" id="optionsRadios1" value="1" checked="">
                          Sentimental Analysis
                        </label>
                      </div>
                      <div class="radio">
                        <label>
                          <input type="radio" name="analysis" id="optionsRadios2" value="2">
                          WordCloud
                        </label>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">
                      <button type="reset" class="btn btn-default">Cancel</button>
                      <button type="submit" class="btn btn-primary" onclick="return showloader();">Run</button>

                      <div id="loading" style="display:none;">
  			<img id="loading-image" src="images/loading.gif"  alt="Loading..." />
			</div>
			
			<script>
					function showloader(){
						document.getElementById("loading").style.display = "block";
						return true; 
					}

			</script>

                    </div>
                  </div>
                </fieldset>
              </form>
            </div>
          </div>
<?php include 'includes/footer.php'; ?>