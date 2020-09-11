package jp.ac.nig.ddbj.vecscreen.search;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URLEncoder;


public class VecscreenSearchInfo {

	String characterEncoding = "UTF-8";

	public String inputStreemToString(InputStream in) throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(in, characterEncoding));
		StringBuffer buf = new StringBuffer();
		String str;
		while ((str = reader.readLine()) != null) {
			if(str.startsWith(">")){
				buf.append(URLEncoder.encode(str, characterEncoding).replaceAll("\\+", " "));
			}
			else{
				buf.append(URLEncoder.encode(str, characterEncoding));
			}
			buf.append("\\n");
		}
		reader.close();
		return buf.toString();
	}

	public String replaceQseq(String in) throws IOException {
		StringReader strReader = new StringReader(in);
		BufferedReader bufReader = new BufferedReader(strReader);
		StringBuffer buf = new StringBuffer();
		String str;
		while((str = bufReader.readLine()) != null){
			if(str.startsWith(">")){
				buf.append(URLEncoder.encode(str, characterEncoding).replaceAll("\\+", " "));
			}
			else{
				buf.append(URLEncoder.encode(str, characterEncoding));
			}
			buf.append("\\n");
		}
		bufReader.close();
		return buf.toString();
	}

	public String replaceOnelineText(String in) throws IOException {
		return (null==in || in.isEmpty()) ? in : URLEncoder.encode(in, characterEncoding).replaceAll("\\+", " ");
	}

}
