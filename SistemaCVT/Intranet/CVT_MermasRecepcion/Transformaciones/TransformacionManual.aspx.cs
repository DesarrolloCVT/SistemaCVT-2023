using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

namespace CVT_MermasRecepcion.Transformaciones
{
    public partial class TransformacionManual : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_Transformacion.Text = Session["TransformacionId"].ToString();

            TransformacionesClass vT = new TransformacionesClass();
            int Tr = vT.ObtieneEstadoTransformacion(Convert.ToInt32(Session["TransformacionId"]));

            if(Tr==2)
            {
                btn_generar.Enabled = false;
                GvDatos.Columns[0].Visible = false;
            }
         




        }

        protected void txt_origen_TextChanged(object sender, EventArgs e)
        {
            WMSClass vWMS = new WMSClass();
            List<Package> dt = vWMS.ObtieneInfoPallet(txt_origen.Text);
            if (dt.Count() == 0)
            {
                lbl_error.Visible = true;
                btn_generar.Enabled = false;
                lbl_cantidad.Text = string.Empty;
                lbl_codproducto.Text = string.Empty;
                lbl_producto.Text = string.Empty;
                lbl_lote.Text = string.Empty;
                lbl_idproducto.Text = string.Empty;
                lbl_idpallet.Text = string.Empty;
                lbl_posicion.Text = string.Empty;
            }
            else
            {
               
                foreach (var p in dt)
                {
                    if(p.Package_ReserveQuantity>0)
                    {
                       ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error Pallet Con cantidad Reservada en transaccion');", true); 
                    }
                    else
                    {
                        lbl_error.Visible = false;
                        btn_generar.Enabled = true;

                        List<Layout> ly = vWMS.ObtieneInfoLayout((int)p.Layout_Id);
                        int siteidpk = 0;
                        int siteidtr = 0;
                        foreach (var l in ly)
                        {
                            siteidpk = l.Site_Id;
                        }
                        TransformacionesClass vT = new TransformacionesClass();
                        List<CVT_Transformacion> Tr = vT.ObtieneTransformacion(Convert.ToInt32(Session["TransformacionId"]));
                        foreach (var t in Tr)
                        {
                            siteidtr = t.Site_Id;
                        }
                        if (siteidtr == siteidpk)
                        {
                            List<ArticleProvider> ap = vWMS.ObtieneInfoProducto(p.ArticleProvider_Id);
                            foreach (var a in ap)
                            {
                                lbl_codproducto.Text = a.ArticleProvider_CodClient;
                                lbl_producto.Text = a.ArticleProvider_Description;
                                Session["Familia"] = a.Family_Id;
                                lbl_idproducto.Text = p.ArticleProvider_Id.ToString();
                            }
                            lbl_lote.Text = p.Package_Lot;
                            lbl_cantidad.Text = p.Package_Quantity.ToString();
                            lbl_idpallet.Text = p.Package_Id.ToString();
                            lbl_posicion.Text = p.Layout_Id.ToString();
                            cbo_producto.DataBind();
                        }
                        else
                        {
                            lbl_error.Visible = true;
                            btn_generar.Enabled = false;
                        }
                    }                  
                }
            }

        }

        protected void btn_generar_Click(object sender, EventArgs e)
        {
            try
            {
                TransformacionesClass vTr = new TransformacionesClass();

                int idpackage = Convert.ToInt32(lbl_idpallet.Text);
                int cantidad = Convert.ToInt32(lbl_cantidad.Text);
                int productoid = Convert.ToInt32(lbl_idproducto.Text);
                int productodestinoid = Convert.ToInt32(cbo_producto.Value);
                int cantidaddestino = Convert.ToInt32(txt_cantidad.Text);
                int transformacionid = Convert.ToInt32(Session["TransformacionId"]);
                int posicionid = Convert.ToInt32(lbl_posicion.Text);

                int valida = vTr.ValidaPalletExiste(transformacionid, idpackage);
                if (valida == 0)
                {
                    LogClass vLog = new LogClass();
                    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 46, "Crea transf.Detalle");

                    CVT_TransformacionDetalle nuevo = new CVT_TransformacionDetalle();
                    nuevo.Transformacion_Id = transformacionid;
                    nuevo.Package_Id = idpackage;
                    nuevo.ArticleProvider_Id = productoid;
                    nuevo.Package_Quantity = cantidad;
                    nuevo.ArticleProviderDestiny_Id = productodestinoid;
                    nuevo.PackageDestiny_Quantity = cantidaddestino;
                    nuevo.Layout_Id = posicionid;


                    vTr.AgregaDetalle(nuevo);
                }
            }
            catch
            {
            }
            GvDatos.DataBind();
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
            this.ASPxGridViewExporter1.FileName = "Detalle Transformacion " + Session["TransformacionId"].ToString();
            Options.SheetName = this.ASPxGridViewExporter1.FileName;
            this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int key = Convert.ToInt32(e.Keys["TransformacionDet_Id"]);
            TransformacionesClass vTR = new TransformacionesClass();
            vTR.EliminaDetTransformacion(key);
            GvDatos.DataBind();
            e.Cancel = true;
        }

        protected void cbo_producto_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}