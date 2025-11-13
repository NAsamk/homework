using homework_14.AbstractFactoryFurniture.Interfaces;

namespace homework_14.AbstractFactoryFurniture.Client
{
    public class Client
    {
        private readonly IChair _chair;
        private readonly ISofa _sofa;
        private readonly ICoffeeTable _coffeeTable;

        public Client(IFurnitureFactory factory)
        {
            _chair = factory.CreateChair();
            _sofa = factory.CreateSofa();
            _coffeeTable = factory.CreateCoffeeTable();
        }

        public void ShowFurniture()
        {
            _chair.HasLegs();
            _chair.SitOn();

            _sofa.HasLegs();
            _sofa.LieOn();

            _coffeeTable.HasLegs();
            _coffeeTable.PutSomethingOn();
        }
    }
}
