using Homework16.DTOs;
using Homework16.Services;
using Homework16.Domain.Interfaces;
using FluentValidation;
using Homework16.Infrastructure.Repositories;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddSingleton<IPersonRepository, FilePersonRepository>();
builder.Services.AddScoped<PersonService>();

builder.Services.AddScoped<IValidator<PersonCreateDto>, PersonValidator>();

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();

app.MapControllers();

app.Run();
