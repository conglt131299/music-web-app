/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Artist;

/**
 *
 * @author Cong Le
 */
public class ArtistDAO extends DBContext {
    public ArrayList<Artist> getAllArtist() {
        ArrayList<Artist> artists = new ArrayList<>();
        try {
            String sql = "select * from Artist";
            PreparedStatement statement = connection.prepareCall(sql);
            ResultSet rs = statement.executeQuery();
            
            while (rs.next()) {
                Artist a = new Artist();
                a.setId(rs.getInt("id"));
                a.setName(rs.getString("name"));
                
                artists.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ArtistDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return artists;
    }
}
