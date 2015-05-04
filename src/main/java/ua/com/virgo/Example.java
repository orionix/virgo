package ua.com.virgo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import ua.com.virgo.bo.NewsBusinessObject;
import ua.com.virgo.model.News;

class Dog {
	
	public int gr(int a) {
		int i = 1;
		
		return (a = 1);
	}
}

public class Example {
/*
	@Autowired
	private static NewsBusinessObject nbo;
	
	private static News news = new News();
*/	
	public static void main(String[] args) {
	/*	
		news.setMessage("LABLA");
		news.setTitle("Bla title");
		news.setMessageStatus(1);
		news.setMessageOrder(30);
		
		nbo.save( news ); 
*/
		
		int a = 3;
		double b = (float) a / 0;
		long d = 10L;
		int c = (int) d;
		
		Object o = new Dog();
		Dog dg = (Dog) o;
		int e = dg.gr(1);
		
		System.out.println("a = " + a + " b = " + b + " c = " + c + " e = " + e);
		
		System.out.println("r_test = " + test());
		
		Integer int1 = new Integer(1);
		Integer int2 = new Integer(1);
		System.out.println(int1 == int2);
		
		String str1 = "a";
		String str2 = str1;
		str2 = str2 + " + b";
		
		print(str2);
		List l = new ArrayList();
		l.add(100);
		l.add("101");
		print((Integer) l.get(0));
		//print((Integer) l.get(1));
		
		Object obj = new Object();
		try {
			obj.wait();
		}
		catch (Exception ex) {
			print(ex);
		}
	}

	public static int test() {
		int r = 0;
		try {
			return r;
		}
		finally {
			r = 1;
			System.out.println("r_finally = " + r);
		}
	}
	
	public static <T> void print(T o) {
		System.out.println(o.getClass() + ". Value is: " + o);
	}
}
