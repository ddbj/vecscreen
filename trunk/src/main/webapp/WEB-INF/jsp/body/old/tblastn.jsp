<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<div id="container">
	<div id="content" role="main">
		<div class="h1_design">
			<h1>tblastn (クエリ:アミノ酸配列,検索対象:塩基配列*) *:アミノ酸配列に翻訳</h1>
		</div>

		<!-- ************************************************************************ -->

		<form method="post" action="newblastc.php"
			enctype="multipart/form-data">
			<h2>Query</h2>
			File Upload: <INPUT TYPE="file" NAME="up_file" MAXLENGTH="0"><br />
			&nbsp;or COPY &amp; PASTE:<br />
			<TEXTAREA NAME="qseq" COLS=80 ROWS=10></TEXTAREA>
			<br /> <INPUT TYPE="submit" VALUE="Send to BLAST"> <INPUT
				TYPE="button" VALUE="Clear"> <br />
			<br />
			<h2>Program</h2>
			<ul>
				<li><input id='tblastn' type="radio" name="blasttype"
					value="tblastn" onclick="switch_tblastn_blastn()" checked>
					tblastn
			</ul>

			<h2>Data Sets</h2>
			<table style="width:500px">
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


			<h2 id="opheader">Optional Parameters</h2>
			<table id="optable" style="border-width:0px;">
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
					<td><INPUT TYPE="radio" NAME="filter" VALUE="T" CHECKED>
						ON <INPUT TYPE="radio" NAME="filter" VALUE="F"> OFF</td>
				</tr>
				<tr>
					<td width="50">SCORING MATRIX</td>
					<td><SELECT NAME="matrix">
							<OPTION VALUE="PAM30">PAM30
							<OPTION VALUE="PAM70">PAM70
							<OPTION VALUE="PAM250">PAM250
							<OPTION VALUE="BLOSUM45">BLOSUM45
							<OPTION VALUE="BLOSUM50">BLOSUM50
							<OPTION VALUE="BLOSUM62" SELECTED>BLOSUM62
							<OPTION VALUE="BLOSUM80">BLOSUM80
							<OPTION VALUE="BLOSUM90">BLOSUM90
					</SELECT></td>
				</tr>
				<tr>
					<td>WORD SIZE</td>
					<td><INPUT TYPE="number" ID="wordsize" NAME="wordsize"
						VALUE="3" SIZE=5></td>
				</tr>
				<!--<tr><td width="50">OTHER OPTIONS</td><td><INPUT TYPE="TEXT" NAME="options" SIZE="40"></td></tr>-->
			</table>
		</form>

	</div>
</div>