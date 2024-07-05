using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Produccion
{
    public partial class GenerarReprocesoBarrido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 43, "Ingreso");
            }
        }

        protected void btn_agregar1_Click(object sender, EventArgs e) 
        {

        }

        protected void btn_generar_Click(object sender, EventArgs e)
        {
            try
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 43, "Genera Etiqueta Rep.Barr.");
                SAPClass vSAP = new SAPClass();
                WMSClass vWMS = new WMSClass();
                int OF = Convert.ToInt32(cbo_of.Value);
                string lote = "CVT000" + cbo_of.Value.ToString();
                string codArticulo = vSAP.ObtieneCodProductoOF(Convert.ToInt32(cbo_of.Value));
                string codReproceso = vSAP.ObtieneCodProductoReproceso(codArticulo);
                string codBarrido = vSAP.ObtieneCodProductoBarrido(codArticulo);
                decimal peso = vSAP.ObtienePesoProducto(codArticulo);
                int barrido = 0;
                int cantBarrido = 0;
                int reproceso = 0;
                int cantreproceso = 0;
                decimal canttotal = 0;
                if (txt_cantidadBarrido.Text != string.Empty)
                {
                    barrido = 1;
                    cantBarrido = Convert.ToInt32(txt_cantidadBarrido.Text);
                    canttotal = cantBarrido;
                }
                if (txt_cantidadReproceso.Text != string.Empty)
                {
                    reproceso = 1;
                    cantreproceso = Convert.ToInt32(txt_cantidadReproceso.Text);
                    canttotal = canttotal + cantreproceso;
                }
                canttotal = canttotal / peso;
                //Dividir canttotal por  OITM.BWeight1
                MermasClass vMerma = new MermasClass();
                if (vMerma.OFModificadas(OF) == 0)
                {

                    string errorrecibo = vSAP.CreaReciboPorduccionRB(OF, lote, canttotal, cantBarrido, cantreproceso);
                    if (errorrecibo == "0")
                    {
                        string errorSalida = vSAP.CreaSalidaMercaderiaRB(OF, lote, canttotal, codArticulo);
                        if (errorSalida == "0")
                        {
                            string errorEntrada = vSAP.CreaEntradaMercaderiaRB(OF, lote, cantreproceso, cantBarrido, codBarrido, codReproceso);
                            if (errorEntrada == "0")
                            {
                                int RecepcionIdR = vWMS.ObtieneRecepcionProductivaLoteR(lote, codArticulo);
                                int RecepcionIdB = vWMS.ObtieneRecepcionProductivaLoteB(lote, codArticulo);
                                int PKIdB = 0;
                                int PKIdR = 0;
                                int SSCCB = 0;
                                int SSCCR = 0;
                                int idPais = vWMS.TraePaisOFRecepcionPRod(OF);
                                if (barrido == 1)
                                {
                                    if (RecepcionIdB == 0)
                                    {
                                        RecepcionIdB = vWMS.AgregaRecepcionProduccion(85, 258, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()), OF,idPais);
                                    }
                                    #region Crea Pallets Barrido
                                    SSCCB = vWMS.getNewCorrelativo(3);
                                    Package vNEW = new Package();
                                    vNEW.Company_Id = 1;
                                    vNEW.Supportive_Id = 1;
                                    vNEW.Reception_Id = RecepcionIdB;
                                    vNEW.Layout_Id = 3779;
                                    vNEW.ArticleProvider_Id = vWMS.ObtieneIdProduct(codBarrido);
                                    vNEW.ArticleProvider_GrossWeight = 1;
                                    //vNEW.Package_Barcode = cbo_turno.Value.ToString();
                                    vNEW.Package_QuantityInitial = cantBarrido;
                                    vNEW.Package_Quantity = cantBarrido;
                                    vNEW.Package_NetWeight = Convert.ToDecimal(cantBarrido);
                                    vNEW.Package_NetWeightInitial = Convert.ToDecimal(cantBarrido);
                                    vNEW.Package_GrossWeight = Convert.ToDecimal(cantBarrido);
                                    vNEW.Package_GrossWeightInitial = Convert.ToDecimal(cantBarrido);
                                    vNEW.Package_Height = 100;
                                    vNEW.Package_Status = 2;
                                    vNEW.Package_QualityStatus = 1;
                                    vNEW.Package_Owner = "19";
                                    vNEW.Package_SSCC = SSCCB.ToString();
                                    vNEW.Package_SSCCParent = string.Empty;
                                    vNEW.Package_Lot = lote;
                                    vNEW.Package_ProductionDate = DateTime.Now;
                                    vNEW.Package_ExpiresDate = DateTime.Now.AddDays(vWMS.ObtieneDiasVencimiento(codBarrido));
                                    vNEW.Package_Mixed = 0;
                                    vNEW.Package_InDate = DateTime.Now;
                                    vNEW.Package_SN = string.Empty;
                                    vNEW.Package_PN = string.Empty;
                                    vNEW.Package_Data1 = string.Empty;
                                    vNEW.Package_Data2 = "Generado por Etiquetado WEB";
                                    vNEW.PackageState_Id = 1;
                                    vNEW.Accounts_Id = 0;
                                    vNEW.Package_FoilPP = string.Empty;
                                    vNEW.EntryType = 0;
                                    vNEW.Package_Origin = idPais;
                                    vNEW.Package_Destination = 1;
                                    vNEW.Package_CrossDocking = 0;
                                    vNEW.PackageState_Id_Initial = 1;
                                    PKIdB = vWMS.AgregaBultoProduccion(vNEW);
                                    vWMS.AddMovement(85, 1, cantBarrido, 1, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()), cantBarrido, cantBarrido, cantBarrido, PKIdB);
                                    vWMS.AddLocation(PKIdB, 3779, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()));
                                    #endregion
                                }
                                if (reproceso == 1)
                                {
                                    if (RecepcionIdR == 0)
                                    {
                                        RecepcionIdR = vWMS.AgregaRecepcionProduccion(2, 19, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()), OF,idPais);
                                    }
                                    #region Crea Pallets Reproceso
                                    SSCCR = vWMS.getNewCorrelativo(1);
                                    Package vNEW = new Package();
                                    vNEW.Company_Id = 1;
                                    vNEW.Supportive_Id = 1;
                                    vNEW.Reception_Id = RecepcionIdR;
                                    vNEW.Layout_Id = 1464;
                                    vNEW.ArticleProvider_Id = vWMS.ObtieneIdProduct(codReproceso);
                                    vNEW.ArticleProvider_GrossWeight = 1;
                                    //vNEW.Package_Barcode = cbo_turno.Value.ToString();
                                    vNEW.Package_QuantityInitial = cantreproceso;
                                    vNEW.Package_Quantity = cantreproceso;
                                    vNEW.Package_NetWeight = Convert.ToDecimal(cantreproceso);
                                    vNEW.Package_NetWeightInitial = Convert.ToDecimal(cantreproceso);
                                    vNEW.Package_GrossWeight = Convert.ToDecimal(cantreproceso);
                                    vNEW.Package_GrossWeightInitial = Convert.ToDecimal(cantreproceso);
                                    vNEW.Package_Height = 100;
                                    vNEW.Package_Status = 2;
                                    vNEW.Package_QualityStatus = 1;
                                    vNEW.Package_Owner = "19";
                                    vNEW.Package_SSCC = SSCCR.ToString();
                                    vNEW.Package_SSCCParent = string.Empty;
                                    vNEW.Package_Lot = lote;
                                    vNEW.Package_ProductionDate = DateTime.Now;
                                    vNEW.Package_ExpiresDate = DateTime.Now.AddDays(vWMS.ObtieneDiasVencimiento(codReproceso));
                                    vNEW.Package_Mixed = 0;
                                    vNEW.Package_InDate = DateTime.Now;
                                    vNEW.Package_SN = string.Empty;
                                    vNEW.Package_PN = string.Empty;
                                    vNEW.Package_Data1 = string.Empty;
                                    vNEW.Package_Data2 = "Generado por Etiquetado WEB";
                                    vNEW.PackageState_Id = 1;
                                    vNEW.Accounts_Id = 0;
                                    vNEW.Package_FoilPP = string.Empty;
                                    vNEW.EntryType = 0;
                                    vNEW.Package_Origin = idPais;
                                    vNEW.Package_Destination = 1;
                                    vNEW.Package_CrossDocking = 0;
                                    vNEW.PackageState_Id_Initial = 1;
                                    PKIdR = vWMS.AgregaBultoProduccion(vNEW);
                                    vWMS.AddMovement(2, 1, cantreproceso, 1, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()), cantreproceso, cantreproceso, cantreproceso, PKIdR);
                                    vWMS.AddLocation(PKIdR, 1464, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()));
                                    #endregion
                                }

                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Barrido:" + SSCCB + " Reproceso:" + SSCCR + "');", true);
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + errorEntrada + "');", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + errorSalida + "');", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + errorrecibo + "');", true);
                    }
                }
                else
                {
                    // string errorEntrada = vSAP.CreaEntradaMercaderiaRB(OF, lote, cantreproceso, cantBarrido, codBarrido, codReproceso);
                    // if (errorEntrada == "0")
                    //{
                    int RecepcionIdR = vWMS.ObtieneRecepcionProductivaLoteR(lote, codArticulo);
                    int RecepcionIdB = vWMS.ObtieneRecepcionProductivaLoteB(lote, codArticulo);
                    int PKIdB = 0;
                    int PKIdR = 0;
                    int SSCCB = 0;
                    int SSCCR = 0;

                    int idPais = vWMS.TraePaisOFRecepcionPRod(OF);
                    if (barrido == 1)
                    {
                        if (RecepcionIdB == 0)
                        {
                            RecepcionIdB = vWMS.AgregaRecepcionProduccion(85, 258, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()), OF,idPais);
                        }
                        #region Crea Pallets Barrido
                        SSCCB = vWMS.getNewCorrelativo(3);
                        Package vNEW = new Package();
                        vNEW.Company_Id = 1;
                        vNEW.Supportive_Id = 1;
                        vNEW.Reception_Id = RecepcionIdB;
                        vNEW.Layout_Id = 3779;
                        vNEW.ArticleProvider_Id = vWMS.ObtieneIdProduct(codBarrido);
                        vNEW.ArticleProvider_GrossWeight = 1;
                        //vNEW.Package_Barcode = cbo_turno.Value.ToString();
                        vNEW.Package_QuantityInitial = cantBarrido;
                        vNEW.Package_Quantity = cantBarrido;
                        vNEW.Package_NetWeight = Convert.ToDecimal(cantBarrido);
                        vNEW.Package_NetWeightInitial = Convert.ToDecimal(cantBarrido);
                        vNEW.Package_GrossWeight = Convert.ToDecimal(cantBarrido);
                        vNEW.Package_GrossWeightInitial = Convert.ToDecimal(cantBarrido);
                        vNEW.Package_Height = 100;
                        vNEW.Package_Status = 2;
                        vNEW.Package_QualityStatus = 1;
                        vNEW.Package_Owner = "19";
                        vNEW.Package_SSCC = SSCCB.ToString();
                        vNEW.Package_SSCCParent = string.Empty;
                        vNEW.Package_Lot = lote;
                        vNEW.Package_ProductionDate = DateTime.Now;
                        vNEW.Package_ExpiresDate = DateTime.Now.AddDays(vWMS.ObtieneDiasVencimiento(codBarrido));
                        vNEW.Package_Mixed = 0;
                        vNEW.Package_InDate = DateTime.Now;
                        vNEW.Package_SN = string.Empty;
                        vNEW.Package_PN = string.Empty;
                        vNEW.Package_Data1 = string.Empty;
                        vNEW.Package_Data2 = "Generado por Etiquetado WEB";
                        vNEW.PackageState_Id = 1;
                        vNEW.Accounts_Id = 0;
                        vNEW.Package_FoilPP = string.Empty;
                        vNEW.EntryType = 0;
                        vNEW.Package_Origin = idPais;
                        vNEW.Package_Destination = 1;
                        vNEW.Package_CrossDocking = 0;
                        vNEW.PackageState_Id_Initial = 1;
                        PKIdB = vWMS.AgregaBultoProduccion(vNEW);
                        vWMS.AddMovement(85, 1, cantBarrido, 1, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()), cantBarrido, cantBarrido, cantBarrido, PKIdB);
                        vWMS.AddLocation(PKIdB, 3779, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()));
                        #endregion
                    }
                    if (reproceso == 1)
                    {
                        if (RecepcionIdR == 0)
                        {
                            RecepcionIdR = vWMS.AgregaRecepcionProduccion(2, 19, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()), OF,idPais);
                        }
                        #region Crea Pallets Reproceso
                        SSCCR = vWMS.getNewCorrelativo(1);
                        Package vNEW = new Package();
                        vNEW.Company_Id = 1;
                        vNEW.Supportive_Id = 1;
                        vNEW.Reception_Id = RecepcionIdR;
                        vNEW.Layout_Id = 1464;
                        vNEW.ArticleProvider_Id = vWMS.ObtieneIdProduct(codReproceso);
                        vNEW.ArticleProvider_GrossWeight = 1;
                        //vNEW.Package_Barcode = cbo_turno.Value.ToString();
                        vNEW.Package_QuantityInitial = cantreproceso;
                        vNEW.Package_Quantity = cantreproceso;
                        vNEW.Package_NetWeight = Convert.ToDecimal(cantreproceso);
                        vNEW.Package_NetWeightInitial = Convert.ToDecimal(cantreproceso);
                        vNEW.Package_GrossWeight = Convert.ToDecimal(cantreproceso);
                        vNEW.Package_GrossWeightInitial = Convert.ToDecimal(cantreproceso);
                        vNEW.Package_Height = 100;
                        vNEW.Package_Status = 2;
                        vNEW.Package_QualityStatus = 1;
                        vNEW.Package_Owner = "19";
                        vNEW.Package_SSCC = SSCCR.ToString();
                        vNEW.Package_SSCCParent = string.Empty;
                        vNEW.Package_Lot = lote;
                        vNEW.Package_ProductionDate = DateTime.Now;
                        vNEW.Package_ExpiresDate = DateTime.Now.AddDays(vWMS.ObtieneDiasVencimiento(codReproceso));
                        vNEW.Package_Mixed = 0;
                        vNEW.Package_InDate = DateTime.Now;
                        vNEW.Package_SN = string.Empty;
                        vNEW.Package_PN = string.Empty;
                        vNEW.Package_Data1 = string.Empty;
                        vNEW.Package_Data2 = "Generado por Etiquetado WEB";
                        vNEW.PackageState_Id = 1;
                        vNEW.Accounts_Id = 0;
                        vNEW.Package_FoilPP = string.Empty;
                        vNEW.EntryType = 0;
                        vNEW.Package_Origin = idPais;
                        vNEW.Package_Destination = 1;
                        vNEW.Package_CrossDocking = 0;
                        vNEW.PackageState_Id_Initial = 1;
                        PKIdR = vWMS.AgregaBultoProduccion(vNEW);
                        vWMS.AddMovement(2, 1, cantreproceso, 1, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()), cantreproceso, cantreproceso, cantreproceso, PKIdR);
                        vWMS.AddLocation(PKIdR, 1464, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()));
                        #endregion
                    }

                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Barrido:" + SSCCB + " Reproceso:" + SSCCR + "');", true);
                    //}
                    //else
                    //{
                    //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + errorEntrada + "');", true);
                    //}
                }
            }
            catch
            {

            }
        }


    }
}