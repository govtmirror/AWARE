﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Harris.Common;

namespace AwareQIManager
{
    public enum AwareObjectTypes { REPORT_DEFINITIONS = 0, SECURITY_GROUPS, VIEW_ALL_PROVIDERS };

    public class AwareAppSettings
    {
        private const int DEF_ATTEMPTS = 3;
        private const int DEF_DATE_SPAN = 90;
        private const string DEF_LOGON_ID_TEXT = "Access Code / Username: ";
        private const string DEF_LOGON_PWD_TEXT = "Verify Code / Password: ";
        
        public string ApplBaseUrl { get; set; }
        
        public string GetApplicationName
        {
            get
            {
                string appName = System.Configuration.ConfigurationManager.AppSettings["ApplicationName"];
                return appName;
            }
        }

        public string GetLogonIdText
        {
            get
            {
                string logonIdText = System.Configuration.ConfigurationManager.AppSettings["LogonIdText"];
                if (true == string.IsNullOrWhiteSpace(logonIdText))
                {
                    logonIdText = DEF_LOGON_ID_TEXT;
                }
                else
                {
                    logonIdText = string.Format("{0}: ", logonIdText);
                }
                return logonIdText;
            }
        }

        public string GetLogonPwdText
        {
            get
            {
                string logonPwdText = System.Configuration.ConfigurationManager.AppSettings["LogonPwdText"];
                if (true == string.IsNullOrWhiteSpace(logonPwdText))
                {
                    logonPwdText = DEF_LOGON_PWD_TEXT;
                }
                else
                {
                    logonPwdText = string.Format("{0}: ", logonPwdText);
                }
                return logonPwdText;
            }
        }
        public string GetApplicationVersion
        {
            get
            {
                return System.Configuration.ConfigurationManager.AppSettings["ApplicationVersion"];
            }
        }

        public int GetMaxLogonAttempts
        {
            get
            {
                int maxlogonAttempts = int.Parse(System.Configuration.ConfigurationManager.AppSettings["MaxLogonAttempts"]);
                if (0 == maxlogonAttempts)
                    maxlogonAttempts = DEF_ATTEMPTS;
                return maxlogonAttempts;
            }
        }

        public int GetDefaultDateSpan
        {
            get
            {
                int dateSpan = int.Parse(System.Configuration.ConfigurationManager.AppSettings["DefaultStartDateSpan"]);
                if (0 == dateSpan)
                    dateSpan = DEF_DATE_SPAN;
                return -dateSpan;
            }
        }

        public bool GetUseAdCredentials
        {
            get
            {
                bool useAd = false;
                string useAdCredentials = System.Configuration.ConfigurationManager.AppSettings["UseADCredentials"];
                useAdCredentials = useAdCredentials.ToUpper();
                if ("TRUE" == useAdCredentials)
                    useAd = true;
                return useAd;
            }
        }

        public bool GetSharedComputer
        {
            get
            {
                bool useAd = false;
                string useAdCredentials = System.Configuration.ConfigurationManager.AppSettings["SharedComputer"];
                useAdCredentials = useAdCredentials.ToUpper();
                if ("TRUE" == useAdCredentials)
                    useAd = true;
                return useAd;
            }
        }

        public bool MaskLogonUserName
        {
            get
            {
                bool mask = false;
                string maskUserName = System.Configuration.ConfigurationManager.AppSettings["LogonUserNameIsMasked"];
                maskUserName = maskUserName.ToUpper();
                if ("TRUE" == maskUserName)
                    mask = true;
                return mask;                
            }
        }

        public string GetSuperUserList
        {
            get
            {
                string suName = "";
                suName = System.Configuration.ConfigurationManager.AppSettings["SuperUsers"];
                suName = suName.ToUpper();

                return suName;
            }
        }

        public string GetReportServerUrl
        {
            get
            {
                string url = string.Empty;
                try
                {
                    url = Properties.Settings.Default.AwareQIManager_Reportingservice2010_ReportingService2010.ToString();
                    int a = 9;
                }
                catch
                {
                }
                return url;
            }
        }

        public string GetReportServerUrlSansWebService
        {
            get
            {
                string url = string.Empty;
                try
                {
                    url = Properties.Settings.Default.AwareQIManager_Reportingservice2010_ReportingService2010.ToString();
                    url = url.Substring(0, url.LastIndexOf('/'));
                }
                catch
                {
                }
                return url;
            }
        }

        public string GetReportsRootFolder
        {
            get
            {
                string rootFolder = System.Configuration.ConfigurationManager.AppSettings["ReportsRootFolder"];
                return rootFolder;
            }
        }

        public string GetAwareDbConnectionString
        {
            get
            {
                return Properties.Settings.Default.AWARE_DB_ConnectionString.ToString();
            }
        }

        public string GetConsultsDbConnectionString
        {
            get
            {
                return Properties.Settings.Default.Consults_DB_ConnectionString.ToString();
            }
        }
    }
}