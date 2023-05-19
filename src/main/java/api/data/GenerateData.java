package api.data;

public class GenerateData {

	
	public static String getEmail() {
		String email ="Louville";
		String provider ="@tekschool.us";
		int randomNumber = (int)(Math.random()*10000);
		String autoEmail = email + randomNumber + provider;
		return autoEmail;
	}
	

	public static String getPhoneNumber() {
		
		String phoneNumber = "703";
		for(int i =0; i<7;i++) {
			phoneNumber+= (int)(Math.random()*10);
		}
		return phoneNumber;
	}
	
	public static String getLicensePlate() {
		
		String license = "wrk";
		for(int i =0; i<4;i++) {
		   license+= (int)(Math.random()*10);
		}
		return license;
	}
	
	public static void main(String[]args) {
		
		System.out.println(getPhoneNumber());
	}
	
	
	
	
	
}
