using System;
using homework_14.AbstractFactoryFurniture.Interfaces;

namespace homework_14.AbstractFactoryFurniture.Victorian
{
    public class VictorianChair : IChair
    {
        public void HasLegs() => Console.WriteLine("Victorian chair has 4 carved legs.");
        public void SitOn() => Console.WriteLine("Sitting on a Victorian chair.");
    }
}
