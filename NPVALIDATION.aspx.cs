﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;



namespace ejemplo
{
    public partial class NPVALIDATION : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtPartNumber.Attributes.Add("OnFocus", "selectPartNumber()");
            txtPartNumber.Attributes.Add("OnClick", "selectPartNumber()");
            txtWorkOrder.Attributes.Add("OnClick", "selectWorkOrder()");
            txtWorkOrder.Attributes.Add("OnFocus", "selectWorkOrder()");
            txtPartNumber.Enabled = false;
            txtWorkOrder.Focus();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            // SET THE FIELDS & LABELS TO CLEAN WHEN YOU CLIC ON RESET BUTTON 
            txtWorkOrder.Text = "";
            txtWorkOrder.Enabled = true;
            txtWorkOrder.Focus(); //SETEAR EL CURSOR EN EL CAMPO DE LA WO 
            lblModel.Text = "";
            lblPNName.Visible = false;
            lblPNName.Text = "";
            lblResult.Text = "";
            lblResult.Visible = false;
            lblQtyWO.Text = "";
            lblQtyWO.Visible = false;
            txtPartNumber.Text = "";

            res2.Visible = false;
            res.Visible = true;
            res.Text = "";
        }

        protected void txtWorkOrder_TextChanged(object sender, EventArgs e)
        {
            string conect = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlConnection sqlConnection = new SqlConnection(conect);
            SqlCommand sqlCommand = new SqlCommand("GetModelQtyByWorkOrder", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };
            sqlConnection.Open();
            sqlCommand.Parameters.Add("@WorkOrder", SqlDbType.VarChar, 50).Value = txtWorkOrder.Text;
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            sqlDataReader.Read();
            if (sqlDataReader.HasRows)
            {
                txtWorkOrder.Enabled = false;
                string model = sqlDataReader.GetString(sqlDataReader.GetOrdinal("Model"));
                int qty = sqlDataReader.GetInt32(sqlDataReader.GetOrdinal("Quantity"));
                lblModel.ForeColor = System.Drawing.Color.DarkBlue;
                lblQtyWO.ForeColor = System.Drawing.Color.Blue;
                lblQtyWO.Visible = true;
                lblModel.Text = model;
                lblQtyWO.Text = qty.ToString() + " PCS";
                txtPartNumber.Enabled = true;
                txtPartNumber.Focus();
                Session["model"] = model;
                sqlConnection.Close();
                string conQty = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
                SqlConnection connectionQty = new SqlConnection(conQty);
                SqlCommand cmdQty = new SqlCommand("GetScannedPNKiting", connectionQty)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmdQty.Connection.Open();
                cmdQty.Parameters.Add("@WorkOrder", SqlDbType.VarChar, 50).Value = txtWorkOrder.Text;
                connectionQty.Close();

            }
            else
            {
                lblModel.Text = "Work Order Not Found";
                lblModel.ForeColor = System.Drawing.Color.Red;
                txtWorkOrder.Focus();
            }
        }

        protected void txtPartNumber_TextChanged(object sender, EventArgs e)
        {
            string quantity = String.Empty;
            string description = String.Empty;
            string workOrder = txtWorkOrder.Text;
            string dataScan = txtPartNumber.Text;
            string partNumber;
            char delimitador = ',';//SE DEFINE DELIMITADOR ,
            char delimitador2 = ' ';//SE DEFINE DEILIMITADOR ESPACIO   ,' '27MXXXXXXXXXXX
            //FUNCTION TO EXTRACT NUMBER PART FROM PROVIDEER DATA, FOR EXAMPLE,  Etiqueta, 27MX0000000000, N/A
            if (dataScan.Contains(delimitador))
            {
                string[] split = dataScan.Split(delimitador);
                string etiqueta = split[0].ToUpper();
                partNumber = split[1].TrimStart(delimitador2);
                string date = split[2].ToUpper();
            }
            else if (dataScan.Contains(delimitador2))
            {
                partNumber = txtPartNumber.Text.TrimStart(delimitador2);
            }
            else
            {
                partNumber = txtPartNumber.Text.ToUpper();
            }
            string conect = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlConnection conPartNumber = new SqlConnection(conect);
            SqlCommand cmdPartNumber = new SqlCommand("GetDetailsPN", conPartNumber)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmdPartNumber.Connection.Open();
            cmdPartNumber.Parameters.Add("@WorkOrder", SqlDbType.VarChar, 50).Value = workOrder;
            cmdPartNumber.Parameters.Add("@PartNumber", SqlDbType.VarChar, 50).Value = partNumber;
            SqlDataReader drPartNumber = cmdPartNumber.ExecuteReader();
            drPartNumber.Read();
            if (drPartNumber.HasRows)
            {
                string etiqueta = drPartNumber.GetString(drPartNumber.GetOrdinal("PartNumber"));
                description = drPartNumber.GetString(drPartNumber.GetOrdinal("Description"));
                quantity = drPartNumber.GetString(drPartNumber.GetOrdinal("Quantity"));
                lblPNTitle.Visible = true;
                lblPNTitle.Visible = true;
                lblPNName.Visible = true;
                lblPNTitle.Text = partNumber;
                txtPartNumber.Enabled = false;
                lblPNName.Text = description;

                lblResult.Visible = true;
                lblResult.Text = "PASS";
                lblResult.Attributes.Add("class", "text-success");

                string user = Session["userLogin"].ToString();
                string np = lblPNTitle.Text;
                string resultado = lblResult.Text;
                DateTime currentDate = DateTime.Now;
                string connection = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
                SqlConnection sqlConnection = new SqlConnection(connection);
                SqlCommand cmd = new SqlCommand("AddValidationMaterialWH", sqlConnection)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Connection.Open();
                cmd.Parameters.Add("@WorkOrder", SqlDbType.VarChar, 50).Value = txtWorkOrder.Text.ToUpper();
                cmd.Parameters.Add("@PartNumber", SqlDbType.VarChar, 30).Value = partNumber;
                cmd.Parameters.Add("@User", SqlDbType.VarChar, 30).Value = user;
                cmd.Parameters.Add("@Result", SqlDbType.VarChar, 10).Value = resultado;
                cmd.Parameters.Add("@SuppliedDate", SqlDbType.DateTime).Value = currentDate;
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                int rowcount = dr.GetInt32(dr.GetOrdinal("rowInserted"));
                cmd.Connection.Close();
                if (rowcount > 0)
                {
                    res2.Attributes.Add("class", "bg-success");
                    res2.Visible = true;
                    res.Visible = true;
                    res.Text = "ETIQUETA CORRECTA; REGISTRADA CORRECTAMENTE EN LA BASE DE DATOS";
                    res.ForeColor = System.Drawing.Color.White;
                    btnReset.Visible = true;
                    btnReset.Enabled = true;
                }
                else
                {
                    res2.Visible = true;
                    res.Visible = true;
                    res2.Attributes.Add("class", "bg-warning");
                    res.Text = "NO FUE POSIBLE REGISTRAR LA VALIDACION CORECTA EN LA BASE DE DATOS; CONTACTE A IT";
                    res.ForeColor = System.Drawing.Color.White;
                    btnReset.Visible = true;
                    btnReset.Enabled = true;
                }
            }
            else
            {
                lblPNName.Visible = true;
                txtPartNumber.Enabled = false;
                lblPNName.Text = description;

                string user = Session["userLogin"].ToString();
                string resultado = lblResult.Text;
                DateTime currentDate = DateTime.Now;
                string connection = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
                SqlConnection sqlConnection = new SqlConnection(connection);
                SqlCommand cmd = new SqlCommand("AddValidationMaterialWH", sqlConnection)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Connection.Open();
                cmd.Parameters.Add("@WorkOrder", SqlDbType.VarChar, 50).Value = txtWorkOrder.Text.ToUpper();
                cmd.Parameters.Add("@PartNumber", SqlDbType.VarChar, 30).Value = partNumber;
                cmd.Parameters.Add("@User", SqlDbType.VarChar, 30).Value = user;
                cmd.Parameters.Add("@Result", SqlDbType.VarChar, 10).Value = "FAIL";
                cmd.Parameters.Add("@SuppliedDate", SqlDbType.DateTime).Value = currentDate;

                lblResult.Visible = true;
                lblResult.Text = "FAIL";
                lblResult.Attributes.Add("class", "text-danger");
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                int rowcount = dr.GetInt32(dr.GetOrdinal("rowInserted"));
                cmd.Connection.Close();
                if (rowcount > 0)
                {
                    res2.Visible = true;
                    res.Visible = true;
                    res2.Attributes.Add("class", "bg-danger");
                    res.Text = "ETIQUETA INCORRECTA, REVISE EL NUMERO DE PARTE;  REGISTRADA EN LA BASE DE DATOS.";
                    res.ForeColor = System.Drawing.Color.White;
                    btnReset.Visible = true;
                    btnReset.Enabled = true;
                }
                else
                {
                    res2.Visible = true;
                    res.Visible = true;
                    res2.Attributes.Add("class", "bg-warning");
                    res.Text = "NO FUE POSIBLE REGISTRAR LA VALIDACION INCORECTA EN LA BASE DE DATOS; CONTACTE A IT";
                    res.ForeColor = System.Drawing.Color.White;
                    btnReset.Visible = true;
                    btnReset.Enabled = true;
                }
            }
            //string conect = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            //SqlConnection sqlConnection = new SqlConnection(conect);
            //SqlCommand sqlCommand = new SqlCommand("GetCountPN", sqlConnection)
            //{
            //    CommandType = CommandType.StoredProcedure
            //};
            //sqlConnection.Open();
            //sqlCommand.Parameters.Add("@WorkOrder", SqlDbType.VarChar, 50).Value = workOrder;
            //sqlCommand.Parameters.Add("@PartNumber", SqlDbType.VarChar, 30).Value = partNumber;
            //int rows = Convert.ToInt32(sqlCommand.ExecuteScalar());
            //if (rows > 0)
            //{

            //    SqlConnection conPartNumber = new SqlConnection(conect);
            //    SqlCommand cmdPartNumber = new SqlCommand("GetDetailsPN", conPartNumber)
            //    {
            //        CommandType = CommandType.StoredProcedure
            //    };
            //    cmdPartNumber.Connection.Open();
            //    cmdPartNumber.Parameters.Add("@WorkOrder", SqlDbType.VarChar, 50).Value = workOrder;
            //    cmdPartNumber.Parameters.Add("@PartNumber", SqlDbType.VarChar, 50).Value = partNumber;
            //    SqlDataReader drPartNumber = cmdPartNumber.ExecuteReader();
            //    drPartNumber.Read();
            //    if (drPartNumber.HasRows)
            //    {
            //        description = drPartNumber.GetString(drPartNumber.GetOrdinal("Description"));
            //        quantity = drPartNumber.GetString(drPartNumber.GetOrdinal("Quantity"));

            //    }
            //    lblPNTitle.Visible = true;
            //    lblPNName.Visible = true;
            //    lblPNTitle.Text = partNumber;
            //    txtPartNumber.Enabled = false;
            //    lblResultQty.Visible = true;
            //    lblResultQty.Text = quantity;
            //    lblPNName.Text = description;
            //    lblResult.Visible = true;
            //    lblResult.Text = "PASS";
            //    txtResult.Text = "PASS";
            //    lblResult.ForeColor = System.Drawing.Color.Green;
            //    txtTest.Visible = true;
            //    lblTest.Visible = true;
            //    btnReset.Visible = false;
            //    btnReset.Enabled = false;
            //    lblTest.Visible = true;
            //    txtTest.Visible = true;
            //    btnSaveQty.Visible = true;
            //}
            //else
            //{
            //    lblPNTitle.Visible = true;
            //    lblPNTitle.Visible = true;
            //    lblPNTitle.Text = partNumber;
            //    lblPNName.Text = description;
            //    lblResult.Visible = true;
            //    lblResult.Text = "FAIL";
            //    txtResult.Text = "FAIL";
            //    lblResult.Visible = true;
            //    lblResult.ForeColor = System.Drawing.Color.Red;
            //    txtPartNumber.Enabled = false;

            //    btnReset.Visible = false;
            //    txtWorkOrder.Enabled = false;
            //    lblTest.Visible = false;
            //    txtTest.Visible = false;
            //    txtTest.Text = "N/A";
            //    btnSaveQty.Visible = true;
            //}
            //sqlConnection.Close();



        }

        protected void btnSaveQty_Click(object sender, EventArgs e)
        {
            
        }

        public void SavePass()
        {
        }


        public void SaveFail()
        {

        }

        protected void txtTest_TextChanged(object sender, EventArgs e)
        {
          
        }
    }
}