//package com.godrej.client;
//import java.util.InputMismatchException;
//import java.util.Scanner;
//
//import com.godrej.model.Address;
//import com.godrej.model.Product;
//import com.godrej.model.User;
//import com.godrej.service.ProductService;
//import com.godrej.service.UserService;
//import com.godrej.serviceimpl.ProductServiceImpl;
//import com.godrej.serviceimpl.UserServiceImpl;
//
//
//public class MainActivity{	
//	private static UserService userService;
//	private static ProductService productService;
//	private static Scanner sc;
//	
//	public static void main(String args[]) throws InputMismatchException, NumberFormatException{
//			userService = new UserServiceImpl();
//			productService = new ProductServiceImpl();
//			sc = new Scanner(System.in);
//			int i = 0;
//			do {
//				try {
//				System.out.println("\nEnter 1. User or 2. Product, 3.EXIT\n");
//				i = sc.nextInt();
//
//				if(i==1) 
//					choiceUser();
//				else if(i ==2)
//					choicePdt();
//				else if(i ==3)
//					System.out.println("\nEnd\n");
//				else 
//					System.out.println("\nWrong Input");
//				}
//				catch (InputMismatchException e) {
//					System.out.println("\nInput Error, Try again");
//				}
//				catch (NumberFormatException e) {
//					System.out.println("\nInput Error, Try again");
//				}
//				finally {
//					sc.next();
//				}
//			}while(i!=3);
//	}
//	public static void choicePdt() throws InputMismatchException{
//		int ch;	
//		sc = new Scanner(System.in);
//		do{
//			System.out.print("\n\n1. Search Entry\n2. Insert Entry\n3. Update Entry\n4. Delete Entry\n5. Read All Entrys\n6. Exit\n");
//			ch = sc.nextInt();
//			int id;
//			switch(ch)
//			{
//			case 1: 
//				System.out.println("\nEnter term of search :\t");
//				System.out.println("1. Name, 2. Category, 3. Price\n");
//				int ch1 = sc.nextInt();
//				System.out.println("\nEnter the field");
//				String s = sc.next();
//				switch(ch1) {
//				case 1: 
//				case 2:
//				case 3:	
//					productService.search(ch1, s);
//					break;
//				}
//				break;
//			case 2: 
//				System.out.print("\nEnter an ID ");
//				id = sc.nextInt();
//				System.out.print("\nEnter a Name ");
//				String name = sc.next();		
//				System.out.print("\nEnter a Category ");
//				String cat = sc.next();
//				System.out.print("\nEnter a price");
//				int price = sc.nextInt();
//				Product p = new Product();
//				p.setProduct_Id(id);
//				p.setProduct_Name(name);
//				p.setProduct_Cat(cat);
//				p.setProduct_Price(price);
//				productService.insert(p);
//				break;
//			case 3: 
//				System.out.print("\nEnter ID for update ");
//				id = sc.nextInt();
//				System.out.println("\nUpdate - 1.Name, 2.Category, 3.Price, 4.EXIT");
//				int option = sc.nextInt();
//				System.out.println("Enter the new value : ");
//				String passVal = sc.next();
//				productService.update(id, passVal, option);
//				break;
//			case 4:
//				System.out.print("\nEnter ID for delete ");
//				id = sc.nextInt();
//				productService.delete(id);
//				break;
//			case 5: 
//				productService.display();
//				break;
//			case 6: System.out.println("\nEXIT");
//			break;
//			default:System.out.println("\nWrong Input\n");
//			}
//		}while(ch!=6);
//
//	}
//	public static void choiceUser() throws InputMismatchException{
//		int ch;
//		sc = new Scanner(System.in);
//		do{
//			System.out.print("\n\n1. Search Entry\n2. Insert Entry\n3. Update Entry\n4. Delete Entry\n5. Read All Entrys\n6. Exit\n");
//			ch = sc.nextInt();
//			int id;
//			switch(ch)
//			{
//			case 1: 
//				System.out.println("\nEnter term of search :\t");
//				System.out.println("1. Name, 2. Address, 3.Address Pincode\n");
//				int ch1 = sc.nextInt();
//				System.out.println("\nEnter the field");
//				String s = sc.next();
//				switch(ch1) {
//				case 1:
//				case 2: 
//				case 3: userService.search(ch1,s);
//				break;
//				}
//				break;
//			case 2: 
//				User user = new User();
//				Address address = new Address();
//				System.out.print("\nEnter a Name ");
//				user.setuName(sc.next());
//				System.out.print("\nEnter a Password ");
//				user.setuPass(sc.next()); 
//				System.out.print("\nEnter your city");
//				address.setCity(sc.next());
//				System.out.print("\nEnter your state");
//				address.setState(sc.next());
//				System.out.print("\nEnter your pincode");
//				address.setPinCode(Integer.parseInt(sc.next()));
//				user.setAddress(address);
//				userService.insert(user);
//				break;
//
//			case 3: 
//				System.out.print("\nEnter UserID for update ");
//				id = sc.nextInt();
//				System.out.println("\nUpdate - 1.Name, 2.Pass, 3.Address State, 4.Address City, 5.Address PinCode, 4.EXIT");
//				int option = sc.nextInt();
//				System.out.println("Enter the new value : ");
//				String passVal = sc.next();
//				userService.update(id, passVal, option);
//				break;
//			case 4:
//				System.out.print("\nEnter UserID for delete ");
//				id = sc.nextInt();
//				userService.delete(id);
//				break;
//			case 5: 
//				userService.display();
//				break;
//			case 6: System.out.println("\nEXIT");
//			break;
//			default:System.out.println("\nWrong Input\n");
//			}
//		}while(ch!=6);
//	}
//
//}
