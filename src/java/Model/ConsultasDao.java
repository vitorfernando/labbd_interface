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

    public String teste(String query, String query_test) throws SQLException, DAOException {
        PreparedStatement stmt;
        ResultSet r; // will store the query's result
        String result = "";
        stmt = connection.prepareStatement(query);
        r = stmt.executeQuery();
        r.next();
        result = r.getString(query_test);
        r.close();
        stmt.close();
        ConnectionFactory.closeConnection(connection);
        return result;
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

    public int consulta2aux(String actor, String director) throws SQLException, DAOException {
        int result;
        PreparedStatement stmt;
        ResultSet r; // will store the query's result
        String SQL = "SELECT count(am.movieid) FROM (SELECT movieid,act.actorid from act \n" +
"		INNER JOIN (SELECT actorid from actor where actorname LIKE '"+ actor+"' ) AS a \n" +
"		ON a.actorid = act.actorid) AS am ,\n" +
"		 (SELECT movieid,d.directorid from direct \n" +
"			INNER JOIN (SELECT directorid FROM  directors WHERE dname = '"+ director+"') AS d \n" +
"			ON d.directorid = direct.directorid) AS dm \n" +
"		Where dm.movieid = am.movieid";
        stmt = connection.prepareStatement(SQL);
        r = stmt.executeQuery();

        r.next();
        result = r.getInt("count");
        
        r.close();
        stmt.close();
        ConnectionFactory.closeConnection(connection);
        return result;
    }

    public ArrayList<String> consulta2(String actor, String director) throws SQLException, DAOException {
        ArrayList<String> movies_list = new ArrayList<String>();
        PreparedStatement stmt;
        ResultSet r; // will store the query's result
        String SQL = "SELECT consulta2('actorname','dname','" + actor + "','" + director + "')";
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

    public ArrayList<Director> consulta1(String title, String array_genres[], String array_languages[]) throws SQLException, DAOException {
        ArrayList<Director> directors_list = new ArrayList<Director>();
        PreparedStatement stmt;
        ResultSet r; // will store the query's result

        String SQL = "SELECT directors.directorid, directors.dname FROM directors,\n"
                + "	(SELECT directorid FROM direct,\n"
                + "		(SELECT m.movieid FROM \n"
                + "			(SELECT DISTINCT movieid FROM havegenres WHERE genres = ";
        if (array_genres.length > 1) {
            for (int i = 0; i < array_genres.length - 1; i++) {
                SQL += "'" + array_genres[i] + "' or genres = '";
            }
            SQL += "" + array_genres[array_genres.length - 1] + "') AS g ,";
        } else {
            SQL += "'" + array_genres[0] + "')AS g ,";
        }

        SQL += "(SELECT DISTINCT movieid FROM havelanguages WHERE languages = ";
        if (array_languages.length > 1) {
            for (int i = 0; i < array_languages.length - 1; i++) {
                SQL += "'" + array_languages[i] + "' or languages = '";
            }
            SQL += "" + array_languages[array_languages.length - 1] + "') AS l ,";
        } else {
            SQL += "'" + array_languages[0] + "')AS l ,";
        }
        SQL += "(SELECT movieid FROM movies WHERE title LIKE '" + title + "%') AS m \n"
                + "		WHERE m.movieid = g.movieid AND m.movieid = l.movieid) AS aux\n"
                + "	WHERE aux.movieid = direct.movieid) AS aux2 \n"
                + "WHERE aux2.directorid = directors.directorid;";

        stmt = connection.prepareStatement(SQL);
        r = stmt.executeQuery();

        while (r.next()) {
            Director d = new Director();
            d.setDirectorid(r.getInt("directorid"));
            d.setDname(r.getString("dname"));
            directors_list.add(d);
        }
        r.close();
        stmt.close();
        ConnectionFactory.closeConnection(connection);
        return directors_list;

    }
}
