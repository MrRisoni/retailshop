using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace retailshop
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            try
            {
                List<ProductCategory> categories = new List<ProductCategory>();
                using (IDbConnection db = new System.Data.SqlClient.SqlConnection("Server=localhost;Database=multishopdb;Trusted_Connection=True;"))
                {

                    categories = db.Query<ProductCategory>("SELECT * FROM dbo.product_categories").ToList();
                    Console.WriteLine(categories.ElementAt(0).title);
                }
                Console.WriteLine("Adieu World!");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}
