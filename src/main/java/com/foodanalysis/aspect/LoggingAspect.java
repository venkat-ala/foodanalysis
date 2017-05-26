package com.foodanalysis.aspect;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {
  private static Logger logger = Logger.getLogger(LoggingAspect.class);

  @AfterThrowing(pointcut = "execution(public * com.foodanalysis.biz.*.*(..))", throwing = "t")
  public void serviceError(JoinPoint joinPoint, Throwable t) {
    logger.error(t.getMessage(), t);
  }

}
