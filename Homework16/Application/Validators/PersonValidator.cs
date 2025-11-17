using Homework16.DTOs;
using FluentValidation;


public class PersonValidator : AbstractValidator<PersonCreateDto>
{
    public PersonValidator()
    {
        RuleFor(x => x.CreateDate)
            .LessThanOrEqualTo(DateTime.Now)
            .WithMessage("CreateDate არ უნდა იყოს მომავალზე დიდი.");

        RuleFor(x => x.Firstname)
            .NotEmpty().WithMessage("Firstname ცარიელი არაა.")
            .MaximumLength(50);

        RuleFor(x => x.Lastname)
            .NotEmpty().WithMessage("Lastname ცარიელი არაა.")
            .MaximumLength(50);

        RuleFor(x => x.JobPosition)
            .NotEmpty().WithMessage("JobPosition ცარიელი არაა.")
            .MaximumLength(50);

        RuleFor(x => x.Salary)
            .InclusiveBetween(0, 10000)
            .WithMessage("Salary უნდა იყოს 0-10000.");

        RuleFor(x => x.WorkExperience)
            .GreaterThanOrEqualTo(0)
            .WithMessage("WorkExperience ≥ 0.");

        RuleFor(x => x.Address)
            .NotNull().WithMessage("Address აუცილებელია.")
            .SetValidator(new AddressValidator());
    }
}
