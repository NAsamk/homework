using homework_14.AbstractFactoryFurniture.Interfaces;
using System;

namespace homework_14.AbstractFactoryFurniture.ArtDeco
{
    public class ArtDecoChair : IChair
    {
        public void HasLegs() => Console.WriteLine("ArtDeco chair has stylish geometric legs.");
        public void SitOn() => Console.WriteLine("Sitting on an ArtDeco chair.");
    }
}
