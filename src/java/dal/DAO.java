/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Brand;
import model.Category;
import model.Subcategory;

/**
 *
 * @author maidu
 */
public class DAO extends DBContext {
    public Subcategory getSubcategoryById(int id) {
        String sql = "select * from subcategory where id=?";  
        DAO d = new DAO();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();  
            if (rs.next()) {  
                Subcategory c = new Subcategory(rs.getInt(1), rs.getString(2), d.getCategoryById(rs.getInt(3)),rs.getString(4));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }
    
    public Category getCategoryById(int id) {
        String sql = "select * from category where id=?";  
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();  
            if (rs.next()) { 
                Category c = new Category(rs.getInt(1), rs.getString(2));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }
    
    public Brand getBrandById(int id) {
        String sql = "select b.id, b.brand_name, count(b.id) \n" +
            "from brand b join Product p on p.brand_id = b.id\n" +
            "where b.id=?\n" +
            "group by b.id, b.brand_name";  
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();  
            if (rs.next()) { 
                Brand b = new Brand(rs.getInt(1), rs.getString(2), rs.getInt(3));
                return b;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }
    
    

}
