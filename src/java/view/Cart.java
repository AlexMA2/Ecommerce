/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import javaFrejoles.Item;
import javaFrejoles.Producto;
import cad.ProductoCad;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author USUARIO
 */
public class Cart extends HttpServlet {

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
        if (request.getParameter("action") != null) {
            String a = request.getParameter("action");
            int webid = 0;
            Producto p = null;
            HttpSession session = request.getSession();

            if (a.equals("order")) {
                order(session, request);
            } else if (a.equals("delete")) {
                delete(session, request);
            } else if (a.equals("finish")) {
                finish(webid, session, request);
                response.setContentType("text/html;charset=UTF-8");
                request.getRequestDispatcher("Inicio").forward(request, response);
            } else if (a.equals("ActualizarCantidadMore")) {
                incrementar(session, request);
            } else if (a.equals("ActualizarCantidadLess")) {
                decrementar(session, request);
            }

        }

        response.setContentType(
                "text/html;charset=UTF-8");
        request.getRequestDispatcher(
                "WEB-INF/cart.jsp").forward(request, response);
    }

    private int yaExisteProducto(int webid, ArrayList<Item> cart) {
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getP().getWebid() == webid) {
                return i;
            }
        }
        return -1;
    }

    private void delete(HttpSession session, HttpServletRequest request) {
        int webid = Integer.parseInt(request.getParameter("id"));
        ArrayList<Item> cart = (ArrayList<Item>) session.getAttribute("cart");
        int indice = yaExisteProducto(webid, cart);
        cart.remove(indice);
        session.setAttribute("cart", cart);
        setContador(cart, session);
    }

    private void order(HttpSession session, HttpServletRequest request) {
        int webid = Integer.parseInt(request.getParameter("id"));
        if (session.getAttribute("cart") == null) {
            ArrayList<Item> cart = new ArrayList<>();
            Producto p = ProductoCad.consultarProducto(session.getAttribute("moneda").toString(), webid);
            cart.add(new Item(p, 1));
            session.setAttribute("cart", cart);
            if (cart.size() > 0) {
                session.setAttribute("contador", cart.size());
            } else {
                session.setAttribute("contador", null);
            }

        } else {
            ArrayList<Item> cart = (ArrayList<Item>) session.getAttribute("cart");
            int indice = yaExisteProducto(webid, cart);
            if (indice == -1) {
                Producto p = ProductoCad.consultarProducto(session.getAttribute("moneda").toString(), webid);
                cart.add(new Item(p, 1));
            } else {
                int cantidad = cart.get(indice).getCantidad() + 1;
                cart.get(indice).setCantidad(cantidad);
            }

            session.setAttribute("cart", cart);
            setContador(cart, session);
        }
    }

    private void finish(int webid, HttpSession session, HttpServletRequest request) {
        ArrayList<Item> cart = (ArrayList<Item>) session.getAttribute("cart");        
        cart.clear();
        session.setAttribute("cart", cart);
    }

    private void incrementar(HttpSession session, HttpServletRequest request) {
        int webid = Integer.parseInt(request.getParameter("id"));
        ArrayList<Item> cart = (ArrayList<Item>) session.getAttribute("cart");
        for (int i = 0; i < cart.size(); i++) {
            if ((cart.get(i).getP().getWebid() == webid) && (cart.get(i).getCantidad() < cart.get(i).getP().getStock())) {

                int cant = cart.get(i).getCantidad() + 1;
                cart.get(i).setCantidad(cant);

            }
        }
    }

    private void decrementar(HttpSession session, HttpServletRequest request) {
        int webid = Integer.parseInt(request.getParameter("id"));
        ArrayList<Item> cart = (ArrayList<Item>) session.getAttribute("cart");
        for (int i = 0; i < cart.size(); i++) {
            if ((cart.get(i).getP().getWebid() == webid) && (cart.get(i).getCantidad() > 1)) {

                int cant = cart.get(i).getCantidad() - 1;
                cart.get(i).setCantidad(cant);

            }
        }
    }

    private void setContador(ArrayList<Item> cart, HttpSession session) {
        if (cart.size() > 0) {
            session.setAttribute("contador", cart.size());
        } else {
            session.setAttribute("contador", null);
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
