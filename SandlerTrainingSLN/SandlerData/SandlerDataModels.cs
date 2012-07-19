using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using SandlerModels;
using SandlerRepositories;

namespace SandlerData.Models
{
    public interface IROIDataModel
    {
        List<ROIModel> GetROIModel(int repId);
        void Update(int repId, List<ROIModel> roiModels);
    }

    public interface IUserDataModel
    {
        void Load(UserModel user);
    }
    public class ROIDataModel : IROIDataModel
    {
        IROI roiData;
        public ROIDataModel()
        {
            roiData = new ROIRepository();
        }
        public List<ROIModel> GetROIModel(int repId)
        {
            List<ROIModel> lstROIModels = null;
            ROIModel roiModel = null;
            DataSet dsROI = null;
            try
            {
                dsROI = roiData.GetByRepId(repId);

                if (dsROI != null)
                {
                    lstROIModels = new List<ROIModel>();

                    foreach (DataTable dt in dsROI.Tables)
                    {
                        foreach (DataRow dr in dt.Rows)
                        {
                            roiModel = new ROIModel();

                            roiModel.ID = int.Parse(dr["ID"].ToString());
                            if (!(dr["ProductID"] is DBNull)) roiModel.ProductID = int.Parse(dr["ProductID"].ToString());
                            if (!(dr["FranchiseeID"] is DBNull)) roiModel.FranchiseeID = int.Parse(dr["FranchiseeID"].ToString());
                            if (!(dr["ClientID"] is DBNull)) roiModel.ClientID = int.Parse(dr["ClientID"].ToString());
                            if (!(dr["RepID"] is DBNull)) roiModel.RepID = int.Parse(dr["RepID"].ToString());
                            if (!(dr["PeriodYear"] is DBNull)) roiModel.PeriodYear = int.Parse(dr["PeriodYear"].ToString());
                            if (!(dr["YearDesignation"] is DBNull)) roiModel.YearDesignation = int.Parse(dr["YearDesignation"].ToString());
                            if (!(dr["InitialTrngInvestment"] is DBNull)) roiModel.InitialTrngInvestment = double.Parse(dr["InitialTrngInvestment"].ToString());
                            if (!(dr["ImplementationCost"] is DBNull)) roiModel.ImplementationCost = double.Parse(dr["ImplementationCost"].ToString());
                            if (!(dr["TrainingInvestment"] is DBNull)) roiModel.TrainingInvestment = double.Parse(dr["TrainingInvestment"].ToString());
                            if (!(dr["CostReductionSalesCycleTime"] is DBNull)) roiModel.CostReductionSalesCycleTime = double.Parse(dr["CostReductionSalesCycleTime"].ToString());
                            if (!(dr["CostReductionSalesEfficiency"] is DBNull)) roiModel.CostReductionSalesEfficiency = double.Parse(dr["CostReductionSalesEfficiency"].ToString());
                            if (!(dr["IncreasedQualifiedSales"] is DBNull)) roiModel.IncreasedQualifiedSales = double.Parse(dr["IncreasedQualifiedSales"].ToString());
                            if (!(dr["SavingsonRetainedSalesReps"] is DBNull)) roiModel.SavingsonRetainedSalesReps = double.Parse(dr["SavingsonRetainedSalesReps"].ToString());
                            if (!(dr["IncreasedQuotaAchievement"] is DBNull)) roiModel.IncreasedQuotaAchievement = double.Parse(dr["IncreasedQuotaAchievement"].ToString());
                            if (!(dr["TotalAnnualBenefits"] is DBNull)) roiModel.TotalAnnualBenefits = double.Parse(dr["TotalAnnualBenefits"].ToString());
                            if (!(dr["EstimatedBenefitsGained"] is DBNull)) roiModel.EstimatedBenefitsGained = double.Parse(dr["EstimatedBenefitsGained"].ToString());
                            if (!(dr["TotalBenefitsRealized"] is DBNull)) roiModel.TotalBenefitsRealized = double.Parse(dr["TotalBenefitsRealized"].ToString());
                            if (!(dr["TotalCost"] is DBNull)) roiModel.TotalCost = double.Parse(dr["TotalCost"].ToString());
                            if (!(dr["AnnualBenefitFlow"] is DBNull)) roiModel.AnnualBenefitFlow = double.Parse(dr["AnnualBenefitFlow"].ToString());
                            if (!(dr["CumBenefitFlow"] is DBNull)) roiModel.CumBenefitFlow = double.Parse(dr["CumBenefitFlow"].ToString());
                            if (!(dr["DiscountedCosts"] is DBNull)) roiModel.DiscountedCosts = double.Parse(dr["DiscountedCosts"].ToString());
                            if (!(dr["DiscountedBenefits"] is DBNull)) roiModel.DiscountedBenefits = double.Parse(dr["DiscountedBenefits"].ToString());
                            if (!(dr["TotalDiscountBenefitFlow"] is DBNull)) roiModel.TotalDiscountBenefitFlow = double.Parse(dr["TotalDiscountBenefitFlow"].ToString());
                            if (!(dr["TotalCumDiscountedBenefitFlow"] is DBNull)) roiModel.TotalCumDiscountedBenefitFlow = double.Parse(dr["TotalCumDiscountedBenefitFlow"].ToString());
                            if (!(dr["CostofCapital"] is DBNull)) roiModel.CostofCapital = double.Parse(dr["CostofCapital"].ToString());
                            if (!(dr["OngoingSupportCosts"] is DBNull)) roiModel.OngoingSupportCosts = double.Parse(dr["OngoingSupportCosts"].ToString());
                            if (!(dr["NetPresentValue"] is DBNull)) roiModel.NetPresentValue = double.Parse(dr["NetPresentValue"].ToString());
                            if (!(dr["Yr1ROI"] is DBNull)) roiModel.Yr1ROI = double.Parse(dr["Yr1ROI"].ToString());
                            if (!(dr["Yr2ROI"] is DBNull)) roiModel.Yr2ROI = int.Parse(dr["Yr2ROI"].ToString());
                            if (!(dr["Yr3ROI"] is DBNull)) roiModel.Yr3ROI = int.Parse(dr["Yr3ROI"].ToString());
                            roiModel.Payback = dr["Payback"].ToString();
                            roiModel.IsOriginalVersion = Convert.ToBoolean(dr["IsOriginalVersion"].ToString());

                            lstROIModels.Add(roiModel);
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return lstROIModels;
        }

        public void Update(int repId, List<ROIModel> roiModels)
        {
            DataTable tblROI;
            DataRow dr;
            try
            {
                tblROI = new DataTable();
                tblROI.Columns.Add(new DataColumn("ID"));
                tblROI.Columns.Add(new DataColumn("ProductID"));
                tblROI.Columns.Add(new DataColumn("FranchiseeID"));
                tblROI.Columns.Add(new DataColumn("ClientID"));
                tblROI.Columns.Add(new DataColumn("RepID"));
                tblROI.Columns.Add(new DataColumn("PeriodYear"));
                tblROI.Columns.Add(new DataColumn("YearDesignation"));
                tblROI.Columns.Add(new DataColumn("InitialTrngInvestment"));
                tblROI.Columns.Add(new DataColumn("ImplementationCost"));
                tblROI.Columns.Add(new DataColumn("TrainingInvestment"));
                tblROI.Columns.Add(new DataColumn("CostReductionSalesCycleTime"));
                tblROI.Columns.Add(new DataColumn("CostReductionSalesEfficiency"));
                tblROI.Columns.Add(new DataColumn("IncreasedQualifiedSales"));
                tblROI.Columns.Add(new DataColumn("SavingsonRetainedSalesReps"));
                tblROI.Columns.Add(new DataColumn("IncreasedQuotaAchievement"));
                tblROI.Columns.Add(new DataColumn("TotalAnnualBenefits"));
                tblROI.Columns.Add(new DataColumn("EstimatedBenefitsGained"));
                tblROI.Columns.Add(new DataColumn("TotalBenefitsRealized"));
                tblROI.Columns.Add(new DataColumn("TotalCost"));
                tblROI.Columns.Add(new DataColumn("AnnualBenefitFlow"));
                tblROI.Columns.Add(new DataColumn("CumBenefitFlow"));
                tblROI.Columns.Add(new DataColumn("DiscountedCosts"));
                tblROI.Columns.Add(new DataColumn("DiscountedBenefits"));
                tblROI.Columns.Add(new DataColumn("TotalDiscountBenefitFlow"));
                tblROI.Columns.Add(new DataColumn("TotalCumDiscountedBenefitFlow"));
                tblROI.Columns.Add(new DataColumn("CostofCapital"));
                tblROI.Columns.Add(new DataColumn("NetPresentValue"));
                tblROI.Columns.Add(new DataColumn("Yr1ROI"));
                tblROI.Columns.Add(new DataColumn("Yr2ROI"));
                tblROI.Columns.Add(new DataColumn("Yr3ROI"));
                tblROI.Columns.Add(new DataColumn("Payback"));
                tblROI.Columns.Add(new DataColumn("OngoingSupportCosts"));

                foreach (ROIModel roiModel in roiModels)
                {
                    dr = tblROI.NewRow();
                
                    dr["ID"] = (roiModel.ID.HasValue) ? roiModel.ID : null;
                    dr["ProductID"] = (roiModel.ProductID.HasValue) ? roiModel.ProductID : null;
                    dr["FranchiseeID"] = (roiModel.FranchiseeID.HasValue) ? roiModel.FranchiseeID : null;
                    dr["ClientID"] = (roiModel.ClientID.HasValue) ? roiModel.ClientID : null;
                    dr["RepID"] = (roiModel.RepID.HasValue) ? roiModel.RepID : null;
                    dr["PeriodYear"] = (roiModel.PeriodYear.HasValue) ? roiModel.PeriodYear : null;
                    dr["YearDesignation"] = (roiModel.YearDesignation.HasValue) ? roiModel.YearDesignation : null;
                    dr["InitialTrngInvestment"] = (roiModel.InitialTrngInvestment.HasValue) ? roiModel.InitialTrngInvestment : null;
                    dr["ImplementationCost"] = (roiModel.ImplementationCost.HasValue) ? roiModel.ImplementationCost : null;
                    dr["TrainingInvestment"] = (roiModel.TrainingInvestment.HasValue) ? roiModel.TrainingInvestment : null;
                    dr["CostReductionSalesCycleTime"] = (roiModel.CostReductionSalesCycleTime.HasValue) ? roiModel.CostReductionSalesCycleTime : null;
                    dr["CostReductionSalesEfficiency"] = (roiModel.CostReductionSalesEfficiency.HasValue) ? roiModel.CostReductionSalesEfficiency : null;
                    dr["IncreasedQualifiedSales"] = (roiModel.IncreasedQualifiedSales.HasValue) ? roiModel.IncreasedQualifiedSales : null;
                    dr["SavingsonRetainedSalesReps"] = (roiModel.SavingsonRetainedSalesReps.HasValue) ? roiModel.SavingsonRetainedSalesReps : null;
                    dr["IncreasedQuotaAchievement"] = (roiModel.IncreasedQuotaAchievement.HasValue) ? roiModel.IncreasedQuotaAchievement : null;
                    dr["TotalAnnualBenefits"] = (roiModel.TotalAnnualBenefits.HasValue) ? roiModel.TotalAnnualBenefits : null;
                    dr["EstimatedBenefitsGained"] = (roiModel.EstimatedBenefitsGained.HasValue) ? roiModel.EstimatedBenefitsGained : null;
                    dr["TotalBenefitsRealized"] = (roiModel.TotalBenefitsRealized.HasValue) ? roiModel.TotalBenefitsRealized : null;
                    dr["TotalCost"] = (roiModel.TotalCost.HasValue) ? roiModel.TotalCost : null;
                    dr["AnnualBenefitFlow"] = (roiModel.AnnualBenefitFlow.HasValue) ? roiModel.AnnualBenefitFlow : null;
                    dr["CumBenefitFlow"] = (roiModel.CumBenefitFlow.HasValue) ? roiModel.CumBenefitFlow : null;
                    dr["DiscountedCosts"] = (roiModel.DiscountedCosts.HasValue) ? roiModel.DiscountedCosts : null;
                    dr["DiscountedBenefits"] = (roiModel.DiscountedBenefits.HasValue) ? roiModel.DiscountedBenefits : null;
                    dr["TotalDiscountBenefitFlow"] = (roiModel.TotalDiscountBenefitFlow.HasValue) ? roiModel.TotalDiscountBenefitFlow : null;
                    dr["TotalCumDiscountedBenefitFlow"] = (roiModel.TotalCumDiscountedBenefitFlow.HasValue) ? roiModel.TotalCumDiscountedBenefitFlow : null;
                    dr["CostofCapital"] = (roiModel.CostofCapital.HasValue) ? roiModel.CostofCapital : null;
                    dr["OngoingSupportCosts"] = (roiModel.OngoingSupportCosts.HasValue) ? roiModel.OngoingSupportCosts : null;
                    dr["NetPresentValue"] = (roiModel.NetPresentValue.HasValue) ? roiModel.NetPresentValue : null;
                    dr["Yr1ROI"] = (roiModel.Yr1ROI.HasValue) ? roiModel.Yr1ROI : null;
                    dr["Yr2ROI"] = (roiModel.Yr2ROI.HasValue) ? roiModel.Yr2ROI : null;
                    dr["Yr3ROI"] = (roiModel.Yr3ROI.HasValue) ? roiModel.Yr3ROI : null;
                    dr["Payback"] = roiModel.Payback;

                    tblROI.Rows.Add(dr);
                }
                roiData.Update(repId, tblROI);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }

    public class UserDataModel : IUserDataModel
    {
        public FranchiseeUsersRepository franchiseeUsersRepository;
        public UserDataModel()
        {
            franchiseeUsersRepository = new FranchiseeUsersRepository();
        }
        #region IUserDataModel Members

        public void Load(UserModel user)
        {
            user.FranchiseeID = franchiseeUsersRepository.GetAll().Where(r => r.UserID == user.UserId).SingleOrDefault().FranchiseeID;
        }

        #endregion
    }
}