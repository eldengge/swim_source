package util;

import java.lang.reflect.Field;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;

public class WebUtil {
	public static<T> T getBean(T t,HttpServletRequest request){
		Map<String, String[]> parameterMap = request.getParameterMap();
		try {
			BeanUtils.populate(t, parameterMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}
	public static<T> T getBean(T t,Map parameterMap) {
		try {
			BeanUtils.populate(t, parameterMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}
	
	public static<T> Object[] beanToArray(T t) {
		Class clazz=t.getClass();
		Field[] declaredFields = clazz.getDeclaredFields();
		Object[] params=new Object[declaredFields.length];
		for (int i=0;i<declaredFields.length;++i) {
			try {
				declaredFields[i].setAccessible(true);
				params[i]=declaredFields[i].get(t);
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return params;
	}
}
