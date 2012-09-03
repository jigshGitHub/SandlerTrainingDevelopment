using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SandlerModels
{
    [Serializable]
    public class Company
    {
        private string _companyName;
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
