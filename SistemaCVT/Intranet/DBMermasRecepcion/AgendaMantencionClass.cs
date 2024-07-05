using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class AgendaMantencionClass
    {
        DBMLCVTDESAINTDataContext DBDESAINT = new DBMLCVTDESAINTDataContext();

        public AgendaMantencionClass()
        {
        }

        public List<VW_CVT_AGENDAMANTENCION_ENCABEZADO_test> ObtieneAgendamientos()
        {
            List<VW_CVT_AGENDAMANTENCION_ENCABEZADO_test> ret = new List<VW_CVT_AGENDAMANTENCION_ENCABEZADO_test>();
            ret = (from a in DBDESAINT.VW_CVT_AGENDAMANTENCION_ENCABEZADO_test
                   select a).ToList<VW_CVT_AGENDAMANTENCION_ENCABEZADO_test>();
            return ret;
        }

    }
}
