/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Order;

/**
 *
 * @author maidu
 */
public class OrderDAO extends DBContext {
    public void insertOrder(Order o) {
        String sql = "INSERT INTO [dbo].[Order]\n" +
            "           ([user_id]\n" +
            "           ,[name]\n" +
            "           ,[phone]\n" +
            "           ,[address]\n" +
            "           ,[order_date]\n" +
            "           ,[status]\n" +
            "           ,[total])\n" +
            "     VALUES\n" +
            "           (?,?,?,?,GETDATE(),1,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, o.getUserId());
            st.setString(2, o.getName());
            st.setString(3, o.getPhone());
            st.setString(4, o.getAddress());
            st.setInt(5, o.getTotal());
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public int getLastOrderId(){
        String sql="SELECT MAX( [id])\n" +
            "  FROM [Order]";
        try{
            PreparedStatement st=connection.prepareStatement(sql);
            ResultSet rs=st.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
        }catch(SQLException e){
        }
        return 0;
    }
    
    
}
