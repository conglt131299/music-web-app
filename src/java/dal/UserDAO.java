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
import model.User;
import org.apache.commons.lang3.RandomStringUtils;

/**
 *
 * @author Cong Le
 */
public class UserDAO extends DBContext {
    public User find(String username, String password) {
        ArrayList<User> users = new ArrayList<>();
        
        try {
            String sql = "select * from [User]";
            PreparedStatement statement = connection.prepareCall(sql);
            ResultSet rs = statement.executeQuery();
            
            while (rs.next()) {
                User u = new User();
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setGender(rs.getBoolean("gender") ? "Male" : "Female");
                u.setDateOfBirth(rs.getDate("dob").toString());
                
                users.add(u);
            }
            
            for (User user : users) {
                if (username.equals(user.getUsername()) && password.equals(user.getPassword())) {
                    return user;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return null;
    }
    
    public void add(User user) {
        try {
            String sql = "insert into [User]"
                    + " values (?,?,?,?,?,?)";
            PreparedStatement statement = connection.prepareCall(sql);
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getName());
            statement.setString(4, user.getEmail());
            statement.setBoolean(5, user.getGender().equals("Male") ? true : false);
            statement.setString(6, user.getDateOfBirth());
            
            statement.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public User findByEmail(String email) {
        User u = new User();
        try {
            String sql = "select * from [User] where email=?";
            PreparedStatement statement = connection.prepareCall(sql);
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            
            while (rs.next()) {
                u.setUsername(rs.getString("username"));
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return u;
    }
    
    public void update(User u) {
        try {
            String sql = "update [User] set password=? where username=?";
            PreparedStatement statement = connection.prepareCall(sql);
            statement.setString(1, u.getPassword());
            statement.setString(2, u.getUsername());
            statement.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String resetUserPassword(String email) {
        User u = findByEmail(email);
        String randomPassword = RandomStringUtils.randomAlphanumeric(10);
        
        u.setPassword(randomPassword);
        update(u);
        
        return randomPassword;
    }
}
