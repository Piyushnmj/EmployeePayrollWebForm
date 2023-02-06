using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace EmployeePayrollWebForms.WebForms
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        static string connectionString = ConfigurationManager.ConnectionStrings["EmployeePayrollWebFormsConnectionString"].ConnectionString;
        SqlConnection objConnection = new SqlConnection(connectionString);

        protected void Register_Click(object sender, EventArgs e)
        {
            SqlCommand objCommand = new SqlCommand("EmployeeRegistrationProcedure", objConnection);
            objCommand.CommandType = System.Data.CommandType.StoredProcedure;
            objCommand.Parameters.AddWithValue("@FIRSTNAME", TextBox1.Text);
            objCommand.Parameters.AddWithValue("@LASTNAME", TextBox2.Text);
            objCommand.Parameters.AddWithValue("@EMAIL", TextBox3.Text);
            objCommand.Parameters.AddWithValue("@PASSWORD", TextBox4.Text);
            objConnection.Open();
            var dataReader = objCommand.ExecuteReader();
            if (dataReader != null)
            {
                Session["data"] = dataReader;
                Register.Text = "Registration successful.";
                Register.ForeColor = System.Drawing.Color.Green;
                Response.Redirect("PayrollForm.aspx");
            }
            else
            {
                Register.Text = "Something went wrong. Try Again.";
                Register.ForeColor = System.Drawing.Color.Red;
            }
            objConnection.Close();
        }
    }
}