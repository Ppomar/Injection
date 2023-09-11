using Entity.Catalogs;
using System.Data.SqlClient;
using System.Data;
using Repository.Interfaces;

namespace Repository.Repositories
{
    public class RepositoryPerson : IRepositoryPerson
    {
        public List<Person> GetPeople() {
            var list = new List<Person>();
            SqlConnection conn = null;

            try {
                conn = new SqlConnection();
                conn.ConnectionString = Connection.PracticesConnectionString;
                conn.Open();

                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "SP_PERSONA_READ";
                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read()) {
                    var pe = new Person();

                    pe.Id = dr.GetInt32(dr.GetOrdinal("Id"));
                    pe.FirstName = dr.GetString(dr.GetOrdinal("Nombres"));
                    pe.LastName = dr.GetString(dr.GetOrdinal("ApellidoPaterno"));
                    pe.Bithday = dr.GetDateTime(dr.GetOrdinal("FechaNacimiento"));
                    pe.Modified = dr.GetDateTime(dr.GetOrdinal("Modificado"));
                    pe.ModifiedBy = dr.GetString(dr.GetOrdinal("ModificadoPor"));

                    list.Add(pe);
                }
            }
            catch (Exception ex) {

            }
            finally { if (conn != null) { conn.Close(); conn.Dispose(); } }

            return list;
        }
    }
}
