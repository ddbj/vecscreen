<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<script type="text/javascript" src="resources/js/vecscreen-message.js"></script>
<!-- <script type="text/javascript" src="resources/js/blast-request-url.js"></script> -->
<script type="text/javascript" src="resources/js/vecscreen-report-functions.js"></script>
<script type="text/javascript">

vecscreenUrl = "<%= jp.ac.nig.ddbj.vecscreen.util.Conf.vecscreenUrl %>"
var querySequence = replaceDecode(decodeURI('${querySequence}'));
var database = replaceDecode(decodeURI('${database}'));
var program = replaceDecode(decodeURI('${program}'));
var parameters = replaceDecode(decodeURI('${parameters}'));
var result = replaceDecode(decodeURI('${result}'));
var address = replaceDecode(decodeURI('${address}'));

function post(){
  var url = vecscreenUrl + "wabi";
  $.ajax({
    type: 'POST',
    url: url,
    dataType: 'json',
    cache: false,
    data: {
        querySequence: querySequence,
        database: database,
        parameters: parameters,
        format: '${format}',
        result: result,
        address: address
    },
    success: function(data){
      if ("illegal-arguments" == data.status) {
        setErrorMsg(errorMsg4);
      } else {
        var message = message2.join("<br><br>") + "<br>" 
                      + "<a href=\"" + vecscreenUrl + data.requestId + "\" target=\"_blank\">" 
                      + vecscreenUrl + data.requestId + "</a>";
        sessionStorage.setItem("requestId", data.requestId);
        sessionStorage.setItem("message", message);
        $('#requestId').text(data.requestId);
        $('#message').html(message);
      }
    },
    error: function(xmlreq, textStatus, errorThrown){
      var errorMsg = null;
      if (404==xmlreq.status) {
        errorMsg = errorMsg3;
      } else if (400==xmlreq.status) {
        errorMsg = errorMsg4;
      } else if (400<=xmlreq.status && xmlreq.status<=499) {
        errorMsg = errorMsg1;
      } else {
        errorMsg = errorMsg2;
      }
      sessionStorage.setItem("errorMessage", errorMsg);
      setErrorMessage(errorMsg);
    }
  });
}

function setErrorMessage(message){
  $("table").remove("#searchInfo");
  $('#errorMessage').text(message);
}

$(document).ready(function(){
  if("${querySequence}" == "" || "${address}" == ""){
    setErrorMessage(errorMsg1);
  }
  else{
    if(sessionStorage.getItem("requestId") == null){
      post();
    }
    else if(sessionStorage.getItem("errorMessage") == null){
      $('#requestId').text(sessionStorage.getItem("requestId"));
      $('#message').html(sessionStorage.getItem("message"));
    }
    else if(sessionStorage.getItem("message") == null){
      setErrorMessage(errorMsg2);
    }
  }

});
</script>
