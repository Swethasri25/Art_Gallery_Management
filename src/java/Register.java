/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static javax.swing.JOptionPane.showMessageDialog;



/**
 *
 * @author hp
 */
public class Register extends HttpServlet {
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            int temp=0;
            String url="jdbc:mysql://localhost:3306/artist";
            String user="root";
            String pwd="";
            PrintWriter outs=response.getWriter();
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection(url, user, pwd);
            String username=request.getParameter("username");
            int flag_name=0,flag_pass=0,flag_email=0,flag_pn=0;
             Statement st=conn.createStatement();
            String q="select * from register where username='"+username+"';";
            ResultSet re=st.executeQuery(q);
            if(re.next()){
                temp=1;
            }
            String password=request.getParameter("password");
            String emailid=request.getParameter("emailid");
            String phonenumber=request.getParameter("phonenumber");
            String usertype=request.getParameter("usertype");
            Pattern pattern = Pattern.compile("^([A-Za-z|' ']{1,45})$");
            Matcher matcher = pattern.matcher(username);
            boolean matchFound = matcher.find();
            if(matchFound) {
                       flag_name=1;
            } else {
                flag_name=0;
            }
            Pattern pattern1 = Pattern.compile("^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$");
            Matcher matcher1 = pattern1.matcher(password);
            boolean matchFound1 = matcher1.find();
            if(matchFound1) {
                       flag_pass=1;
            } else {
                    flag_pass=0;
            }
            Pattern pattern2 = Pattern.compile("^([a-z\\d\\.-]+)@([a-z\\d-]+)\\.([a-z]{2,8})$");
            Matcher matcher2 = pattern2.matcher(emailid);
            boolean matchFound2 = matcher2.find();
            if(matchFound2) {
                       flag_email=1;
            } else {
                    flag_email=0;
            }
            Pattern pattern3 = Pattern.compile("[0-9]{10}");
            Matcher matcher3 = pattern3.matcher(phonenumber);
            boolean matchFound3 = matcher3.find();
            if(matchFound3) {
                       flag_pn=1;
            } else {
                    flag_pn=0;
            }
            if(temp==1){
                //showMessageDialog(null, "Username already exists");
                out.println("<h2>username already exists!!!</h2>");
                request.getRequestDispatcher("register.jsp").include(request,response);
            }
        if(flag_name==1 && flag_pass==1 && flag_email==1 && flag_pn==1 && temp==0){
            
            
            PreparedStatement pstmt=conn.prepareStatement("insert into register(username,password,emailid,phonenumber,usertype)"+"values(?,?,?,?,?)");
            pstmt.setString(1, username);
            pstmt.setString(2,password);
            pstmt.setString(3,emailid);
            pstmt.setString(4,phonenumber);
            pstmt.setString(5,usertype);
            int count=pstmt.executeUpdate();
            if(count>0)
            {
                request.getRequestDispatcher("index.jsp").include(request,response);
                out.println("<h2>Registration successful</h2>");
            }
            else
            {
                out.println("<h2>Not Updated</h2>");
            }
            pstmt.close();
            outs.close();
            conn.close();
            /* TODO output your page here. You may use following sample code. */
            
        }  
        }
        catch(Exception e){
            e.printStackTrace();
        }
        finally {
            out.close();
        }
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        processRequest(request, response);
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
