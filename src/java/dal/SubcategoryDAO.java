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
import model.Subcategory;

/**
 *
 * @author maidu
 */
public class SubcategoryDAO extends DBContext {
//    public List<Subcategory> getSubByCid(int id) {
//        List<Subcategory> list = new ArrayList<>();
//        String sql = "select * from subcategory where category_id=?";
//        DAO d = new DAO();
//        try {
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setInt(1, id);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                list.add(new Subcategory(rs.getInt(1),rs.getString(2), d.getCategoryById(rs.getInt(3)),rs.getString(4)));
//            }
//        } catch (SQLException e) {
//        }
//        return list;
//    }
    
    public List<Subcategory> getSubHot() {
        List<Subcategory> list = new ArrayList<>();
        String sql = "select * from SubCategory where image is not null";
        DAO d = new DAO();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Subcategory(rs.getInt(1),rs.getString(2), d.getCategoryById(rs.getInt(3)),rs.getString(4)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    
    
}
