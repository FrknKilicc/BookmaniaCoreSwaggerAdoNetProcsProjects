using System.Data.SqlClient;

namespace BookmaniaCoreSwaggerAdoNetProcsProjects.Model
{
    public class DBCustomers
    {
        SqlConnection connection = new SqlConnection("Server=FURKAN\\FURKANKILIC;Database=BookmaniaDB;Integrated Security=true;");
        public string CustomersCRUD(Customers customers)
        {
            string islem = "";
            connection.Open();
            using (SqlCommand cmd = new SqlCommand("CRUDCustomers", connection))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CustomerId", customers.CustomerId);
                cmd.Parameters.AddWithValue("@FirstName", customers.FirstName);
                cmd.Parameters.AddWithValue("@LastName", customers.LastName);
                cmd.Parameters.AddWithValue("@Email", customers.Email);
                cmd.Parameters.AddWithValue("@transactionn", customers.transactionn);
                cmd.ExecuteNonQuery();
            }
            connection.Close();
            return islem;

        }
        public List<Customers> CustomerList()

        {
            List<Customers> Clist = new List<Customers>();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = connection;
            cmd.CommandText = "ListCustomers";
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Customers c = new Customers();
                c.CustomerId = Convert.ToInt32(reader["CustomerId"]);
                c.FirstName = reader["FirstName"].ToString();
                c.LastName = reader["LastName"].ToString();
                c.Email = reader["Email"].ToString();
                Clist.Add(c);
            }
            connection.Close();
            return Clist;



        }

    }
}
