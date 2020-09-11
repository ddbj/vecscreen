<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>



<div id="container">
	<div id="content" role="main">
		<div class="h1_design">
			<h1>blastn (クエリ:塩基配列,検索対象:塩基配列)</h1>
		</div>

		<!-- ************************************************************************ -->

		<form method="post" action="newblastc.php"
			enctype="multipart/form-data">
			<h2>Query</h2>
			File Upload: <INPUT TYPE="file" NAME="up_file" MAXLENGTH="0"><br />
			&nbsp;or COPY & PASTE:<br />
			<TEXTAREA NAME="qseq" COLS=80 ROWS=10></TEXTAREA>
			<br /> <INPUT TYPE="submit" VALUE="Send to BLAST"> <INPUT
				TYPE="button" VALUE="Clear"> <br />
			<br />
			
			<!-- 
			<h2>Program</h2>
			<ul>
				<li><input id='blastn' type="radio" name="blasttype"
					value="blastn" onclick="switch_blastn_blastn()" checked>
					blastn 
			</ul>
	        -->

			<h2>Data Sets</h2>
			
			<p></p>
			<select name="database">
			<option value="ddbjall" selected>DDBJ ALL (DDBJ periodical release + daily updates)</option>
			<option value="ddbjnew">DDBJ New (DDBJ daily updates)</option>
			</select>
			select-all
			clear-all
			<p></p>
			<table>
				<tr>
					<td colspan="5">Standard divisions
					  default
					  select-all
					  clear-all
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="divsion" value="ddbjhum">Human</td>
					<td><input type="checkbox" name="divsion" value="ddbjpri">Primates</td>
					<td><input type="checkbox" name="divsion" value="ddbjrod">Rodents</td>
					<td><input type="checkbox" name="divsion" value="ddbjmam">Mammals</td>
					<td><input type="checkbox" name="divsion" value="ddbjvrt">Vertebrates</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="divsion" value="ddbjinv">Invertebrates</td>
					<td><input type="checkbox" name="divsion" value="ddbjpln">Plants</td>
					<td><input type="checkbox" name="divsion" value="ddbjbct">Bacteria</td>
					<td><input type="checkbox" name="divsion" value="ddbjvir">Viruses</td>
					<td><input type="checkbox" name="divsion" value="ddbjphg">Phages</td>
				</tr>
			</table>

			<table>
				<tr>
					<td colspan="3">High throughput divisions
					select-all
					clear-all
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" name="divsion" value="ddbjthg">HTG</td>
					<td><input type="checkbox" name="divsion" value="ddbjpri">HTC</td>
					<td><input type="checkbox" name="divsion" value="ddbjrod">TSA</td>
				</tr>
			</table>

			<table>
				<tr>
					<td colspan="5">EST divisions
					select-all
					clear-all
					</td>
				</tr>
				<tr>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="est_atha">A.thaliana</td>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="est_btra">B.taurus</td>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="est_cele">C.elegans</td>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="est_cint">C.intestinalis</td>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="est_crei">C.reinhardtii</td>
				</tr>
				<tr>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="est_ddis">D.discoideum</td>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="est_dmel">D.melanogaster</td>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="est_drer">D.rerio</td>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="est_ggal">G.gallus</td>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="est_gmax">G.max</td>
				</tr>
				<TR>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="est_hum">H.sapiens</td>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="est_hvul">H.vulgare</td>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="est_mous">M.musculus</td>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="est_mtru">M.truncatula</td>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="est_osat">O.sativa</td>
				</tr>
				<tr>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="est_rnor"> R.norvegicus</td>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="est_slyc">S.lycopersicum</td>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="est_taes">T.aestivum</td>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="est_xlae">X.laevis</td>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="est_xtro">X.tropicalis</td>
				</tr>
				<tr>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="est_zmay"> Z.mays</td>
					<td></td>
					<td colspan="3"><INPUT TYPE="checkbox" NAME="division" VALUE="est_rest">Others</td>

				</tr>
			</table>

			<table>
				<tr>
					<td COLSPAN="5">Other divisions
					select-all
					clear-all
					</td>
				</tr>
				<tr>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="ddbjpat">Patent</td>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="ddbjuna">Unannotated Seq</td>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="ddbjgss">GSS</td>
					<td><INPUT TYPE="checkbox" NAME="division" VALUE="ddbjsts">STS</td>
				</tr>
			</table>


			<!-- 
			<table width="500">
				<tr>
					<td width="350"><ul>
							<li><input type="radio" name="database" value="ddbjfull"
								onclick="append_children('full','ja')">DDBJ/EMBL/GenBank
								全配列データ (DDBJ定期リリース+新着データ)
							<li><input id="ddbjall" type="radio" name="database"
								value="ddbjall" onclick="append_children('all','ja')">古典的区分の配列データ
								(DDBJ定期リリース+新着データ。 但し以下を除く;
								PAT,ENV,EST,STS,GSS,HTG,HTC,UNA,SYN,TSA）
							<li><input type="radio" name="database" value="ddbjnew"
								onclick="append_children('new','ja')">DDBJ新着データ
							<li><input type="radio" name="database" value="pat"
								onclick="append_children('pat','ja')">PAT:
								特許に登録された塩基配列データ
							<li><input type="radio" name="database" value="env"
								onclick="append_children('env','ja')">ENV:
								環境上のサンプルに由来した配列
							<li><input type="radio" name="database" value="gss"
								onclick="append_children('gss','ja')">GSS: short single
								passのゲノム配列データ
							<li><input type="radio" name="database" value="htc"
								onclick="append_children('htc','ja')">HTC:
								EST以外のcDNA配列プロジェクトに由来する配列データ
							<li><input type="radio" name="database" value="htg"
								onclick="append_children('htg','ja')">HTG:
								ゲノムプロジェクトに由来する配列データ
							<li><input type="radio" name="database" value="sts"
								onclick="append_children('sts','ja')">STS:
								ゲノムシーケンシングのタグとなる配列データ
							<li><input type="radio" name="database" value="est"
								onclick="append_children('est','ja')">EST: Expressed
								sequence tag
							<li><input type="radio" name="database" value="other"
								onclick="append_children('other','ja')">その他
						</ul></td>
					<td><ul id="divisions"></ul></td>
				</tr>
			</table>
	        
			<input id='hiddendiv' type='hidden' name='division' value='ddbjall'>
	        -->

			<h2 id="opheader">Optional Parameters</h2>
			<table id="optable" border="0">
				<tr>
					<td width="50">SCORES</td>
					<td><INPUT TYPE="number" NAME="score" VALUE="100" SIZE="5"></td>
				</tr>
				<tr>
					<td width="50">ALIGNMENTS</td>
					<td><INPUT TYPE="number" NAME="alignments" VALUE="100"
						SIZE="5"></td>
				</tr>
				<tr>
					<td width="50">EXPECT</td>
					<td><INPUT TYPE="number" NAME="expect" VALUE=10 SIZE=5></td>
				</tr>
				<tr>
					<td width="50">FILTER</td>
					<td>
					<INPUT TYPE="radio" NAME="filter" VALUE="T">ON 
					<INPUT TYPE="radio" NAME="filter" VALUE="F" CHECKED>
					</td>
				</tr>
				<tr>
					<td>WORD SIZE</td>
					<td><INPUT TYPE="number" ID="wordsize" NAME="wordsize"
						VALUE="11" SIZE=5></td>
				</tr>
				<tr><td width="50">OTHER OPTIONS</td><td><INPUT TYPE="TEXT" NAME="options" SIZE="40"></td></tr>
			</table>
		</form>

	</div>
</div>



