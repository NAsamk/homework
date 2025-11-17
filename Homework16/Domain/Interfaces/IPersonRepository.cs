using Homework16.Domain.Entities;

namespace Homework16.Domain.Interfaces
{
    public interface IPersonRepository
    {
        List<Person> GetAll();
        Person Get(int index);
        void Add(Person person);
        void Update(int index, Person person);
        void Delete(int index);
        void SaveAll(List<Person> persons);
    }
}
