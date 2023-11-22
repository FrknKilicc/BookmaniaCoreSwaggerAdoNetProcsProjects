using BookmaniaCoreSwaggerAdoNetProcsProjects.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BookmaniaCoreSwaggerAdoNetProcsProjects.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        DBProducts db = new DBProducts();
        [HttpGet]
        public List<Products> GetProducts()
        {
            var result = db.ProductList();
            return result;
        }
        [HttpPost]

        public string PostProducts(Products products)
        {
            string islem = db.ProductsCrud(products);
            return islem;
        }
        [HttpPut]
        [Route("id")]
        public string PutProducts(Products products, int id)
        {
            string islem = "";
            products.ProductId = id;
            islem = db.ProductsCrud(products);
            return islem;

        }
        [HttpDelete]
        [Route("id")]
        public string DeleteProducts(int id,Products products)
        {
            string islem = "";
            products.ProductId = id;
            products.transactionnss = "delete";
            islem = db.ProductsCrud(products);
            return islem;

        }


    }
}
