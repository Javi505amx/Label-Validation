using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace ejemplo
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUser.Focus();
        }
        public void saveDataUser()
        {
            string username;
            username = txtUser.Text;
            ScanHistoric.userLogin = txtUser.Text;
            ScanHistoric.loginDate = DateTime.Now.ToString("MM/dd/yyyy");
            ScanHistoric.loginTime = DateTime.Now.ToString("HH:mm:ss");
            ScanHistoric.longDateTime = ScanHistoric.loginDate + " " + ScanHistoric.loginTime;
            Session["userLogin"] = txtUser.Text;
            Session["password"] = txtPassword.Text;

            string conect = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlConnection cn = new SqlConnection(conect);
            SqlCommand cmd = new SqlCommand("GetFullName", cn)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Connection.Open();
            cmd.Parameters.Add("@Username", SqlDbType.VarChar, 50).Value = username;
            string fullName = Convert.ToString(cmd.ExecuteScalar());
            cn.Close();
            Session["fullName"] = fullName;
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string conect = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlConnection sqlCon = new SqlConnection(conect);
            SqlCommand cmd = new SqlCommand("ValidateUser", sqlCon)
            {
                CommandType = System.Data.CommandType.StoredProcedure
            };
            cmd.Connection.Open();
            cmd.Parameters.Add("@User", SqlDbType.VarChar, 50).Value = txtUser.Text;
            cmd.Parameters.Add("@Pass", SqlDbType.VarChar, 50).Value = txtPassword.Text;
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            int result = dr.GetInt32(dr.GetOrdinal("Users"));
            sqlCon.Close();
            if (result > 0)
            {
                SqlConnection sqlConAdmin = new SqlConnection(conect);
                SqlCommand cmdAdmin = new SqlCommand("ValidateUserAdmin", sqlConAdmin)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmdAdmin.Connection.Open();
                cmdAdmin.Parameters.Add("@User", SqlDbType.VarChar, 50).Value = txtUser.Text;
                cmdAdmin.Parameters.Add("@Pass", SqlDbType.VarChar, 50).Value = txtPassword.Text;
                SqlDataReader drAdmin = cmdAdmin.ExecuteReader();
                drAdmin.Read();
                int resultAdmin = drAdmin.GetInt32(drAdmin.GetOrdinal("Users"));
                cmdAdmin.Connection.Close();
                string v = resultAdmin.ToString();
                Session["Users"] = v;
                saveDataUser();
                Response.Redirect("menu.aspx");
                
            }
            else
            {
                lblError.Text = "Usuario o contraseña incorrectos";
                lblError.ForeColor = System.Drawing.Color.Red;
            }
            cmd.Connection.Close();
        }

        protected void txtUser_TextChanged(object sender, EventArgs e)
        {
            txtPassword.Focus();
        }
    }
}