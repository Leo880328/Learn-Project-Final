package fourth.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fourth.bean.Base64FileBean;
import fourth.dao.ActivityImageDao;

@Service
public class ActivityImageService {
	
	@Autowired
	private ActivityImageDao activityImageDao;
	
	public String saveBase64Img(Base64FileBean base64FileBean) {
		if (base64FileBean.haveNull()) {
			return null;
		}
		return activityImageDao.saveBase64Image(base64FileBean);
	}
	
	public boolean delectImg(Base64FileBean base64FileBean) {
		if(base64FileBean.haveNull()) {
			return false;
		}
		return activityImageDao.delectFile(base64FileBean);
	}
	
	public boolean deleteImg(String path) {
		return activityImageDao.delectFile(path);
	}

}
