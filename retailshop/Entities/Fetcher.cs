using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace retailshop.Entities
{
    public static class Fetcher
    {
        private static SqlConnection dbObj = null;
        private static SqlConnection getConnection()
        {
          
            return new System.Data.SqlClient.SqlConnection("Server=localhost;Database=multishopdb;Trusted_Connection=True;");
            
        }

        public static void getTopProductCategories()
        {
            List<ProductCategory> categories = new List<ProductCategory>();
            using (IDbConnection db = Fetcher.getConnection())
            {

                categories = db.Query<ProductCategory>("EXEC dbo.FetchTopCategory").ToList();
                Console.WriteLine(categories.ElementAt(0).title);
            }
        }


        public static void getCampaignRecipients(String campaignCode  = "BLACK_FRIDAY_2020")
        {
            using (IDbConnection db = Fetcher.getConnection())
            {
                int total = db.Query<int>(" SELECT COUNT(user_id) AS totalRecipients FROM newsletter_recipients" +
                    " NR JOIN newsletter_campaigns NC ON NC.id = NR.campaign_id " +
                    "  WHERE NC.code = 'BLACK_FRIDAY_2020' ").ToList().ElementAt(0);
                Console.WriteLine("Total " + total);
             }
               
        }
        public static void getCampaignSuccess() { 
            }
/*    SELECT O.user_id, totalRecipients.totalUsers FROM newsletter_campaigns C
JOIN newsletter_recipients R ON R.campaign_id = C.id
JOIN orders O ON O.user_id = R.user_id
JOIN order_items OI ON OI.order_id = O.id
JOIN (
  SELECT P.product_id FROM newsletter_campaigns C
  JOIN newsletter_products P ON P.campaign_id = C.id
  WHERE C.code = 'BLACK_FRIDAY_2020'
) AS promo_products ON promo_products.product_id  = OI.product_id
JOIN (
 SELECT COUNT(R.user_id) AS totalUsers, C.id AS campaignId FROM newsletter_campaigns C
  JOIN newsletter_recipients R ON R.campaign_id = C.id
  WHERE C.code = 'BLACK_FRIDAY_2020'
) AS totalRecipients ON totalRecipients.campaignId =  C.id
WHERE C.code = 'BLACK_FRIDAY_2020'
AND O.is_success= 1 AND O.is_void = 0
AND O.created_at >= C.started_at
AND O.created_at <= C.ended_at
AND OI.is_void = 0 AND OI.is_refund = 0*/
    }


}
