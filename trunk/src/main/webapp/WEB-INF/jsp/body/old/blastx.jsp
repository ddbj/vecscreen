<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<div id="container">
	<div id="content" role="main">
		<div class="h1_design">
			<h1>blastx (クエリ:塩基配列*,検索対象:アミノ酸配列) *:アミノ酸配列に翻訳</h1>
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
				<li><input id='blastx' type="radio" name="blasttype"
					value="blastx" onclick="switch_blastx_blastp()" checked>
					blastx
			</ul>

			<h2>Data Sets</h2>
			<table style="width:500px;">
				<tr>
					<td width="350"><ul>
							<li><input id="uniprot_all" type="radio" name="database"
								value="uniprot_all"
								onclick="append_children('uniprot_all','ja')">UniProt(Swiss-Prot
								+ TrEMBL)
						</ul></td>
					<td><ul id="divisions"></ul></td>
				</tr>
			</table>

			<input id='hiddendiv' type='hidden' name='division'
				value='uniprot_all'>


			<h2 id="opheader">Optional Parameters</h2>
			<table id="optable" style="border-width:0px">
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