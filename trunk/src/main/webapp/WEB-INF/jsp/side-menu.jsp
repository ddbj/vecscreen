<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div class="servicebox">
	<a href="vecscreen?lang=${language_code2}">VecScreen</a><br><br>
	<a href="viewer?lang=${language_code2}">Result viewer</a>
	<a href="http://www.ddbj.nig.ac.jp/search/help/vecscreenhelp-${language_code}.html">
	<spring:message code="label.side-menu.help" /></a>
</div>
