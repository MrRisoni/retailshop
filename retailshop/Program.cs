using retailshop.Entities;
using System;

namespace retailshop
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            try
            {
                Fetcher.getTopProductCategories();
                Console.WriteLine("Adieu World!");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}
