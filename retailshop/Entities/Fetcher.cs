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
        public static void getCampaignSuccess()
        {
            using (IDbConnection db = Fetcher.getConnection())
            {

                float percentage = db.Query<float>("EXECUTE dbo.BlackFridayCampaignPercetangeBuy 'BLACK_FRIDAY_2020'").ToList().ElementAt(0);
                Console.WriteLine(percentage);

            }
        }

    }


}

EXECUTE LastTKSegments 'PUSHKI', 452875