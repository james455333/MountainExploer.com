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
    public void beforeService(JoinPoint joinPoint) {   
		
        Object target = joinPoint.getTarget();
        String methodName = joinPoint.getSignature().getName();
        Object[] args = joinPoint.getArgs();
        Logger.getLogger(target.getClass().getName())
              .info(String.format("%s.%s(%s)",
                target.getClass().getName(), methodName, Arrays.toString(args)));
    }
	@Before("execution(* main.generic.dao.GenericDAO.*(..))")
	public void beforeDAO(JoinPoint joinPoint) {   
		
		Object target = joinPoint.getTarget();
		String methodName = joinPoint.getSignature().getName();
		Object[] args = joinPoint.getArgs();
		Logger.getLogger(target.getClass().getName())
		.info(String.format("%s.%s(%s)",
				target.getClass().getName(), methodName, Arrays.toString(args)));
	}
	@Before("execution(* mountain.controller..*.*(..))")
	public void before(JoinPoint joinPoint) {   
		
		Object target = joinPoint.getTarget();
		String methodName = joinPoint.getSignature().getName();
		Object[] args = joinPoint.getArgs();
		Logger.getLogger(target.getClass().getName())
		.info(String.format("%s.%s(%s)",
				target.getClass().getName(), methodName, Arrays.toString(args)));
	}
	
	@AfterThrowing(pointcut = "execution(* mountain.controller..*.*(..))",throwing = "error")
	public void logMountaiAllAfterThrowing(JoinPoint joinPoint, Throwable error) {
		
		Object target = joinPoint.getTarget();
		String methodName = joinPoint.getSignature().getName();
		Object[] args = joinPoint.getArgs();
		Logger.getLogger(target.getClass().getName())
		.info(String.format("Class : [ %s ] => method [ %s ] => \n arg [ %s ] => Error:[ %s ]",
				target.getClass().getName(), methodName,Arrays.toString(args), error));
	}
	@AfterThrowing(pointcut = "execution(* main.generic..*.*(..))",throwing = "error")
	public void logGenericAfterThrowing(JoinPoint joinPoint, Throwable error) {
		Object target = joinPoint.getTarget();
		String methodName = joinPoint.getSignature().getName();
		Object[] args = joinPoint.getArgs();
		Logger.getLogger(target.getClass().getName())
		.info(String.format("Class : [ %s ] => method [ %s ] => \n arg [ %s ] => Error:[ %s ]",
				target.getClass().getName(), methodName,Arrays.toString(args), error));
		
		
	}
	
}
