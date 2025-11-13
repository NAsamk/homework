using homework_14.AbstractFactoryFurniture.Interfaces;
using System;

namespace homework_14.AbstractFactoryFurniture.ArtDeco
{
    public class ArtDecoCoffeeTable : ICoffeeTable
    {
        public void HasLegs() => Console.WriteLine("ArtDeco coffee table has elegant curved legs.");
        public void PutSomethingOn() => Console.WriteLine("Putting a magazine on an ArtDeco coffee table.");
    }
}
