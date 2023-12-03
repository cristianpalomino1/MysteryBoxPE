/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package mbpe.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mbpe.DAOimpl.DaoCategoriaImpl;
import mbpe.DAOimpl.DaoLoginImpl;
import mbpe.DAOimpl.DaoPlantillaImpl;
import mbpe.DAOimpl.DaoUsuarioImpl;
import mbpe.clases.Plantilla;
import mbpe.clases.Categoria;
import mbpe.clases.Usuario;

/**
 *
 * @author Alex
 */
@WebServlet(name = "IndexServlet", urlPatterns = {""})
public class IndexServlet extends HttpServlet {

    DaoPlantillaImpl plantilla = new DaoPlantillaImpl();
    DaoCategoriaImpl categoria = new DaoCategoriaImpl();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        DaoLoginImpl login = new DaoLoginImpl();

        Usuario user = Usuario.ObtenerUser();
        List carrito = Usuario.ObtenerCarrito();
        request.setAttribute("conectado", user.getConectado());
        RequestDispatcher dispatcher = null;
        dispatcher = request.getRequestDispatcher("index.jsp");
        
        List<Plantilla> listaPlantillas = plantilla.PlantillaList();
        List<Categoria> listaCategorias = categoria.CategoriaList();
        request.setAttribute("listaCategorias", listaCategorias);
        request.setAttribute("listaPlantillas", listaPlantillas);
        
        dispatcher.forward(request, response);
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
