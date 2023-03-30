BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "branch" (
	"branch_id"	INT,
	"branch_name"	VARCHAR(255),
	"branch_adress"	VARCHAR(255),
	PRIMARY KEY("branch_id")
);
CREATE TABLE IF NOT EXISTS "Customer" (
	"cus_id"	INT,
	"branch_id"	int,
	"cus_name"	VARCHAR(255),
	"cus_adress"	VARCHAR(255),
	"cus_contact"	Int,
	PRIMARY KEY("cus_id"),
	FOREIGN KEY("branch_id") REFERENCES "branch"("branch_id")
);
CREATE TABLE IF NOT EXISTS "Employ" (
	"Emp_id"	INT,
	"branch_id"	int,
	"cus_id"	INT,
	"Emp_name"	VARCHAR(255),
	"Emp_adress"	VARCHAR(255),
	"Emp_contact"	Int,
	PRIMARY KEY("Emp_id"),
	FOREIGN KEY("cus_id") REFERENCES "Customer"("cus_id"),
	FOREIGN KEY("branch_id") REFERENCES "branch"("branch_id")
);
CREATE TABLE IF NOT EXISTS "Loan" (
	"Loan_id"	INT,
	"cus_id"	INT,
	"Loan_type"	VARCHAR(255),
	"Loan_amount"	VARCHAR(255),
	"Intrest_rate"	Int,
	PRIMARY KEY("Loan_id"),
	FOREIGN KEY("cus_id") REFERENCES "Customer"("cus_id")
);
CREATE TABLE IF NOT EXISTS "Payment" (
	"Payment_id"	INT,
	"cus_id"	INT,
	"Loan_id"	INT,
	"Loan_amount"	INT,
	"Date"	date,
	PRIMARY KEY("Payment_id"),
	FOREIGN KEY("cus_id") REFERENCES "Customer"("cus_id"),
	FOREIGN KEY("Loan_id") REFERENCES "Loan"("Loan_id")
);
CREATE TABLE IF NOT EXISTS "EMI" (
	"Loan_id"	INT,
	"EMI_rate"	INT,
	FOREIGN KEY("Loan_id") REFERENCES "Loan"("Loan_id")
);
INSERT INTO "branch" VALUES (1,'Branch A','123 Main Street');
INSERT INTO "branch" VALUES (2,'Branch B','456 Oak Avenue');
INSERT INTO "Customer" VALUES (1,1,'John Smith','456 Elm Street','555-1234');
INSERT INTO "Customer" VALUES (2,1,'Jane Doe','789 Maple Avenue','555-5678');
INSERT INTO "Customer" VALUES (3,2,'Bob Johnson','101 Pine Street','555-9999');
INSERT INTO "Employ" VALUES (1,1,1,'Mary Brown','123 Oak Street','555-1111');
INSERT INTO "Employ" VALUES (2,2,2,'Tom Jones','456 Elm Street','555-2222');
INSERT INTO "Employ" VALUES (3,1,3,'Samantha Lee','789 Maple Avenue','555-3333');
INSERT INTO "Loan" VALUES (1,1,'Personal','10000',5);
INSERT INTO "Loan" VALUES (2,1,'Car','20000',7);
INSERT INTO "Loan" VALUES (3,2,'Home','300000',9);
INSERT INTO "Payment" VALUES (1,1,1,5000,'2022-01-15');
INSERT INTO "Payment" VALUES (2,1,1,5000,'2022-02-15');
INSERT INTO "Payment" VALUES (3,2,3,15000,'2022-03-01');
INSERT INTO "EMI" VALUES (1,1000);
INSERT INTO "EMI" VALUES (2,2000);
INSERT INTO "EMI" VALUES (3,10000);
COMMIT;
