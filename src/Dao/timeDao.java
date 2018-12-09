package Dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class timeDao {
     public Date getBirth(String birth){
    	 String[] time=null;
    	 Date Birth=new Date();
    	 SimpleDateFormat format=new SimpleDateFormat("yyyyMMdd");
    	 time=birth.split("-");
    	 if(time[1].length()==1){
    		 time[1]="0"+time[1];
    	 }
    	 if(time[2].length()==1){
    		 time[2]="0"+time[2];
    	 }
    	 birth=time[0]+time[1]+time[2];
    	try {
			Birth=format.parse(birth);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	 
    	 return Birth;
     }
    public Date end_date(int time){
    	Date end_time=null;
    	String today= new SimpleDateFormat("yyyy-MM-dd-").format(new Date());
    	StringBuffer overtime=new StringBuffer();
    	String []Today=today.split("-");
    	int month=Integer.parseInt(Today[1])+time;
    	if(month>12){
    		int a=month/12;
    		int b=month%12;
    		int year=Integer.parseInt(Today[0])+a;
    		overtime.append(Integer.toString(year));
    		if(b<10){
    			overtime.append("0"+Integer.toString(b));
    		}else{
    			overtime.append(Integer.toString(b));
    		}
    		overtime.append(Today[2]);
    	}else{
    		overtime.append(Today[0]);
    		if(month<10){
    			overtime.append("0"+Integer.toString(month));
    		}else{
    			overtime.append(Integer.toString(month));
    		}
    		overtime.append(Today[2]);
    	}
			//System.out.println(overtime.toString());
    	try {
			end_time=new SimpleDateFormat("yyyyMMdd").parse(overtime.toString());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return end_time;
    }
}
