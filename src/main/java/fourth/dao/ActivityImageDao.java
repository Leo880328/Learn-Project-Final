package fourth.dao;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.regex.Matcher;

import org.springframework.stereotype.Repository;

import fourth.bean.Base64FileBean;

@Repository
public class ActivityImageDao {

	private String staticPath = getStaticPath();
	private String path = "ActivityResources"+File.separator+"images" +File.separator;

	private String getStaticPath() {
		String path = this.getClass().getClassLoader().getResource("").getPath();
		path = path.substring(1).replaceAll("target", "src").replaceAll("classes", "main") + "resources"
				+ File.separator + "static" + File.separator;
		path = path.replaceAll("/", Matcher.quoteReplacement(File.separator));
		return path;
	}

	public String saveBase64Image(Base64FileBean base64FileBean) {
		if (base64FileBean.haveNull()) {
			return null;
		}
		// 讀取編碼，並進行分解，並解碼
		Decoder decoder = Base64.getDecoder();
		String base64Image = base64FileBean.getBase64().split(",")[1];
		byte[] decode = decoder.decode(base64Image);

		// 取得相對路徑
		String path = this.path+ base64FileBean.getFileName() + "." + base64FileBean.getFileType();
		// 創建檔案寫入絕對路徑
		File file = new File(staticPath + path);
		try (OutputStream outputStream = new BufferedOutputStream(new FileOutputStream(file))) {
			outputStream.write(decode);
		} catch (IOException e) {
			return null;
		}
		// 返還相對路徑路徑
		return path;
	}

	public boolean delectFile(Base64FileBean base64FileBean) {
		String path = this.path+ base64FileBean.getFileName() + "." + base64FileBean.getFileType();
		return delectFile( path);
	}

	public boolean delectFile(String filePath) {
		File file = new File(this.staticPath+filePath);
//		判斷是否擁有檔案有的話刪除
		if (file.exists() && file.delete()) {
			return true;
		}
		return false;
	}

}
