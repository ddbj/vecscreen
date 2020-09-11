package jp.ac.nig.ddbj.vecscreen.controller;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import jp.ac.nig.ddbj.vecscreen.request.VecscreenRequest;
import jp.ac.nig.ddbj.vecscreen.search.VecscreenSearchInfo;
import jp.ac.nig.ddbj.vecscreen.util.Conf;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class VecscreenWebPageController {

//	public static final Map<String,String> blastDatabaseGroup = new HashMap<String,String>();

	private static Pattern patternPermittedRemoteAddrTestSecurityApplicationScanPage = Pattern.compile(Conf.patternPermittedRemoteAddrTestSecurityApplicationScanPage);

	/**
	 * HTTP 404 Not Found を通知する用途
	 */
	private static class NotFoundException extends Exception {
		// Note: とくに実装なし。
	}

	/**
	 * HTTP 400 Bad Request を通知する用途
	 */
	private static class BadRequestException extends Exception {
		// Note: とくに実装なし。
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		/*
		 * Note: 脆弱性対策
		 * 不正なパラメータを指定された時に HTTP 500 エラーになっていたので、
		 * それを回避するために、有効なパラメータ名を列挙して指定しておく。
		 */
		binder.setAllowedFields("lang",
								"language_code", "language_code2", "up_file", "qseq", "result", "address", "database",
								"querySequence", "database", "parameters", "format", "result", "address",
								"id", "format", "info", "id", "language_code", "language_code2", "id");
	}

	public VecscreenWebPageController() {
	}

	@RequestMapping(value={"/vecscreen", "/"})
	public ModelAndView showVecscreenPage(@RequestParam(value="lang",defaultValue="en")  String lang, ModelMap model) {
		if (lang.equals("ja")) {
			model.addAttribute("program_title", "VecScreen");
			
			model.addAttribute("language_chooser_label", "English");
			model.addAttribute("language_chooser_url", "vecscreen?lang=en");
			
			// http://www.ddbj.nig.ac.jp/index-j.html などの"j"の部分。
			model.addAttribute("language_code", "j");
			model.addAttribute("language_code2", "ja");
		}
		else {
			model.addAttribute("program_title", "VecScreen");
			model.addAttribute("language_chooser_label", "Japanese");
			model.addAttribute("language_chooser_url", "vecscreen?lang=ja");
			
			model.addAttribute("language_code", "e");
			model.addAttribute("language_code2", "en");
		}
		
		return new ModelAndView("vecscreen", model);
	}


	@RequestMapping(value="/viewer")
	public ModelAndView showSearchPage(@RequestParam(value="lang",defaultValue="en")  String lang, ModelMap model) {
		if (lang.equals("ja")) {
			model.addAttribute("program_title", "Result viewer");
			model.addAttribute("language_chooser_label", "English");
			model.addAttribute("language_chooser_url", "viewer?lang=en");

			// http://www.ddbj.nig.ac.jp/index-j.html などの"j"の部分。
			model.addAttribute("language_code", "j");
			model.addAttribute("language_code2", "ja");

		}
		else {
			model.addAttribute("program_title", "Result viewer");
			model.addAttribute("language_chooser_label", "Japanese");
			model.addAttribute("language_chooser_url", "viewer?lang=ja");

			model.addAttribute("language_code", "e");
			model.addAttribute("language_code2", "en");
		}

		return new ModelAndView("vecscreen_viewer", model);
	}

	
	@RequestMapping(value="/report", method=RequestMethod.POST)
	public ModelAndView showReportPage(
		@RequestParam("language_code") String language_code,
		@RequestParam("language_code2") String language_code2,
		@RequestParam("up_file") MultipartFile file,
		@RequestParam("qseq") String qseq,
		@RequestParam("result") String result,
		@RequestParam("address") String address,
		@RequestParam("database") String database,
		@RequestParam("format") String format
		) throws IOException {

		VecscreenSearchInfo searchInfo = new VecscreenSearchInfo();	
		ModelMap model = new ModelMap();

		model.addAttribute("program_title", "VecScreen");

		//set language_code
		if (!("j".equals(language_code) ||
			  "e".equals(language_code))) {
			language_code = "e";
		}
		model.addAttribute("language_code", language_code);

		//set language_code2
		if (!("ja".equals(language_code2) ||
			  "en".equals(language_code2))) {
			language_code2 = "en";
		}
		model.addAttribute("language_code2", language_code2);
		
		//set querySequence
		String strFile = "";
		String strQseq = "";
		if(!file.isEmpty())
			strFile = searchInfo.inputStreemToString(file.getInputStream());
		if(!("".equals(qseq) || qseq == null))
			strQseq = searchInfo.replaceQseq(qseq);
		model.addAttribute("querySequence", strFile + strQseq);

		//set result
		model.addAttribute("result", searchInfo.replaceOnelineText(result));

		//set address
		if("".equals(address) || address == null){
			model.addAttribute("address", "");
		}
		else{
			model.addAttribute("address", searchInfo.replaceOnelineText(address));
		}

		//set database
		model.addAttribute("database", searchInfo.replaceOnelineText(database));

		//set program
//		model.addAttribute("program", searchInfo.replaceOnelineText(program));

		//set parameters
		StringBuffer buf = new StringBuffer();
		buf.append("-f " + format);
		model.addAttribute("parameters", searchInfo.replaceOnelineText(buf.toString()));

		//set format
		model.addAttribute("format", "json");

		//return new ModelAndView("blast_report", model);
		if("www".equals(result)){
			return new ModelAndView("vecscreen_report", model);
		}
		else{
			return new ModelAndView("vecscreen_mail", model);
		}
	}

    @RequestMapping(value="/wabi", method=RequestMethod.POST)
	public ModelAndView post(@ModelAttribute VecscreenRequest request) {

		ModelMap model = new ModelMap();

		model.addAttribute("querySequence", request.getQuerySequence());
//		model.addAttribute("datasets", request.getDatasets());
		model.addAttribute("database", request.getDatabase());
//		model.addAttribute("program", request.getProgram());
		model.addAttribute("parameters", request.getParameters());
		model.addAttribute("format", request.getFormat());
		model.addAttribute("result", request.getResult());
		model.addAttribute("address", request.getAddress());
		model.addAttribute("language_code", request.getLanguage());
		model.addAttribute("language_code2", request.getLanguage2());

		return new ModelAndView("vecscreen_post", model);
	}

	@RequestMapping(value="/wabi/{id}", method=RequestMethod.GET)
	public ModelAndView get(@PathVariable("id") String requestId,
			@RequestParam(value="format", defaultValue="text")  String format,
			@RequestParam(value="info", defaultValue="status")  String info) throws IOException, BadRequestException {

		ModelMap model = new ModelMap();
		String viewName = "";
		model.addAttribute("requestId", requestId);

		boolean invalidInfo = false;
		if (info.equals("status")) {
			viewName = "vecscreen_status";
			model.addAttribute("format", format);
		}
		else if (info.equals("result")) {
			viewName = "vecscreen_result";
			model.addAttribute("info", info);
		}
		else if (info.equals("request")) {
			viewName = "vecscreen_request";
			model.addAttribute("info", info);
		}
		else {
			invalidInfo = true;
		}

		if (invalidInfo) {
			throw new BadRequestException();
		}

		return new ModelAndView(viewName, model);
	}

	@RequestMapping(value="/result", method=RequestMethod.POST)
	public ModelAndView showSearchPage(@RequestParam("id") String requestId,
			@RequestParam("language_code") String language_code,
			@RequestParam("language_code2") String language_code2) throws IOException {

		VecscreenSearchInfo searchInfo = new VecscreenSearchInfo();	
		ModelMap model = new ModelMap();

		if (!("j".equals(language_code) ||
			  "e".equals(language_code))) {
			language_code = "e";
		}
		if (!("ja".equals(language_code2) ||
			  "en".equals(language_code2))) {
			language_code2 = "en";
		}

		model.addAttribute("requestId", searchInfo.replaceOnelineText(requestId));
		model.addAttribute("language_code", language_code);
		model.addAttribute("language_code2", language_code2);
		model.addAttribute("program_title", "Result viewer");

		return new ModelAndView("search_result", model);
	}

	@RequestMapping(value="/{id}")
	public ModelAndView showSearchPage(@PathVariable("id") String requestId) {

		ModelMap model = new ModelMap();

		model.addAttribute("requestId", requestId);
		model.addAttribute("language_code", "j");
		model.addAttribute("language_code2", "ja");

		return new ModelAndView("search_result", model);
	}

	@RequestMapping(value="/test/security_application_scan", method=RequestMethod.GET)
	public String showSecurityApplicationScanPage(HttpServletRequest req) throws NotFoundException {
		if (!patternPermittedRemoteAddrTestSecurityApplicationScanPage.matcher(req.getRemoteAddr()).matches()) {
			throw new NotFoundException();
		}
		return "test.security_application_scan";
	}

	@ExceptionHandler
	@ResponseBody
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handlerException(NotFoundException e) {
		return "BLAST: The specified resource is not found.";
	}

	@ExceptionHandler
	@ResponseBody
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	public String handlerException(BadRequestException e) {
		return "BLAST: The specified resource is not found.";
	}

	// エラーページ
	@RequestMapping(value="/error")	
	public ModelAndView showErrorPage(@RequestParam(value="lang",defaultValue="en") String lang, ModelMap model) {
		if (lang.equals("ja")) {
			model.addAttribute("program_title", "VecScreen");
			
			model.addAttribute("language_chooser_label", "English");
			model.addAttribute("language_chooser_url", "vecscreen?lang=en");
			
			// http://www.ddbj.nig.ac.jp/index-j.html などの"j"の部分。
			model.addAttribute("language_code", "j");
			model.addAttribute("language_code2", "ja");
		}
		else {
			model.addAttribute("program_title", "VecScreen");
			model.addAttribute("language_chooser_label", "Japanese");
			model.addAttribute("language_chooser_url", "vecscreen?lang=ja");
			
			model.addAttribute("language_code", "e");
			model.addAttribute("language_code2", "en");
		}
		return new ModelAndView("error_page");
	}
	
}
