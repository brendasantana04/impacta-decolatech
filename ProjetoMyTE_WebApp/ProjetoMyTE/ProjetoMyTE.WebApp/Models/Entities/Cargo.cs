﻿namespace ProjetoMyTE.WebApp.Models.Entities
{
    public class Cargo
    {
        //definindo propriedades de cargo
        public int ID { get; set; }
        public string? DESCRICAO { get; set; }
        public int AreaId{ get; set; }
        public int SALARIO { get; set; }
        public Area? AreaAtuacao { get; set; }
    }
}
