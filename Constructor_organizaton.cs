82 
Constructor_Organization.cs
 -0,0 +1,82
using System;

namespace Constructor_Organization
{
    internal class Program
    {
        static void Main(string[] args)
        {
            DateTime dt1 =new  DateTime(2002, 08, 15);
           /* Employee employee= new Employee();
            Console.WriteLine($"employeeid ={employee.employeeId} ");*/
            Employee employee= new Employee("Harry",dt1,true);
            Console.WriteLine($"employeename={employee.employeeName} dateofbirth={employee.dateOfBirth} gender={employee.gender}");
            Employee employee2 = new Employee("Harry", dt1, true, 3);
            Console.WriteLine($"employeename={employee2.employeeName} dateofbirth={employee2.dateOfBirth} gender={employee2.gender} No.of dependents={employee2.numberOfDependents}");
        }
    }
    public class Employee
    {
        public DateTime dateOfBirth;
        public string[] dependents;
        public static int employeeId=1001;
        public string employeeName;
        public bool gender;
        public static int nextEmployeeNumber;
        public short numberOfDependents;

        static Employee()
        {
            nextEmployeeNumber = 1001;
        }
        public Employee()
        {
            nextEmployeeNumber = employeeId++;
            dependents = new string[3];
        }
        public Employee(string employeeName, DateTime dateOfBirth, bool gender)
        {
            this.employeeName = employeeName;
            this.dateOfBirth = dateOfBirth;
            this.gender = gender;
        }
        public Employee(string employeeName, DateTime dateOfBirth, bool gender, short numberOfDependents)
        {
            this.employeeName = employeeName;
            this.dateOfBirth = dateOfBirth;
            this.gender = gender;
            if (numberOfDependents < 0)
            {
                this.numberOfDependents = 0;
            }
            else if (numberOfDependents > 3)
            {
                this.numberOfDependents = 3;
            }
            else
            {
                this.numberOfDependents = numberOfDependents;
            }
        }
        public int AddDependent(string dependentName)
        {
            if (numberOfDependents < 3)
            {
                dependents[numberOfDependents++] = dependentName;
                return numberOfDependents;
            }
            else
            {
                return 0;
            }
        }
        public bool UpdateDependent(string dependentName, int dependentId)
        {
            if (dependentId > 0 && dependentId <= 2)
            {
                dependents[employeeId - 1] = dependentName;
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
