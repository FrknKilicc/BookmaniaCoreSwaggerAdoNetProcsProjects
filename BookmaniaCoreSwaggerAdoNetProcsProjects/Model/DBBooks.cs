using System.Data;
using System.Data.SqlClient;
using System.Net;

namespace BookmaniaCoreSwaggerAdoNetProcsProjects.Model
{
    public class DBBooks
    {
        SqlConnection con = new SqlConnection("Server=FURKAN\\FURKANKILIC;Database=BookmaniaDB;Integrated Security=true;");
        public string CRUD(Books books)
        {
            string islem = "";
            con.Open();
            using (SqlCommand cmd = new SqlCommand("CRUD", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@BookId", books.BookId);
                cmd.Parameters.AddWithValue("@Title", books.Title);
                cmd.Parameters.AddWithValue("@Author", books.Author);
                cmd.Parameters.AddWithValue("@Genre", books.Genre);
                cmd.Parameters.AddWithValue("@PublishedYear", books.PublishedYear);
                cmd.Parameters.AddWithValue("@transactionn", books.transactionn);
                cmd.ExecuteNonQuery();
            }
            con.Close();
            return islem;
        }

        public List<Books> ListBooks()
        {
            List<Books> Blist = new List<Books>();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "listBook";
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                Books b = new Books();
                b.BookId = Convert.ToInt32(dr["BookId"]);
                b.Title = dr["Title"].ToString();
                b.Author = dr["Author"].ToString();
                b.Genre = dr["Genre"].ToString();
                b.PublishedYear = Convert.ToInt32(dr["PublishedYear"]);
                Blist.Add(b);
            }
            con.Close (); return Blist;
        }
    }
}
