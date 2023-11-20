/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package mbpe.servlets.Sesion;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mbpe.DAOimpl.DaoLoginImpl;
import mbpe.clases.Usuario;

/**
 *
 * @author Alex
 */
@WebServlet(name = "RegistroServlet", urlPatterns = {"/Registro"})
public class RegistroServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        DaoLoginImpl login = new DaoLoginImpl();
        RequestDispatcher dispatcher = null;
        Usuario user = Usuario.ObtenerUser();
        List carrito = Usuario.ObtenerCarrito();

        String username = request.getParameter("username");
        String correo = request.getParameter("email");
        String contraseña = request.getParameter("password");
        String contraseña_prueba = request.getParameter("password-confirm");

        if (contraseña.equals(contraseña_prueba)) {
            login.RegistrarUser(correo, username, contraseña);

        } else if (!contraseña.equals(contraseña_prueba)) {
            System.out.println("Contraseñas diferentes");

        } else {
            System.out.println("error servlet");
        }
        response.sendRedirect("/MysteryBoxPE/");
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
