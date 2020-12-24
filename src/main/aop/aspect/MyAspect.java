package main.aop.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;

public class MyAspect {
	public void before(JoinPoint point) {
		System.out.println("call MyAspect.before!" + point.getSignature().getName());
	}

	public void after(JoinPoint point) {
		System.out.println("call MyAspect.after!" + point.getSignature().getName());
	}
	
	
	public void afterReturning(Object retVal){
		System.out.println("call MyAspect.afterReturning! return Value:" + retVal);
	}
	
	public void afterThrowing(Exception ex) {
		
		System.out.println("call MyAspect.afterThrowing! Exception:" + ex.getMessage());
	}
	
    public Object around(ProceedingJoinPoint pjp) throws Throwable
    {
        System.out.println("call around start-" + pjp.getSignature().getName());
        Object obj=pjp.proceed();
        System.out.println("call around end-" + pjp.getSignature().getName());
        return obj;
    }
}
