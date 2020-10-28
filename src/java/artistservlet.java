/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author SAM
 */
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.Date;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.MultipartConfig;
/**
 *
 * @author SAM
 */
@MultipartConfig
public class artistservlet extends HttpServlet {
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        try{
            response.setContentType("text/html");
            FileInputStream fis=null;
            PrintWriter out=response.getWriter();
            String ptitle=request.getParameter("painting_title");
            int price=Integer. parseInt(request.getParameter("price"));
            java.util.Date date = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("date"));
            java.sql.Date painting_date = new java.sql.Date(date.getTime());
            String pcategory=request.getParameter("painting_category");
            String pdescription=request.getParameter("painting_description");
            String psize=request.getParameter("painting_size");
            Part part=request.getPart("img");
            InputStream painting = part.getInputStream();
            HttpSession session=request.getSession(false);
            String anme=(String)session.getAttribute("uname");
            response.sendRedirect("artist_gallery.jsp");
            try{
                String url="jdbc:mysql://localhost:3306/artist";
                String user="root";
                String pwd="";
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection(url,user,pwd);
                PreparedStatement pstmt = conn.prepareStatement("insert into artist(artist_name,painting_title,price,date,painting_category,painting_description,painting_size,painting,status,soldstatus) " + "values(?,?,?,?,?,?,?,?,?,?)");
                pstmt.setString(1,anme);
                //painting_id is auto_increment;
               // pstmt.setString(2,pid);
                pstmt.setString(2,ptitle);
                pstmt.setInt(3,price);
                pstmt.setDate(4,painting_date);
                pstmt.setString(5,pcategory);
                pstmt.setString(6,pdescription);
                pstmt.setString(7,psize);
                pstmt.setBlob(8,painting);
                pstmt.setInt(9,0);
                pstmt.setInt(10,0);
                int count = pstmt.executeUpdate();
                if(count>0)
                {
                    out.println("<h2>Painting uploaded</h2>");
                }
                else
                {
                    out.println("<h2>not successfully</h2>");
                }
                pstmt.close();
                conn.close();
            }
            catch(Exception ex)
            {
                ex.printStackTrace();
            }
        }
 catch(ParseException ex)
{
            Logger.getLogger(artistservlet.class.getName()).log(Level.SEVERE, null, ex);
}
    }

    
}
