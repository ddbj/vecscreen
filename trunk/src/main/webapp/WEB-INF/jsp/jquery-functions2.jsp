<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<script type="text/javascript" src="resources/js/vecscreen-message.js"></script>
<script type="text/javascript" src="resources/js/vecscreen-report-functions.js"></script>
<script type="text/javascript" src="resources/js/vecscreen-search-time-functions.js"></script>
<script type="text/javascript">

vecscreenUrl = "<%= jp.ac.nig.ddbj.vecscreen.util.Conf.vecscreenUrl %>";
var querySequence = replaceDecode(decodeURI('${querySequence}'));
var database = replaceDecode(decodeURI('${database}'));
var parameters = replaceDecode(decodeURI('${parameters}'));
var result = replaceDecode(decodeURI('${result}'));
var address = replaceDecode(decodeURI('${address}'));
var requestId;
var reqInterval = 1000;

function post(){
  var url = vecscreenUrl + 'wabi';
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
  }).success(function(data){
      if ("illegal-arguments" == data.status) {
        setErrorMsg(errorMsg4);
      } else {
        requestId = data.requestId;
        sessionStorage.setItem("requestId", requestId);
        startGetStatus();
      }
  }).error(function(xmlreq, textStatus, errorThrown){
      if (404==xmlreq.status) {
        setErrorMsg(errorMsg3);
      } else if (400==xmlreq.status) {
        setErrorMsg(errorMsg4);
      } else if (400<=xmlreq.status && xmlreq.status<=499) {
        setErrorMsg(errorMsg1);
      } else {
        setErrorMsg(errorMsg2 + ': post: ' + xmlreq.status + ': ' + url);
      }
  });
}

function getStatus(){
  var url = vecscreenUrl + "wabi/" + requestId + "?format=json";
  var count = 0;
  $.ajax({
    type: 'GET',
    url: url,
    dataType: 'json',
    cache: false,
    success: function(data, dataType){
      $('#status').text(data.status);
      if(data.status == "finished"){
        getResult();
      }
      else if(data.status == "not-found"){
	if (count == 4) {
          getRequestErrorFunction(errorMsg2 + ': getStatus1');
	} else {
	  setTimeout("getStatus()", reqInterval);
	  count = count +1;
	}
      }
      else if(data.status == "illegal-arguments"){
        getRequestErrorFunction(errorMsg4);
      }
      else{
        setTimeout("getStatus()", reqInterval);
      }
    },
    error: function(xmlreq, textStatus, errorThrown){
      if (404==xmlreq.status) {
        setErrorMsg(errorMsg3);
      } else if (400==xmlreq.status) {
        setErrorMsg(errorMsg4);
      } else if (400<=xmlreq.status && xmlreq.status<=499) {
        setErrorMsg(errorMsg1);
      } else {
        setErrorMsg(errorMsg2 + ': getStatus2');
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
      if ("illegal-arguments" == data.status) {
        setErrorMsg(errorMsg4);
      } else {
        sessionStorage.removeItem("startDate");
        stopInterval();
        removeSearchInfoTbl();
        vecscreenReport(data, database);
      }
    },
    error: function(xmlreq, textStatus, errorThrown){
      if (404==xmlreq.status) {
        setErrorMsg(errorMsg3);
      } else if (400==xmlreq.status) {
        setErrorMsg(errorMsg4);
      } else if (400<=xmlreq.status && xmlreq.status<=499) {
        setErrorMsg(errorMsg1);
      } else {
        setErrorMsg(errorMsg2 + ': getResult');
      }
    }
  });
}

function startGetStatus(){
  getStartDate();
  getStatus();
  $('#requestId').text(requestId);
  $('#status').text("waiting");
  $('#waitMessage').text(message1);
  startInterval();
}

function getRequestErrorFunction(errorMsg){
  sessionStorage.removeItem("startDate");
  setErrorMsg(errorMsg);
}

function setErrorMsg(errorMsg){
  removeSearchInfoTbl();
  $('#response').text(errorMsg);
}

function removeSearchInfoTbl(){
  if($('#searchInfo').length){
    var dom_obj = document.getElementById("searchInfo");
    var dom_obj2 = document.getElementById("searchInfo2");
    var dom_obj_parent = dom_obj.parentNode;
    var dom_obj_parent2 = dom_obj2.parentNode;
    dom_obj_parent.removeChild(dom_obj);
    dom_obj_parent2.removeChild(dom_obj2);
  }
}

function setProgram(){
  if(sessionStorage.getItem("") == null){
    program = replaceDecode(decodeURI('${program}'));
  }
  else{
    program = sessionStorage.getItem("program");
  }
}

function setDatabase(){
  if(sessionStorage.getItem("database") == null){
    database = replaceDecode(decodeURI('${database}'));
  }
  else{
    database = sessionStorage.getItem("database");
  }
}

function del_header_jp() {
	document.getElementById("header_jp").style.display = "none";
}

$(document).ready(function(){
  language_code2 = "${language_code2}";
  if("${querySequence}" == ""){
    setErrorMsg(errorMsg1);
  } else {
    // 言語切り替えのリンクを消す。
    //del_header_jp();
    setProgram();
    setDatabase();
//    setReportStr(database);

    if (sessionStorage.getItem("requestId") == null) {
      post();
    } else {
      requestId = sessionStorage.getItem("requestId");
      if (sessionStorage.getItem("startDate") == null) {
        removeSearchInfoTbl();
        getStatus();
      } else {
        startGetStatus();
      }
    }
  }

});
</script>
