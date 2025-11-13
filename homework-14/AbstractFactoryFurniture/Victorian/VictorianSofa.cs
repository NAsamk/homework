using homework_14.AbstractFactoryFurniture.Interfaces;
using System;

namespace homework_14.AbstractFactoryFurniture.Victorian
{
    public class VictorianSofa : ISofa
    {
        public void HasLegs() => Console.WriteLine("Victorian sofa has 4 short legs.");
        public void LieOn() => Console.WriteLine("Lying on a Victorian sofa.");
    }
}
