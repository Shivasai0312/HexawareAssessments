
 
Assignment1.sql

create database Assignment1

use Assignment1

	create table customer2
	(
	CUSTOMER_NUMBER varchar(10) primary key,
	FIRSTNAME varchar(40),
	middlename varchar(25),
	lastname varchar(25),
	CUSTOMER_CITY varchar(15),
	CUSTOMER_CONTACT_N0 varchar(10),
	occupation varchar(20),
	CUSTOMER_DATE_OF_BIRTH date 
	)
	select * from customer2

	insert into customer2 values('A01','ROHIT','','SHARMA','PATNA','7843198345','SAILS FORCE','1988-12-06')
	insert into customer2 values('A02','KARAN','MEHAR','JINNA','ASSAM','8876532109','SOFTWARE','1969-10-16')
	insert into customer2 values('A03','SWARNA','NULL','VAROJ','KOLKATA','6665178901','STUDENT','1999-09-26')
	insert into customer2 values('A04','SAHIL','NULL','RAI','DELHI','8676532109','EMPLOYEE','1976-11-03')
	insert into customer2 values('A05','SUBASH','CHANDRA','TRIVEDI','MUMBAI','8976523190','STUDENT','2000-09-19')
	insert into customer2 values('A06','SIRAJ','NULL','KARNA','CHENNAI','6576532109','STUDENT','1996-11-06')
	insert into customer2 values('A07','JANHANAVI','MERAJ','SRINA','MUMBAI','9651298321','STUDENT','1998-09-06')
	insert into customer2 values('A08','DISHA','','AGARWAL','MUMBAI','6876532109','EMPLOYEE','1991-12-03')
	insert into customer2 values('A09','ABHISEKH','','DUTTA','SRINAGAR','7856198761','WORKER','1973-05-22')
	insert into customer2 values('A10','SHANKAR','','NAIR','CHENNAI','9765489076','EMPLOYEE','1975-07-12')
	select * from customer2

-Display no. of customers belongs to each city
select CUSTOMER_CITY, count(CUSTOMER_CITY) from customer2 group by CUSTOMER_CITY
-Name of all cities from customer table without duplicate values
select distinct(CUSTOMER_CITY) from customer2
-No. of customers from different occupation
select occupation, count(CUSTOMER_NUMBER) as 'count' from customer2 group by occupation
select occupation, count(occupation) as 'count' from customer2 group by occupation
-Customer details with ascending order based on firstname
select * from customer2 order by FIRSTNAME
-display the data in descending order based on occupation and display the firstnamein ascendingof each occupation
select * from customer2 order by occupation desc, FIRSTNAME
-customers with middle names
select * from customer2 where middlename is null

	create table loan_details
	(
	customer_number varchar(10) foreign key references
	customer2(CUSTOMER_NUMBER),
	branch_id int,
	loan_amount bigint
	)
	create table branch_master
	(
	branch_id int primary key,
	branch_name varchar(20),
	branch_city varchar(20)
	)
	create table account_master
	(
	account_number varchar(10) primary key,
	customer_number varchar(10) foreign key references customer2(CUSTOMER_NUMBER),
	branch_id int foreign key references branch_master(branch_id),
	opening_balance bigint,
	account_opening_date date,
	account_type varchar(10),
	account_status varchar(10)
	)

	create table transaction_details
	(
	transaction_number int primary key,
	account_number varchar(10) foreign key references account_master(account_number),
	date_of_transaction date,
	medium_of_transaction varchar(20),
	transaction_type varchar(10),
	transaction_amount bigint
	)
78
 
Employee.cs
 -0,0 +1,78
using System;
using System.Collections.Generic;
using System.Text;

namespace Organization
{
    internal class Employee
    {
        public static int empid = 1001;
        public DateTime dateofbirth;
        public string[] dependents;
        public string empname;
        public bool gender;
        public static int nextempnumber;
        public short noofdependents;

        static Employee()
        {
            nextempnumber = 1001;
        }
        public Employee()
        {
            nextempnumber = empid++;
            dependents = new string[3];

        }

        public Employee(string empname, DateTime dateofbirth, bool gender)
        {
            this.empname = empname;
            this.dateofbirth = dateofbirth;
            this.gender = gender;
        }

        public Employee(string empname, DateTime dateofbirth, bool gender, short noofdependents)
        {
            this.empname = empname;
            this.dateofbirth = dateofbirth;
            this.gender = gender;
            if (noofdependents < 0)
            {
                this.noofdependents = 0;
            }
            else if (noofdependents > 3)
            {
                this.noofdependents = 3;
            }
            else
            {
                this.noofdependents = noofdependents;
            }
        }

        public short addependent(string dependentname)
        {
            if (noofdependents < 3)
            {
                dependents[noofdependents++] = dependentname;
                return noofdependents;
            }
            else
            {
                return 0;
            }
        }

        public bool updatedependents(string dependentname, int dependentid)
        {
            if (dependentid > 0 && dependentid <= noofdependents)
            {
                dependents[dependentid - 1] = dependentname;
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}



 36  
Instructor.cs
-0,0 +1,36 
using System;
using System.Collections.Generic;
using System.Text;

namespace Abctraining
{
    internal class Insrtuctor
    {
        private float avgfeedback;
        private int experience;
        private string instructorname;
        private string[] instructorskill;

        public Insrtuctor(string instructorname, float avgfeedback, int experience, string[] instructorskill)
        {
            this.instructorname = instructorname;
            this.avgfeedback = avgfeedback;
            this.experience = experience;
            this.instructorskill = instructorskill;
        }

        public bool validateligibility()
        {
            if (experience > 3 && avgfeedback == 4.5 || experience <= 3 && avgfeedback >= 4)
            {
                return true;
            }
            return false;
        }

        public bool checkskill(string skill)
        {
            foreach (string iskill in instructorskill)
            {
                if (iskill.Equals(skill))
                {
                    return true;
                }
            }
            return false;
        }
    }
}
 82 
Insurance.cs
-0,0 +1,82
using System;
using System.Collections.Generic;
using System.Text;

namespace Insurancecompany
{
    internal class Insurance
    {
        public int age;
        public string consumername;
        public static int counter;
        public int credithistory;
        public string[] documents;
        public string insuranceid;

        static Insurance()
        {
            counter = 1000;
        }
        public Insurance()
        {
            this.age = 18;
            this.credithistory = 45000;
        }
        public Insurance(string consumername)
        {
            this.consumername = consumername;
        }

        public Insurance(string consumername, string[] documents)
        {
            this.consumername = consumername;
            this.documents = documents;
        }
        public Insurance(string consumername, int credithistory, int age, string[] documents)
        {
            this.consumername = consumername;
            this.documents = documents;
            this.age = age;
            this.credithistory = credithistory;
        }
        public bool checkeligibility()
        {
            bool res = false;
            if (age < 18)
            {
                res = false;
            }
            else if (age > 18 && age <= 30 && credithistory <= 60000)
            {
                res = true;
            }
            else if (age > 30 && credithistory <= 45000)
            {
                res = true;
            }
            else
            {
                res = false;
            }
            return res;
        }

        public bool checkdocuments(string[] accdocuments)
        {
            if (checkeligibility())
            {
                int res = 0;
                foreach (string doc in accdocuments)
                {
                    foreach (string document in documents)
                    {
                        if (doc.Equals(document))
                        {
                            res++;
                        }
                    }
                }
                if (res >= 1)
                {
                    insuranceid = counter.ToString();
                    counter++;
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
    }
}
