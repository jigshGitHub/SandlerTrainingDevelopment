using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SandlerModels.DataIntegration
{
    [Serializable]
    public class Contact
    {
        private string _actionStep;
        private string _discussionTopic;
        private string _lastName;
        private string _firstName;
        private string _phone;
        private string _email;
        private string _bossName;
        private string _companyYears;
        //Date fields
        private DateTime _lastContactDate;
        private DateTime _nextContactDate;
        private DateTime _courseTrainingDate;
        private DateTime  _birthDay;
        private DateTime _anniversary;
        //List Box
        private string _companyIdList;
        private string _isNewApptList;
        private string _isEmailSubscriptionList;
        private string _isNeedCallBackList;
        private string _apptSourceList;
        private string _courseIdList;
        private string _isRegisteredForTrainingList;
        
        
        
        public string IsRegisteredForTrainingList
        {
            get
            {
                return _isRegisteredForTrainingList;

            }
            set
            {
                _isRegisteredForTrainingList = value;
            }
        }
        public string CourseIdList
        {
            get
            {
                return _courseIdList;

            }
            set
            {
                _courseIdList = value;
            }
        }

        public DateTime CourseTrainingDate
        {
            get
            {
                return _courseTrainingDate;

            }
            set
            {
                _courseTrainingDate = value;
            }
        }

        public string ApptSourceList
        {
            get
            {
                return _apptSourceList;

            }
            set
            {
                _apptSourceList = value;
            }
        }
        
        public string IsEmailSubscriptionList
        {
            get
            {
                return _isEmailSubscriptionList;

            }
            set
            {
                _isEmailSubscriptionList = value;
            }
        }

        public string IsNeedCallBackList
        {
            get
            {
                return _isNeedCallBackList;

            }
            set
            {
                _isNeedCallBackList = value;
            }
        }

        public string CompanyYears
        {
            get
            {
                return _companyYears;

            }
            set
            {
                _companyYears = value;
            }
        }
        
        public string BossName
        {
            get
            {
                return _bossName;

            }
            set
            {
                _bossName = value;
            }
        }
        
        public DateTime Anniversary
        {
            get
            {
                return _anniversary;

            }
            set
            {
                _anniversary = value;
            }
        }

        public DateTime BirthDay
        {
            get
            {
                return _birthDay;

            }
            set
            {
                _birthDay = value;
            }
        }
        
        public string Email
        {
            get
            {
                return _email;

            }
            set
            {
                _email = value;
            }
        }
        
        public string IsNewApptList
        {
            get
            {
                return _isNewApptList;

            }
            set
            {
                _isNewApptList = value;
            }
        }
        
        public string Phone
        {
            get
            {
                return _phone;

            }
            set
            {
                _phone = value;
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

        public string CompanyIdList
        {
            get
            {
                return _companyIdList;

            }
            set
            {
                _companyIdList = value;
            }
        }

        public string LastName
        {
            get
            {
                return _lastName;

            }
            set
            {
                _lastName = value;
            }
        }

        public string FirstName
        {
            get
            {
                return _firstName;

            }
            set
            {
                _firstName = value;
            }
        }
    }
}
