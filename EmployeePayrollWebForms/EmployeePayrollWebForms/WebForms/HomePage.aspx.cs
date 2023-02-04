using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace EmployeePayrollWebForms.WebForms
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        static string connectionString = ConfigurationManager.ConnectionStrings["EmployeePayrollWebFormsConnectionString"].ConnectionString;
        SqlConnection objConnection = new SqlConnection(connectionString);

        protected void RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int Id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
            objConnection.Open();
            SqlCommand objCommand = new SqlCommand("delete from PayrollDetails where ID='" + Id + "'", objConnection);
            int result = objCommand.ExecuteNonQuery();
            if (result > 1)
            {
                Response.Write("<script>alert('Data is Deleted')</script>");
                GridView1.EditIndex = -1;
                GridView1.DataBind();
            }
            objConnection.Close();
        }
    }
}