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

    <link rel="stylesheet" href="resources/css/style-new.css" type="text/css" />

    <script type='text/javascript' src='https://use.fontawesome.com/da0fe5cd36.js'></script>
    <script type="text/javascript" src="resources/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <script type="text/javascript">
        var $220 = $.noConflict(true);
    </script>
    <tiles:insertAttribute name="jquery-functions" />
    <script type="text/javascript" src="resources/js/jquery.menu.js"></script>

</head>

<body>
    <div id="vecscreen-page" class="top">
        <header id="branding">
            <tiles:insertAttribute name="header" />
        </header>
        <div id="main" class="clearfix">
            <div id="page_main">
                <form method="post" action="report" enctype="multipart/form-data">
                    <tiles:insertAttribute name="query-form" />
                    <tiles:insertAttribute name="dataset" />
                    <tiles:insertAttribute name="parameter" />
                </form>
            </div>
<!--
            <div id="sub">
                <tiles:insertAttribute name="side-menu" />
            </div>
-->
        </div>
        <footer>
            <tiles:insertAttribute name="footer" />
        </footer>
    </div>
</body>
</html>
