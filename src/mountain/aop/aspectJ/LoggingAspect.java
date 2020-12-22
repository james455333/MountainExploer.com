package mountain.aop.aspectJ;

import java.lang.reflect.Field;
import java.util.Arrays;

import java.util.logging.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {
	@Before("execution(* main.generic.service.GenericService.*(..))")
    public void before(JoinPoint joinPoint) {   
		
        Object target = joinPoint.getTarget();
        String methodName = joinPoint.getSignature().getName();
        Object[] args = joinPoint.getArgs();
        Logger.getLogger(target.getClass().getName())
              .info(String.format("%s.%s(%s)",
                target.getClass().getName(), methodName, Arrays.toString(args)));
    }
	
	@AfterThrowing(pointcut = "execution(* main.generic.service.GenericService.*(..))",throwing = "error")
	public void logAfterThrowing(JoinPoint joinPoint, Throwable error) {
		
		Object target = joinPoint.getTarget();
        String methodName = joinPoint.getSignature().getName();
        Object[] args = joinPoint.getArgs();
        Logger.getLogger(target.getClass().getName())
        	.info(String.format("Class : [ %s ] => method [ %s ] => arg [ %s ] => Error:[ %s ]",
        			target.getClass().getName(), methodName,Arrays.toString(args), error));
	}
	@AfterThrowing(pointcut = "execution(* mountain..*.*(..))",throwing = "error")
	public void logMountaiAllAfterThrowing(JoinPoint joinPoint, Throwable error) {
		
		Object target = joinPoint.getTarget();
		String methodName = joinPoint.getSignature().getName();
		Object[] args = joinPoint.getArgs();
		Logger.getLogger(target.getClass().getName())
		.info(String.format("Class : [ %s ] => method [ %s ] => \n arg [ %s ] => Error:[ %s ]",
				target.getClass().getName(), methodName,Arrays.toString(args), error));
		System.out.println("args field print : START");
		System.out.println("==============================");
		if (args != null && args.length>0) {
			Integer i = 0;
			for (Object object : args) {
				if(object!=null) continue;
				System.out.println("No." + (++i) + " arg : " + object.toString());
				Field[] fields = object.getClass().getFields();
				if (fields != null && fields.length>0) {
					for (Object object2 : args) {
						System.out.println("args field : " + object2.toString());
					}
				}else {
					System.out.println("***---Can't find args field---***");
				}
			}
			System.out.println("==============================");
			System.out.println("args field print : END");
		}
		
	}
	@AfterThrowing(pointcut = "execution(* main.generic..*.*(..))",throwing = "error")
	public void logGenericAfterThrowing(JoinPoint joinPoint, Throwable error) {
		
		Object target = joinPoint.getTarget();
		String methodName = joinPoint.getSignature().getName();
		Object[] args = joinPoint.getArgs();
		Logger.getLogger(target.getClass().getName())
		.info(String.format("Class : [ %s ] => method [ %s ] => \n arg [ %s ] => Error:[ %s ]",
				target.getClass().getName(), methodName,Arrays.toString(args), error));
		System.out.println("args field print : START");
		System.out.println("==============================");
		if (args != null && args.length > 0) {
			Integer i = 0;
			for (Object object : args) {
				System.out.println("No." + (++i) + " arg : " + object.toString());
				Field[] fields = object.getClass().getFields();
				for (Object object2 : args) {
					System.out.println("args field name : " + object2.toString());
				}
			}
			System.out.println("==============================");
			System.out.println("args field print : END");
		}
		
	}
	
}
