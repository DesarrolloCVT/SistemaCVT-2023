﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.42000
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DBMermasRecepcion.Properties {
    
    
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "17.8.0.0")]
    internal sealed partial class Settings : global::System.Configuration.ApplicationSettingsBase {
        
        private static Settings defaultInstance = ((Settings)(global::System.Configuration.ApplicationSettingsBase.Synchronized(new Settings())));
        
        public static Settings Default {
            get {
                return defaultInstance;
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.SpecialSettingAttribute(global::System.Configuration.SpecialSetting.ConnectionString)]
        [global::System.Configuration.DefaultSettingValueAttribute("Data Source=alerce;Initial Catalog=SBO_CVTRADING;Persist Security Info=True;User " +
            "ID=sa;Password=cvt.vdp22$;Connect Timeout=3600;Encrypt=False")]
        public string SBO_CVTRADINGConnectionString {
            get {
                return ((string)(this["SBO_CVTRADINGConnectionString"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.SpecialSettingAttribute(global::System.Configuration.SpecialSetting.ConnectionString)]
        [global::System.Configuration.DefaultSettingValueAttribute("Data Source=alerce;Initial Catalog=SBO_MMETRO;Persist Security Info=True;User ID=" +
            "sa;Password=cvt.vdp22$;Encrypt=False")]
        public string SBO_MMETROConnectionString {
            get {
                return ((string)(this["SBO_MMETROConnectionString"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.SpecialSettingAttribute(global::System.Configuration.SpecialSetting.ConnectionString)]
        [global::System.Configuration.DefaultSettingValueAttribute("Data Source=alerce;Initial Catalog=CVT_CONTROL_BIO;Persist Security Info=True;Use" +
            "r ID=sa;Password=cvt.vdp22$;Encrypt=False")]
        public string CVT_CONTROL_BIOConnectionString {
            get {
                return ((string)(this["CVT_CONTROL_BIOConnectionString"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.SpecialSettingAttribute(global::System.Configuration.SpecialSetting.ConnectionString)]
        [global::System.Configuration.DefaultSettingValueAttribute("Data Source=alerce;Initial Catalog=CVT_WMS_SMM;Persist Security Info=True;User ID" +
            "=sa;Password=cvt.vdp22$;Encrypt=False")]
        public string CVT_WMS_SMMConnectionString {
            get {
                return ((string)(this["CVT_WMS_SMMConnectionString"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.SpecialSettingAttribute(global::System.Configuration.SpecialSetting.ConnectionString)]
        [global::System.Configuration.DefaultSettingValueAttribute("Data Source=alerce;Initial Catalog=CvWmsProd2;Persist Security Info=True;User ID=" +
            "sa;Password=cvt.vdp22$;Connect Timeout=3600;Encrypt=False")]
        public string CvWmsProd2ConnectionString {
            get {
                return ((string)(this["CvWmsProd2ConnectionString"]));
            }
        }
        
        [global::System.Configuration.ApplicationScopedSettingAttribute()]
        [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [global::System.Configuration.SpecialSettingAttribute(global::System.Configuration.SpecialSetting.ConnectionString)]
        [global::System.Configuration.DefaultSettingValueAttribute("Data Source=alerce;Initial Catalog=CVT_DESAINT;Persist Security Info=True;User ID" +
            "=sa;Password=cvt.vdp22$;Connect Timeout=3600;Encrypt=False")]
        public string CVT_DESAINTConnectionString {
            get {
                return ((string)(this["CVT_DESAINTConnectionString"]));
            }
        }
    }
}