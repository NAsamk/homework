namespace Homework16.Domain.Entities
{
    public class Person
    {
        public required DateTime CreateDate { get; set; }
        public required string Firstname { get; set; }
        public required string Lastname { get; set; }
        public required string JobPosition { get; set; }
        public required double Salary { get; set; }
        public required double WorkExperience { get; set; }
        public required Address PersonAddress { get; set; }
    }

}
