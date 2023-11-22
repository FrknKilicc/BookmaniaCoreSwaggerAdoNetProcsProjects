using BookmaniaCoreSwaggerAdoNetProcsProjects.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BookmaniaCoreSwaggerAdoNetProcsProjects.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        DBOrders con = new DBOrders();

        [HttpGet]
        public List<Orders> GetOrders()
        {
            var result = con.OrderList();
            return result;
        }
        [HttpPost]
        public string PostOrders(Orders orders)
        {
            string islem = con.OrderCrud(orders);
            return islem;

        }
        [HttpPut]
        [Route("id")]
        public string PutOrders(Orders orders, int id)
        {
            string islem = "";
            orders.OrderId = id;
            islem = con.OrderCrud(orders);
            return islem;

        }
        [HttpDelete]
        [Route("id")]
        public string DeleteOrders(int id,Orders orders)
        {
            string islem = "";
            orders.OrderId = id;
            orders.transactionss = "delete";
            islem = con.OrderCrud(orders);
            return islem;
        }
    }
}
