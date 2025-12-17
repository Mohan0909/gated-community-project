package com.utils;

import org.hibernate.SessionFactory;

import org.hibernate.Session;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import com.entity.Resident;


public class HibernateUtils {
	
	private static SessionFactory sessionFactory;

    static {
        try {
            // Create Configuration instance and load hibernate.cfg.xml
        	Configuration configuration = new Configuration();
        	configuration.configure("hibernate.cfg.xml");
        	configuration.addAnnotatedClass(Resident.class); // Must add this
        	SessionFactory factory = configuration.buildSessionFactory();


            // Build ServiceRegistry
            ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
                    .applySettings(configuration.getProperties()).build();

            // Build SessionFactory
            sessionFactory = configuration.buildSessionFactory(serviceRegistry);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionInInitializerError("Hibernate initialization failed: " + e);
        }
    }

    // Get SessionFactory (Singleton)
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    // Get a new Session
    public static Session getSession() {
        return getSessionFactory().openSession();
    }

    // Shutdown Hibernate (close SessionFactory)
    public static void shutdown() {
        if (sessionFactory != null) {
            sessionFactory.close();
        }
    }
    
    public static void main(String[] args) {
        try (Session session = HibernateUtils.getSession()) {
            System.out.println("✅ Hibernate connected successfully!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }




}