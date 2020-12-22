package mountain.aop.aspectJ;

import java.util.Arrays;
import java.util.logging.Logger;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {
	@Before("execution(* member.model.MemberService.*(..))")
    public void before(JoinPoint joinPoint) {   
        Object target = joinPoint.getTarget();
        String methodName = joinPoint.getSignature().getName();
        Object[] args = joinPoint.getArgs();
        System.out.println("==================================================");
        System.out.println("==================================================");
        System.out.println("==================================================");
        System.out.println("==================================================");
        System.out.println("==================================================");
        System.out.println("==================================================");
        System.out.println("==================================================");
        System.out.println("==================================================");
        System.out.println("==================================================");
        System.out.println("==================================================");
        System.out.println("==================================================");
        Logger.getLogger(target.getClass().getName())
              .info(String.format("%s.%s(%s)",
                target.getClass().getName(), methodName, Arrays.toString(args)));
    }
}
