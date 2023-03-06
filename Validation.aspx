<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Validation.aspx.cs" Inherits="ejemplo.Validation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="inventronics icon.ico" rel="icon" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous"/>    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.min.js"></script>
    <title>VALIDACION</title>
    <script type="text/javascript">
        function selectPartNumber() {
            document.getElementById('txtPartNumber').select();
        }
        function selectWorkOrder() {
            document.getElementById('txtWorkOrder').select();
        }
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
      <style type="text/css">
        #divLabels{
            float: left;
            text-align: right;
        }
        #divTextboxes{
            width: 900px;
        }
        #divTest{
            float: left;
        }
        #divResult{
            text-align: center;
            position:relative;
            bottom:50px;
        }
        #lblResult{
            position: absolute;
            bottom: 50px;
        }
        #btnReset{
            position:absolute;
            bottom:5px;
            right:50px;
        }
        #btnPrint{
            position: absolute;
            right: 50px;
            top: 300px;

        }
  
    </style>
    
</head>
<body>
    
     <form id="frmScanInfo" runat="server" style="font-family:Calibri; font-weight:700;" title="Label Validation MFG">
           <div id="Div1"  visible="TRUE"  runat="server" class="bg-primary text-center" > 
            <asp:Label  Text="VALIDACION DE ETIQUETAS (AREA VALIDACION DE KITS)" id="Label1" Visible="TRUE" CssClass="font-weight-bold  text-white" Font-Size="180%"   runat="server" ></asp:Label><br />
        </div>
        <br />
         <!-- -->
        <div id="divLabels">
            <asp:Label ID="lblWorkOrder" runat="server" Text="Work Order" Font-Size="200%" Height="60px"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblPartNumber" runat="server" Text="Label Part Number" Font-Size="200%" Height="60px"></asp:Label>
        </div>
        <div id="divTextboxes">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp
            <asp:TextBox ID="txtWorkOrder" runat="server" style="text-transform:uppercase" AutoPostBack="true" Font-Size="200%" Height="60px" Width="270px" AutoCompleteType="Disabled" OnTextChanged="txtWorkOrder_TextChanged" ></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label runat="server" ID="lblQtyPartNumbers" Visible="false" Font-Size="300%" Font-Bold="true" ForeColor="Green"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtPartNumber" runat="server" style="text-transform:uppercase" AutoPostBack="true"  Font-Size="200%" Height="60px" Width="270px" AutoCompleteType="Disabled" OnTextChanged="txtPartNumber_TextChanged" ></asp:TextBox>
        </div>
        <br />
        <asp:Label ID="lblModel" runat="server" Font-Size="180%" Height="60px" Text=""></asp:Label>
        <br />
        <asp:Label ID="lblQtyWO" runat="server" Font-Size="180%" Height="60px" Text=""></asp:Label>
        <br />
        <asp:Label ID="lblPNTitle" runat="server" Font-Size="200%" Height="60px" Text=""></asp:Label>
        <asp:Label ID="lblPNName" runat="server" Font-Size="200%" Height="60px" Text="" Visible="false"></asp:Label>
        <br />
        <asp:Label ID="lblQty" runat="server" Font-Size="200%" Height="60px" Text="Quantity: " Visible="false"></asp:Label>
        <asp:Label ID="lblResultQty" runat="server" Font-Size="200%" Height="60px" Text="" Visible="false"></asp:Label>
        <div id="divResult">
            <asp:Label ID="lblResult" runat="server" Font-Size="150px" Text="" Visible="false"></asp:Label> 
            <asp:TextBox ID="txtResult" runat="server" Text="" Visible="false" ></asp:TextBox>
        </div>
         <%--<div id="divReset">--%>
              <asp:LinkButton runat="server" CssClass="btn btn-primary btnReset" ID="btnReset" Font-Size="200%" OnClick="btnReset_Click" >
                <span class="fas fa-sync-alt" aria-hidden="true"></span> Reiniciar
            </asp:LinkButton>
         <%--</div>--%>
        
        <asp:Label ID="lblTest" runat="server" Text="Usuario " Font-Size="200%" Height="60px" Visible="false"></asp:Label>
        <asp:TextBox ID="txtTest" runat="server" style="text-transform: uppercase" Font-Size="200%" Height="60px" Width="200px" Visible="false" AutoCompleteType="None"></asp:TextBox>
        
        <asp:LinkButton ID="btnClose2" runat="server" Font-Size="150%" CssClass="btn btn-secondary" PostBackUrl="~/Menu.aspx">
             <span class="fas fa-backspace" aria-hidden="true"></span> Exit
        </asp:LinkButton>
    </form>
         <div id="res2"  visible="false"  runat="server" > 
            <asp:Label  Text=" " id="res" Visible="false" CssClass="font-weight-bold text-white" Font-Size="210%"   runat="server" ></asp:Label><br />
        </div>
</body>
</html>
