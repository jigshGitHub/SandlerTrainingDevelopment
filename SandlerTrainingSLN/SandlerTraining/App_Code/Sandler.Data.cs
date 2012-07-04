using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using Sandler.Data.Utility;
namespace Sandler.Data
{
    public interface IGapAnalysis
    {
        DataSet GetData();
        SqlDataReader GetSalesRepresentativeData(string repId);
        void UpdateSalesRepresentativeData(string repId, string SCTAsIsText, string SEAsIsText, string SQAsIsText, string TCSAsIsText, string QAAsIsText, string EBGAsISText, string SCTAsIsValue, string SEAsIsValue, string SQAsIsValue, string TCSAsIsValue, string QAAsIsValue, string EBGAsISValue, string SCTToBeText, string SEToBeText, string SQToBeText, string TCSToBeText, string QAToBeText, string EBGToBeText, string SCTToBeValue, string SEToBeValue, string SQToBeValue, string TCSToBeValue, string QAToBeValue, string EBGToBeValue);
    }

    public class GapAnalysis : IGapAnalysis
    {
        public GapAnalysis()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public DataSet GetData()
        {
            SqlConnection sqlConnection = null;
            SqlDataAdapter sqlDataAdapter;
            string commandText;
            DataSet ds = null;
            try
            {
                sqlConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SandlerDBConnection"].ToString());
                commandText = "SELECT SalesCycleTime, PercentofIndustryAve FROM [(Gap_Analysis_Sales_Cycle_Time)] ORDER BY SalesCycleTime;" +
                                "SELECT [SalesEfficiency],[PercentofIndustryAve] FROM [(Gap_Analysis_Sales_Efficiency)] ORDER BY SalesEfficiency;" +
                                "SELECT SalesQualification, PercentofIndustryAve FROM  [(Gap_Analysis_Sales_Qualification)] ORDER BY SalesQualification;" +
                                "SELECT [TrngCostSavings],[PercentofIndustryAve] FROM [(Gap_Analysis_Training_Cost_Savings)] ORDER BY TrngCostSavings;" +
                                "SELECT [QuotaAchievement],[PercentofIndustryAve] FROM [(Gap_Analysis_Quota_Achievement)] ORDER BY QuotaAchievement;" +
                                "SELECT [EstBenefitsGained],[PercentofIndustryAve] FROM [(Gap_Analysis_Est_Benefits_Gained)] ORDER BY EstBenefitsGained;";
                sqlDataAdapter = new SqlDataAdapter(commandText, sqlConnection);

                ds = new DataSet();

                sqlDataAdapter.Fill(ds);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (sqlConnection.State == ConnectionState.Open)
                    sqlConnection.Close();
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

        public  void UpdateSalesRepresentativeData(string repId, string SCTAsIsText, string SEAsIsText, string SQAsIsText, string TCSAsIsText, string QAAsIsText, string EBGAsISText, string SCTAsIsValue, string SEAsIsValue, string SQAsIsValue, string TCSAsIsValue, string QAAsIsValue, string EBGAsISValue, string SCTToBeText, string SEToBeText, string SQToBeText, string TCSToBeText, string QAToBeText, string EBGToBeText, string SCTToBeValue, string SEToBeValue, string SQToBeValue, string TCSToBeValue, string QAToBeValue, string EBGToBeValue)
        {
            SqlConnection sqlConnection = null;
            SqlCommand sqlCommand;
            try
            {
                sqlConnection = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SandlerDBConnection"].ToString());
                sqlCommand = new SqlCommand("UPDATE [Gap_Analysis] " +
                                            "SET" +
                                              " [AsIs_SalesCycleTime] = '" + SCTAsIsText + "'" +
                                              ", [AsIs_SalesEfficiency] = '" + SEAsIsText + "'" +
                                              ", [AsIs_SalesQualification] = '" + SQAsIsText + "'" +
                                              ", [AsIs_TrngCostSavings] = '" + TCSAsIsText + "'" +
                                              ", [AsIs_QuotaAchievement] = '" + QAAsIsText + "'" +
                                              ", [AsIs_EstBenefitsGained] = '" + EBGAsISText + "'" +
                                              ", [AsIs_SalesCycleTimeofIndustryAve] = " + SCTAsIsValue +
                                              ", [AsIs_SalesEfficiencyofIndustryAve] = " + SEAsIsValue +
                                              ", [AsIs_SalesQualificationofIndustryAve] = " + SQAsIsValue +
                                              ", [AsIs_TrngCostSavingsofIndustryAve] = " + TCSAsIsValue +
                                              ", [AsIs_QuotaAchievementofIndustryAve] = " + QAAsIsValue +
                                              ", [AsIs_EstBenefitsGainedofIndustryAve] = " + EBGAsISValue +
                                              ", [ToBe_SalesCycleTime] = '" + SCTToBeText + "'" +
                                              ", [ToBe_SalesEfficiency] = '" + SEToBeText + "'" +
                                              ", [ToBe_SalesQualification] = '" + SQToBeText + "'" +
                                              ", [ToBe_TrngCostSavings] = '" + TCSToBeText + "'" +
                                              ", [ToBe_QuotaAchievement] = '" + QAToBeText + "'" +
                                              ", [ToBe_EstBenefitsGained] = '" + EBGToBeText + "'" +
                                              ", [ToBe_SalesCycleTimeofIndustryAve] = " + SCTToBeValue +
                                              ", [ToBe_SalesEfficiencyofIndustryAve] = " + SEToBeValue +
                                              ", [ToBe_SalesQualificationofIndustryAve] = " + SQToBeValue +
                                              ", [ToBe_TrngCostSavingsofIndustryAve] = " + TCSToBeValue +
                                              ", [ToBe_QuotaAchievementofIndustryAve] = " + QAToBeValue +
                                              ", [ToBe_EstBenefitsGainedofIndustryAve] = " + EBGToBeValue +
                                              " WHERE [RepID] = '" + repId + "'", sqlConnection);

                sqlConnection.Open();
                sqlCommand.ExecuteNonQuery();
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

    public interface IROI
    {
        DataSet GetROIData(int repId);
        void UpdateROI(int repId, DataTable tblROI);
    }

    public class ROI:IROI
    {
        DBUtility dbUtility;
        public ROI()
        {
            dbUtility = new DBUtility();
        }

        public DataSet GetROIData(int repId)
        {
            DataSet ds;
            string strQry;
            try
            {
                strQry = "SELECT * FROM Return_on_Trng_Investment WHERE RepID = " + repId + " Order By PeriodYear, IsOriginalVersion ASC";
                ds = dbUtility.ExecuteDataset(strQry);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return ds;
        }

        public void UpdateROI(int repId, DataTable tblROI)
        {
            List<SqlParameter> cmdParams;
            try
            {
                foreach (DataRow dr in tblROI.Rows)
                {
                    cmdParams = new List<SqlParameter>();
                
                    cmdParams.Add(new SqlParameter() { Value = dr["ID"], ParameterName = "@ID", Direction = ParameterDirection.Input });
                    cmdParams.Add(new SqlParameter() { Value = dr["ProductID"], ParameterName = "@ProductID", Direction = ParameterDirection.Input });//.ProductID : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["FranchiseeID"], ParameterName = "@FranchiseeID", Direction = ParameterDirection.Input });//.FranchiseeID : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["ClientID"], ParameterName = "@ClientID", Direction = ParameterDirection.Input });//.ClientID : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["RepID"], ParameterName = "@RepID", Direction = ParameterDirection.Input });//.RepID : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["PeriodYear"], ParameterName = "@PeriodYear", Direction = ParameterDirection.Input });//.PeriodYear : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["YearDesignation"], ParameterName = "@YearDesignation", Direction = ParameterDirection.Input });//.YearDesignation : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["InitialTrngInvestment"], ParameterName = "@InitialTrngInvestment", Direction = ParameterDirection.Input });//.InitialTrngInvestment : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["ImplementationCost"], ParameterName = "@ImplementationCost", Direction = ParameterDirection.Input });//.ImplementationCost : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["TrainingInvestment"], ParameterName = "@TrainingInvestment", Direction = ParameterDirection.Input });//.TrainingInvestment : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["CostReductionSalesCycleTime"], ParameterName = "@CostReductionSalesCycleTime", Direction = ParameterDirection.Input });//.CostReductionSalesCycleTime : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["CostReductionSalesEfficiency"], ParameterName = "@CostReductionSalesEfficiency", Direction = ParameterDirection.Input });//.CostReductionSalesEfficiency : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["IncreasedQualifiedSales"], ParameterName = "@IncreasedQualifiedSales", Direction = ParameterDirection.Input });//.IncreasedQualifiedSales : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["SavingsonRetainedSalesReps"], ParameterName = "@SavingsonRetainedSalesReps", Direction = ParameterDirection.Input });//.SavingsonRetainedSalesReps : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["IncreasedQuotaAchievement"], ParameterName = "@IncreasedQuotaAchievement", Direction = ParameterDirection.Input });//.IncreasedQuotaAchievement : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["TotalAnnualBenefits"], ParameterName = "@TotalAnnualBenefits", Direction = ParameterDirection.Input });//.TotalAnnualBenefits : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["EstimatedBenefitsGained"], ParameterName = "@EstimatedBenefitsGained", Direction = ParameterDirection.Input });//.EstimatedBenefitsGained : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["TotalBenefitsRealized"], ParameterName = "@TotalBenefitsRealized", Direction = ParameterDirection.Input });//.TotalBenefitsRealized : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["TotalCost"], ParameterName = "@TotalCost", Direction = ParameterDirection.Input });//.TotalCost : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["AnnualBenefitFlow"], ParameterName = "@AnnualBenefitFlow", Direction = ParameterDirection.Input });//.AnnualBenefitFlow : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["CumBenefitFlow"], ParameterName = "@CumBenefitFlow", Direction = ParameterDirection.Input });//.CumBenefitFlow : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["DiscountedCosts"], ParameterName = "@DiscountedCosts", Direction = ParameterDirection.Input });//.DiscountedCosts : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["DiscountedBenefits"], ParameterName = "@DiscountedBenefits", Direction = ParameterDirection.Input });//.DiscountedBenefits : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["TotalDiscountBenefitFlow"], ParameterName = "@TotalDiscountBenefitFlow", Direction = ParameterDirection.Input });//.TotalDiscountBenefitFlow : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["TotalCumDiscountedBenefitFlow"], ParameterName = "@TotalCumDiscountedBenefitFlow", Direction = ParameterDirection.Input });//.TotalCumDiscountedBenefitFlow : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["CostofCapital"], ParameterName = "@CostofCapital", Direction = ParameterDirection.Input });//.CostofCapital : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["OngoingSupportCosts"], ParameterName = "@OngoingSupportCosts", Direction = ParameterDirection.Input });//.OngoingSupportCosts : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["NetPresentValue"], ParameterName = "@NetPresentValue", Direction = ParameterDirection.Input });//.NetPresentValue : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["Yr1ROI"], ParameterName = "@Yr1ROI", Direction = ParameterDirection.Input });//.Yr1ROI : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["Yr2ROI"], ParameterName = "@Yr2ROI", Direction = ParameterDirection.Input });//.Yr2ROI : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["Yr3ROI"], ParameterName = "@Yr3ROI", Direction = ParameterDirection.Input });//.Yr3ROI : null;
                    cmdParams.Add(new SqlParameter() { Value = dr["Payback"], ParameterName = "@Payback", Direction = ParameterDirection.Input });

                    dbUtility.ExecuteNonQuery("sp_Insert_UpdateROI", cmdParams);
                }


                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}