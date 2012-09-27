using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using SandlerModels;
namespace SandlerRepositories
{
    public interface IGapAnalysis
    {
        DataSet GetData();
        SqlDataReader GetSalesRepresentativeData(string repId);
        int SaveGARecord(int gaId, int companyId, int contactId, Guid userId, int SCTAsIsValue, int SEAsIsValue, int SQAsIsValue, int TCSAsIsValue, int QAAsIsValue, int EBGAsISValue, int SCTToBeValue, int SEToBeValue, int SQToBeValue, int TCSToBeValue, int QAToBeValue, int EBGToBeValue);
        TBL_GA_Tracker GetGATracker(int companyId, int contactId);
    }

    public partial class GapAnalysisRepository : IGapAnalysis
    {
        DBFactory db = new DBFactory();

        public TBL_GA_Tracker GetGATracker(int companyId, int contactId)
        {
            return GetAll().Where(record => record.CompanyId == companyId && record.ContactId == contactId).SingleOrDefault();
        }

        public DataSet GetData()
        {
            DataSet ds = null;
            string commandText;
            try
            {
                commandText = "SELECT SalesCycleTime, [Id] FROM [TBL_GA_SalesCycleTime] ORDER BY SalesCycleTime;" +
                                "SELECT [SalesEfficiency],[Id] FROM [TBL_GA_SalesEfficiency] ORDER BY SalesEfficiency;" +
                                "SELECT SalesQualification, Id FROM  [TBL_GA_SalesQualification] ORDER BY SalesQualification;" +
                                "SELECT [TrngCostSavings],[Id] FROM [TBL_GA_TrainingCostSavings] ORDER BY TrngCostSavings;" +
                                "SELECT [QuotaAchievement],[Id] FROM [TBL_GA_QuotaAchievement] ORDER BY QuotaAchievement;" +
                                "SELECT [EstBenefitsGained],[Id] FROM [TBL_GA_EstBenefitsGained] ORDER BY EstBenefitsGained;";
                ds = db.ExecuteDataset(commandText);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ds;
        }

        public SqlDataReader GetSalesRepresentativeData(string repId)
        {
            SqlConnection sqlConnection = null;
            SqlCommand sqlCommand;
            SqlDataReader reader;
            try
            {
                sqlConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SandlerDBConnection"].ToString());
                sqlCommand = new SqlCommand("SELECT [ID] ,[ProductID] ,[FranchiseeID] ,[ClientID] ,[RepID] ,[AsIs_SalesCycleTimeofIndustryAve] ,[AsIs_SalesEfficiencyofIndustryAve] ,[AsIs_SalesQualificationofIndustryAve] ,[AsIs_TrngCostSavingsofIndustryAve] ,[AsIs_QuotaAchievementofIndustryAve] ,[AsIs_EstBenefitsGainedofIndustryAve] ,[ToBe_SalesCycleTimeofIndustryAve] ,[ToBe_SalesEfficiencyofIndustryAve] ,[ToBe_SalesQualificationofIndustryAve] ,[ToBe_TrngCostSavingsofIndustryAve] ,[ToBe_QuotaAchievementofIndustryAve] ,[ToBe_EstBenefitsGainedofIndustryAve]   FROM [Gap_Analysis]   WHERE [RepID] = '" + repId + "';", sqlConnection);

                sqlConnection.Open();
                reader = sqlCommand.ExecuteReader();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
            return reader;
        }

        public int SaveGARecord(int gaId, int companyId, int contactId, Guid userId,int SCTAsIsValue, int SEAsIsValue, int SQAsIsValue, int TCSAsIsValue, int QAAsIsValue, int EBGAsISValue, int SCTToBeValue, int SEToBeValue, int SQToBeValue, int TCSToBeValue, int QAToBeValue, int EBGToBeValue)
        {
            TBL_GA_Tracker gaRecord;
            bool isEditFlg = (gaId > 0);
            try
            {
                gaRecord = (isEditFlg) ? this.GetById(gaId) : new TBL_GA_Tracker();

                gaRecord.AsIsEstBenGainedId = EBGAsISValue;
                gaRecord.AsIsQuotaAchtId = QAAsIsValue;
                gaRecord.AsIsSalesCycleTimeId = SCTAsIsValue;
                gaRecord.AsIsSalesEffId = SEAsIsValue;
                gaRecord.AsIsSalesQualificationId = SQAsIsValue;
                gaRecord.AsIsTrgCostSavingsId = TCSAsIsValue;
                gaRecord.CompanyId = companyId;
                gaRecord.ContactId = contactId;
                gaRecord.ToBeEstBenGainedId = EBGToBeValue;
                gaRecord.ToBeQuotaAchtId = QAToBeValue;
                gaRecord.ToBeSalesCycleTimeId = SCTToBeValue;
                gaRecord.ToBeSalesEffId = SEToBeValue;
                gaRecord.ToBeSalesQualificationId = SQToBeValue;
                gaRecord.ToBeTrgCostSavingsId = TCSToBeValue;
                if (isEditFlg)
                {
                    gaRecord.UpdatedBy = userId;
                    gaRecord.UpdatedDate = DateTime.Now; 
                }
                else
                {
                    gaRecord.CreatedBy = userId;
                    gaRecord.CreatedDate = DateTime.Now;
                }

                if (isEditFlg)
                    this.Update(gaRecord);
                else
                    this.Add(gaRecord);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
            return gaRecord.Id;
        }

        public void UpdateDesiredAnnualmprovements(int gaId, string daiSCT, string daiSE, string daiSQ, string daiTCS, string daiQA, string daiEBG)
        {
            TBL_GA_Tracker gaRecord;
            try
            {
                gaRecord = this.GetById(gaId);
                gaRecord.DesiredAnnualImptEstBenefitsGained = daiEBG;
                gaRecord.DesiredAnnualImptQuotaAcht = daiQA;
                gaRecord.DesiredAnnualImptSalesCycleTime = daiSCT;
                gaRecord.DesiredAnnualImptSalesEfficiency = daiSE;
                gaRecord.DesiredAnnualImptSalesQualfn = daiSQ;
                gaRecord.DesiredAnnualImptTrgCstSvgs = daiTCS;

                this.Update(gaRecord);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }

    }
}
