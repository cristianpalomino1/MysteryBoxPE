/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package mbpe.servlets.Sesion;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mbpe.DAOimpl.DaoLoginImpl;

/**
 *
 * @author Alex
 */
@WebServlet(name = "CierreServlet", urlPatterns = {"/Cierre"})
public class CierreServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        DaoLoginImpl login = new DaoLoginImpl();
        login.logOut();
        try {
            // Invalidar la sesión
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }

            // Indica al navegador que no almacene en caché la página
            response.setHeader("Cache-Control", "no-store");

            // Redirigir al usuario después de invalidar la sesión
            response.sendRedirect("/MysteryBoxPE/");
        } catch (IOException e) {
            // Manejar la excepción en caso de problemas con la redirección
            e.printStackTrace(); // Tratamiento adecuado en producción
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
