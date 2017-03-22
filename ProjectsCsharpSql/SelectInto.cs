namespace ConsoleApplication2
{
    using System;
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using System.Linq;
    using System.Text;
    using System.Threading.Tasks;

    class Startup
    {
        static void Main()
        {
            int EmployeeId = int.Parse(Console.ReadLine());

            SqlConnection connection = new SqlConnection(@"
                    Data Source=(localdb)\MSSQLLocalDB;
                    Database=SoftUni;
                    Integrated Security=true");
            connection.Open();

            using (connection)
            {
                string query = $@"
                SELECT EmployeeId, FirstName, LastName, Salary 
                FROM Employees
                Where EmployeeId = {EmployeeId}";

                SqlCommand cmd = new SqlCommand(query, connection);
                var reader = cmd.ExecuteReader();

                using (reader)
                {
                    for (int i = 0; i < reader.FieldCount; i++)
                    {
                        Console.Write($"{reader.GetName(i),-15}");
                    }

                    Console.WriteLine();
                    while (reader.Read())
                    {
                        reader.GetName(0);
                        for (int i = 0; i < reader.FieldCount; i++)
                        {
                            Console.Write($"{reader[i],-15}");
                        }
                    Console.WriteLine();
                    }
                }
            }
        }
    }
}