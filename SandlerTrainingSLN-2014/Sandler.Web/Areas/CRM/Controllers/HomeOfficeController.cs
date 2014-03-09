using Sandler.DB.Data.Common;
using Sandler.DB.Data.Common.Implementation;
using Sandler.DB.Data.Common.Interface;
using Sandler.DB.Data.Repositories;
using Sandler.DB.Models;
using Sandler.Web.Controllers;
using Sandler.Web.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;

using Sandler.Web.Library;
using Sandler.Web.Models;

namespace Sandler.Web.Areas.CRM.Controllers
{
    public class HomeOfficeController : BaseController
    {
        public EntityViewModel<TBL_FRANCHISEE> FranchiseeViewModel;

        public HomeOfficeController(IUnitOfWork uow) :base(uow)
        {
            FranchiseeViewModel = new EntityViewModel<TBL_FRANCHISEE>();
            FranchiseeViewModel.BaseModel = this.BaseVM;
            FranchiseeViewModel.EntityModel = new TBL_FRANCHISEE();
        }

        public HomeOfficeController() : this(new SandlerUnitOfWork(new SandlerRepositoryProvider(new RepositoryFactories()), new SandlerDBContext()))
        {
        }

        public ActionResult Edit(int id)
        {
            //var company = uow.Repository<TBL_COMPANIES>().GetById(id);
            dynamic model = new System.Dynamic.ExpandoObject();
            model.ID = id;
            return PartialView("Edit", model);
        }

        //
        // GET: /CRM/HomeOffice/
        public ActionResult Index()
        {
            return PartialView(FranchiseeViewModel);
        }

        public ActionResult ViewArchived()
        {
            return PartialView("ViewArchived");
        }

        #region [[ Export to Excel ]]

        public string GetSQLStatement(bool regularorArchived)
        {
            //Get the Current User
            UserModel CurrentUser = BaseVM.CurrentUser;
            string query = "";

            if (CurrentUser.Role == SandlerRoles.Corporate || CurrentUser.Role == SandlerRoles.SiteAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeAdmin || CurrentUser.Role == SandlerRoles.HomeOfficeUser)
            {
                //Full list
                query = String.Format(_sql_export_to_excel_full, (regularorArchived == true ? 1 : 0));
            }
            else
            {
                //Limited columns only
                query = String.Format(_sql_export_to_excel_limited, (regularorArchived == true ? 1 : 0));
            }
            //return
            return query;
        }

        #region [[ SQL Statements Section ]]

        const string _sql_export_to_excel_full =
                            @"SELECT fr.ID, fr.LastName as [Last Name], 
            fr.FirstName as [First Name],
            fr.Name as [Franchise Name],fr.Name as Name, fr.Title,fr.OfficePhone,
            fr.HomePhone,fr.MobilePhone,fr.Fax, 
            fr.WorkEmail as [Primary Office Email], 
            fr.WorkAddress as [Primary Office Address], 
            fr.WorkCity as [Primary Office City],
            fr.WorkZip as [Primary Office Zip],
            fr.AlternateEmail,fr.HomeAddress, fr.HomeCity, fr.HomeZip,
            fr.Territory,fr.BusinessFocusArea,fr.ClosestMetroArea,
            ISNULL(fr.SpouseName,'') as SpouseName,ISNULL(fr.YearswithCompany,'') as YearswithCompany,
            ISNULL(ysn1.Description, 'No') as IsCanPrintLocally,
            ISNULL(ysn2.Description, 'No') as IsBuyFromCustomer,
            ISNULL(ysn3.Description, 'No') as IsMasterFranchiseeExists,
            ISNULL(ysn4.Description, 'No') as IsFixedPricePurchase,
            ISNULL(ysn5.Description, 'No') as IsBehindInTerDev,
            ISNULL(ysn6.Description, 'No') as IsContractorPermitted,
            ISNULL(ysn7.Description, 'No') as IsSandlerMailRequired,
            ISNULL(ysn8.Description, 'No') as IsKOLMember,
            ISNULL(ysn9.Description, 'No') as IsAdvBoard,
            ISNULL(ysn10.Description, 'No') as IsMktgCommittee,
            ISNULL(ysn11.Description, 'No') as IsUsingSandlerCRM,
            ISNULL(ysn12.Description, 'No') as IsDHSAwardWinner,
            ISNULL(ysn13.Description, 'No') as IsReqToSubmitFinancial,
            ISNULL(ysn14.Description, 'No') as IsRepAgreement,
            ISNULL(ysn15.Description, 'No') as IsSameHomeAddress,
            ISNULL(bhamt.BehindAmountText,'') as BehindAmount,
            ISNULL(sndr.SandlerRoleText,'') as SandlerRole,
            ISNULL(awdl.AwardLevelText,'') as AwardLevel,
            ISNULL(pusl.PurchaseLevelText,'') as PurchaseLevel,
            ISNULL(cerl.CertifiedLevelText,'') as CertifiedLevel,
            ISNULL(fr.InitialContractDate, '') as InitialContractDate, 
            ISNULL(fr.RenewalDate, '') as RenewalDate, 
            ISNULL(fr.ContractFormDate, '') as ContractFormDate, 
            ISNULL(fr.DHSAwardDate, '') as DHSAwardDate, 
            ISNULL(fr.InitialTrngDate, '') as InitialTrngDate, 
            ISNULL(fr.BirthDay, '') as BirthDay, 
            ISNULL(fr.Anniversary, '') as Anniversary, 
            ISNULL(mfz.MasterFranchiseeName,'') as MasterFrName,
            ISNULL(cpamt.CostPlusAmountText,'') as CostPlusAmount,
            ISNULL(state1.Name,'') as WorkState,
            ISNULL(state2.Name,'') as HomeState,
            ISNULL(cnt1.Name,'') as [Primary Office Country],
            ISNULL(cnt2.Name,'') as HomeCountry,
            (ch.FirstName + ' ' + ch.LastName) as CoachName, 
            ISNULL(fr.LastCreatedDate, '') as LastUpdatedDate,
            rg.Name as RegionName
            FROM TBL_Franchisee fr
            left outer join tbl_MasterFranchisee mfz on mfz.MasterFranchiseeId = fr.MasterFranchiseeId
            left outer join Tbl_YesNoOptions ysn1 on ysn1.Value = fr.IsCanPrintLocally
            left outer join Tbl_YesNoOptions ysn2 on ysn2.Value = fr.IsBuyFromCustomer
            left outer join Tbl_YesNoOptions ysn3 on ysn3.Value = fr.IsMasterFranchiseeExists
            left outer join Tbl_YesNoOptions ysn4 on ysn4.Value = fr.IsFixedPricePurchase
            left outer join Tbl_YesNoOptions ysn5 on ysn5.Value = fr.IsBehindInTerDev
            left outer join Tbl_YesNoOptions ysn6 on ysn6.Value = fr.IsContractorPermitted
            left outer join Tbl_YesNoOptions ysn7 on ysn7.Value = fr.IsSandlerMailRequired
            left outer join Tbl_YesNoOptions ysn8 on ysn8.Value = fr.IsKOLMember
            left outer join Tbl_YesNoOptions ysn9 on ysn9.Value = fr.IsAdvBoard
            left outer join Tbl_YesNoOptions ysn10 on ysn10.Value = fr.IsMktgCommittee
            left outer join Tbl_YesNoOptions ysn11 on ysn11.Value = fr.IsUsingSandlerCRM
            left outer join Tbl_YesNoOptions ysn12 on ysn12.Value = fr.IsDHSAwardWinner
            left outer join Tbl_YesNoOptions ysn13 on ysn13.Value = fr.IsReqToSubmitFinancial
            left outer join Tbl_YesNoOptions ysn14 on ysn14.Value = fr.IsRepAgreement
            left outer join Tbl_YesNoOptions ysn15 on ysn15.Value = fr.IsSameHomeAddress
            left outer join Tbl_State state1  on state1.Id = fr.WorkStateId
            left outer join Tbl_State state2  on state2.Id = fr.HomeStateId
            left outer join Tbl_Country cnt1  on cnt1.Id = fr.WorkCountryId
            left outer join Tbl_Country cnt2  on cnt2.Id = fr.HomeCountryId
            left outer join Tbl_AwardLevel awdl on awdl.AwardLevelId = fr.AwardLevelId
            left outer join Tbl_PurchaseLevel pusl on pusl.PurchaseLevelId = fr.PurchaseLevelId
            left outer join Tbl_CertifiedLevel cerl on cerl.CertifiedLevelId = fr.CertifiedLevelId
            left outer join Tbl_SandlerRole sndr on sndr.SandlerRoleId = fr.SandlerRoleId
            left outer join Tbl_BehindAmount bhamt on bhamt.BehindAmountId = fr.BehindAmountId
            left outer join tbl_CostPlusAmount cpamt on cpamt.CostPlusAmountId = fr.CostPlusAmountId
            inner join TBL_COACH ch on ch.Id = fr.CoachID
            inner join TBL_REGION rg on rg.Id = ch.regionId
            where (WorkEmail is null or Upper(WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM')
            and fr.IsActive = {0}
            Order By fr.LastName";


        const string _sql_export_to_excel_limited =
                            @"SELECT fr.ID,	fr.LastName as [Last Name], fr.FirstName as [First Name],fr.Name as [Franchise Name],
                              fr.Name as Name, fr.OfficePhone, fr.WorkEmail as [Primary Office Email] , ISNULL(fr.LastCreatedDate, '') as LastUpdatedDate 
                              FROM TBL_Franchisee fr where (WorkEmail is null or Upper(WorkEmail) != 'SANDLERSPM@MINEDSYSTEMS.COM') and fr.IsActive = {0} Order By fr.LastName";

        #endregion

        public ActionResult ExportFranchisee()
        {

            string sToday = String.Format("{0:yyyyMMMdd__hh_mm_ss tt}", DateTime.Now);
            string moduleName = "Franchisees";

            return new ExcelResult
            {
                fileName = moduleName + "_" + System.Guid.NewGuid() + "_" + sToday + ".xlsx",
                filePath = "~/Downloads/",
                sheetName = moduleName,
                clientsidefileName = moduleName + "_" + sToday + ".xlsx",
                sqlStatement = GetSQLStatement(true),
                connectionSring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString
            };

        }

        public ActionResult ExportArchivedFranchisee()
        {

            string sToday = String.Format("{0:yyyyMMMdd__hh_mm_ss tt}", DateTime.Now);
            string moduleName = "ArchivedFranchisees";

            return new ExcelResult
            {
                fileName = moduleName + "_" + System.Guid.NewGuid() + "_" + sToday + ".xlsx",
                filePath = "~/Downloads/",
                sheetName = moduleName,
                clientsidefileName = moduleName + "_" + sToday + ".xlsx",
                sqlStatement = GetSQLStatement(false),
                connectionSring = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString
            };

        }


        #endregion

       

    }
}
