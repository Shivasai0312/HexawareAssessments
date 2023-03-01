

using System;

namespace Constructors_Insurance
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string[] mydoc = { "Aadhar", "BankAccount" };
            Insurance insurance = new Insurance("Harry",45000,23,mydoc);
            if(insurance.CheckEligibility()==true) 
            {
                if(insurance.CheckDocuments(mydoc))
                {
                    Console.WriteLine("Customer is Eligible");
                    Console.WriteLine(insurance.insuranceId);
                }
                else
                {
                    Console.WriteLine("Customer is not eligible");
                    
                }
            }
            else
            {
                Console.WriteLine("Customer is not eligible");
            }
        }
    }
    public class Insurance
    {
        public int age;
        string consumerName;
        static int counter;
        int creditHistory;
        string[] documents;
        public string insuranceId="l100";

        static Insurance()
        {
            counter = 1000;
        }
        public Insurance()
        {
            age = 18;
            creditHistory = 45000;
        }
        public Insurance(string consumerName)
        {
            this.consumerName = consumerName;
        }
        public Insurance(string consumerName, int creditHistory, int age, string[] documents)
        {
            this.consumerName = consumerName;
            this.creditHistory = creditHistory;
            this.age = age;
            this.documents = documents;
        }
        public Insurance(string consumerName, string[] documents)
        {
            this.consumerName = consumerName;
            this.documents = documents;
        }
        public bool CheckEligibility()
        {
            if (age < 18)
            {
                return false;
            }
            else if (age > 18 && age <= 30 && creditHistory <= 60000)
            {
                return true;
            }
            else if (age >= 30 && creditHistory <= 45000)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool CheckDocuments(string[] acceptabledocuments)
        {
            int status = 0;
            if(CheckEligibility())
            {
                foreach(string i in acceptabledocuments)
                {
                    foreach(string dc in documents)
                    {
                        if(i.Equals(dc))
                        {
                           status++;
                        }
                    }
                }
                if(status>=1)
                {
                    insuranceId = counter.ToString();
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
