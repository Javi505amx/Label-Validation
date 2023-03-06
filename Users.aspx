<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="ejemplo.Users" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Resources/Images/inventronics icon.ico" rel="icon"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous"/>    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.min.js"></script>
    <title>Users Management</title>
    <script type="text/javascript">
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
    <style type="text/css">
        #form1{
            text-align: center;
        }
    </style>
</head>
<body class="bg-light">
    <form id="form1" runat="server" style="font-family: Calibri; font-weight:700" title="Users Management">
        <br /><!--AppendDataBoundItems="true" OnSelectedIndexChanged="dlArea_SelectedIndexChanged" AutoPostBack="true"-->
            <asp:DropDownList ID="dlArea" runat="server" >
                <asp:ListItem Value="0">&lt;Seleccionar Area&gt;</asp:ListItem>
                <asp:ListItem Value="Calidad" Text="Calidad"></asp:ListItem>
                <asp:ListItem Value="Empaque" Text="Empaque"></asp:ListItem>
                <asp:ListItem Value="IT" Text="IT"></asp:ListItem>
     
            </asp:DropDownList>
        <br />
        <br /><!--AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="dlUsers_SelectedIndexChanged" ValidateRequestMode="Disabled"-->
            <asp:DropDownList ID="dlUsers" runat="server" >
                <asp:ListItem Value="0">&lt;Seleccionar Usuario&gt;</asp:ListItem>
            </asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="lblUsername" runat="server" Text="Username:" Font-Size="100%"></asp:Label>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat="server" ID="txtUsername" Font-Size="100%" AutoCompleteType="Disabled"></asp:TextBox>
        <br />
        <asp:Label ID="lblFullName" runat="server" Text="Nombre Completo:" Font-Size="100%"></asp:Label>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat="server" ID="txtFullName" Font-Size="100%" AutoCompleteType="Disabled"></asp:TextBox>
        <br />
        <asp:Label ID="lblEmpNumber" runat="server" Text="Número de Empleado:" Font-Size="100%" ></asp:Label>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Textbox runat="server" ID="txtEmployeeNumber" Font-Size="100%" AutoCompleteType="Disabled"></asp:Textbox>
        <br />
        <asp:Label ID="lblArea" runat="server" Text="Area:" Font-Size="100%"></asp:Label>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat="server" ID="txtArea" Font-Size="100%" AutoCompleteType="Disabled"></asp:TextBox>
        <br />
        <asp:Label Text="Password:" runat="server" Font-Size="100%"></asp:Label>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat="server" ID="txtPassword" Font-Size="100%" AutoCompleteType="Disabled"></asp:TextBox>
        <br />
        <asp:Label runat="server" Text="Administrator:" Font-Size="100%" ></asp:Label>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox runat="server" ID="cbAdmin" Font-Size="100%"/>
        <br />
        <asp:Label runat="server" Text="Fecha de Creación:" Font-Size="100%"></asp:Label>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox runat="server" ID="txtCreationDate" Font-Size="100%" TextMode="Date" AutoCompleteType="Disabled"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lblResult" runat="server" Text="" Font-Bold="true" Font-Size="150%" Visible="false"></asp:Label>
        <br />
        <br />
        <div id="divButtons">
            <asp:LinkButton ID="btnNew" runat="server" Font-Size="150%" CssClass="btn btn-primary" >
                <span class="fas fa-plus" aria-hidden="true"></span> Nuevo
            </asp:LinkButton>
            <asp:LinkButton runat="server" CssClass="btn btn-primary" ID="btnSave"  Font-Size="150%">
                <span class="fas fa-save" aria-hidden="true"></span> Guardar
            </asp:LinkButton>
            <asp:LinkButton runat="server" CssClass="btn btn-primary" ID="btnUpdate"  Font-Size="150%">
                <span class="fas fa-sync" aria-hidden="true"></span> Actualizar
            </asp:LinkButton>
            <asp:LinkButton runat="server" CssClass="btn btn-primary" ID="btnDelete" Font-Size="150%">
                <span class="fas fa-trash" aria-hidden="true"></span> Eliminar
            </asp:LinkButton>
            <asp:LinkButton runat="server" CssClass="btn btn-primary" ID="btnBack" Font-Size="150%" PostBackUrl="~/Menu.aspx">
                <span class="fas fa-backspace" aria-hidden="true"></span> Exit
            </asp:LinkButton>
        </div>
    </form>
</body>
</html>
