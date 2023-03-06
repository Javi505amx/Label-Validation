<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="ejemplo.Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Resources/Images/inventronics icon.ico" rel="icon" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous"/>    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.min.js"></script>
    <title>Menu</title>
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
    <style type="text/css">
        #menuValidation{
            text-align: center;
        }
        #divLinks{
            position: absolute;
            margin: 3% 0 0 37%;
        }
        #btnLogout{
            float: right;
        }
    </style>
</head>
<body>
     <form id="menuValidation" runat="server" style="font-family: Calibri;" title="SMT Validation Menu">
        <div id="divUser">
            <asp:Label ID="lblUser" runat="server" Text="" Font-Size="150%" Font-Bold="true" ForeColor="Blue"></asp:Label>
        </div>
        <div id ="divLinks">
           <!-- <asp:LinkButton runat="server" CssClass="btn btn-secondary" ID="btnUserAdmin" PostBackUrl="~/Users.aspx" Font-Size="200%" Visible="true">
                <span class="fas fa-users" aria-hidden="true"></span> Gestión de Usuarios
            </asp:LinkButton>
            <br />
            <br />
            <asp:LinkButton runat="server" CssClass="btn btn-secondary" ID="btnDB" PostBackUrl="~/PopulateForm.aspx" Font-Size="200%" Visible="true">
                <span class="fas fa-database" aria-hidden="true"></span> Alimentación de BD
            </asp:LinkButton>-->
            <br />
            <br />
            <asp:LinkButton runat="server" CssClass="btn btn-secondary" ID="btnDelivery" PostBackUrl="~/NPVALIDATION.aspx" Font-Size="200%" Visible="true">
                <span class="fas fa-arrow-alt-circle-up" aria-hidden="true"></span> Entrega de Etiqueta(ALMACEN)
            </asp:LinkButton>
            <br />
            <br />
                        <asp:LinkButton runat="server" CssClass="btn btn-secondary" ID="LinkButton1" PostBackUrl="~/Validation.aspx" Font-Size="200%" Visible="true">
                <span class="fas fa-check-circle" aria-hidden="true"></span> Validacion de Etiquetas (VALIDACION)
            </asp:LinkButton>
            <br />
            <br />
            <asp:LinkButton runat="server" CssClass="btn btn-secondary" ID="btnValidation" PostBackUrl="~/LabelValidation.aspx" Font-Size="200%" Visible="true">
                <span class="fas fa-arrow-alt-circle-down" aria-hidden="true"></span> Recibo de Etiquetas (MANUFACTURA)
            </asp:LinkButton>
            <br />
            <br />

            <asp:LinkButton runat="server" CssClass="btn btn-secondary" ID="btnReturn" PostBackUrl="~/LabelReturn.aspx" Font-Size="200%" Visible="false">
                <span class="fas fa-exchange-alt" aria-hidden="true"></span> Retorno de Etiquetas
            </asp:LinkButton>
            <br />
            <br />

            <asp:LinkButton runat="server" CssClass="btn btn-secondary" ID="btnUsers" PostBackUrl="~/users.aspx" Font-Size="200%" Visible="false">
                <span class="fas fa-users" aria-hidden="true"></span> Gestion de Usuarios
            </asp:LinkButton>
            <br />
            <br />
            <asp:LinkButton runat="server" CssClass="btn btn-secondary" ID="btnConsulta" PostBackUrl="~/consulta.aspx" Font-Size="200%" Visible="true">
                <span class="fas fa-search" aria-hidden="true"></span> Consulta
            </asp:LinkButton>
            <br />
            <br />
            <asp:LinkButton runat="server" CssClass="btn btn-primary" ID="btnLogout" PostBackUrl="~/Login.aspx" Font-Size="200%">
                <span class="fas fa-sign-out-alt" aria-hidden="true"></span> Exit
            </asp:LinkButton>
        </div>
    </form>
</body>
</html>
