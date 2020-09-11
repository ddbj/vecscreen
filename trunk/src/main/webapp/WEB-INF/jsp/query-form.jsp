<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!-- <INPUT TYPE="hidden" ID="program" NAME="program" VALUE="${program}">  
  <INPUT TYPE="hidden" ID="program" NAME="program" VALUE="${program}"> -->
  <INPUT TYPE="hidden" NAME="language_code" VALUE="${language_code}">
  <INPUT TYPE="hidden" NAME="language_code2" VALUE="${language_code2}">

<!-- ************************************************************************ -->

<h2>Query</h2>
File Upload: <INPUT TYPE="file" NAME="up_file" MAXLENGTH="0"><br />
&nbsp;or COPY & PASTE:<br />
<TEXTAREA NAME="qseq" COLS=80 ROWS=10></TEXTAREA>
<br />
<br />
<INPUT TYPE=radio NAME="result" VALUE="www" CHECKED > WWW
<br />
<INPUT TYPE=radio NAME="result" VALUE="mail" > E-Mail <INPUT TYPE=text SIZE=30 NAME="address" VALUE="">
<br />
<br /> 
<INPUT ID="send_to_vecscreen" TYPE="submit" VALUE="Send to VecScreen"> 
<INPUT ID="query_clear" TYPE="button" VALUE="Clear">
<br />
<br />

