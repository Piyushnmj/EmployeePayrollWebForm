<%@ Page Title="" Language="C#" MasterPageFile="~/Employee.Master" AutoEventWireup="true" CodeBehind="PayrollForm.aspx.cs" Inherits="EmployeePayrollWebForms.WebForms.PayrollForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../StyleSheet/PayrollForm.css" rel="stylesheet" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Employee Payroll Form
    </h2>
    <div>
        <asp:Label ID="Label1" runat="server" Text="Label">Name</asp:Label>
        <asp:TextBox ID="Name" runat="server" Height="16px" Width="140px"></asp:TextBox>
    </div>
    <br />
    <div>
        <asp:Label ID="Label2" runat="server" Text="Label">Profile Image</asp:Label>
        <asp:RadioButtonList ID="rblImage" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem Text='<img src="../Images/Ellipse -1.png" alt="img1"/>' Value="../Images/Ellipse -1.png"></asp:ListItem>
            <asp:ListItem Text='<img src="../Images/Ellipse -3.png" alt="img2"/>' Value="../Images/Ellipse -3.png"></asp:ListItem>
            <asp:ListItem Text='<img src="../Images/Ellipse -4.png" alt="img3"/>' Value="../Images/Ellipse -4.png"></asp:ListItem>
            <asp:ListItem Text='<img src="../Images/Ellipse -2.png" alt="img4"/>' Value="../Images/Ellipse -2.png"></asp:ListItem>
        </asp:RadioButtonList>
    </div>
    <br />
    <div>
        <asp:Label ID="Label3" runat="server" Text="Label">Gender</asp:Label>
        <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
        </asp:RadioButtonList>
    </div>
    <br />
    <div>
        <asp:Label ID="Label4" runat="server" Text="Label">Department</asp:Label>
        <asp:CheckBoxList ID="cblDepartment" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem Text="HR" Value="HR"></asp:ListItem>
            <asp:ListItem Text="Sales" Value="Sales"></asp:ListItem>
            <asp:ListItem Text="Finance" Value="Finance"></asp:ListItem>
            <asp:ListItem Text="Engineer" Value="Engineer"></asp:ListItem>
            <asp:ListItem Text="Others" Value="Others"></asp:ListItem>
        </asp:CheckBoxList>
    </div>
    <br />
    <div>
        <asp:Label ID="Label5" runat="server" Text="Label">Salary</asp:Label>
        <asp:DropDownList ID="ddlSalary" runat="server">
            <asp:ListItem>Select Salary</asp:ListItem>
            <asp:ListItem Value="10,000"></asp:ListItem>
            <asp:ListItem Value="20,000"></asp:ListItem>
            <asp:ListItem Value="30,000"></asp:ListItem>
            <asp:ListItem Value="40,000"></asp:ListItem>
            <asp:ListItem Value="50,000"></asp:ListItem>
        </asp:DropDownList>
    </div>
    <br />
    <div>
        <asp:Label ID="Label6" runat="server" Text="Label">Start Date</asp:Label>
        <asp:DropDownList ID="ddlDay" runat="server">
            <asp:ListItem Value="Day">Day</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="ddlMonth" runat="server">
            <asp:ListItem>Month</asp:ListItem>
        </asp:DropDownList>
        <asp:DropDownList ID="ddlYear" runat="server">
            <asp:ListItem>Year</asp:ListItem>
        </asp:DropDownList>
    </div>
    <br />
    <div>
        <asp:Label ID="Label7" runat="server" Text="Label">Notes</asp:Label>
        <asp:TextBox ID="Notes" runat="server" Height="65px" Width="313px"></asp:TextBox>
    </div>
    <br />
    <div>
        <asp:Button ID="Button1" runat="server" Text="Cancel" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Submit" OnClick="Button2_Click" />
        &nbsp;
        <asp:Button ID="Button3" runat="server" Text="Reset" />
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EmployeePayrollWebFormsConnectionString %>" SelectCommand="SELECT * FROM [PayrollDetails]"></asp:SqlDataSource>
</asp:Content>
