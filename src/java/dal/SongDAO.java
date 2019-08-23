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
import model.Song;

/**
 *
 * @author Cong Le
 */
public class SongDAO extends DBContext {

    public ArrayList<Song> getAllSongs() {
        ArrayList<Song> songs = new ArrayList<>();

        try {
            String sql = "select Song.id, Song.name, Song_Artist.song_link, Artist.id as artist_id"
                    + " from Song, Artist, Song_Artist"
                    + " where Song.id = Song_Artist.song_id and Artist.id = Song_Artist.artist_id";
            PreparedStatement statement = connection.prepareCall(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Song s = new Song();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setSong_link(rs.getString("song_link"));
                s.setArtist_id(rs.getInt("artist_id"));

                songs.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SongDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return songs;
    }

    public Song getSong(int song_id, int artist_id) {
        Song song = new Song();

        try {
            String sql = "select Song.id, Song.name, Song_Artist.song_link, Artist.id as artist_id, Song_Artist.view_count"
                    + " from Song, Artist, Song_Artist"
                    + " where Song.id = Song_Artist.song_id and Artist.id = Song_Artist.artist_id and Song.id = ? and Artist.id = ?";
            PreparedStatement statement = connection.prepareCall(sql);
            statement.setInt(1, song_id);
            statement.setInt(2, artist_id);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                song.setId(rs.getInt("id"));
                song.setName(rs.getString("name"));
                song.setSong_link(rs.getString("song_link"));
                song.setArtist_id(rs.getInt("artist_id"));
                song.setView_count(rs.getInt("view_count"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SongDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return song;
    }

    public ArrayList<Song> paging(int pagesize, int pageindex) {
        ArrayList<Song> songs = new ArrayList<>();

        String sql = "SELECT *\n"
                + " FROM (SELECT Song.id, Song.name, Song_Artist.image_link, Song_Artist.song_link, Artist.id as artist_id, Song_Artist.view_count, ROW_NUMBER() OVER (ORDER BY Song.id ASC) as rownum FROM Song, Song_Artist, Artist\n"
                + " WHERE Song.id = Song_Artist.song_id AND Artist.id = Song_Artist.artist_id) as tbSong\n"
                + " WHERE rownum >= (?-1)* ? + 1 AND rownum <= ?*?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, pageindex);
            statement.setInt(2, pagesize);
            statement.setInt(3, pagesize);
            statement.setInt(4, pageindex);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Song s = new Song();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setImage_link(rs.getString("image_link"));
                s.setSong_link(rs.getString("song_link"));
                s.setArtist_id(rs.getInt("artist_id"));
                s.setView_count(rs.getInt("view_count"));

                songs.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(SongDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return songs;
    }

    public int count() {
        String sql = " SELECT COUNT(*) as TotalRows FROM Song, Artist, Song_Artist"
                + " WHERE Song.id = Song_Artist.song_id AND Artist.id = Song_Artist.artist_id";

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

    public void updateView(int song_id, int artist_id, int hitCount) {
        try {
            String sql = "UPDATE [dbo].[Song_Artist]\n"
                    + "   SET view_count = ?\n"
                    + " WHERE song_id = ? and artist_id = ?";
            PreparedStatement statement = connection.prepareCall(sql);
            statement.setInt(1, hitCount);
            statement.setInt(2, song_id);
            statement.setInt(3, artist_id);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SongDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<Song> getSongByRank(int pagesize, int pageindex) {
        ArrayList<Song> songs = new ArrayList<>();

        String sql = "SELECT *\n"
                + " FROM (SELECT Song.id, Song.name, Song_Artist.image_link, Song_Artist.song_link, Artist.id as artist_id, Song_Artist.view_count, ROW_NUMBER() OVER (ORDER BY Song_Artist.view_count DESC) as rownum FROM Song, Song_Artist, Artist\n"
                + " WHERE Song.id = Song_Artist.song_id AND Artist.id = Song_Artist.artist_id) as tbSong\n"
                + " WHERE rownum >= (?-1)* ? + 1 AND rownum <= ?*?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, pageindex);
            statement.setInt(2, pagesize);
            statement.setInt(3, pagesize);
            statement.setInt(4, pageindex);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Song s = new Song();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setImage_link(rs.getString("image_link"));
                s.setSong_link(rs.getString("song_link"));
                s.setArtist_id(rs.getInt("artist_id"));
                s.setView_count(rs.getInt("view_count"));
                s.setRank(rs.getInt("rownum"));
                
                songs.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(SongDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return songs;
    }
    
}
