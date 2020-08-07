package com.app.config;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.app.controllers.LoginServlet;
import com.app.controllers.RentsServlet;

@WebListener
public class Schedulers implements ServletContextListener{
	private ScheduledExecutorService scheduler;
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		scheduler = Executors.newSingleThreadScheduledExecutor();
		scheduler.scheduleAtFixedRate(new RentsServlet(), 0, 1, TimeUnit.DAYS);
		
		
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}

}
