/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SOMASHEKHAR
 */
public class pidorder extends HttpServlet {

    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        try{
           
            int check_sold=0;
            Boolean b=true;
            response.setContentType("text/html");
            PrintWriter out=response.getWriter();
            String pid=request.getParameter("pidcnfrm");
            //out.println(pid);
           // out.println(pid+1);
            String url="jdbc:mysql://localhost:3306/artist";
        String user="root";
        String pwd="";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection(url,user,pwd);
       // Statement stmt = conn.createStatement();
       //String q="UPDATE artist3 SET sold_status=1 WHERE painting_id = pid";
    
    
        PreparedStatement pks = conn.prepareStatement("select painting_id from artist");
      // pks.setString(1,pid);
       ResultSet resp=pks.executeQuery();
       int found=0;
        while(resp.next()){
            int q= resp.getInt("painting_id");
            String w= Integer.toString(q);
           if(w.equals(pid))
           {
               found=1;
               break;
           }
    
       }
            if(found==0)
       {
           out.println("<h2 style=\"color:#ff0000\">Transaction Failed!</h2>");
           out.println("<br>");
           out.println("<br>");
           out.println("<br>");
           out.println("<br>");
           out.println("<br><a href=\"confirmation form.jsp\"><button type=\"button\">Redirect TO Confirmation page</button></a>");
           
       }
       int rep_pid=Integer.parseInt(pid);
       //out.println(pid+25);
        
       
        //out.println(check_sold);
        //out.println(found);
       PreparedStatement pk = conn.prepareStatement("select * from artist where painting_id=?");
       pk.setInt(1,rep_pid);
       ResultSet res=pk.executeQuery();
        while(res.next()){
           check_sold=res.getInt(11);
       }
       if(check_sold==1)
       {
           out.println("<h2 style=\"color:#ff0000\">Transaction Failed!</h2>");
           out.println("<br>");
           out.println("<br>");
           out.println("<br>");
           out.println("<br>");
           out.println("<br><a href=\"confirmation form.jsp\"><button type=\"button\">Redirect TO Confirmation page</button></a>");
           
       }
       
      
       PreparedStatement stmt=conn.prepareStatement("update artist set soldstatus=? where painting_id=?");  
       //ResultSet rs1=pstmt.executeQuery();
       stmt.setInt(1,1); 
       stmt.setInt(2,rep_pid);
       stmt.executeUpdate();
       int i=stmt.executeUpdate();  
       //out.println(i+" records updated");
       //out.println(pid+0001);
      // if(count>0){
        //   out.println("<h2>updated</h2>");
       //}
       //else
       //{
         //  out.println("<h2>Fail</h2>");
       //}
       PreparedStatement pst = conn.prepareStatement("select * from artist where painting_id=?");
       pst.setInt(1,rep_pid);
       ResultSet rs=pst.executeQuery();
       int painting_id=0,price=0;
       String artist_name="",customer_name="",painting_title="";
       while(rs.next()){
           painting_id=rs.getInt(2);
           artist_name=rs.getString(1);
           painting_title=rs.getString(3);
           HttpSession session=request.getSession(false);
           customer_name=session.getAttribute("uname").toString();
           //out.println(customer_name);
           price=rs.getInt(4);
       }
       
      // out.println(painting_id);
      // out.println(painting_title);
     //out.println("<h2 style=\"color:#ff0000\">Transaction Failed!</h2>");
       java.util.Date date=new java.util.Date();
       java.sql.Date sqldate=new java.sql.Date(date.getTime());
       PreparedStatement pre = conn.prepareStatement("insert into sales values(?,?,?,?,?,?)");
       pre.setInt(1,painting_id);
       pre.setString(2,artist_name);
       pre.setString(3,customer_name);
       pre.setInt(4,price);
       pre.setString(5,painting_title);
       pre.setDate(6,sqldate);
       int k=pre.executeUpdate();
       //out.println(k+" records updated downnnnnnnnnnnnnnnn");
       //request.setAttribute("rev_paintid", painting_id);
       
       if(k>0)
       {
           out.println("<h2 style=\"color:#00ff00\">Transaction Succesful!</h2>");
           out.println("<br>");
           out.println("<br>");
           //out.println("<button onClick="home();">Redirect TO HOME</button>");
           //request.setAttribute("rev_paintid", painting_id);
           out.println("<br><a href=\"customer.jsp\"><button type=\"button\">Redirect TO HOME</button></a>");
           //request.getRequestDispatcher("index.jsp").forward(request, response);
           //response.sendRedirect("index.jsp");
       }

        pre.close();
        pst.close();
        stmt.close();
        conn.close();
     
        }    
        
        
    catch(Exception e){
           out.println("<h2 style=\"color:#ff0000\">Transaction Failed!</h2>");
           out.println("<br>");
           out.println("<br>");
           out.println("<br>");
           out.println("<br>");
           out.println("<br><a href=\"confirmation form.jsp\"><button type=\"button\">Redirect TO Confirmation page</button></a>");
           
    }    
        
        
}
  
}