using Homework16.DTOs;
using Homework16.Services; 
using FluentValidation;

using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("api/[controller]")]
public class PeopleController : ControllerBase
{
    private readonly PersonService _service;
    private readonly IValidator<PersonCreateDto> _validator;

    public PeopleController(PersonService service, IValidator<PersonCreateDto> validator)
    {
        _service = service;
        _validator = validator;
    }

    // POST
    [HttpPost]
    public IActionResult Create(PersonCreateDto dto)
    {
        var result = _validator.Validate(dto);
        if (!result.IsValid) return BadRequest(result.Errors);

        return Ok(_service.Create(dto));
    }

    // GET
    [HttpGet]
    public IActionResult GetAll() =>
        Ok(_service.GetAll());

    // GET/{id}
    [HttpGet("{id}")]
    public IActionResult Get(int id)
    {
        var p = _service.Get(id);
        if (p == null) return NotFound();
        return Ok(p);
    }

    // DELETE
    [HttpDelete("{id}")]
    public IActionResult Delete(int id)
    {
        return Ok(_service.Delete(id));
    }

    // PUT
    [HttpPut("{id}")]
    public IActionResult Update(int id, PersonUpdateDto dto)
    {
        var validator = new PersonValidator();
        var result = validator.Validate(dto);
        if (!result.IsValid) return BadRequest(result.Errors);

        return Ok(_service.Update(id, dto));
    }
}
