using Senai.Optus.Domains;
using System;
using System.Collections.Generic;
using System.Text;

namespace Senai.Optus.Interfaces
{
    public interface IEstiloMusicalRepository
    {
        List<EstiloMusical> Listar();
        void Cadastrar(EstiloMusical estiloMusical);

        void Deletar(int id);

        void Atualizar(int id, EstiloMusical estiloMusical);

        EstiloMusical BuscarPorId(int id);
    }
}
