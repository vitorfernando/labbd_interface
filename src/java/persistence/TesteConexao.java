/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author vitor
 */
public class TesteConexao {

    public static void main(String []args) throws SQLException, DAOException {
        Connection connection = new ConnectionFactory().getConnection();      
        System.out.println("conexão aberta!");
        connection.close();
    }
}
