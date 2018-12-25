package controller;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthenticator extends Authenticator {
	PasswordAuthentication pa;
	public MyAuthenticator(String username,String password)
	{
		pa=new PasswordAuthentication(username,password);

}
	protected PasswordAuthentication getPasswordAuthentication(){
		return pa;
	}
	
}