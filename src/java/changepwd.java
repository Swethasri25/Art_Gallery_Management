/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SAM
 */
public class changepwd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        String currentpwd=request.getParameter("oldpwd");
        String newpwd=request.getParameter("newpwd");
        String newpwdconfirm=request.getParameter("newpwd2");
        if(newpwd.equals(newpwdconfirm)){
            if (!newpwd.equals(currentpwd)){
            try {
                HttpSession session=request.getSession(false);
                String anme=session.getAttribute("uname").toString();
                String url="jdbc:mysql://localhost:3306/artist";
                String user="root";
                String pwd="";
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection(url,user,pwd);
                PreparedStatement pstmt = conn.prepareStatement("update register set password=? where username=? and password=?");
                pstmt.setString(2,anme);
                 pstmt.setString(1,newpwd);
                pstmt.setString(3,currentpwd);
               
                int count = pstmt.executeUpdate();
                if(count>0){
                   
                    response.sendRedirect("index.jsp");
                     out.println("<p>password changed, login again with your new password</p>");
                }
                else{
                    out.println("password updation failed,Try again");
                }
                pstmt.close();
                conn.close();
            } 
            catch (ClassNotFoundException ex) {
                Logger.getLogger(changepwd.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(changepwd.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
            else{
                out.println("your current password and new password cant be same, try again!1");
            }
        
        }
        else{
           out.println("Your passwords doesnt match, reconfirm your password rightly and try again!!");
        }
    }

}

