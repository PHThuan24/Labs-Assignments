package java_lesson_4.Exercise5;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class QLCB {
	List<CanBo> canBos = new ArrayList<>();
	
	public QLCB() {
		List<CanBo> canBos = new ArrayList<>();
	}

	/*
	public void insertCanBo1() {
		CanBo canBo = new CanBo();
		Scanner scanner = new Scanner(System.in);
		System.out.print("Enter name: ");
		String name = scanner.nextLine();
		System.out.print("Enter age: ");
		int age = Integer.parseInt(scanner.nextLine());
		System.out.print("Enter address: ");
		String address =scanner.nextLine();
		canBo.setFullName(name);
		canBo.setAge(age);
		canBo.setGender(Gender.UNKNOWN);
		canBo.setAddress(address);
		this.canBos.add(canBo);
		System.out.println("Insert thanh cong Can Bo:");
		System.out.println("Ten      : " +canBo.getFullName());
		System.out.println("Tuoi     : " +canBo.getAge());
		System.out.println("Gioi tinh: " +canBo.getGender());
		System.out.println("Dia chi  : " +canBo.getAddress());
	}
	*/
	
	public void insertCanBo() {
//		CanBo canBo = new CanBo();
		Scanner scanner = new Scanner(System.in);
		System.out.print("Enter name: ");
		String name = scanner.nextLine();
		System.out.print("Enter age: ");
		int age = scanner.nextInt();
		scanner.nextLine();
		System.out.print("Enter address: ");
		String address =scanner.nextLine();

		System.out.println("Chon type Can Bo: \n1. Cong Nhan\n2. Ky Su\n3. Nhan Vien");
		int chon = scanner.nextInt();
		scanner.nextLine();
		
		switch (chon) {
			case 1: 
				System.out.println("Enter level: ");
				byte level = scanner.nextByte();
				CanBo conNhan = new CongNhan(name, age, Gender.MALE, address, level);
				canBos.add(conNhan);
				break;
			case 2: 
				System.out.println("Enter industry: ");
				String ind = scanner.nextLine();
				CanBo kySu = new KySu(name, age, Gender.MALE, address, ind);
				canBos.add(kySu);
				break;
			case 3: 
				System.out.println("Enter work: ");
				String work = scanner.nextLine();
				CanBo nhanVien = new NhanVien(name, age, Gender.MALE, address, work);
				canBos.add(nhanVien);
				break;
			default:
				System.out.println("Chon sai!!!");
				break;
		}
	}
	
	public void insertCanBo(String fullName, int age, Gender gender, String address) {
		CanBo canBo = new CanBo();
		canBo.setFullName(fullName);
		canBo.setAge(age);
		canBo.setGender(gender);
		canBo.setAddress(address);
		this.canBos.add(canBo);
	}
	
	public void displayCanBo() {
		System.out.println("Danh sach Can Bo: ");
		for (int i = 0; i < canBos.size(); i++) {
			System.out.println("Can Bo " +(i+1) +":");
			System.out.println("Ten      : " +canBos.get(i).getFullName());
			System.out.println("Tuoi     : " +canBos.get(i).getAge());
			System.out.println("Gioi tinh: " +canBos.get(i).getGender());
			System.out.println("Dia chi  : " +canBos.get(i).getAddress());
			if (canBos.get(i) instanceof CongNhan) {
				CongNhan congNhan = (CongNhan)canBos.get(i);
				System.out.println("Level    : " +congNhan.getLevel());
			} else if (canBos.get(i) instanceof KySu) {
				KySu kySu = (KySu)canBos.get(i);
				System.out.println("Industry : " +kySu.getIndustry());
			} else {
				NhanVien nhanVien = (NhanVien)canBos.get(i);
				System.out.println("Work     : " +nhanVien.getWork());
			}
		}
	}
	
	public void searchName(String name) {
		System.out.println("Ket qua Search: ");
		for(CanBo canBo : canBos) {
			if(canBo.getFullName().equals(name)) {
				System.out.println("Can Bo:");
				System.out.println("Ten      : " +canBo.getFullName());
				System.out.println("Tuoi     : " +canBo.getAge());
				System.out.println("Gioi tinh: " +canBo.getGender());
				System.out.println("Dia chi  : " +canBo.getAddress());
			}
		}
	}
	
	public void deleteByName(String name) {
		List<CanBo> willRemove = new ArrayList<CanBo>();
		boolean isDelete = false;
		for(CanBo canBo : canBos) {
			if(canBo.getFullName().equals(name)) {
				willRemove.add(canBo);
				isDelete = true;
			}
		}
		canBos.removeAll(willRemove);
		if (isDelete) {
			System.out.println("Xoa thanh cong!!!");
		} else {
			System.out.println("Ten nay khong ton tai!");
		}
	}
	
	
	public void exitSystem() {
		System.exit(0);
	}
}
