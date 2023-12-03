/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package mbpe.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mbpe.DAOimpl.DaoPlantillaImpl;
import mbpe.clases.Carrito;
import mbpe.clases.Plantilla;
import mbpe.clases.Usuario;

/**
 *
 * @author Alex
 */
@WebServlet(name = "CarritoServlet", urlPatterns = {"/Carrito"})
public class CarritoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        DaoPlantillaImpl plantilla = new DaoPlantillaImpl();

        Plantilla mb = new Plantilla();
        Usuario user = Usuario.ObtenerUser();

        List lista_id = Usuario.ObtenerCarrito();
        List lista_cantidad = Usuario.ObtenerCantidad();

        request.setAttribute("conectado", user.getConectado());
        RequestDispatcher dispatcher = null;

        dispatcher = request.getRequestDispatcher("carrito.jsp");

        List<Carrito> lista_productos_carrito = new ArrayList();

        double subTotal;
        double Total = 0;
        int cantSkin=0;
        int cantProd=0;
        for (int i = 0; i < lista_id.size(); i++) {
            int id_plantilla = (Integer) lista_id.get(i);
            int numero = (Integer) lista_cantidad.get(i);

            mb = plantilla.PlantillaSelect(id_plantilla);

            Carrito carrito = new Carrito();

            carrito.setId_plantilla(id_plantilla);
            carrito.setCantidad(numero);
            carrito.setNombre_plantilla(mb.getNombre());
            carrito.setCategoria_plantilla(mb.getCategoria());
            carrito.setCapacidad_plantilla(mb.getCapacidad());
            carrito.setPrecio_plantilla(mb.getPrecio());
            
            
            if (carrito.getId_skin() == 0) {
                subTotal = carrito.getPrecio_plantilla() * carrito.getCantidad();
            } else {
                subTotal = (carrito.getPrecio_plantilla() * carrito.getCantidad()) + 5;
                cantSkin++;     
            }
            cantProd = carrito.getCantidad() + cantProd;
            
            Total = subTotal + Total;
        
            lista_productos_carrito.add(carrito);
            
            
        }
        DecimalFormat df = new DecimalFormat("#.00");
        request.setAttribute("lista_carrito", lista_productos_carrito);
        request.setAttribute("Total", df.format(Total));
        request.setAttribute("cantidad_Productos", cantProd);
        request.setAttribute("cantidad_Skins", cantSkin);
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
