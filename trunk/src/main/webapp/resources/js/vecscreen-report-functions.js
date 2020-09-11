var database;
var program;
var language_code2;

function vecscreenReport(data){
	  var outArray = new Array();
	  var lines = data.split("\n");

	  outArray.push("<H2>Request ID:&nbsp;" + requestId + "</H2>");

	  if (data.match(/<HTML>/)) {
		  data.replace("<HTML>", "");
		  data.replace("</HTML>", "");
		  var flag = 1;
		  for(var i = 0; i < lines.length; i++){
			  if (lines[i].match(/<PRE><b>/)) {
				  if (flag) {
					  flag = 0;
				  } else {
					  outArray.push("<HR>");
				  }
			  }
			  outArray.push(lines[i]);
		  }
	  } else {
		  outArray.push("<PRE>");
		  for (var i = 0; i < lines.length; i++) {
			  outArray.push(lines[i]);
		  }
		  outArray.push("</PRE>");
	  }
	  $('#response').html(outArray.join("\n"));
}

function replaceDecode(reportLine){
	  var strLine = reportLine;

	  strLine = strLine.replace(/%23/g, "#");
	  strLine = strLine.replace(/%24/g, "$");
	  strLine = strLine.replace(/%26/g, "&");
	  strLine = strLine.replace(/%2B/g, "+");
	  strLine = strLine.replace(/%2C/g, ",");
	  strLine = strLine.replace(/%2F/g, "/");
	  strLine = strLine.replace(/%3A/g, ":");
	  strLine = strLine.replace(/%3B/g, ";");
	  strLine = strLine.replace(/%3D/g, "=");
	  strLine = strLine.replace(/%3F/g, "?");
	  strLine = strLine.replace(/%40/g, "@");

	  return strLine;
}

