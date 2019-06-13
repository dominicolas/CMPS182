import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * A class that connects to PostgreSQL and disconnects.
 * You will need to change your credentials below, to match the usename and password of your account
 * in the PostgreSQL server.
 * The name of your database in the server is the same as your username.
 * You are asked to include code that tests the methods of the SalesRecordsApplication class
 * in a similar manner to the sample RunFilmsApplication.java program.
*/


public class RunSalesRecordsApplication
{
    public static void main(String[] args) {
    	
    	Connection connection = null;
    	try {
    	    //Register the driver
    		Class.forName("org.postgresql.Driver"); 
    	    // Make the connection.
            // You will need to fill in your real username abd password for your
            // Postgres account in the arguments of the getConnection method below.
            connection = DriverManager.getConnection(
                                                     "jdbc:postgresql://cmps182-db.lt.ucsc.edu/dsnicola",
                                                     "dsnicola",
                                                     "transaction67right");
            
            if (connection != null)
                System.out.println("Connected to the database!");

            /* Include your code below to test the methods of the SalesRecordsApplication class
             * The sample code in RunFilmsApplication.java should be useful.
             * That code tests other methods for a different database schema.
             * Your code below: */

	    SalesRecordsApplication App = new SalesRecordsApplication(connection);
	    
	    int numDifferentProductsSold = 3;
	    System.out.println("Output of getStoresThatSoldFewProducts when numDifferentProductsSold = " + numDifferentProductsSold);

	    List<Integer> storeIds = App.getStoresThatSoldFewProducts( numDifferentProductsSold);
	    for(int i: storeIds){
		System.out.println(i);
	    }
	    
	    /* 
	     *Output of getStoresThatSoldFewProducts
	     *when numDifferentProductsSold is 3
	     *2
	    */
            
	    String oldManufacturer = "Google";
	    String newManufacturer = "Alphabet";
	    System.out.println("Output of updateManufacturer when oldManufacturer = " + oldManufacturer + " and newManufacturer = " + newManufacturer);
	    int numUpdatedmanuf = App.updateManufacturer( oldManufacturer, newManufacturer );
	    System.out.println(numUpdatedmanuf);

	    /*
	     *Output of updateManufacturer when oldManufacturer is 'Google'
	     *and new manufacturer is 'Alphabet'
	     * 3
	     */

	    int lowCustomerID = 1001;
	    int statusCount1 = App.fixCustomerStatus(lowCustomerID);
	    System.out.println(statusCount1);

            lowCustomerID = 1004;
	    int statusCount2 = App.fixCustomerStatus(lowCustomerID);
	    System.out.println(statusCount2);

            /*******************
            * Your code ends here */
            
    	}
    	catch (SQLException | ClassNotFoundException e) {
    		System.out.println("Error while connecting to database: " + e);
    		e.printStackTrace();
    	}
    	finally {
    		if (connection != null) {
    			// Closing Connection
    			try {
					connection.close();
				} catch (SQLException e) {
					System.out.println("Failed to close connection: " + e);
					e.printStackTrace();
				}
    		}
    	}
    }
}
