/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package mbpe.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mbpe.DAOimpl.DaoPlantillaImpl;
import mbpe.clases.Plantilla;
import mbpe.clases.Usuario;

/**
 *
 * @author Alex
 */
@WebServlet(name = "ProductoServlet", urlPatterns = {"/MysteryBox"})
public class ProductoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        DaoPlantillaImpl plantilla = new DaoPlantillaImpl();

        Plantilla mb = new Plantilla();
        
        System.out.println("PRODUCTO SERVLET added = "+mb.getAdded());
        Usuario user = Usuario.ObtenerUser();
        List carrito = Usuario.ObtenerCarrito();
        request.setAttribute("conectado", user.getConectado());
        RequestDispatcher dispatcher = null;
        dispatcher = request.getRequestDispatcher("producto.jsp");

        String nombre;
        String categoria;
        int capacidad;
        double precio;

        if (mb.getAdded()) {
            System.out.println("añadido con exito");
            int id_plantilla = (int) request.getAttribute("id_plantilla");
            mb = plantilla.PlantillaSelect(id_plantilla);
            nombre = mb.getNombre();
            categoria = mb.getCategoria();
            capacidad = mb.getCapacidad();
            precio = mb.getPrecio();
        } else {
            System.out.println("no se añadió");
            int id = Integer.parseInt(request.getParameter("id_plantilla"));
            request.setAttribute("id_plantilla", id);

            mb = plantilla.PlantillaSelect(id);
            nombre = mb.getNombre();
            categoria = mb.getCategoria();
            capacidad = mb.getCapacidad();
            precio = mb.getPrecio();
        }
        boolean added = mb.getAdded();
        request.setAttribute("nombre_plantilla", nombre);
        request.setAttribute("categoria_plantilla", categoria);
        request.setAttribute("capacidad_plantilla", capacidad);
        request.setAttribute("precio_plantilla", precio);
        request.setAttribute("added", added);
        dispatcher.forward(request, response);
        mb.setAdded(false);
        System.out.println("added cambio a falso");
        for (int i = 0; i < 5; i++) {
            System.out.println(".");
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
