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
import mbpe.DAOimpl.DaoLoginImpl;
import mbpe.DAOimpl.DaoPlantillaImpl;
import mbpe.DAOimpl.DaoUsuarioImpl;
import mbpe.clases.Plantilla;
import mbpe.clases.Usuario;

/**
 *
 * @author Alex
 */
@WebServlet(name = "IndexServlet", urlPatterns = {""})
public class IndexServlet extends HttpServlet {

    DaoPlantillaImpl plantilla = new DaoPlantillaImpl();

    private void obtenerYConfigurarDatos(HttpServletRequest request) {

        List<Plantilla> listaPlantillas = plantilla.PlantillaList();
        List<String> listacategorias = new ArrayList();
        String cataux = "";
        for (int i = 0; i < listaPlantillas.size(); i++) {
            int id_plantilla = listaPlantillas.get(i).getId_plantilla();
            String nombre = listaPlantillas.get(i).getNombre();
            String categoria = listaPlantillas.get(i).getCategoria();
            int capacidad = listaPlantillas.get(i).getCapacidad();
            double precio = listaPlantillas.get(i).getPrecio();
            String aux = String.valueOf(i);
            if (!cataux.equals(categoria)) {
                listacategorias.add(categoria);
                cataux = categoria;
            }
            request.setAttribute("id_plantilla", id_plantilla);
            request.setAttribute("aux", aux);
            request.setAttribute("nombre" + i, nombre);
            request.setAttribute("categoria" + i, categoria);
            request.setAttribute("capacidad" + i, capacidad);
            request.setAttribute("precio" + i, precio);
        }
        System.out.println(listacategorias.size()); 
       request.setAttribute("listaCategorias", listacategorias);
        request.setAttribute("listaPlantillas", listaPlantillas);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        DaoLoginImpl login = new DaoLoginImpl();
        Usuario user = Usuario.ObtenerUser();
        List carrito = Usuario.ObtenerCarrito();
        String accion;

        request.setAttribute("conectado", user.getConectado());
        RequestDispatcher dispatcher = null;
        accion = request.getParameter("accion");
        dispatcher = request.getRequestDispatcher("index.jsp");

        if (accion == null || accion.isEmpty()) {
            obtenerYConfigurarDatos(request);
            dispatcher.forward(request, response);
        }
            
    
         else if (accion.equals("registro")) {
            String username = request.getParameter("username");
            String correo = request.getParameter("email");
            String contraseña = request.getParameter("password");
            String contraseña_prueba = request.getParameter("password-confirm");

            if (contraseña.equals(contraseña_prueba)) {
                login.RegistrarUser(correo, username, contraseña);
                obtenerYConfigurarDatos(request);

            } else if (!contraseña.equals(contraseña_prueba)) {
                System.out.println("Contraseñas diferentes");
                obtenerYConfigurarDatos(request);

            } else {
                System.out.println("error servlet");
                obtenerYConfigurarDatos(request);
            }
            dispatcher.forward(request, response);
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
