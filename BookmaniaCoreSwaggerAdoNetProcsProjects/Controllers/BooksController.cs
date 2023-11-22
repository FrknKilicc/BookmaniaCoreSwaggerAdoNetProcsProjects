using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using BookmaniaCoreSwaggerAdoNetProcsProjects.Model;
using System.Data;
using System.Data.SqlClient;


namespace BookmaniaCoreSwaggerAdoNetProcsProjects.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BooksController : ControllerBase
    {
        DBBooks connct = new DBBooks();
        [HttpGet]
        public List<Books> GetBooks()
        {
            var result = connct.ListBooks();
            return result;
        }
        [HttpPost]
        public string Post(Books books)
        {
            string result = connct.CRUD(books);
            return result;
        }
        [HttpPut]
        [Route("id")]
        public string Put(Books books, int id)
        {
            string islem = "";
            books.BookId = id;
            islem = connct.CRUD(books);
            return islem;
        }
        [HttpDelete]
        [Route("id")]
        public string Delete (Books books,int id)
        {
            string islem = "";
            books.BookId = id;
            books.transactionn = "delete";
            islem=connct.CRUD(books);
            return islem;
        }

    }
}
