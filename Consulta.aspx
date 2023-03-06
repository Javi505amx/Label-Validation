<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Consulta.aspx.cs" Inherits="ejemplo.Consulta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="Resources/Images/inventronics icon.ico" rel="icon" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous"/>    
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="Resources/CSS/Styles.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.min.js"></script>
<title>Consultar WO</title>
<script type="text/javascript">
    function preventBack() { window.history.forward(); }
    setTimeout("preventBack()", 0);
    window.onunload = function () { null };
</script>
<style type="text/css">
    #size{

        
    }

    #divCenter{
        text-align: center;
    }
 #divModelWO{
        position: absolute;
        top: 120px;
        left: 610px;
    }
    #divResults{
        float: left;
        top: 40px;
    }
    #divLabels{
        float: left;
        text-align: right;
    }
    #divQtys{
        float: left;
        text-align: left;
    }
    #divButtons{
        position:absolute;
        bottom:50px;
        left: 50px;
    }
    #dataView{
        float:right;
        position:absolute;
        bottom:20px;
        width:auto;
    }
</style>
</head>
<body class="bg-light" id="size">
    <form id="form1" runat="server" style="font-family: Calibri;" title="Consultar WO">
        <div id="divCenter" class="form-group">
            <asp:Label ID="lblScan" runat="server" Text="Escanear WO" Font-Size="200%" ForeColor="Black" Visible="true"></asp:Label>
    
            <br />
            <asp:TextBox ID="txtWorkOrder" AutoPostBack="true" runat="server" Font-Size="200%"  visible="true" Style="text-transform:uppercase" AutoCompleteType="Disabled" OnTextChanged="txtWorkOrder_TextChanged" ></asp:TextBox>
        </div>
      
        <br />
       <%-- <div id="divModelWO" class="form-group">
            <asp:Label ID="lblWorkOrder" Text="TEST" runat="server" Font-Size="200%" Visible="true" Font-Bold="true" ForeColor="Blue"></asp:Label>
            <br />
            <asp:Label ID="lblModel" Text="TEST" runat="server" Font-Size="200%" Visible="true" ForeColor="Black" Font-Bold="true"></asp:Label>
        </div>--%>
        <br />
        <br />
        <br />
        <br />
        <div id="divResults">
           &nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label6" Text="LAST LABEL VALIDATION" runat="server" ForeColor="Red" Font-Size="200%"  Font-Bold="true" Visible="true"></asp:Label>
                <br />
          <div id="divLabels">
              
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" Text="Work Order:" runat="server" Font-Size="200%"  Font-Bold="true" Visible="true"></asp:Label>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2" Text="Part Number:" runat="server" Font-Size="200%" Font-Bold="true" Visible="true"></asp:Label>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label3" Text="User:" runat="server" Font-Size="200%" Font-Bold="true" Visible="true"></asp:Label>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label4" Text="Result:" runat="server" Font-Size="200%"  Font-Bold="true" Visible="true"></asp:Label>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label5" Text="Date & Time:" runat="server" Font-Size="200%" Font-Bold="true" Visible="false"></asp:Label>

          </div>
            <div id="divQtys" class="form-group">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblWO" Text="" runat="server" Font-Size="200%"   Visible="true"></asp:Label>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblPartNumber" Text="" runat="server" Font-Size="200%"  Visible="true"></asp:Label>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblUser" Text="" runat="server" Font-Size="200%"  Visible="true"></asp:Label>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblValidation" Text="" runat="server" Font-Size="200%" ForeColor="Blue" Visible="true"></asp:Label>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblDate" Text="" runat="server" Font-Size="200%"  Visible="false"></asp:Label>
            </div>


        </div>
          <div id="divButtons">
            <asp:LinkButton ID="btnClose2" runat="server" Font-Size="200%" CssClass="btn btn-primary" PostBackUrl="~/Menu.aspx">
                <span class="fas fa-backspace" aria-hidden="true"></span> Atras
            </asp:LinkButton>
            <asp:LinkButton runat="server" CssClass="btn btn-primary" ID="btnLogout" PostBackUrl="~/Menu.aspx" Font-Size="200%">
                <span class="fas fa-sign-out-alt" aria-hidden="true"></span> Salir
            </asp:LinkButton>
        </div>

        <%-- Class="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True" OnPageIndexChanging="datagrid_PageIndexChanging" AutoGenerateColumns="False"/--%>
        <div id="divModelWO">
            <asp:GridView ID="datagrid" runat="server"  CssClass="mydatagrid" AutoGenerateColumns="False"  HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True"    ShowHeaderWhenEmpty="false" EmptyDataText="No Data Record" AllowCustomPaging="true" PageSize="4" >
                <Columns>
                    <asp:BoundField DataField="WorkOrder" HeaderText="Work Order" SortExpression="Work Order" />
                    <asp:BoundField DataField="PartNumber" HeaderText="Part Number" SortExpression="Part Number" />
                    <asp:BoundField DataField="Validation" HeaderText="Validation" SortExpression="Validation" />
                    <asp:BoundField DataField="ValidationDate" HeaderText="Validation Date" SortExpression="Validation Date" />
                    <asp:BoundField DataField="User" HeaderText="User" SortExpression="User" />
                </Columns>
<HeaderStyle CssClass="header"></HeaderStyle>

<PagerStyle CssClass="pager"></PagerStyle>

<RowStyle CssClass="rows"></RowStyle>

 </asp:GridView>


        </div>
      
    </form>
</body>
</html>
