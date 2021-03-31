<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div>
    <h2 class="title">MENU</h2>
    <ul>
        <li>
            <a href="vecscreen?lang=${language_code2}"><h3 class="title">Vecscreen</h3></a>
        </li>
        <li>
            <a href="viewer?lang=${language_code2}"><h3 class="title">Result viewer</h3></a>
        </li>
        <li>
            <a href="http://www.ddbj.nig.ac.jp/services/vecscreen${language_code}.html"><h3 class="title"><spring:message code="label.side-menu.help" /></h3></a>
        </li>
    </ul>
</div>

