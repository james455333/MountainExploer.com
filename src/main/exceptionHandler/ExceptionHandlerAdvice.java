package main.exceptionHandler;


import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;


@ControllerAdvice
public class ExceptionHandlerAdvice {

	private static final Logger logger = LoggerFactory.getLogger(ExceptionHandlerAdvice.class);

	@ExceptionHandler(NoHandlerFoundException.class)
    public ModelAndView handleError404(HttpServletRequest request, Exception e)   {
            ModelAndView mav = new ModelAndView("/exception/404");
            //mav.addObject("errorcode", "404");
            return mav;
    }
	
	
}
