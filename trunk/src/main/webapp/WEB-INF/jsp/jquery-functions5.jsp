<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<script type="text/javascript" src="resources/js/vecscreen-message.js"></script>
<script type="text/javascript" src="resources/js/vecscreen-report-functions.js"></script>
<script type="text/javascript" src="resources/js/vecscreen-search-time-functions.js"></script>
<script type="text/javascript">

vecscreenUrl = "<%= jp.ac.nig.ddbj.vecscreen.util.Conf.vecscreenUrl %>"
wabiApiUrl = "<%= jp.ac.nig.ddbj.vecscreen.util.Conf.wabiApiUrl %>";
var requestId = replaceDecode(decodeURI('${requestId}'));
var interval = 1000;
var tblparent;
var firstFlg = 1;
var querySequence = "";

function getUserRequest(){
  var url = vecscreenUrl + "wabi/" + requestId + "?info=request";
  $.ajax({
    type: 'GET',
    url: url,
    cache: false,
    success: function(data){
      if(data.Message == undefined){
        //database = data.datasets;
//        if(data.datasets != undefined){
//          database = data.datasets;
//        }
//        else{
//          setDatabase(data.program);
//        }
//        program = data.program;
//        database = data.database;
//        setReportStr(database);
        getStatus();
      }
      else if("illegal-arguments" == data.status){
        setErrorMsg(errorMsg4);
      }
      else{
        $('#response').text(errorMsg3);
      }
    },
    error: function(xmlreq, textStatus, errorThrown){
      if (404==xmlreq.status) {
        $('#response').text(errorMsg3);
      } else if (400==xmlreq.status) {
        $('#response').text(errorMsg4);
      } else if (400<=xmlreq.status && xmlreq.status<=499) {
        $('#response').text(errorMsg1);
      } else {
        $('#response').text(errorMsg2 + ': getUserRequest: ' + xmlreq.status + ': ' + url);
      }
    }
  });
}

function getStatus(){
  var url = vecscreenUrl + "wabi/" + requestId + "?format=json";
  $.ajax({
    type: 'GET',
    url: url,
    cache: false,
    success: function(data){
      if(data.status == "finished"){
        if(firstFlg == 0){
          $('#status').text(data.status);
        }
        getResult();
      }
      else if(data.status == "not-found") {
        $('#response').text(errorMsg3);
      }
      else if(data.status == "illegal-arguments") {
        $('#response').text(errorMsg4);
      }
      else {
        if(firstFlg == 1){
          $('#response').text("");
          $('div#content').prepend(tblparent);
          setStartDate(createStartDate(requestId));
          $('#requestId').text(requestId);
          $('#waitMessage').text(message1);
          startInterval();
          firstFlg = 0;
        }
        $('#status').text(data.status);
        setTimeout("getStatus()", interval);
      }
    },
    error: function(xmlreq, textStatus, errorThrown){
      if (404==xmlreq.status) {
        $('#response').text(errorMsg3);
      } else if (400==xmlreq.status) {
        $('#response').text(errorMsg4);
      } else if (400<=xmlreq.status && xmlreq.status<=499) {
        $('#response').text(errorMsg1);
      } else {
        $('#response').text(errorMsg2 + ': getStatus');
      }
    }
  });        
}

function getResult(){
  var url = vecscreenUrl + "wabi/" + requestId + "?info=result";
  $.ajax({
    type: 'GET',
    url: url,
    cache: false,
    success: function(data){
      if("illegal-arguments" == data.status){
        setErrorMsg(errorMsg4);
      } else {
        stopInterval();
        $("table").remove("#searchInfo");
        removeSearchInfo();
        vecscreenReport(data);
      }
    },
    error: function(xmlreq, textStatus, errorThrown){
      if (404==xmlreq.status) {
        $('#response').text(errorMsg3);
      } else if (400==xmlreq.status) {
        $('#response').text(errorMsg4);
      } else if (400<=xmlreq.status && xmlreq.status<=499) {
        $('#response').text(errorMsg1);
      } else {
        $('#response').text(errorMsg2 + ': getResult');
      }
    }
  });
}

function createStartDate(requestId){
  var requestIdArray = requestId.split("-");
  var year = requestIdArray[0].substring(requestIdArray[0].lastIndexOf("_") + 1);
  var month = requestIdArray[1].substring(0, 2);
  var day = requestIdArray[1].substring(2);
  var hh = requestIdArray[2].substring(0, 2);
  var mm = requestIdArray[2].substring(2);
  var ss = requestIdArray[3];

  var dateStr = year + "/" + month + "/" + day + " " + hh + ":" + mm + ":" + ss;

  return dateStr;
}

//function del_header_jp() {
//	document.getElementById("header_jp").style.display = "none";
//}

function removeSearchInfo(){
	  if($('#searchInfo2').length){
	    var dom_obj2 = document.getElementById("searchInfo2");
	    var dom_obj_parent2 = dom_obj2.parentNode;
	    dom_obj_parent2.removeChild(dom_obj2);
	  }
}

$(document).ready(function(){
//  del_header_jp();
  language_code2 = "${language_code2}";
  //$("table").remove("#searchInfo");
  tblparent = $("table#searchInfo").detach();
  if(requestId == ""){
    $('#response').text(errorMsg1);
  }
  else {
    $('#response').text(message3);
    getUserRequest();
  }

});


</script>
