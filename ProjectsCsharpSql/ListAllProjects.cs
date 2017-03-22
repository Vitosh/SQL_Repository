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
            SqlConnection connection = new SqlConnection(@"
                    Data Source=(localdb)\MSSQLLocalDB;
                    Database=SoftUni;
                    Integrated Security=true");
            ListAllProjects(connection);
        }
        
        static void ListAllProjects(SqlConnection connection)
        {
            connection.Open();

            using (connection)
            {
                string query = @"SELECT ProjectId, Name FROM Projects";
                SqlCommand cmd = new SqlCommand(query, connection);
                var reader = cmd.ExecuteReader();

                Console.WriteLine(" ID | Project Name");
                Console.WriteLine("----+--------------");
                
                while (reader.Read())
                {
                    Console.WriteLine($"{reader[0],4}|{reader[1]}");
                }
            }
        }
    }
}