/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.FavoriteSongDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.FavoriteSong;
import model.User;

/**
 *
 * @author Cong Le
 */
public class FavoriteSongServlet extends HttpServlet {

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
        FavoriteSongDAO fsd = new FavoriteSongDAO();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        String page = request.getParameter("page");

        if (page == null || page.equals("")) {
            page = "1";
        }
        int pageindex = Integer.parseInt(page);
        int pagesize = 10;

        int totalRows = fsd.count();
        int totalpage = (totalRows + pagesize - 1) / pagesize;
        ArrayList<FavoriteSong> favoriteSongs = fsd.getFavoriteSongInPaging(pagesize, pageindex, user.getUsername());
        
        request.setAttribute("favoriteSongs", favoriteSongs);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("pagesize", pagesize);
        request.setAttribute("totalpage", totalpage);
        
        request.getRequestDispatcher("jsp/favoriteAudio.jsp").forward(request, response);
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
