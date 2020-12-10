using System;
using System.Collections.Generic;
using System.Text;

namespace retailshop.Entities
{
    class TopCampaignProducts
    {
        public long product_id { get; set; }
        public string title { get; set; }
        public int totalQuantity { get; set; }
        public int totalOrders { get; set; }
        public int totalNet { get; set; }
        public decimal salesPercent { get; set; }
    }
}
