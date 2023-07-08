/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;


/**
 *
 * @author maidu
 */
public class CategoryDAO extends DBContext{
    public List<Category> getCategories() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from category";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),rs.getString(2)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
}
