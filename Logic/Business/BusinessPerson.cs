using Entity.Catalogs;
using Logic.Interfaces;
using Repository.Interfaces;

namespace Logic.Business
{
    public class BusinessPerson : IBusinessPerson
    {
        private readonly IRespositoryPerson _repositoryPerson;

        public BusinessPerson(IRespositoryPerson repositoryPerson) {
            _repositoryPerson = repositoryPerson;
        }

        public List<Person> GetPeople() {
            var list = _repositoryPerson.GetPeople();

            list = list.Select(person => {
                person.Age = DateTime.Now.Year - person.Bithday.Year;

                return person;
            }).ToList();

            return list;
        }
    }
}
