/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import persistence.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import persistence.DAOException;
/**
 *
 * @author vitor
 */
public class ConsultasDao {

    // a conexão com o banco de dados
    private Connection connection;

    public ConsultasDao() throws DAOException {
        this.connection = ConnectionFactory.getConnection();
    }
    public void teste(String query) throws SQLException, DAOException{
        PreparedStatement stmt;
        ResultSet r; // will store the query's result
        
        stmt = connection.prepareStatement(query);
        r = stmt.executeQuery();
        
        r.close();
        stmt.close();
        ConnectionFactory.closeConnection(connection);
    }
    
    
    public ArrayList<String> getActors() throws SQLException, DAOException {
        ArrayList<String> genres_list = new ArrayList<String>();
        PreparedStatement stmt;
        ResultSet r; // will store the query's result
        String SQL = "SELECT getActors()";
        stmt = connection.prepareStatement(SQL);
        r = stmt.executeQuery();

        while (r.next()) {
            genres_list.add(r.getString("getactors"));
        }
        r.close();
        stmt.close();
        ConnectionFactory.closeConnection(connection);
        return genres_list;
    }
    
    public ArrayList<String> getDirectors() throws SQLException, DAOException {
        ArrayList<String> directors_list = new ArrayList<String>();
        PreparedStatement stmt;
        ResultSet r; // will store the query's result
        String SQL = "select getDirectors()";
        stmt = connection.prepareStatement(SQL);
        r = stmt.executeQuery();

        while (r.next()) {
            directors_list.add(r.getString("getdirectors"));
        }
        r.close();
        stmt.close();
        ConnectionFactory.closeConnection(connection);
        return directors_list;
    }
    
    public ArrayList<String> getGenres() throws SQLException, DAOException {
        ArrayList<String> genres_list = new ArrayList<String>();
        PreparedStatement stmt;
        ResultSet r; // will store the query's result
        String SQL = "select getGenres()";
        stmt = connection.prepareStatement(SQL);
        r = stmt.executeQuery();

        while (r.next()) {
            genres_list.add(r.getString("getgenres"));
        }
        r.close();
        stmt.close();
        ConnectionFactory.closeConnection(connection);
        return genres_list;
    }

    public ArrayList<String> getLanguages() throws SQLException, DAOException {
        ArrayList<String> languages_list = new ArrayList<String>();
        PreparedStatement stmt;
        ResultSet r; // will store the query's result
        String SQL = "SELECT getLanguages()";
        stmt = connection.prepareStatement(SQL);
        r = stmt.executeQuery();

        while (r.next()) {
            languages_list.add(r.getString("getlanguages"));
        }
        r.close();
        stmt.close();
        ConnectionFactory.closeConnection(connection);
        return languages_list;
    } 
    
    public ArrayList<String> consulta2(String actor, String director) throws SQLException, DAOException {
        ArrayList<String> movies_list = new ArrayList<String>();
        PreparedStatement stmt;
        ResultSet r; // will store the query's result
        String SQL = "SELECT consulta2('"+actor+"','"+director+"')";
        stmt = connection.prepareStatement(SQL);
        r = stmt.executeQuery();

        while (r.next()) {
            movies_list.add(r.getString("consulta2"));
        }
        r.close();
        stmt.close();
        ConnectionFactory.closeConnection(connection);
        return movies_list;
    }
}
