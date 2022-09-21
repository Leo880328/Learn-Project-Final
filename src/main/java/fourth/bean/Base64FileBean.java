package fourth.bean;



import org.springframework.stereotype.Component;

@Component
public class Base64FileBean {
	
	private String fileType;
	
	private String fileName;
	
	private String base64;

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getBase64() {
		return base64;
	}

	public void setBase64(String base64) {
		this.base64 = base64;
	}
	
	
	public boolean haveNull() {
		if (fileName==null||fileType==null||base64==null) {
			return true;
		}
		return false;
	}
	public String  getNameAndType() {
		return this.fileName+"."+this.fileType;
	}

	@Override
	public String toString() {
		return "Base64FileBean [fileType=" + fileType + ", fileName=" + fileName + ", base64=" + base64 + "]";
	}



}
