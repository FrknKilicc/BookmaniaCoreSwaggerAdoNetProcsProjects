using BookmaniaCoreSwaggerAdoNetProcsProjects.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BookmaniaCoreSwaggerAdoNetProcsProjects.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomersController : ControllerBase
    {
        DBCustomers connect = new DBCustomers();
        [HttpGet]
        public List<Customers> GetCustomers()
        {
            var result = connect.CustomerList();
            return result;
        }
        [HttpPost]
        public string Post(Customers customers)
        {
            string islem = connect.CustomersCRUD(customers);
            return islem;

        }
        [HttpPut]
        [Route("id")]
        public string Put(Customers customers, int id)
        {
            string islem = "";
            customers.CustomerId = id;
            islem = connect.CustomersCRUD(customers);
            return islem;
        }
        [HttpDelete]
        [Route("id")]
        public string Delete(Customers customers,int id)
        {
            string isle = "";
            customers.CustomerId = id;
            customers.transactionn = "delete";
            isle = connect.CustomersCRUD(customers);
           
            return isle;
        }
    }
}
