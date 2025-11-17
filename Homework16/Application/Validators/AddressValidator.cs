using Homework16.DTOs;
using FluentValidation;

public class AddressValidator : AbstractValidator<AddressDto>
{
    public AddressValidator()
    {
        RuleFor(x => x.Country).NotEmpty().WithMessage("Country აუცილებელია.");
        RuleFor(x => x.City).NotEmpty().WithMessage("City აუცილებელია.");
        RuleFor(x => x.HomeNumber).NotEmpty().WithMessage("HomeNumber აუცილებელია.");
    }
}
