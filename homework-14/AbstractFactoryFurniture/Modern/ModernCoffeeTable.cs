using homework_14.AbstractFactoryFurniture.Interfaces;
using System;

namespace homework_14.AbstractFactoryFurniture.Modern
{
    public class ModernCoffeeTable : ICoffeeTable
    {
        public void HasLegs() => Console.WriteLine("Modern coffee table has sleek metal legs.");
        public void PutSomethingOn() => Console.WriteLine("Putting a laptop on a modern coffee table.");
    }
}
