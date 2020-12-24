package main.aop.aspect;

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
	
	@Before("execution(* main.generic.service..*(..))")
    public void beforeService(JoinPoint joinPoint) {   
		
        Object target = joinPoint.getTarget();
        String methodName = joinPoint.getSignature().getName();
        Object[] args = joinPoint.getArgs();
        Logger.getLogger(target.getClass().getName())
              .info(String.format("Class[ %s ] =>\t Method [ %s ]\narg [ %s ]\n",
                target.getClass().getName(), methodName, Arrays.toString(args)));
    }
//	@Before("execution(* main.generic.dao.GenericDAO.*(..))")
//	public void beforeDAO(JoinPoint joinPoint) {   
//		
//		Object target = joinPoint.getTarget();
//		String methodName = joinPoint.getSignature().getName();
//		Object[] args = joinPoint.getArgs();
//		Logger.getLogger(target.getClass().getName())
//		.info(String.format("Class[ %s ] =>\t Method [ %s ]\narg [ %s ]\n",
//				target.getClass().getName(), methodName, Arrays.toString(args)));
//	}
	@Before("execution(* mountain.controller..*.*(..))")
	public void beforeController(JoinPoint joinPoint) {   
		
		Object target = joinPoint.getTarget();
		String methodName = joinPoint.getSignature().getName();
		Object[] args = joinPoint.getArgs();
		Logger.getLogger(target.getClass().getName())
		.info(String.format("Class[ %s ] =>\t Method [ %s ]\narg [ %s ]\n",
				target.getClass().getName(), methodName, Arrays.toString(args)));
	}
	
	@AfterThrowing(pointcut = "execution(* mountain.controller..*.*(..))",throwing = "error")
	public void logMountaiAllAfterThrowing(JoinPoint joinPoint, Throwable error) {
		
		Object target = joinPoint.getTarget();
		String methodName = joinPoint.getSignature().getName();
		Object[] args = joinPoint.getArgs();
		Logger.getLogger(target.getClass().getName())
		.warning(String.format("Class : [ %s ] =>\t method [ %s ]\narg [ %s ] =>\t Error:[ %s ]\n",
				target.getClass().getName(), methodName,Arrays.toString(args), error));
	}
	@AfterThrowing(pointcut = "execution(* main.generic..*.*(..))",throwing = "error")
	public void logGenericServiceAfterThrowing(JoinPoint joinPoint, Throwable error) {
		Object target = joinPoint.getTarget();
		String methodName = joinPoint.getSignature().getName();
		Object[] args = joinPoint.getArgs();
		Logger.getLogger(target.getClass().getName())
		.warning(String.format("Class : [ %s ] =>\t method [ %s ] => \n arg [ %s ] =>\t Error:[ %s ]\n",
				target.getClass().getName(), methodName,Arrays.toString(args), error));
		
		
	}
	
}
