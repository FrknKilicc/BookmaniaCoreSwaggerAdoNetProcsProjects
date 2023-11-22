using System.ComponentModel.DataAnnotations.Schema;

namespace BookmaniaCoreSwaggerAdoNetProcsProjects.Model
{
    public class Orders
    {
        public int OrderId { get; set; }
        public DateTime OrderDate { get; set; }
        
        public int CustomerId { get; set; }
        public float TotalAmount { get; set; }
        public string transactionss { get; set; }

    }
}
