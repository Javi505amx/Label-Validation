﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NPVALIDATION.aspx.cs" Inherits="ejemplo.NPVALIDATION" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="inventronics icon.ico" rel="icon" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous"/>    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.min.js"></script>
    <link rel="stylesheet" href="Resources/CSS/Styles.css" />
    <title>ENTREGA ETIQUETA WH</title>
    <script type="text/javascript">
        function selectPartNumber() {
            document.getElementById('txtPartNumber').select();
        }
        function selectWorkOrder() {
            document.getElementById('txtWorkOrder').select();
        }
        function preventBack() {window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () {null};
    </script>
    <style type="text/css">
        #divLabels {
            float: left;
            text-align: right;
        }

        #divTextboxes {
            width: 900px;
        }

        #divTest {
            float: left;
        }

        #divResult {
            text-align: center;
            position: relative;
            bottom: 50px;
        }

        #lblResult {
            position: absolute;
            bottom: 50px;
        }

        #btnReset {
            position: absolute;
            top: 50px;
            right: 50px;
        }

        #btnPrint {
            position: absolute;
            right: 50px;
            top: 300px;
        }

        #btnClose2 {
            position: absolute;
            right: 50px;
            top: 300px;
        }
    </style>
    
</head>
<body>
    
     <form id="frmScanInfo" runat="server" style="font-family:Calibri; font-weight:700;" title="Validate Material">
                      <div id="Div1"  visible="TRUE"  runat="server" class="bg-primary text-center" > 
            <asp:Label  Text="ENTREGA DE ETIQUETAS ALMACEN" id="Label1" Visible="TRUE" CssClass="font-weight-bold  text-white" Font-Size="180%"   runat="server" ></asp:Label><br />
        </div>
        <br />
        <div id="divLabels">
            <asp:Label ID="lblWorkOrder" runat="server" Text="Work Order" Font-Size="200%" Height="60px"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblPartNumber" runat="server" Text="Etiqueta PT" Font-Size="200%" Height="60px"></asp:Label><br />
            <asp:Label runat="server" Text="Modelo" Font-Size="200%" Height="60px"></asp:Label><br />
            <asp:Label runat="server" Text="Cantidad WO" Font-Size="200%" Height="60px"></asp:Label><br />
            <asp:Label runat="server" Text="Etiqueta" Font-Size="200%" Height="60px"></asp:Label><br />
            <asp:Label runat="server" Text="Descripcion" Font-Size="200%" Height="60px"></asp:Label><br />

        </div>
        <div id="divTextboxes">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtWorkOrder" runat="server" Style="text-transform: uppercase" AutoPostBack="true" Font-Size="200%" Height="60px" Width="270px" AutoCompleteType="Disabled" OnTextChanged="txtWorkOrder_TextChanged"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtPartNumber" runat="server" Style="text-transform: uppercase" AutoPostBack="true" Font-Size="200%" Height="60px" Width="270px" AutoCompleteType="Disabled" OnTextChanged="txtPartNumber_TextChanged"></asp:TextBox>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblModel" runat="server" Font-Size="180%" Height="60px" Text=""></asp:Label>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblQtyWO" runat="server" Font-Size="180%" Height="60px" Text=""></asp:Label>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblPNTitle" runat="server" Font-Size="200%" Height="60px" Text=""></asp:Label><br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblPNName" runat="server" Font-Size="200%" Height="40px" Text="" Visible="true"></asp:Label>
            <br />
        </div>

        <div id="divResult">
            <asp:Label ID="lblResult" runat="server" Font-Size="150px" Text="" Visible="false"></asp:Label> 
       <asp:TextBox ID="txtResult" runat="server" Text="" Visible="false" ></asp:TextBox>
            </div>
         <div id="divReset">
              <asp:LinkButton runat="server" CssClass="btn btn-primary" ID="btnReset" Font-Size="200%" OnClick="btnReset_Click" style="right: 375px; bottom: 183px" >
                <span class="fas fa-sync-alt" aria-hidden="true"></span> Reset
            </asp:LinkButton>
         </div>
        
 
           



         <asp:LinkButton ID="btnClose2" runat="server" Font-Size="150%" CssClass="btn btn-secondary" PostBackUrl="~/Menu.aspx">
             <span class="fas fa-backspace" aria-hidden="true"></span>Exit
        </asp:LinkButton>
    </form>
             <div id="res2"  visible="false"  runat="server" > 
            <asp:Label  Text=" " id="res" Visible="false" CssClass="font-weight-bold text-white" Font-Size="210%"   runat="server" ></asp:Label><br />
        </div>
</body>
</html>
