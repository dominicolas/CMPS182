
import java.sql.*;
import java.util.*;

/**
 * The class implements methods of the SalesRecords database interface.
 *
 * All methods of the class receive a Connection object through which all
 * communication to the database should be performed. Note: the
 * Connection object should not be closed by any method.
 *
 * Also, no method should throw any exceptions. In particular, in case
 * an error occurs in the database, then the method should print an
 * error message and call System.exit(-1);
 */

public class SalesRecordsApplication {

    private Connection connection;

    /*
     * Constructor
     */
    public SalesRecordsApplication(Connection connection) {
        this.connection = connection;
    }

    public Connection getConnection()
    {
        return connection;
    }

    /**
     * getStoresThatSoldFewProducts has an integer argument called numDifferentProductsSold,
     * and returns the storeID for each store in Stores for which there are fewer than
     * numDifferentProductsSold different products in Sales at that store.
     * A value of numDifferentProductsSold that’s not greater than 0 is an error.
     */

    public List<Integer> getStoresThatSoldFewProducts(int numDifferentProductsSold)
    {
        List<Integer> result = new ArrayList<Integer>();
       
	if( numDifferentProductsSold < 0){
	    System.out.println("Invalid value for numDifferentProductsSold");
	}
	
	String query = " SELECT st.storeID " 
	             + " FROM Stores st, Sales s " 
	             +  "WHERE st.storeID = s.storeID " 
	             + " GROUP BY st.storeID "
	    + " HAVING COUNT(DISTINCT s.productID) <  " + numDifferentProductsSold;

	try {
	    
	    Statement stmt = connection.createStatement();
	    ResultSet rs = stmt.executeQuery(query);
	    
	    while(rs.next()){
		result.add(rs.getInt("storeID"));

	    }
	    
	    stmt.close();
	    rs.close();

	}

	catch (SQLException e){
	    e.printStackTrace();
	    System.exit(-1);

	}

      
        return result;

    }


    /**
     * updateManufacturer method has two string arguments, oldManufacturer and newManufacturer.
     * updateManufacturer should update manuf in Products for every product whose manuf value is
     * oldManufacturer, changing its manuf value to newManufacturer.
     * updateManufacturer should return the number of products whose manuf value was changed.
     */

    public int updateManufacturer(String oldManufacturer, String newManufacturer)
    {
	String query = " UPDATE Products "
	             + " SET manuf = '" + newManufacturer + "' "
	    + " WHERE manuf = '" + oldManufacturer + "' ";

	int numUpdatedmanuf = 0;

	try{

	    Statement stmt = connection.createStatement();
	    numUpdatedmanuf = stmt.executeUpdate(query);
	    stmt.close();

	}

	catch (SQLException e) {

	    e.printStackTrace();
	    System.exit(-1);

	}

	
	return numUpdatedmanuf;

    }


    /**
     * fixCustomerStatus has an integer parameters, lowCustomerID.  It invokes a stored function
     * fixStatusFunction that you will need to implement and store in the database according to the
     * description in Section 5.  fixStatusFunction should have the same parameters, lowCustomerID.
     *
     * Customers has a status attribute.  fixStatusFunction will change the status for some
     * customers whose customerID is greater than or equal to lowCustomerID; Section 5 explains
     * which customer status values should be changed, and how much they should be changed.
     * The fixCustomerStatus method should return the same integer result that the fixStatusFunction
     * stored function returns.
     *
     * The fixCustomerStatus method must only invoke the stored function fixStatusFunction, which
     * does all of the assignment work; do not implement the fixCustomerStatus method using a bunch
     * of SQL statements through JDBC.
     */

    public int fixCustomerStatus (int lowCustomerID)
    {
        int storedFunctionResult = 0;

	String fixCustomerQuery = " SELECT fixStatusFunction(?) ";

	System.out.println("Output of fixCustomerStatus when lowCustomerID is " + lowCustomerID);

	try {

	    PreparedStatement pstmt = connection.prepareStatement(fixCustomerQuery);
	    pstmt.setInt(1, lowCustomerID);

	    ResultSet result = pstmt.executeQuery();
	    while(result.next()){
	    storedFunctionResult = result.getInt(1);
	    }
	    pstmt.close();
	}

	catch(SQLException e) {

	    e.printStackTrace();
	    System.exit(-1);

	}

        return storedFunctionResult;

    }

};
