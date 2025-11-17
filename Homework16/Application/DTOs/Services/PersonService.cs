using Homework16.Domain.Entities;
using Homework16.Domain.Interfaces;
using Homework16.DTOs;

namespace Homework16.Services;

public class PersonService
{
    private readonly IPersonRepository _repo;

    public PersonService(IPersonRepository repo)
    {
        _repo = repo;
    }

    public List<Person> GetAll() => _repo.GetAll();

    public Person Get(int index) => _repo.Get(index);

    public List<Person> Create(PersonCreateDto dto)
    {
        var person = Map(dto);
        _repo.Add(person);
        return _repo.GetAll();
    }

    public List<Person> Update(int id, PersonUpdateDto dto)
    {
        var person = Map(dto);
        _repo.Update(id, person);
        return _repo.GetAll();
    }

    public List<Person> Delete(int id)
    {
        _repo.Delete(id);
        return _repo.GetAll();
    }

    private Person Map(PersonCreateDto dto)
    {
        return new Person
        {
            CreateDate = dto.CreateDate,
            Firstname = dto.Firstname,
            Lastname = dto.Lastname,
            JobPosition = dto.JobPosition,
            Salary = dto.Salary,
            WorkExperience = dto.WorkExperience,   
            PersonAddress = new Address
            {
                Country = dto.Address.Country,
                City = dto.Address.City,
                HomeNumber = dto.Address.HomeNumber
            }
        };
    }
}
