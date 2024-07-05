using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Data;
using DBMermasRecepcion;

// NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Service1" en el código, en svc y en el archivo de configuración.
public class Service : IService
{
    //public string GetData(int value)
    //{
    //	return string.Format("You entered: {0}", value);
    //}

    //public CompositeType GetDataUsingDataContract(CompositeType composite)
    //{
    //	if (composite == null)
    //	{
    //		throw new ArgumentNullException("composite");
    //	}
    //	if (composite.BoolValue)
    //	{
    //		composite.StringValue += "Suffix";
    //	}
    //	return composite;
    //}

    //   public List<CVT_Usuarios> GetDataObtieneDatosUsuario (int IdUsuario)
    //   {
    //       List<CVT_Usuarios> ret = new List<CVT_Usuarios>();

    //       try
    //       {
    //           UsuarioClass vUsuario = new UsuarioClass();
    //           ret= vUsuario.ObtieneDatosUsuarioPorID(IdUsuario);
    //       }
    //       catch
    //       {

    //       }
    //       return ret;
    //   }

    //   public bool GetDataVerificaUser(string nomusu, string contrasena)
    //   {
    //       bool rs = false;

    //       LogClass lg = new LogClass();
    //       string pass = lg.Encrypt(contrasena, true);

    //       UsuarioClass vUsuario = new UsuarioClass();     
    //       int CID = vUsuario.VerificaUsuarioClaveEncriptada(nomusu, pass);
    //       if (CID != 0){
    //           rs = true;                   
    //       }
    //       else
    //       {
    //           rs = false;
    //       }
    //       return rs;
    //   }

    public int GetSuma(int num1, int num2)
    {
        int res = 0;

        return res = num1 + num2;          
               
         
    }

}
