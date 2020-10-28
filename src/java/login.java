/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
 * @author hp
 */
public class login extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String username=request.getParameter("username");
            String password=request.getParameter("password");
       
            String url="jdbc:mysql://localhost:3306/artist";
            String user="root";
            String pwd="";
            PrintWriter outs=response.getWriter();
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, pwd);
            Statement st=conn.createStatement();
            String q="select * from register where username='"+username+"' and password='"+password+"';";
            ResultSet re=st.executeQuery(q);
            if(re.next()){
                out.println(re.getString(1)+"\n Login Successfull \n");
                
                if(re.getString(5).equals("artist")){
                    
                    //out.println("REDIRECTED TO ARTIST PAGE");
                    HttpSession session=request.getSession();
                    session.setAttribute("uname",username);
                    response.sendRedirect("artist.jsp");
                }
                if(re.getString(5).equals("admin")){
                    
                    out.println("REDIRECTED TO ADMIN PAGE");
                    HttpSession session=request.getSession();
                    session.setAttribute("uname",username);
                    response.sendRedirect("admin.jsp");
                    
                }
                if(re.getString(5).equals("customer")){
                    
                   // out.println("REDIRECTED TO CUSTOMER PAGE");
                    HttpSession session=request.getSession();
                    session.setAttribute("uname",username);
                    response.sendRedirect("customer.jsp");
                }
                }
                
            
            else
            {
                out.println("<h2>Invalid Login Credentials!!!Please Try Again..</h2>");
            }
             st.close();
        conn.close();
            
            //PreparedStatement pstmt=conn.prepareStatement("select * from sample where username");
        }
       
                finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
