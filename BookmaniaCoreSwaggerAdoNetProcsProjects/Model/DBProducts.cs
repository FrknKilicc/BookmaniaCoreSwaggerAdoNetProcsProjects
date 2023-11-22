using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;

namespace BookmaniaCoreSwaggerAdoNetProcsProjects.Model
{
    public class DBProducts
    {
        SqlConnection con = new SqlConnection("Server=FURKAN\\FURKANKILIC;Database=BookmaniaDB;Integrated Security=true;");
        public string ProductsCrud(Products products)
        {
            string islem = "";
            con.Open();
            using (SqlCommand cmd = new SqlCommand("CrudProducts", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ProductId", products.ProductId);
                cmd.Parameters.AddWithValue("@Name", products.Namee);
                cmd.Parameters.AddWithValue("@Price", products.Price);
                cmd.Parameters.AddWithValue("@Description", products.Descriptionn);
                cmd.Parameters.AddWithValue("@transactionn", products.transactionnss);
                cmd.ExecuteNonQuery();


            }
            con.Close();
            return islem;


        }
        public List<Products> ProductList()
        {
            List<Products> products = new List<Products>();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "ListProducts";
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Products p = new Products();
                p.ProductId = Convert.ToInt32(reader["ProductId"]);
                p.Namee = reader["Namee"].ToString();
                p.Price = Convert.ToSingle("Price");
                p.Descriptionn = reader["Descriptionn"].ToString();
                products.Add(p);


            }
            con.Close();
            return products;
        }
    }
}
