<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

            <div id="header" class="clearfix">
                <div id="header-top">
                    <a href="https://www.ddbj.nig.ac.jp/index-${language_code}.html" title="DNA Data Bank of Japan" rel="home">
                        <img class="logo" src="./resources/images/ddbj-logo-white.svg" width="50" height="23">
                    </a>
                    <div id="header-top-left">
                        <span class="resources-btn">Services<i class="fa fa-angle-double-down svg-triangle header-left-menu down" aria-hidden="true"></i><i class="fa fa-angle-double-up svg-triangle header-left-menu up" aria-hidden="true" style="display: none;"></i></span>
                    </div>
                    <div id="header-top-right">
                        <ul>
                            <li><a href="https://ddbj.nig.ac.jp/D-way">Login &amp; Submit</a></li>
                            <li><a href="https://www.ddbj.nig.ac.jp/policies-${language_code}.html">Policies and Disclaimers</a></li>
                            <li class="contact-form"><a href="https://www.ddbj.nig.ac.jp/contact-${language_code}.html">Contact</a></li>
                            <li class="language"><a href="${language_chooser_url}">${language_chooser_label}</a></li>
                        </ul>
                    </div>
                </div>
                <div class="resources-contents" style="display: none;">
                    <div class="boxContainer">
                        <div class="resources-box">
                            <ul class="resources-box-item">
                                <li><h3><img src="./resources/images/logos/service-org.svg">Search</h3></li>
                                <li><a title="Retrieve sequence records by accession numbers" href="http://getentry.ddbj.nig.ac.jp/top-${language_code}.html">getentry</a></li>
                                <li><a title="Retrieve sequence and annotation by keywords" href="http://ddbj.nig.ac.jp/arsa/">ARSA</a></li>
                                <li><a title="Search and retrieve sequencing data." href="http://ddbj.nig.ac.jp/DRASearch">DRA Search</a></li>
                                <li><a title="Search unified taxonomy database" href="http://ddbj.nig.ac.jp/tx_search/?lang=${language_code2}">TXSearch</a></li>
                                <li><a title="Search nucleotide sequences by sequence similarity" href="http://blast.ddbj.nig.ac.jp/blastn?lang=${language_code2}">BLAST</a></li>
                            </ul>
                            <ul class="resources-box-item">
                                <li><h3><img src="./resources/images/logos/wrench.svg">Analysis</h3></li>
                                <li><a title="Screen vector sequences" href="http://ddbj.nig.ac.jp/vecscreen/">Vector Screening System</a></li>
                                <li><a title="Multiple alignment and tree-making" href="http://clustalw.ddbj.nig.ac.jp/index.php?lang=${language_code2}">ClustalW</a></li>
                                <li><a title="Web API for using the search services of DDB" href="/search/help/wabi/wabi-${language_code}.html">WABI (Web API for Biology)</a></li>
                                <li><a title="Download public data by ftp" href="ftp://ftp.ddbj.nig.ac.jp/">DDBJ FTP Site</a></li>
                            </ul>
                        </div>
                        <div class="resources-box">
                            <ul class="resources-box-item">
                                <li><h3><img src="./resources/images/logos/database-org.svg">Databases</h3></li>
                                <li><a title="Annotated/Assembled Sequences (DDBJ)" href="https://www.ddbj.nig.ac.jp/ddbj/index-${language_code}.html">Annotated/Assembled Sequences (DDBJ)</a></li>
                                <li><a title="Sequence Read Archive" href="https://www.ddbj.nig.ac.jp/dra/index-${language_code}.html">Sequence Read Archive (DRA)</a></li>
                                <li><a title="Genomic Expression Archive" href="https://www.ddbj.nig.ac.jp/gea/index-${language_code}.html">Genomic Expression Archive (GEA)</a></li>
                                <li><a title="BioProject" href="https://www.ddbj.nig.ac.jp/bioproject/index-${language_code}.html">BioProject</a></li>
                                <li><a title="BioSample" href="https://www.ddbj.nig.ac.jp/biosample/index-${language_code}.html">BioSample</a></li>
                                <li><a title="Japanese Genotype-phenotype Archive" href="https://www.ddbj.nig.ac.jp/jga/index-${language_code}.html">Japanese Genotype-phenotype Archive (JGA)</a></li>
                                <li><a title="Submission portal D-way" href="https://ddbj.nig.ac.jp/D-way">Submission portal D-way</a></li>
                            </ul>
                            <ul class="resources-box-item">
                                <li><h3><img src="./resources/images/logos/sc-org.svg">NIG SuperComputer</h3></li>
                                <li><a title="NIG SuperComputer" href="https://sc.ddbj.nig.ac.jp/${language_code2}">NIG SuperComputer</a></li>
                            </ul>
                        </div>
                        <div class="resources-box dbcls">
                            <ul class="resources-box-item">
                                <li><h3><img src="./resources/images/logos/dbcls-s.svg">DBCLS Services</h3></li>
                                <li><a title="Statistics and trends of gene expression data" href="http://aoe.dbcls.jp/${language_code2}">AOE</a></li>
                                <li><a title="Designing CRISPR/Cas9 guide RNA with reduced off-target sites" href="https://crispr.dbcls.jp/">CRISPRdirect</a></li>
                                <li><a title="Statistics and trends of SRA data" href="http://sra.dbcls.jp/">DBCLS SRA</a></li>
                                <li><a title="Functional profiling of gene and disease features for omics analysis" href="http://gendoo.dbcls.jp/">Gendoo</a></li>
                                <li><a title="A ultrafast sequence search" href="https://gggenome.dbcls.jp/${language_code2}/">GGGenome</a></li>
                                <li><a title="A Google-like, ultrafast search engine for genes and transcripts" href="https://ggrna.dbcls.jp/${language_code2}/">GGRNA</a></li>
                                <li><a title="A web tool for a comfortable search of reference data for gene expression analysis" href="http://refex.dbcls.jp/index.php?lang=${language_code2}">RefEx</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div id="breadcrumb" class="clearfix">
                <ul>
                    <li><a href="https://www.ddbj.nig.ac.jp/index-${language_code}.html" title="DDBJ Center top page">HOME</a></li>
                    <li>&gt;</li>
                    <li><a href="https://www.ddbj.nig.ac.jp/services-${language_code}.html" title="Search &amp; Analysis"><spring:message code="label.breadcrumb.analysis" /></a></li>
                    <li>&gt;</li>
		    <li><a href="/vecscreen">VecScreen</a></li>
                </ul>
            </div>
            <div id="header-middle" class="clearfix">
                <h1 class="page-title" style="font-size:24px;">VecScreen</h1>
                <div style="position:absolute; top:10px; right:20px;">
                    <a target="_blank" href="http://www.ddbj.nig.ac.jp/search/help/vecscreenhelp-${language_code}.html" style="font-size: 100%; text-align: center; text-decoration: none;"><spring:message code="label.side-menu.help" /></a>
                </div>
            </div>


	<!-- #access -->

