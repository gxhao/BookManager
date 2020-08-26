package com.xiao.util;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;

//静态工厂负责实例化对象
public class BeanFactory {
	public static Object getBean(String allClassName) {
		try {
			//获得类的管理对象
			Class objectClass = Class.forName(allClassName);
			//获得默认构造方法
			Constructor<Object> constructor = objectClass.getConstructor();//无参构造
			//实例化对象
			return constructor.newInstance();//实例化对象
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}
}
