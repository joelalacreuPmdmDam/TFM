﻿namespace EmptyRestAPI.Models
{
    public class TablonActividadesObject
    {
        public int? id {  get; set; }
        public int? idActividad { get; set; }
        public String? actividad { get; set; }
        public Boolean? completa { get; set; } 
        public DateTime? fecha { get; set; }
        public int? inscripciones { get; set; }        
        public int? idInstructor { get; set; }
        public String? instructor { get; set; }

    }

    public class TablonActividadesResponseObject
    {
        public TablonActividadesObject[] TablonActividades {  get; set; }
    }
}
