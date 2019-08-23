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
import model.FavoriteSong;

/**
 *
 * @author Cong Le
 */
public class FavoriteSongDAO extends DBContext {

    public ArrayList<FavoriteSong> getFavoriteSongInPaging(int pagesize, int pageindex, String username) {
        ArrayList<FavoriteSong> favoriteSongs = new ArrayList<>();

        String sql = "SELECT *\n"
                + "FROM (SELECT Favorite_Song.id, Favorite_Song.sa_id, ROW_NUMBER() OVER (ORDER BY Favorite_Song.id ASC) as rownum FROM [User], Song_Artist, Favorite_Song\n"
                + "WHERE [User].username = Favorite_Song.username AND Song_Artist.id = Favorite_Song.sa_id and [User].username = ?) as tbFavoriteSong \n"
                + "WHERE WHERE rownum >= (?-1)* ? + 1 AND rownum <= ?*?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setInt(2, pageindex);
            statement.setInt(3, pagesize);
            statement.setInt(4, pagesize);
            statement.setInt(5, pageindex);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                FavoriteSong fs = new FavoriteSong();
                fs.setId(rs.getInt("id"));
                fs.setSa_id(rs.getInt("sa_id"));

                favoriteSongs.add(fs);
            }

        } catch (SQLException ex) {
            Logger.getLogger(SongDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return favoriteSongs;
    }
    
    public int count() {
        String sql = " SELECT COUNT(*) as TotalRows FROM [User], Song_Artist, Favorite_Song\n"
                + "WHERE [User].username = Favorite_Song.username AND Song_Artist.id = Favorite_Song.sa_id";

        PreparedStatement statement;
        try {
            statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return rs.getInt("TotalRows");
            }

        } catch (SQLException ex) {
            Logger.getLogger(SongDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return 0;
    }
}
