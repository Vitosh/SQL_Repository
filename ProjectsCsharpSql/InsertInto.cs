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
            string townName = Console.ReadLine();

            SqlConnection connection = new SqlConnection(@"
                    Data Source=(localdb)\MSSQLLocalDB;
                    Database=SoftUni;
                    Integrated Security=true");

            connection.Open();

            using (connection)
            {
                string query = $"INSERT INTO Towns(Name) VALUES (@TownName)";
                var cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@TownName", townName);
                int affected = cmd.ExecuteNonQuery();
                Console.WriteLine($"Affected {affected} rows");
            }
        }
    }
}