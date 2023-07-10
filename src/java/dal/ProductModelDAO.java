/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import model.ProductModel;

/**
 *
 * @author maidu
 */
public class ProductModelDAO extends DBContext {

    public ProductModel getById(String id) {
        String sql = "select *\n" +
            "from ProductModel\n" +
            "where id=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ProductModel p = new ProductModel(rs.getInt(1),rs.getInt(2),rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), rs.getInt(7) );
                return p;
            }
        } catch (SQLException e) {
        }
        return null;
    }
    
    public void updateQuantity(String ProductMdelId, int Quantity) {
        String sql = "UPDATE [dbo].[ProductModel]\n" +
            "   SET [quantity] = ?\n" +
            " WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, Quantity);
            ps.setString(2, ProductMdelId);
            ps.executeQuery();
        } catch (SQLException e) {
        }
    }
    
     public static void main(String[] args) {
        ProductModelDAO d = new  ProductModelDAO();
        d.updateQuantity("1", 40);
    }
    
    
}
