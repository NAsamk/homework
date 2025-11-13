using homework_14.AbstractFactoryFurniture.Interfaces;
using homework_14.AbstractFactoryFurniture.Victorian;

namespace homework_14.AbstractFactoryFurniture.Victorian
{
    public class VictorianFurnitureFactory : IFurnitureFactory
    {
        public IChair CreateChair() => new VictorianChair();
        public ISofa CreateSofa() => new VictorianSofa();
        public ICoffeeTable CreateCoffeeTable() => new VictorianCoffeeTable();
    }
}
