/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package form;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author Windows 7
 */
public class dbconnect_1 {
     public Connection con=null;
    private static int nourut;
    public static String penomoran="";
    private Statement stat;
   
public void OpenConnect()
{
    try{
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        con=DriverManager.getConnection("jdbc:odbc:dstoko","","");
    }catch(Exception SE)
    {
        JOptionPane.showMessageDialog(null,"error");
        System.exit(0);
    } 
}

public String dbconnecte(String nmfield,String nmfile,int maxdigit,String awal)
    {
        OpenConnect();
        try
        {
            Statement stat=con.createStatement();
            ResultSet rec=stat.executeQuery("SELECT COUNT(DISTINCT " + nmfield + ") FROM " + nmfile);
            if (rec.next())
            {nourut=rec.getInt(1)+1;}
            else
            {nourut=0;}
        }
        catch (SQLException se){}
        penomoran=Integer.toString(nourut);
        int y=penomoran.length()+awal.length();
        String b="";
        for(int i=1;i<=maxdigit-y;i++)
        {
           b+="0";
        }
        return (penomoran=awal+b+penomoran);
    }
    
}




    
