using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DBMermasRecepcion
{
    public class MenuClass
    {
        DBMLCVTDESAINTDataContext DBDatos = new DBMLCVTDESAINTDataContext();
        public MenuClass()
        {
        }
        public DataTable ObtieneMenuUsuarioPorPerfil(int PerfilId)
        {
            DataTable ret = new DataTable();
            try
            {
                var temp = from pp in DBDatos.CVT_PrivilegioPerfil
                           join s in DBDatos.CVT_SubMenu on pp.IdSubMenu equals s.IdSubMenu
                           join m in DBDatos.CVT_Menu on s.IdMenu equals m.IdMenu
                           where pp.IdPerfil.Equals(PerfilId) && m.IdMenu != 59
                           orderby m.Nombre_Menu, s.Nombre_SubMenu
                           select new { m.Nombre_Menu, s.Nombre_SubMenu, s.URL_SubMenu };
                ret = Utilidades.LINQToDataTable(temp);
            }
            catch { }
            return ret;

        }

        public DataTable ObtieneSubMenuUsuarioPorPerfil(int PerfilId, int MenuID)
        {
            DataTable ret = new DataTable();
            try
            {
                var temp = from pp in DBDatos.CVT_PrivilegioPerfil
                           join s in DBDatos.CVT_SubMenu on pp.IdSubMenu equals s.IdSubMenu
                           join m in DBDatos.CVT_Menu on s.IdMenu equals m.IdMenu
                           where pp.IdPerfil.Equals(PerfilId) && m.IdMenu.Equals(MenuID)
                           orderby m.Nombre_Menu, s.Nombre_SubMenu
                           select new { s.Nombre_SubMenu, s.URL_SubMenu, m.IdMenu };
                ret = Utilidades.LINQToDataTable(temp);
            }
            catch { }
            return ret;
        }
    }
}
