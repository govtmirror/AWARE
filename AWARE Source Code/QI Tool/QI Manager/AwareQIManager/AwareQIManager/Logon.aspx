﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AwareQIManager.Master" AutoEventWireup="true" CodeBehind="Logon.aspx.cs" Inherits="AwareQIManager.Logon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <br />
        <asp:Panel ID="Panel1" runat="server" BorderColor="Blue" BorderStyle="Inset" Style="margin: 0 auto; width: 350px;">
            <h2 id="LogonCredHdr" style="text-align:center">Please enter your credentials:</h2>            
            <asp:Table id="Table2" BorderColor="Gray" BorderWidth="2" GridLines="Both" runat="server" align = "center">
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Right">Access Code / Username:</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="tboxUserName" runat="server" width="150px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Right">Verify Code / Password:</asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="tboxPassword" runat="server" TextMode="Password" width="150px"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>            
            <div align="center">
                 <asp:CheckBox ID="ChkBxRevealText" runat="server" 
                    Text="Show Access Code / User Name characters" AutoPostBack="True" oncheckedchanged="ChkBxRevealText_CheckedChanged" />
                <br /> <br />
                <asp:Button ID="btnLogin" runat="server" Text="Login" onclick="btnLogin_Click" />
            </div>   
            &nbsp;     
        </asp:Panel>
        </div>
    <div style="text-align:center">
        <asp:Label ID="lblLogonStatus" runat="server" Text="Not currently logged on."></asp:Label>
    </div>
</asp:Content>


