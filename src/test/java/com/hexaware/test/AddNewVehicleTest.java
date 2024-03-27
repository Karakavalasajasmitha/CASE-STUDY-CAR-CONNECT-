package com.hexaware.test;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.hexaware.dao.VehicleDao;
import com.hexaware.exception.DatabaseConnectionException;
import com.hexaware.entity.Vehicle;

/**
 * Unit tests for adding new vehicles using the VehicleDao class.
 */
public class AddNewVehicleTest {
	
	/** 
	 * The VehicleDao instance for testing. 
	 */
	VehicleDao vehicleDao;
	
	/** 
	 * Set up method to initialize the VehicleDao instance. 
	 */
	@Before
	public void setUp() {
	
		vehicleDao= new VehicleDao();
	}
	
	/** 
	 * Test case for adding a valid vehicle.
	 */
	@Test
	public void testAddVehicle_ValidInput() {
		
		Vehicle vehicle = new Vehicle();
		
		String model = "audi";
		String make = "Volkswagen";
		int year = 2024;
		String color = "blue";
		String regnum = "87AS767";
		float dailyRate = 300;
		
		vehicle.setMake(make);
		vehicle.setModel(model);
		vehicle.setYear(year);
		vehicle.setColor(color);
		vehicle.setRegistrationNumber(regnum);
		vehicle.setDailyRate(dailyRate);
		
		try {
			
			assertTrue(vehicleDao.addVehicle(vehicle));
			
		} catch (DatabaseConnectionException e) {
			e.printStackTrace();
		}
		
	}
	
	/** 
	 * Test case for adding an invalid vehicle. 
	 */
	@Test
	public void testAddVehicle_InValidInput() {
		
		Vehicle vehicle = new Vehicle();
		
		String model = "audii";
		String make = "Voolkswagen";
		int year = 2024;
		String color = "white";
		String regnum = "7AS767";
		float dailyRate = 500;
		
		vehicle.setMake(make);
		vehicle.setModel(model);
		vehicle.setYear(year);
		vehicle.setColor(color);
		vehicle.setRegistrationNumber(regnum);
		vehicle.setDailyRate(dailyRate);
		
		try {
			
			assertFalse(vehicleDao.addVehicle(vehicle));
			
		} catch (DatabaseConnectionException e) {
			e.printStackTrace();
		}
		
	}
	
	/** 
	 * Tear down method to clean up resources after testing.
	 */
	@After
	public void tearDown() {
		
		vehicleDao =null;
	}
	
	

}
