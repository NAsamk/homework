namespace Homework16.DTOs
{
    public class PersonCreateDto
    {
        public required DateTime CreateDate { get; set; }
        public required string Firstname { get; set; }
        public required string Lastname { get; set; }
        public required string JobPosition { get; set; }
        public required double Salary { get; set; }
        public required double WorkExperience { get; set; }
        public required AddressDto Address { get; set; }
    }



    public class AddressDto
    {
        public required string Country { get; set; }
        public required string City { get; set; }
        public required string HomeNumber { get; set; }
    }

}
