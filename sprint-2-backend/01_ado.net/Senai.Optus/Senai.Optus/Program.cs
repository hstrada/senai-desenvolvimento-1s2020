using Senai.Optus.Domains;
using Senai.Optus.Interfaces;
using Senai.Optus.Repositories;
using System;
using System.Collections.Generic;

namespace Senai.Optus
{
    class Program
    {
        public static IEstiloMusicalRepository _repositorio = new EstiloMusicalRepository();

        static void Main(string[] args)
        {
            RecuperarEstilosMusicais();
            //GravarEstiloMusical();
            //ExcluirEstiloMusical();
            //AtualizarEstiloMusical();
            //BuscarEstiloMusicalPorId();
        }

        private static void BuscarEstiloMusicalPorId()
        {
            EstiloMusical estilo = _repositorio.BuscarPorId(2);
            Console.WriteLine(estilo.Nome);
        }

        private static void AtualizarEstiloMusical()
        {
            _repositorio.Atualizar(2, new EstiloMusical { Nome = "Indie Folk" });
        }

        private static void ExcluirEstiloMusical()
        {
            _repositorio.Deletar(3);
        }

        private static void GravarEstiloMusical()
        {
            EstiloMusical novoEstilo = new EstiloMusical();
            novoEstilo.Nome = "Pop";
            _repositorio.Cadastrar(novoEstilo);
        }

        private static void RecuperarEstilosMusicais()
        {
            List<EstiloMusical> estilos = _repositorio.Listar();
            foreach (var item in estilos)
            {
                Console.WriteLine(item.Nome);
            }
        }
    }
}
