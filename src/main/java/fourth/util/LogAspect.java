package fourth.util;

import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.NamedThreadLocal;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import fourth.bean.Log;
import fourth.bean.MemberBean;
import fourth.service.LogService;
import fourth.service.MemberService;

@Aspect
@Component
public class LogAspect {
	 private static Logger logger = LoggerFactory.getLogger(LogAspect.class);
	    
	    private static final ThreadLocal<Date> beginTimeThreadLocal = new NamedThreadLocal<Date>("ThreadLocal beginTime");
	    private static final ThreadLocal<Log> logThreadLocal =  new NamedThreadLocal<Log>("ThreadLocal log");

	    private static final ThreadLocal<MemberBean> currentUser=new NamedThreadLocal<>("ThreadLocal user");
	    
	    @Autowired(required=false)
	    HttpServletRequest request;

	    @Autowired
	    ThreadPoolTaskExecutor threadPoolTaskExecutor;
	    
	    @Autowired
	    LogService logService;
	    
	    @Autowired
	    MemberService memberService;
	    
//	    @Autowired
//	    RedisUtil redisUtil;
	    
	    /**
	     * Service層切點
	     */
//	    @Pointcut("@annotation(com.isoftstone.api.common.log.target.SystemServiceLog)")
//	    public void serviceAspect(){}
	    
	    /**
	     * Controller層切點 註解攔截
	     */
	    @Pointcut("@annotation(fourth.util.SystemControllerLog)")
	    public void controllerAspect(){}
	    
	    /*@Pointcut("execution(* com.isoftstone.api.*.controller.*.*(..))")
	    public void controllerPointerCut(){}*/

	    /**
	     * 前置通知 用於攔截Controller層記錄用戶的操作的開始時間
	     * @param joinPoint 切點
	     * @throws InterruptedException
	     */
	    @Before("controllerAspect()")
	    public void doBefore(JoinPoint joinPoint) throws InterruptedException{
	        
	        logger.info("進入日誌切面前置通知!!");
	        Date beginTime=new Date();
	        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
	        beginTimeThreadLocal.set(beginTime);//線程綁定變量（該數據只有當前請求的線程可見）  
	        if (logger.isDebugEnabled()){//這裏日誌級別爲debug
	            logger.debug("開始計時: {}  URI: {}", simpleDateFormat
	                .format(beginTime), request.getRequestURI());
	        }

	        //讀取session中的用戶
	        HttpSession session = request.getSession();       
	        MemberBean user = (MemberBean) session.getAttribute("user");    
//	        Users user=UserUtils.getUser(redisUtil);
	        currentUser.set(user);

	    }

	    /**
	     * 後置通知 用於攔截Controller層記錄用戶的操作
	     * @param joinPoint 切點
	     * @throws Exception 
	     */
	    @After("controllerAspect()")
	    public void doAfter(JoinPoint joinPoint) throws Exception {
	        logger.info("進入日誌切面後置通知!!");
	        MemberBean user = currentUser.get();
	        
	        if(user !=null){
	            String title="";
	            String type="info";                       //日誌類型(info:入庫,error:錯誤)
	            String remoteAddr=request.getRemoteAddr();//請求的IP
	            String requestUri=request.getRequestURI();//請求的Uri
	            String method=request.getMethod();        //請求的方法類型(post/get)
//	            Map<String,String[]> params=request.getParameterMap(); //請求提交的參數
	            String methodName = joinPoint.getSignature().getName();
	            Object[] args = joinPoint.getArgs();
	            String setParams = setParams(args);
	            
	            try {
	            	title=getControllerMethodDescription2(joinPoint);
	            	if("updateOrder".equalsIgnoreCase(methodName)) {
	            		
	            		if("2".equalsIgnoreCase(args[0].toString())) {
	            			title = "會員完成訂單付款";
	            		}
	            		if("3".equalsIgnoreCase(args[0].toString())) {
	            			title = "會員申請退款";
	            		}
	            		if("4".equalsIgnoreCase(args[0].toString())) {
	            			title = "更改訂單狀態為完成";
	            		}
	            		if("5".equalsIgnoreCase(args[0].toString())) {
	            			title = "更改訂單狀態為退款";
	            		}
	            		if("6".equalsIgnoreCase(args[0].toString())) {
	            			title = "更改訂單狀態為駁回";
	            		}
	            	}
	            } catch (Exception e) {
	                e.printStackTrace();
	            }    
	            // 打印JVM信息。
	            long beginTime = beginTimeThreadLocal.get().getTime();//得到線程綁定的局部變量（開始時間）  
	            long endTime = System.currentTimeMillis();  //2、結束時間  
//	            if (logger.isDebugEnabled()){
//	                logger.debug("計時結束：{}  URI: {}  耗時： {}   最大內存: {}m  已分配內存: {}m  已分配內存中的剩餘空間: {}m  最大可用內存: {}m",
//	                        new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(endTime),
//	                        request.getRequestURI(),
//	                        DateUtils.formatDateTime(endTime - beginTime),
//	                        Runtime.getRuntime().maxMemory()/1024/1024,
//	                        Runtime.getRuntime().totalMemory()/1024/1024,
//	                        Runtime.getRuntime().freeMemory()/1024/1024,
//	                        (Runtime.getRuntime().maxMemory()-Runtime.getRuntime().totalMemory()+Runtime.getRuntime().freeMemory())/1024/1024);
//	            }
	            logger.info("設置日誌信息存儲到表中!!");
	            UUID uuid = UUID.randomUUID();
	            Log log=new Log();
	            log.setLogId(uuid.toString());
	            log.setTitle(title);
	            log.setType(type);
	            log.setRemoteAddr(remoteAddr);
	            log.setRequestUri(requestUri);
	            log.setMethod(method);
//	            log.setMapToParams(params);
	            log.setParams(setParams);
	            log.setException("無異常!");
	            log.setUserId(String.valueOf(user.getuserId()));
	            Date operateDate=beginTimeThreadLocal.get();
	            log.setOperateDate(operateDate);
	            log.setTimeout(DateUtil.secondToTime(endTime-beginTime));

	            MemberBean member = memberService.checkLogin(user.getAccount());
	            
	            log.setMemberBean(member);
	            //1.直接執行保存操作
	            this.logService.saveLog(log);

	            //2.優化:異步保存日誌
	            //new SaveLogThread(log, logService).start();

	            //3.再優化:通過線程池來執行日誌保存
//	            threadPoolTaskExecutor.execute(new SaveLogThread(log, logService));
//	            logThreadLocal.set(log);
	        }

	    }
	    
        private String setParams(Object[] args) {
        	int length = args.length;
        	int count = 0;
        	 StringBuilder sb = new StringBuilder();
			 for(Object o : args) {
				 if(o != null) {
					 if(o.getClass().getTypeName().equalsIgnoreCase("org.springframework.validation.support.BindingAwareModelMap") || o.getClass().getTypeName().equalsIgnoreCase("org.springframework.security.web.servletapi.HttpServlet3RequestFactory$Servlet3SecurityContextHolderAwareRequestWrapper")) {
						 count++;
						 continue;
					 }
					 String param =o.toString()+",";
					 if(count == length - 1) {
						 param = o.toString();
					 }
					 sb.append(param);
				 }
		     	count++;
		     }
			 String[] split = sb.toString().split(",");
			 String params="";
			 for(int i = 0 ; i < split.length; i++) {
				 if(i == split.length - 1) {
					 params += split[i];
				 }else {
					 params += split[i] + ", ";
				 }
			 }
			 return params;
		}

//	    @AfterReturning(returning = "res", pointcut = "controllerAspect()")
//	    public void doAfterReturning(Object res) throws Throwable {
//	        // 處理完請求，返回內容
//	        logger.info("==========返回參數日誌=========");
//	        logger.info("返回接口響應參數:"+JsonUtils.obj2JSON(res));
//	        Log log = logThreadLocal.get();
//	        if (log!=null) {
//	            log.setResultParams(JsonUtils.obj2JSON(res));
//	            logger.info("==========更新日誌參數=========");
//	            new UpdateLogThread(log, logService).start();
//	        }
//	    }

	    /**
	     *  異常通知 記錄操作報錯日誌
	     * @param joinPoint
	     * @param e
	     */
	    @AfterThrowing(pointcut = "controllerAspect()", throwing = "e")  
	    public  void doAfterThrowing(JoinPoint joinPoint, Throwable e) {
	        logger.info("進入日誌切面異常通知!!");
	        logger.info("異常信息:"+e.getMessage());
	        Log log = logThreadLocal.get();
	        if (log!=null) {
	            log.setType("error");
	            log.setException(e.toString());
//	            new UpdateLogThread(log, logService).start();
	            logService.saveLog(log);
	        }
	    }

	    /**
	     * 獲取註解中對方法的描述信息 用於service層註解
	     * @param joinPoint切點
	     * @return discription
	     */
//	    public static String getServiceMthodDescription2(JoinPoint joinPoint) {
//	        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
//	        Method method = signature.getMethod();
//	        SystemServiceLog serviceLog = method.getAnnotation(SystemServiceLog.class);
//	        String discription = serviceLog.description();
//	        return discription;
//	    }

	    /**
	     * 獲取註解中對方法的描述信息 用於Controller層註解
	     *
	     * @param joinPoint 切點
	     * @return discription
	     */
	    public static String getControllerMethodDescription2(JoinPoint joinPoint) {
	        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
	        Method method = signature.getMethod();
	        SystemControllerLog controllerLog = method.getAnnotation(SystemControllerLog.class);
	        String discription = controllerLog.description();
	        return discription;
	    }

//	    /**
//	     * 保存日誌線程
//	     */
//	    private static class SaveLogThread implements Runnable {
//	        private Log log;
//	        private LogService logService;
//
//	        public SaveLogThread(Log log, LogService logService) {
//	            this.log = log;
//	            this.logService = logService;
//	        }
//
//	        @Override
//	        public void run() {
//	            logService.addLog(log);
//	        }
//	    }
//
//	    /**
//	     * 日誌更新線程
//	     */
//	    private static class UpdateLogThread extends Thread {
//	        private Log log;
//	        private LogService logService;
//
//	        public UpdateLogThread(Log log, LogService logService) {
//	            super(UpdateLogThread.class.getSimpleName());
//	            this.log = log;
//	            this.logService = logService;
//	        }
//
//	        @Override
//	        public void run() {
//	            this.logService.putLog(log);
//	        }
//	    }
//	   

	   
}
