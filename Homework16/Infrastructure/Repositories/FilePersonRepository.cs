using Homework16.Domain.Entities;
using Homework16.Domain.Interfaces;
using System.Text.Json;

namespace Homework16.Infrastructure.Repositories;
public class FilePersonRepository : IPersonRepository
{
    private readonly string _file = "Data/people.json";
    private readonly object _lock = new();

    public FilePersonRepository()
    {
        if (!Directory.Exists("Data")) Directory.CreateDirectory("Data");
        if (!File.Exists(_file)) File.WriteAllText(_file, "[]");
    }

    public List<Person> GetAll()
    {
        lock (_lock)
        {
            var json = File.ReadAllText(_file);
            return JsonSerializer.Deserialize<List<Person>>(json) ?? new List<Person>();
        }
    }

    public Person Get(int index)
    {
        var list = GetAll();
        if (index < 0 || index >= list.Count)
            throw new ArgumentOutOfRangeException(nameof(index), "Index not found.");

        return list[index];
    }


    public void Add(Person person)
    {
        var list = GetAll();
        list.Add(person);
        SaveAll(list);
    }

    public void Update(int index, Person person)
    {
        var list = GetAll();
        list[index] = person;
        SaveAll(list);
    }

    public void Delete(int index)
    {
        var list = GetAll();
        list.RemoveAt(index);
        SaveAll(list);
    }

    public void SaveAll(List<Person> persons)
    {
        lock (_lock)
        {
            var json = JsonSerializer.Serialize(persons, new JsonSerializerOptions { WriteIndented = true });
            File.WriteAllText(_file, json);
        }
    }
}
