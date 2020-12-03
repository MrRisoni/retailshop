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
            if (dbObj == null)
            {
                dbObj = new System.Data.SqlClient.SqlConnection("Server=localhost;Database=multishopdb;Trusted_Connection=True;");

            }
            return dbObj;
        }

        public static void getTopProductCategories()
        {
            List<ProductCategory> categories = new List<ProductCategory>();
            using (IDbConnection db = Fetcher.getConnection())
            {

                //   categories = db.Query<ProductCategory>("SELECT * FROM dbo.product_categories").ToList();
                categories = db.Query<ProductCategory>("EXEC   dbo.FetchTopCategory").ToList();
                Console.WriteLine(categories.ElementAt(0).title);
            }
        }
    }


}
