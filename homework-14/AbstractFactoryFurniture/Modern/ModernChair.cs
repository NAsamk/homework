using homework_14.AbstractFactoryFurniture.Interfaces;
using System;

namespace homework_14.AbstractFactoryFurniture.Modern
{
    public class ModernChair : IChair
    {
        public void HasLegs() => Console.WriteLine("Modern chair might have metal legs.");
        public void SitOn() => Console.WriteLine("Sitting on a modern chair.");
    }
}
