using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ejemplo
{
    public partial class Menu : System.Web.UI.Page
    {
        private const bool V = true;
        private const bool F = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Users"].ToString() == "1")
            {
                btnDelivery.Visible = V;
                btnReturn.Visible = V;
                btnValidation.Visible = V;
                btnUsers.Visible = V;
                btnConsulta.Visible = V;
            }
            else if (Session["Users"].ToString() == "0")
            {
                btnDelivery.Visible = V;
                btnReturn.Visible = V;
                btnValidation.Visible = V;
                btnUsers.Visible = F;
                btnConsulta.Visible = F;
                LinkButton1.Visible = V;
            }
            else
            {
                btnDelivery.Visible = F;
                btnReturn.Visible = F;
                btnValidation.Visible = F;
                btnUsers.Visible = F;
                btnConsulta.Visible= F;
            }
        }
    }
}