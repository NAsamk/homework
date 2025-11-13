using homework_14.AbstractFactoryFurniture.Interfaces;

namespace homework_14.AbstractFactoryFurniture.ArtDeco
{
    public class ArtDecoFurnitureFactory : IFurnitureFactory
    {
        public IChair CreateChair() => new ArtDecoChair();
        public ISofa CreateSofa() => new ArtDecoSofa();
        public ICoffeeTable CreateCoffeeTable() => new ArtDecoCoffeeTable();
    }
}
