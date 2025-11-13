using homework_14.AbstractFactoryFurniture.Interfaces;
using homework_14.AbstractFactoryFurniture.Modern;

namespace homework_14.AbstractFactoryFurniture.Modern
{
    public class ModernFurnitureFactory : IFurnitureFactory
    {
        public IChair CreateChair() => new ModernChair();
        public ISofa CreateSofa() => new ModernSofa();
        public ICoffeeTable CreateCoffeeTable() => new ModernCoffeeTable();
    }
}
