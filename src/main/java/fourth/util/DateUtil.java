package fourth.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class DateUtil {
	public static String dateMinusAndAddMonth(String str, int month) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date dt = sdf.parse(str);
		Calendar rightNow = Calendar.getInstance();
		rightNow.setTime(dt);
		rightNow.add(Calendar.MONTH, month);// 日期加3個月
		// rightNow.add(Calendar.DAY_OF_YEAR,10);//日期加10天
		Date dt1 = rightNow.getTime();
		String reStr = sdf.format(dt1);
		return reStr;
	}

	public static String dateMinusAndAddDay(Date date, int day) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		Date dt = sdf.parse(sdf.format(date));// 將字串生成Date
		Calendar rightNow = Calendar.getInstance();
		rightNow.setTime(dt);// 使用給定的 Date 設定此 Calendar 的時間。
		rightNow.add(Calendar.DAY_OF_YEAR, day);
		Date dt1 = rightNow.getTime();// 返回一個表示此 Calendar 時間值的 Date 物件。
		String reStr = sdf.format(dt1);// 將給定的 Date 格式化為日期/時間字串，並將結果新增到給定的 StringBuffer。
		return reStr;
	}

	public static String dateMinusAndAddDayyyyymmdd(String date, int day) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date dt = sdf.parse(date);// 將字串生成Date
		Calendar rightNow = Calendar.getInstance();
		rightNow.setTime(dt);// 使用給定的 Date 設定此 Calendar 的時間。
		rightNow.add(Calendar.DAY_OF_YEAR, day);
		Date dt1 = rightNow.getTime();// 返回一個表示此 Calendar 時間值的 Date 物件。
		String reStr = sdf.format(dt1);// 將給定的 Date 格式化為日期/時間字串，並將結果新增到給定的 StringBuffer。
		return reStr;
	}

	public static String dateMinusAndAddDaymmdd(String date, int day) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		Date dt = sdf.parse(date);// 將字串生成Date
		Calendar rightNow = Calendar.getInstance();
		rightNow.setTime(dt);// 使用給定的 Date 設定此 Calendar 的時間。
		rightNow.add(Calendar.DAY_OF_YEAR, day);
		Date dt1 = rightNow.getTime();// 返回一個表示此 Calendar 時間值的 Date 物件。
		String reStr = sdf.format(dt1);// 將給定的 Date 格式化為日期/時間字串，並將結果新增到給定的 StringBuffer。
		return reStr;
	}

	public static long differDay(Date start, Date end) throws Exception {

		long diff = end.getTime() - start.getTime();

		TimeUnit time = TimeUnit.DAYS;
		long diffrence = time.convert(diff, TimeUnit.MILLISECONDS);

		System.out.println("The difference in days is : " + diffrence);

		return diffrence;
	}

	public static long differDay(long start, long end) throws Exception {

		long diff = end - start;

		TimeUnit time = TimeUnit.DAYS;
		long diffrence = time.convert(diff, TimeUnit.MILLISECONDS);

		System.out.println("The difference in days is : " + diffrence);

		return diffrence;
	}

	

	public static String secondToTime(long second) {

			long days = second /86400;//轉換天數

		    second = second %86400;//剩餘秒數

		    long hours = second /3600;//轉換小時數

		    second = second %3600;//剩餘秒數

		    long minutes = second /60;//轉換分鐘

		    second = second %60;//剩餘秒數


		    return days +":"+hours+":"+minutes+":"+second;


		}

}
