package ua.com.virgo;

import java.util.ArrayList;
import java.util.List;
import ua.com.virgo.*;

public class Reference {
	public static void main(String[] args){
		Employee a = new Reference().new Employee("Alice");
		Employee b = new Reference().new Employee("Bob");
		swap(a, b);
		System.out.println(a);
		System.out.println(b);
		
		NewList list = (NewList) new ArrayList();
		
		System.out.println("size = " + list.size());
	}
	public static void swap(Employee x, Employee y)
	{
		Employee temp = x;
		x = y;
		y = temp;
		
		NewEmployee n = NewEmployee.getInstance();
	}
	class Employee{
		private String name;
		public Employee() {}
		public Employee(String name){
			this.name=name;
		}
		public String toString(){
			return name;
		}
	}
	
	static class NewEmployee {
		private static NewEmployee instance = null;
		private NewEmployee() {
			System.out.println(this.getClass());
			//super();
		}
		public static NewEmployee getInstance() {
			instance = new NewEmployee();
			return instance;
		}
	}
	
}
