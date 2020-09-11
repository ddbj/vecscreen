<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

  <INPUT TYPE="hidden" ID="program" NAME="program" VALUE="">
  <INPUT TYPE="hidden" NAME="language_code" VALUE="${language_code}">
  <INPUT TYPE="hidden" NAME="language_code2" VALUE="${language_code2}">

<!-- ************************************************************************ -->

<%-- <h2>Result viewer</h2> --%>
<h2>Request ID</h2>
<INPUT TYPE="text" NAME="id" SIZE="45" MAXLENGTH=""><br />
<br />
<INPUT ID="display" TYPE="submit" VALUE="display"> 
<INPUT ID="id_clear" TYPE="button" VALUE="Clear">

