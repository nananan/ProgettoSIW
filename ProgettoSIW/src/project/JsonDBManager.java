package project;

import java.io.IOException;
import java.io.StringWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;

public class JsonDBManager extends AbstractDBManager
{
    private static JsonDBManager instance;

    public static JsonDBManager getInstance()
    {
        if (instance == null) {
            instance = new JsonDBManager();
        }
        return instance;
    }

    private final SimpleDateFormat dateSDF = new SimpleDateFormat("dd-MM-yyyy");
    private final SimpleDateFormat timestampSDF = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");

    
	public String getMenuDaily(String data) {

		String json = null;
		final String query = "SELECT * FROM DAILYMENU, DISH WHERE DISH.ID=DAILYMENU.DISH AND DAILYMENU.MENUDATE=?";

		final Connection conn = createConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;
		try
		{
			java.sql.Date dataDB = new Date(dateSDF.parse(data).getTime());
			ps = conn.prepareStatement(query);
			ps.setDate(1, dataDB);

			rs = ps.executeQuery();

			json = toJSON(rs);
		} catch (final SQLException e)
		{
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} finally
		{
			closeResultSet(rs);
			closeStatement(ps);
			closeConnection(conn);
		}
		return json;
	}
    
	public String getRating(int dishId, String username) {
		String json = null;
		final String query = "SELECT POINTS FROM RATING WHERE RATING.DISH=? AND RATING.USERNAME=?";

		final Connection conn = createConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;
		try
		{
			ps = conn.prepareStatement(query);
			ps.setInt(1, dishId);
			ps.setString(2, username);
			
			rs = ps.executeQuery();

			json = toJSON(rs);
		} catch (final SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			closeResultSet(rs);
			closeStatement(ps);
			closeConnection(conn);
		}
		return json;
	}
	
	public String bestDish(String category) {
		String json = null;
		final String query = "SELECT * FROM DISH WHERE DISH.RATING=(SELECT MAX(RATING) FROM DISH AS D1 WHERE D1.CATEGORY=?) AND DISH.CATEGORY=?";

		final Connection conn = createConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try
		{
			ps = conn.prepareStatement(query);
			ps.setString(1, category);
			ps.setString(2, category);
			
			rs = ps.executeQuery();

			json = toJSON(rs);
		} catch (final SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			closeResultSet(rs);
			closeStatement(ps);
			closeConnection(conn);
		}
		return json;
	}
	
	public String getIdComment(int dishId, String user, String comment, String date) {
		String json = null;
		final String query = "SELECT ID FROM COMMENTDISH WHERE COMMENTDISH.DISH=? AND COMMENTDISH.USER=?"
				+ "AND COMMENTDISH.COMMENT=? AND COMMENTDISH.COMMENTDATE=?";
		final Connection conn = createConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;
		try
		{
			ps = conn.prepareStatement(query);
			ps.setInt(1, dishId);
			ps.setString(2, user);
			ps.setString(3, comment);
			ps.setString(4, date);
			
			rs = ps.executeQuery();

			json = toJSON(rs);
		} catch (final SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			closeResultSet(rs);
			closeStatement(ps);
			closeConnection(conn);
		}
		
		return json;
	}
    
	public String getComment(int dishId) {
		String json = null;
		final String query = "SELECT ID,COMMENT,COMMENTDATE FROM COMMENTDISH WHERE COMMENTDISH.DISH=?";

		final Connection conn = createConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;
		try
		{
			ps = conn.prepareStatement(query);
			ps.setInt(1, dishId);
			
			rs = ps.executeQuery();

			json = toJSON(rs);
		} catch (final SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			closeResultSet(rs);
			closeStatement(ps);
			closeConnection(conn);
		}
		return json;
	}
	
	public String getComment(int dishId, String username) {
		String json = null;
		final String query = "SELECT ID,COMMENT,COMMENTDATE FROM COMMENTDISH WHERE COMMENTDISH.DISH=? AND COMMENTDISH.USER=?";

		final Connection conn = createConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;
		try
		{
			ps = conn.prepareStatement(query);
			ps.setInt(1, dishId);
			ps.setString(2, username);
			
			rs = ps.executeQuery();

			json = toJSON(rs);
		} catch (final SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			closeResultSet(rs);
			closeStatement(ps);
			closeConnection(conn);
		}
		return json;
	}
	
	public String getCommentNotUser(int dishId, String username) {
		String json = null;
		final String query = "SELECT ID,COMMENT,COMMENTDATE FROM COMMENTDISH WHERE COMMENTDISH.DISH=? AND COMMENTDISH.USER!=?";

		final Connection conn = createConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;
		try
		{
			ps = conn.prepareStatement(query);
			ps.setInt(1, dishId);
			ps.setString(2, username);
			
			rs = ps.executeQuery();

			json = toJSON(rs);
		} catch (final SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			closeResultSet(rs);
			closeStatement(ps);
			closeConnection(conn);
		}
		return json;
	}
	
	public String getDishesId() {
		String json = null;
		final String query = "SELECT ID FROM DISH";

		final Connection conn = createConnection();

		PreparedStatement ps = null;
		ResultSet rs = null;
		try
		{
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();

			json = toJSON(rs);
		} catch (final SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			closeResultSet(rs);
			closeStatement(ps);
			closeConnection(conn);
		}
		return json;
	}
	
    protected Map<String, Object> getEntityFromResultSet(final ResultSet resultSet) throws SQLException
    {
        final ResultSetMetaData metaData = resultSet.getMetaData();
        final int columnCount = metaData.getColumnCount();
        final Map<String, Object> resultsMap = new HashMap<>();
        for (int i = 1; i <= columnCount; ++i)
        {
            final String columnName = metaData.getColumnName(i).toLowerCase();
            final Object object = resultSet.getObject(i);
            resultsMap.put(columnName, object);
        }
        return resultsMap;
    }
    
    public boolean addRating(int dishID, String username, float points)
	{
		String procedure = "{call addRating(?,?,?)}";
		CallableStatement callableStatement = null;
		final Connection connection = createConnection();
		try
		{
			callableStatement = connection.prepareCall(procedure);
			callableStatement.setInt(1, dishID);
			callableStatement.setString(2, username);
			callableStatement.setFloat(3, points);
			callableStatement.executeUpdate();
			return true;
		} catch (final SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			closeStatement(callableStatement);
			closeConnection(connection);
		}
		return false;
	}
    
    public boolean modifyComment(int commentID, String comment)
	{
		String procedure = "{call modifyComment(?,?)}";
		CallableStatement callableStatement = null;
		final Connection connection = createConnection();
		try
		{
			callableStatement = connection.prepareCall(procedure);
			callableStatement.setInt(1, commentID);
			callableStatement.setString(2, comment);
			callableStatement.executeUpdate();
			return true;
		} catch (final SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			closeStatement(callableStatement);
			closeConnection(connection);
		}
		return false;
	}
    
    
    
    public boolean deleteComment(int commentID)
   	{
   		String procedure = "{call deleteComment(?)}";
   		CallableStatement callableStatement = null;
   		final Connection connection = createConnection();
   		try
   		{
   			callableStatement = connection.prepareCall(procedure);
   			callableStatement.setInt(1, commentID);
   			callableStatement.executeUpdate();
   			return true;
   		} catch (final SQLException e)
   		{
   			e.printStackTrace();
   		} finally
   		{
   			closeStatement(callableStatement);
   			closeConnection(connection);
   		}
   		return false;
   	}
    
    public boolean addComment(int dishId, String username, String comment, String date) {
		String procedure = "{call insertComment(?,?,?,?)}";
		CallableStatement callableStatement = null;
		final Connection connection = createConnection();
		try
		{
			callableStatement = connection.prepareCall(procedure);
			callableStatement.setInt(1, dishId);
			callableStatement.setString(2, username);
			callableStatement.setString(3, comment);
			callableStatement.setString(4, date);
			callableStatement.execute();
//			ResultSet resultSet = callableStatement.getResultSet();
//			json = toJSON(resultSet);
			return true;
		} catch (final SQLException e)
		{
			e.printStackTrace();
		} finally
		{
			closeStatement(callableStatement);
			closeConnection(connection);
		}
//		System.out.println("YOOOOO "+json);
		return false;
	}

    

    protected String toJSON(final ResultSet resultSet)
	{
		try
		{
			final StringWriter stringWriter = new StringWriter();
			final JsonFactory f = new JsonFactory();
			JsonGenerator g;
			g = f.createGenerator(stringWriter);

			final ResultSetMetaData metaData = resultSet.getMetaData();
			final int columnCount = metaData.getColumnCount();
			g.writeStartArray();
			while (resultSet.next())
			{
				g.writeStartObject();
				for (int i = 1; i < columnCount + 1; i++)
				{
					final String column_name = metaData.getColumnName(i).toLowerCase();

					if (metaData.getColumnType(i) == java.sql.Types.BOOLEAN)
					{
						g.writeBooleanField(column_name, resultSet.getBoolean(column_name));
					} else if (metaData.getColumnType(i) == java.sql.Types.BLOB)
					{
						g.writeObjectField(column_name, resultSet.getBlob(column_name));
					} else if (metaData.getColumnType(i) == java.sql.Types.DOUBLE)
					{
						g.writeNumberField(column_name, resultSet.getDouble(column_name));
					} else if (metaData.getColumnType(i) == java.sql.Types.FLOAT)
					{
						g.writeNumberField(column_name, resultSet.getFloat(column_name));
					} else if (metaData.getColumnType(i) == java.sql.Types.INTEGER)
					{
						g.writeNumberField(column_name, resultSet.getInt(column_name));
					} else if (metaData.getColumnType(i) == java.sql.Types.NVARCHAR)
					{
						g.writeStringField(column_name, resultSet.getNString(column_name));
					} else if (metaData.getColumnType(i) == java.sql.Types.VARCHAR)
					{
						final String string = resultSet.getString(column_name);
						g.writeStringField(column_name, string);
					} else if (metaData.getColumnType(i) == java.sql.Types.TINYINT)
					{
						g.writeNumberField(column_name, resultSet.getInt(column_name));
					} else if (metaData.getColumnType(i) == java.sql.Types.SMALLINT)
					{
						g.writeNumberField(column_name, resultSet.getInt(column_name));
					} else if (metaData.getColumnType(i) == java.sql.Types.DATE)
					{
						final Date date = resultSet.getDate(column_name);
						g.writeStringField(column_name, dateSDF.format(date));
					} else if (metaData.getColumnType(i) == java.sql.Types.TIMESTAMP)
					{
						final Timestamp date = resultSet.getTimestamp(column_name);
						g.writeStringField(column_name, timestampSDF.format(date));
					} else
					{
						g.writeObjectField(column_name, resultSet.getObject(column_name));
					}
				}
				g.writeEndObject();
			}
			g.writeEndArray();
			g.close();
			return stringWriter.toString();

		} catch (IOException | SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}



}
