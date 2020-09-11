package jp.ac.nig.ddbj.vecscreen.request;


/** POSTメソッドでBLASTのWebAPIを呼び出す時に用いられる入力データを表す.
 * 
 * 
 */
public class VecscreenRequest {

	String querySequence  = null;
	String database       = null;
	String parameters     = null;
	String format         = null;
	String result         = null;
	String address        = null;
	String language_code  = null;
	String language_code2 = null;


	public String getQuerySequence() {
		return querySequence;
	}
	public void setQuerySequence(String querySequence) {
		this.querySequence = querySequence;
	}

	public String getDatabase() {
		return database;
	}
	public void setDatabase(String database) {
		this.database = database;
	}
	public String getParameters() {
		return parameters;
	}
	public void setParameters(String parameters) {
		this.parameters = parameters;
	}
	public String getFormat() {
		return format;
	}
	public void setFormat(String format) {
		this.format = format;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLanguage() {
		return language_code;
	}
	public void setLanguage(String language_code) {
		this.language_code = language_code;
	}
	public String getLanguage2() {
		return language_code2;
	}
	public void setLanguage2(String language_code2) {
		this.language_code2 = language_code2;
	}


}
