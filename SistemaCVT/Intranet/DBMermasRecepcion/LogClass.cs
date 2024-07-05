using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace DBMermasRecepcion
{
    public class LogClass
    {
        DBMLCVTDESAINTDataContext DBDESAINT = new DBMLCVTDESAINTDataContext();
        //DBMLCVTLOGDataContext DBLOG = new DBMLCVTLOGDataContext();
        public LogClass()
        {
        }
        public bool InsertaRegistroLogDesaint(LOG_SistemaCVT vNuevo)
        {
            bool ret = false;
            DBDESAINT.LOG_SistemaCVT.InsertOnSubmit(vNuevo);
            DBDESAINT.SubmitChanges();
            return ret;
        }
        public bool InsertaRegistroImpresion(int usuario, int numero, int tipo)
        {
            bool ret = false;
            try
            {
                Impresion_Etiquetas nuevo = new Impresion_Etiquetas();
                nuevo.Staff_Id = usuario;
                nuevo.Numero = numero;
                nuevo.Tipo = tipo;
                nuevo.Fecha = DateTime.Now;
                DBDESAINT.Impresion_Etiquetas.InsertOnSubmit(nuevo);
                DBDESAINT.SubmitChanges();
                ret = true;
            }
            catch (Exception)
            {

                
            }
            return ret;
        }
        
        public bool LOGUsabilidad(int idUsuario, int? submenu, string tipoRegistro)
        {
            bool res = false;

            try
            {

                CVT_LogSistema logSis = new CVT_LogSistema();

                logSis.IdUsuario = idUsuario;
                logSis.IdSubMenu = submenu;
                logSis.Tipo = tipoRegistro;
                logSis.Fecha = DateTime.Now;
                


                DBDESAINT.CVT_LogSistema.InsertOnSubmit(logSis);
                DBDESAINT.SubmitChanges();
                res = true;

            }
            catch (Exception)
            {
            }
            return res;
        }

        public string Encrypt(string toEncrypt, bool useHashing)//true
        {
            byte[] buffer;
            byte[] bytes = Encoding.UTF8.GetBytes(toEncrypt);
            AppSettingsReader reader = new AppSettingsReader();
            string s = (string)reader.GetValue("SecurityKey", typeof(string));
            if (useHashing)
            {
                MD5CryptoServiceProvider provider = new MD5CryptoServiceProvider();
                buffer = provider.ComputeHash(Encoding.UTF8.GetBytes(s));
                provider.Clear();
            }
            else
            {
                buffer = Encoding.UTF8.GetBytes(s);
            }
            TripleDESCryptoServiceProvider provider2 = new TripleDESCryptoServiceProvider
            {
                Key = buffer,
                Mode = CipherMode.ECB,
                Padding = PaddingMode.PKCS7
            };
            byte[] inArray = provider2.CreateEncryptor().TransformFinalBlock(bytes, 0, bytes.Length);
            provider2.Clear();
            return Convert.ToBase64String(inArray, 0, inArray.Length);
        }

        public string Decrypt(string cipherString, bool useHashing)//true
        {
            byte[] buffer;
            byte[] inputBuffer = Convert.FromBase64String(cipherString);
            AppSettingsReader reader = new AppSettingsReader();
            string s = (string)reader.GetValue("SecurityKey", typeof(string));
            if (useHashing)
            {
                MD5CryptoServiceProvider provider = new MD5CryptoServiceProvider();
                buffer = provider.ComputeHash(Encoding.UTF8.GetBytes(s));
                provider.Clear();
            }
            else
            {
                buffer = Encoding.UTF8.GetBytes(s);
            }
            TripleDESCryptoServiceProvider provider2 = new TripleDESCryptoServiceProvider
            {
                Key = buffer,
                Mode = CipherMode.ECB,
                Padding = PaddingMode.PKCS7
            };
            byte[] bytes = provider2.CreateDecryptor().TransformFinalBlock(inputBuffer, 0, inputBuffer.Length);
            provider2.Clear();
            return Encoding.UTF8.GetString(bytes);
        }


        public bool LogPrecioEntrega(string err,string Modulo)
        {
            bool res = false;

            try
            {

                CVT_LogPrecioEntrega logPre = new CVT_LogPrecioEntrega();

                logPre.DescError = err;
                logPre.Modulo = Modulo;
                logPre.Fecha = DateTime.Now;
                DBDESAINT.CVT_LogPrecioEntrega.InsertOnSubmit(logPre);
                DBDESAINT.SubmitChanges();
                res = true;

            }
            catch (Exception)
            {
            }
            return res;
        }


    }

}
