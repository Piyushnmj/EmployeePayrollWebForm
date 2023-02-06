using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeePayrollWebForms.WebForms
{
    public partial class EmployeeLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        static string connectionString = ConfigurationManager.ConnectionStrings["EmployeePayrollWebFormsConnectionString"].ConnectionString;
        SqlConnection objConnection = new SqlConnection(connectionString);

        protected void Login_Click(object sender, EventArgs e)
        {
            SqlCommand objCommand = new SqlCommand("Select EMAIL, PASSWORD From EmployeeDetails Where EMAIL= @EMAIL AND PASSWORD = @PASSWORD", objConnection);
            objCommand.Parameters.AddWithValue("@EMAIL", TextBox1.Text);
            objCommand.Parameters.AddWithValue("@PASSWORD", TextBox2.Text);
            SqlDataAdapter objData = new SqlDataAdapter(objCommand);
            DataTable objTable = new DataTable();
            objData.Fill(objTable);
            objConnection.Open();
            var dataReader = objCommand.ExecuteNonQuery();
            if (objTable.Rows.Count > 0)
            {
                Response.Redirect("HomePage.aspx");
            }
            else
            {
                Login.Text = "Email does not exist.";
                Login.ForeColor = System.Drawing.Color.Red;
            }
            objConnection.Close();
        }
    }
}