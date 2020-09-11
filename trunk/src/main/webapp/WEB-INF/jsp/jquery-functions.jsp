<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<script type="text/javascript">

$(function(){

  $('#send_to_vecscreen').click(function(){
    sessionStorage.clear();
    $('.hide input').removeAttr('checked');
  });

  $('#query_clear').click(function(){
    $('[name=up_file]').replaceWith('<INPUT TYPE="file" NAME="up_file" MAXLENGTH="0">');
    $('[name=qseq]').val("");
  });

});
</script>
