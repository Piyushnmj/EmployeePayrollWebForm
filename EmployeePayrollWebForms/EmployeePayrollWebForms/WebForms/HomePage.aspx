<%@ Page Title="" Language="C#" MasterPageFile="~/Employee.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="EmployeePayrollWebForms.WebForms.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../StyleSheet/HomePage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1>Employee Details</h1>
    </div>
    <br />
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" HorizontalAlign="Center" Height="100px" Width="2000px" DataKeyNames="ID" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="2px" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:TemplateField HeaderText="IMG" SortExpression="IMG">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("IMG") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("IMG") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                <asp:BoundField DataField="GENDER" HeaderText="GENDER" SortExpression="GENDER" />
                <asp:BoundField DataField="DEPARTMENT" HeaderText="DEPARTMENT" SortExpression="DEPARTMENT" />
                <asp:BoundField DataField="SALARY" HeaderText="SALARY" SortExpression="SALARY" />
                <asp:BoundField DataField="START_DATE" HeaderText="START_DATE" SortExpression="START_DATE" />
                <asp:CommandField ShowEditButton="True" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton runat="server"
                            OnClientClick="return confirm('Are you sure you?');"
                            CommandName="Delete">Delete</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EmployeePayrollWebFormsConnectionString %>"
            SelectCommand="SELECT [IMG], [NAME], [GENDER], [DEPARTMENT], [SALARY], [START_DATE], [ID] FROM [PayrollDetails]"
            ConflictDetection="CompareAllValues"
            DeleteCommand="DELETE FROM [PayrollDetails] WHERE [ID] = @p_ID"
            OldValuesParameterFormatString="p_{0}"
            UpdateCommand="UPDATE [PayrollDetails] SET [IMG] = @IMG, [NAME] = @NAME, [GENDER] = @GENDER, [DEPARTMENT] = @DEPARTMENT, [SALARY] = @SALARY, [START_DATE] = @START_DATE 
            WHERE [ID] = @p_ID AND [IMG] = @p_IMG AND [NAME] = @p_NAME AND [GENDER] = @p_GENDER AND [DEPARTMENT] = @p_DEPARTMENT AND [SALARY] = @p_SALARY AND [START_DATE] = @p_START_DATE">
            <DeleteParameters>
                <asp:Parameter Name="p_ID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="IMG" Type="String" />
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="GENDER" Type="String" />
                <asp:Parameter Name="DEPARTMENT" Type="String" />
                <asp:Parameter Name="SALARY" Type="String" />
                <asp:Parameter Name="START_DATE" Type="String" />
                <asp:Parameter Name="p_ID" Type="Int32" />
                <asp:Parameter Name="p_IMG" Type="String" />
                <asp:Parameter Name="p_NAME" Type="String" />
                <asp:Parameter Name="p_GENDER" Type="String" />
                <asp:Parameter Name="p_DEPARTMENT" Type="String" />
                <asp:Parameter Name="p_SALARY" Type="String" />
                <asp:Parameter Name="p_START_DATE" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
