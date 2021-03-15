<center>
  <script type="text/javascript">
			function confirmUpload() {
			    var file_data = $("#fileToUpload").prop("files")[0];
			    var form_data = new FormData();
			    form_data.append("file", file_data);
			    form_data.append("use_desc", $("#textareaUseDesc").html());
				$.ajax({
 					 url : '<%=request.getContextPath()%>/potentialCustomer/insertDone.sas',
					 dataType: 'script',
					 cache: false,
					 contentType: false,
					 processData: false,
					 data: form_data,
					 type: 'POST',
                     success:function(data) {
                         alert('등록되었습니다.');
                         window.close();
                         window.opener.location.reload(false);
                     },
                     error: function(data, status, err) {
                         if(data.status == 200) {
                             alert('등록되었습니다.');
                             window.close();
                             window.opener.location.reload(false);
                         } else {
                        	 alert(err.message);
                             //alert('ERROR\nData:' + data + "\nStatus:" + status + "\nError:" + err);
                         }
                     }
				});
			}
			function cancelUpload() {
				window.close();
			}
		</script>
  <table width="550" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td>
        <div class="row">
          <div class="col-lg-4">
            <div class="panel panel-primary">
              <div class="panel-heading">
                <h3 class="panel-title">파일 업로드</h3>
              </div>
              <div class="panel-body">
                <table>
                  <tr>
                    <td width="100" align="right">파일명 :&nbsp;</td>
                    <td colspan="2"><input type="file" id="fileToUpload"
                      class="form-control col-lg-8" placeholder="파일 찾기"
                      style="width: 380px"></td>
                  </tr>
                  <tr height="10">
                    <td colspan="3"></td>
                  </tr>
                  <tr>
                    <td width="100" align="right">대상고객명 :&nbsp;</td>
                    <td colspan="2"><input type="text" id="target_cust_nm"
                      class="form-control col-lg-8"
                      style="width: 380px"></td>
                  </tr>
                  <tr height="10">
                    <td colspan="3"></td>
                  </tr>
                  <tr>
                    <td width="100" align="right">보조고객명 :&nbsp;</td>
                    <td colspan="2"><input type="text" id="sub_cust_nm"
                      class="form-control col-lg-8"
                      style="width: 380px"></td>
                  </tr>
                  <tr height="10">
                    <td colspan="3"></td>
                  </tr>
                  <tr>
                    <td width="100" align="right">고객종류 :&nbsp;</td>
                    <td colspan="2"><input type="text" id="rs_cd"
                      class="form-control col-lg-8"
                      style="width: 380px"></td>
                  </tr>
                  <tr height="10">
                    <td colspan="3"></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td colspan="2" align="right">
                      <button class="btn btn-primary"
                        onclick="return confirmUpload();">&nbsp;&nbsp;&nbsp;확인&nbsp;&nbsp;&nbsp;</button>
                      &nbsp;
                      <button class="btn btn-primary"
                        onclick="return cancelUpload();">&nbsp;&nbsp;&nbsp;취소&nbsp;&nbsp;&nbsp;</button>
                    </td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
        </div>
      </td>
    </tr>
  </table>
</center>