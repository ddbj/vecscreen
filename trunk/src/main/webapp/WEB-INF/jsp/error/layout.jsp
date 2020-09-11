<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<!--
  Design by Free CSS Templates
  http://www.freecsstemplates.org
  Released for free under a Creative Commons Attribution 2.5 License

  Name       : Instant 
  Description: A three-column, fixed-width blog design.
  Version    : 1.0
  Released   : 20080905

-->
<html dir="ltr" lang="ja">
<head>
<meta charset="UTF-8" />
<title><tiles:insertAttribute name="title" ignore="true" /></title>

<link rel="stylesheet" href="./resources/css/style.css" type="text/css" />

<script type="text/javascript" src="resources/js/jquery-1.7.2.min.js"></script>
<tiles:insertAttribute name="jquery-functions" />

</head>

<body>
	<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>

		<div id="subContent">
			<tiles:insertAttribute name="breadcrumb" />

			<br class="boxclear">
			<h1>${title}</h1>



				<div id="container">
					<div id="content" role="main">

						<p><tiles:insertAttribute name="message" ignore="true" /></p>

					</div>
					<div id="sub">
						<tiles:insertAttribute name="side-menu" />
					</div>
				</div>
		</div>

		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>