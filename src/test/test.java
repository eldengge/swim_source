package test;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import com.google.gson.Gson;

public class test {
	 @Test
     public void testdb() throws ParseException {
		 SimpleDateFormat s1=new SimpleDateFormat("yyyy-MM-dd");
		 Date parse = s1.parse("2011-01-02");
		 Date parse1 = s1.parse("2011-01-02");
		 System.out.println(parse.compareTo(parse1));
     }
}
