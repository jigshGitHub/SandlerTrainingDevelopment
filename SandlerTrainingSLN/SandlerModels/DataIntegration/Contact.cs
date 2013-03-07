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

        private string _address;
        private string _zip;
        private string _city;
        private string _state;
        private string _country;
        private string _notes;

        private string _title;
        private string _contactsDepartment;
        private string _contactsRole;
        private string _mobilePhone;
        private string _homePhone;
        private string _fax;
        private string _personalEmail;

        private DateTime _lastAttemptedDate; 
        private DateTime _lastEmailedDate;
        private DateTime _lastMeetingDate;
        private DateTime _letterSentDate;

        private string _spouseName;
        private string _referredBy;

        private string _trainingCourseName;
        private string _companyNameWhereTrainingConducted;
        private string _howManyAttended;

        public string HowManyAttended
        {
            get
            {
                return _howManyAttended;

            }
            set
            {
                _howManyAttended = value;
            }
        }
        
        public string CompanyNameWhereTrainingConducted
        {
            get
            {
                return _companyNameWhereTrainingConducted;

            }
            set
            {
                _companyNameWhereTrainingConducted = value;
            }
        }
        
        public string TrainingCourseName
        {
            get
            {
                return _trainingCourseName;

            }
            set
            {
                _trainingCourseName = value;
            }
        }
        
        public DateTime LetterSentDate
        {
            get
            {
                return _letterSentDate;

            }
            set
            {
                _letterSentDate = value;
            }
        }

        public DateTime LastMeetingDate
        {
            get
            {
                return _lastMeetingDate;

            }
            set
            {
                _lastMeetingDate = value;
            }
        }
        
        public DateTime LastEmailedDate
        {
            get
            {
                return _lastEmailedDate;

            }
            set
            {
                _lastEmailedDate = value;
            }
        }
        
        public DateTime LastAttemptedDate
        {
            get
            {
                return _lastAttemptedDate;

            }
            set
            {
                _lastAttemptedDate = value;
            }
        }
        
        public string ReferredBy
        {
            get
            {
                return _referredBy;

            }
            set
            {
                _referredBy = value;
            }
        }

        public string SpouseName
        {
            get
            {
                return _spouseName;

            }
            set
            {
                _spouseName = value;
            }
        }
        
        public string PersonalEmail
        {
            get
            {
                return _personalEmail;

            }
            set
            {
                _personalEmail = value;
            }
        }
        
        public string Fax
        {
            get
            {
                return _fax;

            }
            set
            {
                _fax = value;
            }
        }
                
        public string HomePhone
        {
            get
            {
                return _homePhone;

            }
            set
            {
                _homePhone = value;
            }
        }

        public string MobilePhone
        {
            get
            {
                return _mobilePhone;

            }
            set
            {
                _mobilePhone = value;
            }
        }

        public string ContactsRole
        {
            get
            {
                return _contactsRole;

            }
            set
            {
                _contactsRole = value;
            }
        }

        public string ContactsDepartment
        {
            get
            {
                return _contactsDepartment;

            }
            set
            {
                _contactsDepartment = value;
            }
        }
                
        public string Title
        {
            get
            {
                return _title;

            }
            set
            {
                _title = value;
            }
        }
        
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
