SET SERVEROUTPUT ON SIZE UNLIMITED
SET DEFINE OFF
----------------------------------------------------------------------------------------
PROMPT ****  UPDATE SYSTEM CONFIGURATION FOR 4.10.3 ***
----------------------------------------------------------------------------------------
------ *** SCRIPTS TO BE ADDED BELOW THIS MARK ***
----------------------------------------------------------------------------------------
PROMPT *TNO*1-<TICKET>*
----------------------------------------------------------------------------------------
DECLARE
	W_COUNT           NUMBER;							-- DO NOT CHANGE
	W_ERRCODE         NUMBER;							-- DO NOT CHANGE
	W_ERRLIBELLE      VARCHAR2 (500);					-- DO NOT CHANGE
	W_STATUS          VARCHAR2 (2):= 'OK';				-- DO NOT CHANGE
	W_STREAM          VARCHAR2 (50);					-- DO NOT CHANGE
	W_VERSION         VARCHAR2 (15);					-- DO NOT CHANGE
	W_JIRAREF         VARCHAR2 (50);					-- DO NOT CHANGE
BEGIN
	W_STREAM := 'TNO';									-- PUT THE CODE OF YOUR STREAM
	W_VERSION := '4.10.3';								-- PUT THE VERSION OF THE RELEASE
	W_JIRAREF := '1-<TICKET>';						-- PUT YOUR JIRA TICKET NUMBER STARTING WITH 1- if SYSTEM CONF, 2- if ACTIVATION else 3- if PROJECT

	SELECT COUNT (*) INTO W_COUNT FROM CONFIGURATIONLOG WHERE CLOJIRAREFERENCE  = W_JIRAREF AND CLOSTATUS ='OK'; 	 --DO NOT CHANGE
	IF W_COUNT=0 THEN		
		-- Objective
		
		
		--END OF ACTIVATION CONFIGURATION FOR <TICKET>
		P_LOGCONSCRIPT ( W_VERSION, SYSTIMESTAMP, W_STREAM, W_STATUS, W_JIRAREF, W_ERRCODE, W_ERRLIBELLE ); 		 --DO NOT CHANGE
		COMMIT;																										 --DO NOT CHANGE
	END IF; 																										 --DO NOT CHANGE

EXCEPTION																											 --DO NOT CHANGE
	WHEN OTHERS THEN																								 --DO NOT CHANGE
		W_ERRCODE := SQLCODE;																						 --DO NOT CHANGE
		W_ERRLIBELLE := SUBSTR(SQLERRM,1,500) || ', ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE ;						-- DO NOT CHANGE
		W_STATUS := 'KO';																							-- DO NOT CHANGE
		ROLLBACK;																									-- DO NOT CHANGE
		-- CALL TO LOG PROCEDURE  WITH KO,  DON'T TOUCH THIS PART 													-- DO NOT CHANGE
		P_LOGCONSCRIPT ( W_VERSION, SYSTIMESTAMP, W_STREAM, W_STATUS, W_JIRAREF, W_ERRCODE, W_ERRLIBELLE ); 		-- DO NOT CHANGE
		COMMIT;
END;
/
----------------------------------------------------------------------------------------
PROMPT *ABC*1-<TICKET3>*
----------------------------------------------------------------------------------------
DECLARE
	W_COUNT           NUMBER;							-- DO NOT CHANGE
	W_ERRCODE         NUMBER;							-- DO NOT CHANGE
	W_ERRLIBELLE      VARCHAR2 (500);					-- DO NOT CHANGE
	W_STATUS          VARCHAR2 (2):= 'OK';				-- DO NOT CHANGE
	W_STREAM          VARCHAR2 (50);					-- DO NOT CHANGE
	W_VERSION         VARCHAR2 (15);					-- DO NOT CHANGE
	W_JIRAREF         VARCHAR2 (50);					-- DO NOT CHANGE
BEGIN
	W_STREAM := 'ABC';									-- PUT THE CODE OF YOUR STREAM
	W_VERSION := '4.10.3';								-- PUT THE VERSION OF THE RELEASE
	W_JIRAREF := '1-<TICKET3>';						-- PUT YOUR JIRA TICKET NUMBER STARTING WITH 1- if SYSTEM CONF, 2- if ACTIVATION else 3- if PROJECT

	SELECT COUNT (*) INTO W_COUNT FROM CONFIGURATIONLOG WHERE CLOJIRAREFERENCE  = W_JIRAREF AND CLOSTATUS ='OK'; 	 --DO NOT CHANGE
	IF W_COUNT=0 THEN		
		-- Objective
		
		INSERT INTO Employees (Employee_ID, First_Name, Last_Name, Email, Salary, Hire_Date)
		VALUES (101, 'John', 'Doe', 'john.doe@example.com', 50000, SYSDATE);

		-- Update statement for Employees table
		UPDATE Employees 
		SET Salary = Salary * 1.1 
		WHERE Employee_ID = 101;

		-- Insert statement for a Products table
		INSERT INTO Products (Product_ID, Product_Name, Category, Price, Stock_Quantity)
		VALUES (2001, 'Laptop', 'Electronics', 1200, 50);

		-- Update statement for Products table
		UPDATE Products 
		SET Price = Price - 100 
		WHERE Product_ID = 2001;

		-- Insert statement for an Orders table
		INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Total_Amount)
		VALUES (5001, 3001, SYSDATE, 250.75);

		-- Update statement for Orders table
		UPDATE Orders 
		SET Total_Amount = Total_Amount + 50 
		WHERE Order_ID = 5001;
		
		--END OF ACTIVATION CONFIGURATION FOR <TICKET3>
		P_LOGCONSCRIPT ( W_VERSION, SYSTIMESTAMP, W_STREAM, W_STATUS, W_JIRAREF, W_ERRCODE, W_ERRLIBELLE ); 		 --DO NOT CHANGE
		COMMIT;																										 --DO NOT CHANGE
	END IF; 																										 --DO NOT CHANGE

EXCEPTION																											 --DO NOT CHANGE
	WHEN OTHERS THEN																								 --DO NOT CHANGE
		W_ERRCODE := SQLCODE;																						 --DO NOT CHANGE
		W_ERRLIBELLE := SUBSTR(SQLERRM,1,500) || ', ' || DBMS_UTILITY.FORMAT_ERROR_BACKTRACE ;						-- DO NOT CHANGE
		W_STATUS := 'KO';																							-- DO NOT CHANGE
		ROLLBACK;																									-- DO NOT CHANGE
		-- CALL TO LOG PROCEDURE  WITH KO,  DON'T TOUCH THIS PART 													-- DO NOT CHANGE
		P_LOGCONSCRIPT ( W_VERSION, SYSTIMESTAMP, W_STREAM, W_STATUS, W_JIRAREF, W_ERRCODE, W_ERRLIBELLE ); 		-- DO NOT CHANGE
		COMMIT;
END;
/
----------------------------------------------------------------------------------------
------ *** DO NOT ADD ANY SCRIPT BELOW THIS MARK ***
----------------------------------------------------------------------------------------
SET DEFINE ON
SET SERVEROUTPUT OFF
----------------------------------------------------------------------------------------
