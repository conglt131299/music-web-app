/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.ArtistDAO;
import dal.SongDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Artist;
import model.Song;

/**
 *
 * @author Cong Le
 */
public class AudioChartServlet extends HttpServlet {

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
        SongDAO songDAO = new SongDAO();
        ArtistDAO artistDAO = new ArtistDAO();
        String page = request.getParameter("page");

        if (page == null || page.equals("")) {
            page = "1";
        }
        int pageindex = Integer.parseInt(page);
        int pagesize = 10;

        int totalRows = songDAO.count();
        int totalpage = (totalRows + pagesize - 1) / pagesize;
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("pagesize", pagesize);
        request.setAttribute("totalpage", totalpage);

        ArrayList<Artist> artists = artistDAO.getAllArtist();
        ArrayList<Song> songs = songDAO.getSongByRank(pagesize, pageindex);

        HttpSession session = request.getSession();
        session.setAttribute("artists", artists);
        request.setAttribute("songs", songs);

        String pagePath = "jsp/audioChart.jsp";
        request.getRequestDispatcher(pagePath).forward(request, response);
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
