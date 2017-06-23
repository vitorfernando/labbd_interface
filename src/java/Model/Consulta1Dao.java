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
import java.util.List;
import persistence.DAOException;

/**
 *
 * @author vitor
 */
public class Consulta1Dao {

    // a conexão com o banco de dados
    private Connection connection;

    public Consulta1Dao() throws DAOException {
        this.connection = ConnectionFactory.getConnection();
    }

    public ArrayList<String> getGenres() throws SQLException {
        ArrayList<String> genres_list = new ArrayList<String>();
        PreparedStatement stmt;
        ResultSet r; // will store the query's result
        String SQL = "SELECT genres FROM genres ORDER BY genres ASC";
        stmt = connection.prepareStatement(SQL);
        r = stmt.executeQuery();

        while (r.next()) {
            genres_list.add(r.getString("genres"));
        }
        r.close();
        stmt.close();
        return genres_list;
    }

    public ArrayList<String> getLanguages() throws SQLException {
        ArrayList<String> languages_list = new ArrayList<String>();
        PreparedStatement stmt;
        ResultSet r; // will store the query's result
        String SQL = "SELECT languages FROM languages ORDER BY languages ASC";
        stmt = connection.prepareStatement(SQL);
        r = stmt.executeQuery();

        while (r.next()) {
            languages_list.add(r.getString("languages"));
        }
        r.close();
        stmt.close();
        return languages_list;
    }

    public List<Director> getLista(ArrayList<String> genres, ArrayList<String> languages, String title) {
        try {
            List<Director> directors = new ArrayList<Director>();
            String query = "SELECT dname, directorid FROM directors, "
                    + "(SELECT directorid FROM direct, "
                    + "(SELECT m.movieid FROM ; ";
            query = query + "(SELECT movieid FROM havegenres WHERE genres";
            for (int i = 0; i < genres.size(); i++) {
                query = query + " '" + genres.get(i) + "'";
            }
            query = query + ") AS g ,(SELECT movieid FROM havelanguages WHERE languages;";
            for (int i = 0; i < languages.size(); i++) {
                query = query + " '" + languages.get(i) + "'";
            }
            query = query + " ) AS l,(SELECT movieid FROM movies WHERE title LIKE "
                    + title + " ) AS m WHERE m.movieid = g.movieid AND m.movieid = l.movieid) AS aux "
                    + "WHERE aux.movieid = direct.movieid) AS aux2 "
                    + "WHERE aux2.directorid = directors.directorid;";

            PreparedStatement stmt = this.connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                // criando o objeto Contato
                Director director = new Director();
                director.setDname(rs.getString("dname"));
                director.setDirectorid(rs.getInt("directorid"));
                directors.add(director);
            }
            rs.close();
            stmt.close();
            return directors;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
