package org.jisonami.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Clob;
import java.sql.SQLException;

public class JDBCUtils {
	 public static String clobToString(Clob clob) throws SQLException, IOException {   
	        String reString = "";   //ƴ�ӱ���
	        Reader is = clob.getCharacterStream();// �õ���   
	        BufferedReader br = new BufferedReader(is);   
	        String s = br.readLine();   
	        StringBuffer sb = new StringBuffer();   
	        while (s != null) {  
	        sb.append(s);   
	        s = br.readLine();   
	        }   
	        reString = sb.toString(); //ת�����ַ��������з���  
	    return reString;   
	    }   
}
