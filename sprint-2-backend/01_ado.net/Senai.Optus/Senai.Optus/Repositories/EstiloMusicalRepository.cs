using Senai.Optus.Domains;
using Senai.Optus.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;

namespace Senai.Optus.Repositories
{
    public class EstiloMusicalRepository : IEstiloMusicalRepository
    {
        private string StringConexao = "Data Source=localhost; initial catalog=Optus;User Id=sa;Pwd=132";

        public void Atualizar(int id, EstiloMusical estiloMusical)
        {
            string Query = "UPDATE EstilosMusicais SET Nome = @Nome WHERE EstiloMusicalId = @EstiloMusicalId";

            using (SqlConnection con = new SqlConnection(StringConexao))
            {
                // faco o comando
                SqlCommand cmd = new SqlCommand(Query, con);
                // defino os parametros
                cmd.Parameters.AddWithValue("@Nome", estiloMusical.Nome);
                cmd.Parameters.AddWithValue("@EstiloMusicalId", id);
                // abrir a conexao
                con.Open();
                // executar
                cmd.ExecuteNonQuery();

            }
        }

        public EstiloMusical BuscarPorId(int id)
        {
            string Query = "SELECT EstiloMusicalId, Nome FROM EstilosMusicais WHERE EstiloMusicalId = @Id";

            // aonde, em qual local
            using (SqlConnection con = new SqlConnection(StringConexao))
            {
                con.Open();
                SqlDataReader sdr;

                using (SqlCommand cmd = new SqlCommand(Query, con))
                {
                    cmd.Parameters.AddWithValue("@Id", id);
                    sdr = cmd.ExecuteReader();

                    if (sdr.HasRows)
                    {
                        while (sdr.Read())
                        {
                            EstiloMusical estilo = new EstiloMusical
                            {
                                EstiloMusicalId = Convert.ToInt32(sdr["EstiloMusicalId"]),
                                Nome = sdr["Nome"].ToString()
                            };
                            return estilo;
                        }
                    }

                    return null;
                }
            }
        }

        public void Cadastrar(EstiloMusical estiloMusical)
        {
            string Query = "INSERT INTO EstilosMusicais VALUES (@Nome)";

            using (SqlConnection con = new SqlConnection(StringConexao))
            {
                // declara o comando com a query e a conexao
                SqlCommand cmd = new SqlCommand(Query, con);
                cmd.Parameters.AddWithValue("@Nome", estiloMusical.Nome);
                // abre a conexao
                con.Open();
                // executa o comando
                cmd.ExecuteNonQuery();
            }
        }

        public void Deletar(int id)
        {
            string Query = "DELETE FROM EstilosMusicais WHERE EstiloMusicalId = @EstiloMusicalId";
            // conexao
            using (SqlConnection con = new SqlConnection(StringConexao))
            {
                // comando
                SqlCommand cmd = new SqlCommand(Query, con);
                cmd.Parameters.AddWithValue("@EstiloMusicalId", id);
                con.Open();
                // executar
                cmd.ExecuteNonQuery();
            }
        }

        public List<EstiloMusical> Listar()
        {
            List<EstiloMusical> estilos = new List<EstiloMusical>();

            // abrir uma conexao com o banco
            using (SqlConnection con = new SqlConnection(StringConexao))
            {
                // fazer a leitura de todos os registros
                // declarar a instrucao a ser realizada
                string Query = "SELECT EstiloMusicalId, Nome FROM EstilosMusicais ORDER BY Nome ASC";

                // abre a conexao com o bd
                con.Open();
                // declaro para percorrer a lista
                SqlDataReader rdr;

                using (SqlCommand cmd = new SqlCommand(Query, con))
                {
                    // executa a query
                    rdr = cmd.ExecuteReader();

                    while (rdr.Read())
                    {
                        EstiloMusical estilo = new EstiloMusical
                        {
                            EstiloMusicalId = Convert.ToInt32(rdr[0]),
                            Nome = rdr["Nome"].ToString()
                        };
                        estilos.Add(estilo);
                    }

                }

            }

            // devolver a lista preenchida
            return estilos;
        }
    }
}
