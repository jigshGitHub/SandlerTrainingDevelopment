﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SandlerModels.DataIntegration
{
    [Serializable]
    public class Company
    {
        
        private string _billingAddress;
        private string _billingState; 
        private string _billingCity ;
        private string _billingZip; 
        private string _billingCountry;
        private string _pocDepartment; 
        private string _pocEmail; 
        private string _pocFax; 
        private string _assistantLastName;
        private string _assistantFirstName;
        private string _assistantPhone; 
        private string _webSite; 
        private string _empQuantity;
        private string _notes; 
        private string _isSameBillingAddress;
        private string _country; 

        private string _companyName;
        private string _companyOwnership;
        private string _companyDescription;
        private string _city;
        private string _state;
        private string _pocLastName;
        private string _pocFirstName;
        private string _pocPhone;
        private string _isNewCompany;
        private string _compValueGoal;
        private string _indId;
        private string _repLastName;
        private string _repFirstName;
        private string _actionStep;
        private string _discussionTopic;
        private string _address;
        private string _zip;
        private DateTime _lastContactDate;
        private DateTime _nextContactDate;
        private DateTime _creationDate;


        public string Country
        {
            get
            {
                return _country;

            }
            set
            {
                _country = value;
            }
        }
        
        public string IsSameBillingAddress
        {
            get
            {
                return _isSameBillingAddress;

            }
            set
            {
                _isSameBillingAddress = value;
            }
        }

        public string Notes
        {
            get
            {
                return _notes;

            }
            set
            {
                _notes = value;
            }
        }

        public string EmpQuantity
        {
            get
            {
                return _empQuantity;

            }
            set
            {
                _empQuantity = value;
            }
        }

        public string WebSite
        {
            get
            {
                return _webSite;

            }
            set
            {
                _webSite = value;
            }
        }

        public string AssistantPhone
        {
            get
            {
                return _assistantPhone;

            }
            set
            {
                _assistantPhone = value;
            }
        }

        public string AssistantFirstName
        {
            get
            {
                return _assistantFirstName;

            }
            set
            {
                _assistantFirstName = value;
            }
        }

        public string AssistantLastName
        {
            get
            {
                return _assistantLastName;

            }
            set
            {
                _assistantLastName = value;
            }
        }

        public string POCFax
        {
            get
            {
                return _pocFax;

            }
            set
            {
                _pocFax = value;
            }
        }

        public string POCEmail
        {
            get
            {
                return _pocEmail;

            }
            set
            {
                _pocEmail = value;
            }
        }

        public string POCDepartment
        {
            get
            {
                return _pocDepartment;

            }
            set
            {
                _pocDepartment = value;
            }
        }
        
        public string BillingCountry
        {
            get
            {
                return _billingCountry;

            }
            set
            {
                _billingCountry = value;
            }
        }

        public string BillingZip
        {
            get
            {
                return _billingZip;

            }
            set
            {
                _billingZip = value;
            }
        }

        public string BillingCity
        {
            get
            {
                return _billingCity;

            }
            set
            {
                _billingCity = value;
            }
        }

        public string BillingState
        {
            get
            {
                return _billingState;

            }
            set
            {
                _billingState = value;
            }
        }

        public string BillingAddress
        {
            get
            {
                return _billingAddress;

            }
            set
            {
                _billingAddress = value;
            }
        }

        public string CompanyDescription
        {
            get
            {
                return _companyDescription;

            }
            set
            {
                _companyDescription = value;
            }
        }
        
        public string CompanyOwnership
        {
            get
            {
                return _companyOwnership;

            }
            set
            {
                _companyOwnership = value;
            }
        }
        
        public string Address
        {
            get
            {
                return _address;

            }
            set
            {
                _address = value;
            }
        }

        public string Zip
        {
            get
            {
                return _zip;

            }
            set
            {
                _zip = value;
            }
        }

        public DateTime CreationDate
        {
            get
            {
                return _creationDate;

            }
            set
            {
                _creationDate = value;
            }
        }

        public DateTime LastContactDate
        {
            get
            {
                return _lastContactDate;

            }
            set
            {
                _lastContactDate = value;
            }
        }
        
        public DateTime NextContactDate
        {
            get
            {
                return _nextContactDate;

            }
            set
            {
                _nextContactDate = value;
            }
        }

        public string DiscussionTopic
        {
            get
            {
                return _discussionTopic;

            }
            set
            {
                _discussionTopic = value;
            }
        }

        public string ActionStep
        {
            get
            {
                return _actionStep;

            }
            set
            {
                _actionStep = value;
            }
        }

        public string RepFirstName
        {
            get
            {
                return _repFirstName;

            }
            set
            {
                _repFirstName = value;
            }
        }

        public string RepLastName
        {
            get
            {
                return _repLastName;

            }
            set
            {
                _repLastName = value;
            }
        }

        public string IndId
        {
            get
            {
                return _indId;

            }
            set
            {
                _indId = value;
            }
        }
        public string CompValueGoal
        {
            get
            {
                return _compValueGoal;

            }
            set
            {
                _compValueGoal = value;
            }
        }
        public string IsNewCompany
        {
            get
            {
                return _isNewCompany;

            }
            set
            {
                _isNewCompany = value;
            }
        }
        public string POCPhone
        {
            get
            {
                return _pocPhone;
                
            }
            set
            {
                _pocPhone = value;
            }
        }
        public string POCLastName
        {
            get
            {
                return _pocLastName;
            }
            set
            {
                _pocLastName = value;
            }
        }
        public string POCFirstName
        {
            get
            {
                return _pocFirstName;
            }
            set
            {
                _pocFirstName = value;
            }
        }
        public string State
        {
            get
            {
                return _state;
            }
            set
            {
                _state = value;
            }
        }
        public string City
        {
            get
            {
                return _city;
            }
            set
            {
                _city = value;
            }
        }
        public string CompanyName
        {
            get
            {
                return _companyName;
            }
            set
            {
                _companyName = value;
            }
        }
    }
}
