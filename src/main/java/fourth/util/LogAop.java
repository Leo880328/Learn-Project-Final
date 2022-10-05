//package fourth.util;
//
//import java.util.Arrays;
//
//import org.aspectj.lang.JoinPoint;
//import org.aspectj.lang.ProceedingJoinPoint;
//import org.aspectj.lang.annotation.After;
//import org.aspectj.lang.annotation.AfterReturning;
//import org.aspectj.lang.annotation.AfterThrowing;
//import org.aspectj.lang.annotation.Around;
//import org.aspectj.lang.annotation.Aspect;
//import org.aspectj.lang.annotation.Before;
//import org.aspectj.lang.annotation.Pointcut;
//import org.springframework.stereotype.Component;
//
//
//@Aspect
//@Component
//public class LogAop {
//	// 切点(第一个*表示返回值，第二个*表示任意类，第三个*表示任意方法，(..)表示任意参数)
//	@Pointcut("execution(* fourth.service.CartService.*(..))")
//	public void demo() {
//	}
//
//	// 前置通知
//	@Before("demo()")
//	public void before(JoinPoint joinPoint) {
//		Object[] args = joinPoint.getArgs();
//		String name = joinPoint.getSignature().getName();
//		System.out.println(name +"方法開始執行   參數為: " + Arrays.toString(args) + "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//	}
//
//	// 后置通知
//	@After("demo()")
//	public void after(JoinPoint joinPoint) {
//		String name = joinPoint.getSignature().getName();
//		System.out.println(name + "方法执行结束................................");
//	}
//
//	// 返回通知
//	@AfterReturning(value = "demo()", returning = "result")
//	public void afterReturning(JoinPoint joinPoint, Object result) {
//		String name = joinPoint.getSignature().getName();
//		System.out.println(name + "方法返回值为: " + result+"...........................................");
//	}
//
//	// 异常通知
//	@AfterThrowing(value = "demo()", throwing = "e")
//	public void afterThrowing(JoinPoint joinPoint, Exception e) {
//		String name = joinPoint.getSignature().getName();
//		System.out.println(name + "方法发生异常，异常是: " + e.getMessage());
//		
//	}
//
//	// 环绕通知
//	@Around("demo()")
//	public Object around(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
//		return proceedingJoinPoint.proceed();
//	}
//
//}
