using homework_14.AbstractFactoryFurniture.Interfaces;
using System;

namespace homework_14.AbstractFactoryFurniture.Modern
{
    public class ModernSofa : ISofa
    {
        public void HasLegs() => Console.WriteLine("Modern sofa has minimalist legs.");
        public void LieOn() => Console.WriteLine("Lying on a modern sofa.");
    }
}
