using homework_14.AbstractFactoryFurniture.Interfaces;
using System;

namespace homework_14.AbstractFactoryFurniture.ArtDeco
{
    public class ArtDecoSofa : ISofa
    {
        public void HasLegs() => Console.WriteLine("ArtDeco sofa has short elegant legs.");
        public void LieOn() => Console.WriteLine("Lying on an ArtDeco sofa.");
    }
}
