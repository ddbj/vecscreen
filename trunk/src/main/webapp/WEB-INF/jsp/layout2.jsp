<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8" />
        <meta property="og:title" content="Top" />
        <meta property="og:url" content="/index.html" />
        <meta
          property="og:description"
          content="生命情報・DDBJ センターは生命科学研究から生み出されるデータの共有・解析サービスを提供することで広く研究活動をサポートしています    検索・解析    登録    ダウンロード    …"
        />
        <meta property6="og:image" content="/images/thumbnail/logo_ddbj_fb.png" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title><tiles:insertAttribute name="title" ignore="true" /></title>
        <script async src="https://www.google-analytics.com/analytics.js"></script>
        <script type="text/javascript" src="resources/js/jquery-1.7.2.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.0.js" integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc=" crossorigin="anonymous"></script>
        <script type="text/javascript">
            var $220 = $.noConflict(true);
        </script>
        <tiles:insertAttribute name="jquery-functions" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.hoverintent/1.10.1/jquery.hoverIntent.min.js" integrity="sha512-gx3WTM6qxahpOC/hBNUvkdZARQ2ObXSp/m+jmsEN8ZNJPymj8/Jamf8+/3kJQY1RZA2DR+KQfT+b3JEB0r9YRg==" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/spin.js/4.1.0/spin.min.js" integrity="sha512-CbohqWjAgarTqRHcX1MbwkF2pujwbsCee1PABpnBWC+VqSldvlNEEI5+4OSsR/HbFQOFFpwY2YvZZNjBMxNnXg==" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.colorbox/1.6.4/jquery.colorbox-min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-deparam/0.5.3/jquery-deparam.min.js"></script>
        <script type="text/javascript" src="https://www.ddbj.nig.ac.jp/assets/js/jquery.trace.js"></script>
        <script type="text/javascript" src="https://www.ddbj.nig.ac.jp/assets/js/jquery.json_search.js"></script>
        <link rel="stylesheet" href="https://www.ddbj.nig.ac.jp/assets/css/colorbox.css" />
        <link rel="stylesheet" href="https://www.ddbj.nig.ac.jp/assets/css/main.css" />
        <link rel="alternate" type="application/rss+xml" title="My Site RSS" href="/feed.xml" />
    
        <script src="https://www.ddbj.nig.ac.jp/assets/js/main.js"></script>

    </head>

    <body data-category="services">
        <script
          src="https://www.ddbj.nig.ac.jp/assets/js/ddbj_common_framework.js"
          id="DDBJ_common_framework"
          style="display: block; height: 40px;"
          data-bottom-menu="true"
          data-ddbj-home-page="true"
          data-search="true"
        ></script>

        <div id="primary">
            <header id="PageHeader">
                <tiles:insertAttribute name="header" />
            </header>
            <div id="NavigationAndMainView">
                <div class="inner -stretched">
                    <nav class="subview">
                        <nav class="internal-link">
                            <tiles:insertAttribute name="side-menu" />
                        </nav>
                    </nav>
                    <main class="mainview">
                        <tiles:insertAttribute name="report-body" />
                    </main>
                </div>
            </div>
        </div>
    </body>
</html>

