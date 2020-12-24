package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;


@Configuration
@EnableWebMvc
@EnableAspectJAutoProxy(proxyTargetClass = true)
@ComponentScan( {"house","member","mountain","product","config","main"})
public class WebAppMvcConfig implements WebMvcConfigurer  {
	
	//初始啟動
	@Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		System.out.println("congigure Start");
    	configurer.enable();
    	System.out.println("Configure Success");
    }
	
	
	//返回VIEW的前綴與後綴
	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/pages/");
		viewResolver.setSuffix(".jsp");
		viewResolver.setOrder(2);
//		System.out.println("test1");
		return viewResolver;
	}
	
//	設置讀取特定路徑的真實路徑
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/**").addResourceLocations("/WEB-INF/pages/","/WEB-INF/resources/","/");
	}
	
	
	
	//JSONVIEW設置
//	@Bean
//	public MappingJackson2JsonView jsonView() {
//		
//		MappingJackson2JsonView mappingJackson2JsonView = new MappingJackson2JsonView();
//		
//		mappingJackson2JsonView.setPrettyPrint(true);
//		
//		return mappingJackson2JsonView;
//	}
//	
//	@Bean
//	public Jaxb2Marshaller jaxbMarshaller() {
//		Jaxb2Marshaller jaxb2Marshaller = new Jaxb2Marshaller();
////		jaxb2Marshaller.setClassesToBeBound(HouseBean.class);
//		return jaxb2Marshaller;
//		
//	}
//	
//	@Bean
//	public ContentNegotiatingViewResolver contentNegotiatingViewResolver() {
//		ContentNegotiatingViewResolver contentNegotiatingViewResolver = new ContentNegotiatingViewResolver();
//		List<View> defaultViewsList = new ArrayList<View>();
//		View jsonView = (View)jsonView();
//		defaultViewsList.add(jsonView);
//		contentNegotiatingViewResolver.setDefaultViews(defaultViewsList);
//		return contentNegotiatingViewResolver;
//	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8");
		return multipartResolver;
	}
	
	
}
