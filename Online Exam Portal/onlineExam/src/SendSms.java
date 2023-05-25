import java.io.*;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.*;
import java.net.URL;
import java.net.URLEncoder;
import javax.net.ssl.HttpsURLConnection;

public class SendSms {
	
	public static void sendSms(String message,String number)
	{
//		System.out.println(message);
//		System.out.println(number);
		try
		{
		
		String apiKey="uWUGkSJZQz5aHo0lKpN2tRC6iBFA3ec1vq9VOm7LDdI4sjyMgEUap9i5j6Puz4lx1JewGNqM8SZnEBQ2";
		String sendId="FSTSMS";
		//important step...
		message=URLEncoder.encode(message, "UTF-8");
		String language="english";
		
		String route="otp";
		
		String variables_values=message;
		
		String myUrl="https://www.fast2sms.com/dev/bulkV2?authorization="+apiKey+"&variables_values="+variables_values+"&route="+route+"&numbers="+number;
		
		System.out.println(myUrl);
		
		//sending get request using java..
		
		URL url=new URL(myUrl);
		
		HttpsURLConnection con=(HttpsURLConnection)url.openConnection();
		
		
		con.setRequestMethod("GET");
		
		con.setRequestProperty("User-Agent", "Mozilla/5.0");
		con.setRequestProperty("cache-control", "no-cache");
		System.out.println("Wait..............");
		
		
		int code=con.getResponseCode();
		
		System.out.println("Response code : "+code);
		
		StringBuffer response=new StringBuffer();
		
		BufferedReader br=new BufferedReader(new InputStreamReader(con.getInputStream()));
		
		while(true)
		{
			String line=br.readLine();
			if(line==null)
			{
				break;
			}
			response.append(line);
		}
		
		System.out.println(response);
		
		
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	
	public static void main(String[] args) {
		System.out.println("Program started.....");
		
		SendSms.sendSms("5434", "8535037107");
		
	}
}