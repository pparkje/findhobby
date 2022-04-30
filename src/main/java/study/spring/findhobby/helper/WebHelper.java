/*
 * 	@filename 		: WebHelper.java
 * 	@description 	: 가상의 view를 만들어 주기 위한 WebHelper 클래스
 * 	@author			: 박재현(forthu12@gmail.com)
 */

package study.spring.findhobby.helper;

import java.io.File;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.AbstractView;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.Thumbnails.Builder;
import net.coobird.thumbnailator.geometry.Positions;

@Slf4j
public class WebHelper {
	
	private String encType;

	private HttpServletRequest request;

	private HttpServletResponse response;
	
	private String uploadDir;
	
	private String uploadPath;
	
	public String getUploadDir() {
		return uploadDir;
	}

	public void setUploadDir(String uploadDir) {
		this.uploadDir = uploadDir;
	}

	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	public void init(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;

		String methodName = request.getMethod();
		String url = request.getRequestURL().toString();
		String queryString = request.getQueryString();

		if (queryString != null) {
			url = url + "?" + queryString;
		}
		log.debug(String.format("[%s] %s", methodName, url));

		try {
			this.request.setCharacterEncoding(this.encType);
			this.response.setCharacterEncoding(this.encType);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getEncType() {
		return encType;
	}

	public void setEncType(String encType) {
		this.encType = encType;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	/***/
	public ModelAndView redirect(String url, String msg) {
		
		log.debug(String.format(" --> [redirect] %s >> %s" ,url ,msg));

		// 가상의 View로 만들기 위한 HTML 태그 구성
		String html = "<!doctype html>";
		html += "<html>";
		html += "<head>";
		html += "<meta charset='" + this.encType + "'>"; 

		if (msg != null) {
			html += "<script type='text/javascript'>alert('" + msg + "');</script>";
		}
		
		if (url != null) {
			html += "<meta http-equiv='refresh' content='0; url=" + url + "' />";
		} else {
			html += "<script type='text/javascript'>history.back();</script>";
		}

		html += "</head>";
		html += "<body></body>";
		html += "</html>";
		
		return this.virtualView(html);

	}
	
	public ModelAndView redirectA(String url, String msg) {
		
		log.debug(String.format(" --> [redirect] %s >> %s" ,url ,msg));

		// 가상의 View로 만들기 위한 HTML 태그 구성
		String html = "<!doctype html>";
		html += "<html>";
		html += "<head>";
		html += "<meta charset='" + this.encType + "'>";

		if (url != null) {
			html += "<meta http-equiv='refresh' content='0; url=" + url + "' />";
		} else {
			html += "<script type='text/javascript'>history.back();</script>";
		}

		html += "</head>";
		html += "<body></body>";
		html += "</html>";
		
		return this.virtualView(html);

	}
	public ModelAndView virtualView(final String body) {
		
		View view = new AbstractView() {
			
			@Override
			protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
					HttpServletResponse response) throws Exception {
				
				PrintWriter out = response.getWriter();
				out.println(body);
				out.flush();
				
			}
		}; 
			

		return new ModelAndView(view);
	}
	
	public String getUploadUrl(String filePath) {
		
		File f = new File(this.uploadPath,filePath);
		
		String path = f.getPath();
		
		return path.replace("\\","/");
	}
	
	public UploadItem saveMultipartFile(MultipartFile multipartFile) throws NullPointerException, Exception{
		
		UploadItem item = null;
		
		String orginName = multipartFile.getOriginalFilename();
		
		if(orginName.isEmpty()) {			
			throw new NullPointerException("업로드 된 파일이 없음.");
		}
		
		String ext = orginName.substring(orginName.lastIndexOf("."));
		String fileName = null;
		File targetFile = null;
		int count = 0;
		
		while(true) {
			fileName = String.format("%d%d%s", System.currentTimeMillis(),count,ext);
			targetFile = new File(this.uploadDir,fileName);
			
			if(!targetFile.exists()) {
				break;
				
			}
			count++;
		}
		
		multipartFile.transferTo(targetFile);
		
		String absPath = targetFile.getAbsolutePath().replace("\\", "/");
		String filePath = absPath.replace(this.uploadDir, "");
		
		item = new UploadItem();
		item.setContentType(multipartFile.getContentType());
		item.setFieldName(multipartFile.getName());
		item.setFileSize(multipartFile.getSize());
		item.setOrginName(orginName);
		item.setFilePath(filePath);
		
		String fileUrl = this.getUploadUrl(filePath);
		item.setFileUrl(fileUrl);
		
		return item;
		
	}

	public String createThumbnail(String path,int width, int height, boolean crop) throws Exception{
		
		log.debug(String.format("[Thumbnail] path: %s, size: %dx%d, crop: %s", path,width,height,String.valueOf(crop)));
		
		File loadFile = new File(this.uploadDir, path);
		String dirPath = loadFile.getParent();
		String fileName = loadFile.getName();
		int p = fileName.lastIndexOf(".");
		String name = fileName.substring(0 , p);
		String ext = fileName.substring(p + 1);
		String prefix = crop ? "_crop_" : "_resize_";
		
		String thumbName = name + prefix + width + "x" + height + "." + ext;
		
		File f = new File(dirPath,thumbName);
		String saveFile = f.getAbsolutePath();
		
		log.debug(String.format("[Thumbnail] saveFile: %s", saveFile));
		
		if(!f.exists()) {
			Builder<File> builder = Thumbnails.of(loadFile);
			
			if(crop == true) {
				builder.crop(Positions.CENTER);
			}
			
			builder.size(width, height);
			builder.useExifOrientation(true);
			builder.outputFormat(ext);
			builder.toFile(saveFile);
		}
		
		saveFile = saveFile.replace("\\", "/").replace(this.uploadDir, "");
		
		return saveFile;
	
	}
	
	/**
     * 컨트롤러로부터 업로드 된 파일의 정보를 전달받아 지정된 위치에 저장한다.
     * @param uploadFiles               업로드 된 파일 정보
     * @return                          파일 정보를 담고 있는 객체들을 저장하는 컬렉션
     * @throws NullPointerException     업로드 된 파일이 없는 경우
     * @throws Exception                파일 저장에 실패한 경우
     */
    public List<UploadItem> saveMultipartFile(MultipartFile[] uploadFiles) throws NullPointerException, Exception {

        if (uploadFiles.length < 1) {
            throw new NullPointerException("업로드 된 파일이 없음.");
        }

        List<UploadItem> uploadList = new ArrayList<UploadItem>();

        for (int i=0; i<uploadFiles.length; i++) {
            try {
                UploadItem item = this.saveMultipartFile(uploadFiles[i]);
                uploadList.add(item);
            } catch (NullPointerException e) {
                log.error(String.format("%d번째 항목이 업로드 되지 않음", i));
            } catch (Exception e) {
                log.error(String.format("%d번째 항목 저장 실패 ::: %s", e.getLocalizedMessage()));
            }
        }

        if (uploadList.size() == 0) {
            throw new Exception("업로드 실패");
        }

        return uploadList;
    }	
	
	
	
	

	public Map<String, Object> getJsonData(int statusCode, String rt, Map<String, Object> data){
		response.setContentType("application/json");
		response.setStatus(statusCode);
		
		this.response.setHeader("Access-Control-Allow-Methods", "POST, GET, PUT,DELETE");
		this.response.setHeader("Access-Control-Max-Age", "3600");
		this.response.setHeader("Access-Control-Allow-Headers", "x-requested-with");
		this.response.setHeader("Access-Control-Allow-Origin", "*");
		
		Calendar c = Calendar.getInstance();
		String pubData = String.format("%04d-%02d-%02d %02d:%02d:%02d", c.get(Calendar.YEAR),c.get(Calendar.MONTH)+1, c.get(Calendar.DAY_OF_MONTH),
										c.get(Calendar.HOUR_OF_DAY),c.get(Calendar.MINUTE),c.get(Calendar.SECOND));
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("rt", rt);
		map.put("pubData", pubData);
		
		if(data != null) {
			map.putAll(data);
		}
		
		return map;
	}
	
	
	public Map<String, Object> getJsonData(Map<String, Object> data){
		
		return this.getJsonData(200, "OK", data);
	}
	
	public Map<String, Object> getJsonData(){
		
		return this.getJsonData(200, "OK", null);
	}
	
	public Map<String, Object> getJsonError(String rt){
		
		return this.getJsonData(500, rt, null);
	}
	public Map<String, Object> getJsonWarning(String rt){
		
		return this.getJsonData(400, rt, null);
	}
	
}
