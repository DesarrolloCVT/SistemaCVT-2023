using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class MailingClass
    {
        public MailingClass()
        {
        }
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSDataContext DBWms = new DBMLCVTWMSDataContext();
        DBMLCVTSAPDataContext DBSap = new DBMLCVTSAPDataContext();

        public List<CVT_MailingInformes> ObtieneMailInforme(string Informe)
        {
            List<CVT_MailingInformes> ret = new List<CVT_MailingInformes>();
            try
            {
                ret = (from m in DBDesaint.CVT_MailingInformes
                       where m.Informe.Equals(Informe)
                       select m).ToList<CVT_MailingInformes>();
            }
            catch
            {
            }
            return ret;
        }


    }
}
