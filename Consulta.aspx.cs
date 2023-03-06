using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ejemplo
{
    public partial class Consulta : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            string conect = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(conect);
            SqlCommand sqlCommand = new SqlCommand("SELECT TOP 1 * FROM RegisteredValidation Order by ValidationDate DESC", sqlConnection);
            sqlConnection.Open();
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            sqlDataReader.Read();
            if (sqlDataReader.HasRows)
            {
                string WO = sqlDataReader.GetString(sqlDataReader.GetOrdinal("WorkOrder"));
                string partNumber = sqlDataReader.GetString(sqlDataReader.GetOrdinal("PartNumber"));
                string user = sqlDataReader.GetString(sqlDataReader.GetOrdinal("User"));
                string validation = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Validation"));
                //string date = sqlDataReader.GetDateTime(sqlDataReader.GetOrdinal("ValidationDate");
                lblWO.Text = WO.ToString();
                lblPartNumber.Text = partNumber.ToString();
                lblUser.Text = user.ToString();
                lblValidation.Text = validation.ToString();
                //lblDate.Text = date.ToString();

            }
            if (!IsPostBack)
            {
                LoadRecord();
            }
        }

        
        protected void txtWorkOrder_TextChanged(object sender, EventArgs e)
        {
            string valorWO =txtWorkOrder.Text.ToUpper();
            string conect = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(conect);
            sqlConnection.Open();
            SqlCommand sqlCommand = new SqlCommand("SELECT WorkOrder, PartNumber, [User], Validation, ValidationDate FROM RegisteredValidation WHERE WorkOrder='" + valorWO + "'", sqlConnection);
            sqlCommand.Parameters.AddWithValue("WorkOrder", valorWO);
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(sqlCommand);
            sda.Fill(dt);
            datagrid.DataSource = dt;   
            datagrid.DataBind();


            //

        }



        void LoadRecord()
        {
            string conect = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(conect);
            SqlCommand sqlCommand = new SqlCommand("SELECT WorkOrder, PartNumber, [User], Validation, ValidationDate FROM RegisteredValidation Order by ValidationDate DESC", sqlConnection);
            sqlConnection.Open();
            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter(sqlCommand);
            sda.Fill(dt);
            datagrid.DataSource = dt;
            datagrid.DataBind();

        }


        void lastRecord()
        {
            
            //else
            //{

            //}
        }

    }

}