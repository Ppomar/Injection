using Entity.Catalogs;

namespace Repository.Interfaces
{
    public interface IRepositoryPerson
    {
        List<Person> GetPeople();
    }
}