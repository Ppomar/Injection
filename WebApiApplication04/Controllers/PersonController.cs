using Logic.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Entity.Catalogs;

namespace WebApiApplication04.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PersonController : ControllerBase {
        private readonly IBusinessPerson _businessPerson;

        public PersonController(IBusinessPerson businessPerson) {
            _businessPerson = businessPerson;
        }

        [HttpGet]
        public List<Person> Get() { 
            var list = _businessPerson.GetPeople();

            return list;
        }

    }
}
