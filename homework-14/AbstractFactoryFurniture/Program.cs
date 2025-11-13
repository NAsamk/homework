
using homework_14.AbstractFactoryFurniture.ArtDeco;
using homework_14.AbstractFactoryFurniture.Client;
using homework_14.AbstractFactoryFurniture.Modern;
using homework_14.AbstractFactoryFurniture.Victorian;
using System;

namespace homework_14.AbstractFactoryFurniture
{
    class Program
    {
        static void Main()
        {
            Console.WriteLine("=== Victorian Furniture Set ===");
            var victorianClient = new Client.Client(new VictorianFurnitureFactory());
            victorianClient.ShowFurniture();

            Console.WriteLine("\n=== Modern Furniture Set ===");
            var modernClient = new Client.Client(new ModernFurnitureFactory());
            modernClient.ShowFurniture();

            Console.WriteLine("\n=== Art Deco Furniture Set ===");
            var artDecoClient = new Client.Client(new ArtDecoFurnitureFactory());
            artDecoClient.ShowFurniture();
        }
    }
}
