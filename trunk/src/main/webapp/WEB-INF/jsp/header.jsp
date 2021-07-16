<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

	<div class="logo-area">
		<!-- Header の写真 -->
		<div class="logo">
			<a href="http://www.ddbj.nig.ac.jp/index-${language_code}.html">
				<img src="resources/images/logo.png">
			</a>
		</div>
		
		<!-- RSS Twitter Language Search -->
		<div id="language-box">
			<a href="${language_chooser_url}" id="header_jp" class="btn" title="JP">${language_chooser_label}</a>
			&nbsp;&nbsp;

			<!-- Twitter , PSS , Language 切り替え -->
<!-- 			<a href="http://twitter.com/DDBJ_topics"><img
				src="resources/images/ico_twitter.png" alt="RSS" width="20"
				height="20"></a> <a
				href="http://www.ddbj.nig.ac.jp?feed=rss2&cat=45 " id="header_rss"
				title="RSS"><img src="resources/images/ico_feed.png" alt="RSS"
				width="20" height="20"></a>&nbsp;&nbsp; -->
		</div>

		<div class="searchBar">
			<div id="search-box">
				<form id="cse-search-box" action="http://www.google.com/cse">
					<div>
						<input type="hidden" value="007882158733737608102:0tkctvbmv90" name="cx">
						<input type="hidden" value="UTF-8" name="ie">
						<input class="search-text" type="text" name="q" style="border: 1px solid rgb(126, 157, 185); padding: 2px; background: url('http://www.google.com/cse/intl/ja/images/google_custom_search_watermark.gif') no-repeat scroll left center rgb(255, 255, 255);">
						<input class="search-go" type="submit" value="Search" name="sa">
					</div>
					<input type="hidden" name="siteurl" value="www.ddbj.nig.ac.jp/searches-${lainguage_code}.html">
					<input type="hidden" name="ref" value="www.ddbj.nig.ac.jp/searches-j.html">
					<input type="hidden" name="ss">
				</form>
			</div>
			<script src="http://www.google.com/coop/cse/brand?form=cse-search-box&lang=ja" type="text/javascript"></script>
		</div>
	</div>

	<!-- Menu -->
	<div id="navi" class="menu-header-menu-${language_code2}-container">
		<ul id="menu-header-menu-${language_code2}" class="menu">
			<li id="menu-item-29098" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-29098">
				<a href="http://www.ddbj.nig.ac.jp/intro-${language_code}.html">
				<spring:message code="label.menu.about" />
				</a>
			</li>
			<li id="menu-item-30461" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-30461">
				<a href="http://www.ddbj.nig.ac.jp/ddbjingtop-${language_code}.html">
				<spring:message code="label.menu.how_to_use" />
				</a>
			</li>
			<li id="menu-item-29095" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-29095">
				<a href="http://www.ddbj.nig.ac.jp/documents-${language_code}.html">
				<spring:message code="label.menu.report" />
				</a>
			</li>
			<li id="menu-item-29440" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-29440">
				<a href="http://www.ddbj.nig.ac.jp/faq/faq-${language_code}.html">FAQ</a>
			</li>
			<li id="menu-item-29099" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-29099">
				<a href="http://www.ddbj.nig.ac.jp/addresses-${language_code}.html">
				<spring:message code="label.menu.contact" />
				</a>
			</li>
		</ul>
	</div>
	<!-- #access -->

