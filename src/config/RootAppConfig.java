package config;

import java.util.Properties;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.jndi.JndiObjectFactoryBean;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;


@Configuration
@EnableTransactionManagement
//@PropertySource("classpath:db.properties")
public class RootAppConfig {
	
	Environment env;
	
	@Autowired
	public void setEnv(Environment env) {
		this.env = env;
	}
	@Bean
	public DataSource dataSource() throws IllegalArgumentException, NamingException {
		JndiObjectFactoryBean jndiBean = new JndiObjectFactoryBean();
		jndiBean.setJndiName("java:comp/env/Jdbc/HibernateService");		
		jndiBean.setProxyInterface(DataSource.class);
		jndiBean.setLookupOnStartup(false);
		jndiBean.afterPropertiesSet();
		DataSource ds = (DataSource)jndiBean.getObject();
		System.out.println("ds:" + ds);
		
//		ComboPooledDataSource ds = new ComboPooledDataSource();
//		ds.setUser(env.getProperty("spring.database.user"));
//		ds.setPassword(env.getProperty("spring.database.password"));
//		try {
//			ds.setDriverClass(env.getProperty("spring.database.driverclass"));
//		} catch (PropertyVetoException e) {
//			e.printStackTrace();
//		}
//		ds.setJdbcUrl(env.getProperty("spring.database.url"));
//		ds.setInitialPoolSize(Integer.parseInt((env.getProperty("spring.database.initialpoolsize"))));
//		ds.setMaxPoolSize(Integer.parseInt((env.getProperty("spring.database.maxpoolsize"))));
		return ds;
	}
	
	@Bean(destroyMethod = "destroy")
	public LocalSessionFactoryBean sessionFactory() throws IllegalArgumentException, NamingException {
		LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
		factory.setDataSource(dataSource());
		factory.setPackagesToScan(new String[] { "house","member","mountain","product","config","main" });
		factory.setHibernateProperties(additionalProperties());
		System.out.println("set SessionFactory");
		return factory;
	}
	
	private Properties additionalProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.dialect", org.hibernate.dialect.Oracle12cDialect.class);
//		properties.put("hibernate.show_sql", Boolean.TRUE);
//		properties.put("hibernate.format_sql", Boolean.TRUE);
		properties.put("hibernate.current_session_context_class", "thread");
//		properties.put("default_batch_fetch_size", 10);
//		properties.put("hibernate.hbm2ddl.auto", "validate");
		return properties;
	}
	
	@Bean(name = "transactionManager")
	@Autowired
	public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager txManager = new HibernateTransactionManager();
		txManager.setSessionFactory(sessionFactory);
		return txManager;
	}
	
	
	
	
}
