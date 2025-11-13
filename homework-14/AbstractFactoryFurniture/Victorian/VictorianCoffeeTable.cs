using homework_14.AbstractFactoryFurniture.Interfaces;
using System;

namespace homework_14.AbstractFactoryFurniture.Victorian
{
    public class VictorianCoffeeTable : ICoffeeTable
    {
        public void HasLegs() => Console.WriteLine("Victorian coffee table has 4 decorative legs.");
        public void PutSomethingOn() => Console.WriteLine("Putting a cup on a Victorian coffee table.");
    }
}
