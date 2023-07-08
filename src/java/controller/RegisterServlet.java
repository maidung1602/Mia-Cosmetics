/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author maidu
 */
public class RegisterServlet extends HttpServlet {
   
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        UserDAO d=new UserDAO();
        String name=request.getParameter("name");
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String repassword=request.getParameter("repassword");
        String phone=request.getParameter("phone");
        String email=request.getParameter("email");
        User b = d.checkAccount(username, password);
        if (name ==null || name.equals("") || username ==null || username.equals("") ||
        password ==null || password.equals("") || repassword ==null || repassword.equals("") ||
        phone ==null || phone.equals("") ||email ==null || email.equals("")){
            request.setAttribute("err", "Chưa nhập đủ thông tin");
        }else if (!password.equals(repassword)) {
            request.setAttribute("err", "Mật khẩu không khớp");
        } else if (b!=null){
            request.setAttribute("err", "Username đã tồn tại");
        } else if (password.equals(repassword) && b==null){
            int id = d.getLastUserId()+1;
            User newUser= new User(id, name, username, password, email, phone, null, false);
            d.insert(newUser);
            HttpSession session=request.getSession();
            session.setAttribute("account", newUser);
            response.sendRedirect("home");
        } 
        
        request.setAttribute("name", name);
        request.setAttribute("username", username);
        request.setAttribute("password", password);
        request.setAttribute("repassword", repassword);
        request.setAttribute("phone", phone);
        request.setAttribute("email", email);
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
