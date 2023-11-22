using System.Data.SqlClient;
namespace BookmaniaCoreSwaggerAdoNetProcsProjects.Model
{
    public class DBOrders
    {
        SqlConnection con = new SqlConnection("Server=FURKAN\\FURKANKILIC;Database=BookmaniaDB;Integrated Security=true;");
        public string OrderCrud(Orders orders)
        {
            string islem = "";
            con.Open();
            using (SqlCommand cmd = new SqlCommand("CRUDOrders"))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@OrderId", orders.OrderId);
                cmd.Parameters.AddWithValue("@OrderDate", orders.OrderDate);
                cmd.Parameters.AddWithValue("@CustomerId", orders.CustomerId);
                cmd.Parameters.AddWithValue("@TotalAmount", orders.TotalAmount);
                cmd.Parameters.AddWithValue("@transactionn", orders.transactionss);
                cmd.ExecuteNonQuery();
            }
            con.Close();
            return islem;

        }
        public List<Orders> OrderList()
        {
            List<Orders> orders = new List<Orders>();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "ListOrders";
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Orders o = new Orders();
                o.OrderId = Convert.ToInt32(reader["OrderId"]);
                o.OrderDate = Convert.ToDateTime(reader["OrderDate"]);
                o.CustomerId = Convert.ToInt32(reader["CustomerId"]);
                o.TotalAmount = Convert.ToSingle(reader["TotalAmount"]);
                orders.Add(o);
            }
            con.Close();
            return orders;
        }

    }
}
