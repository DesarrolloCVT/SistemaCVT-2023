﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Data;
using DBMermasRecepcion;

// NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IService1" en el código y en el archivo de configuración a la vez.
[ServiceContract]
public interface IService
{

	//[OperationContract]
	//string GetData(int value);

	//[OperationContract]
	//CompositeType GetDataUsingDataContract(CompositeType composite);
 //   [OperationContract]
 //   List<CVT_Usuarios> GetDataObtieneDatosUsuario(int IdUsuario);

 //   [OperationContract]
 //   bool GetDataVerificaUser(string nomusu, string contrasena);

    [OperationContract]
    int GetSuma(int num1, int num2);

    // TODO: agregue aquí sus operaciones de servicio
}

// Utilice un contrato de datos, como se ilustra en el ejemplo siguiente, para agregar tipos compuestos a las operaciones de servicio.
[DataContract]
public class CompositeType
{
	//bool boolValue = true;
	//string stringValue = "Hello ";

	//[DataMember]
	//public bool BoolValue
	//{
	//	get { return boolValue; }
	//	set { boolValue = value; }
	//}

	//[DataMember]
	//public string StringValue
	//{
	//	get { return stringValue; }
	//	set { stringValue = value; }
	//}
}
