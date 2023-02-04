using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmployeePayrollWebForms.WebForms
{
    public partial class PayrollForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //Month
                for(int i = 1; i <= 12; i++)
                {
                    ddlMonth.Items.Add(i.ToString());
                }
                ddlMonth.Items.FindByValue(System.DateTime.Now.Month.ToString()).Selected = true;

                //Year
                for(int i = 2000; i <= 2023; i++)
                {
                    ddlYear.Items.Add(i.ToString());
                }
                ddlYear.Items.FindByValue(System.DateTime.Now.Year.ToString()).Selected = true;

                //Day
                SelectDay();
            }
        }

        public void SelectDay()
        {
            ddlDay.Items.Clear();
            int numOfDays = DateTime.DaysInMonth(Convert.ToInt32(ddlYear.SelectedValue), Convert.ToInt32(ddlMonth.SelectedValue));

            for(int i = 1; i<= numOfDays; i++)
            {
                ddlDay.Items.Add(i.ToString());
            }
            ddlDay.Items.FindByValue(System.DateTime.Now.Day.ToString()).Selected = true;
        }

        static string connectionString = ConfigurationManager.ConnectionStrings["EmployeePayrollWebFormsConnectionString"].ConnectionString;
        SqlConnection objConnection = new SqlConnection(connectionString);

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlCommand objCommand = new SqlCommand("EmployeePayrollFormCredentials", objConnection);
            objCommand.CommandType = System.Data.CommandType.StoredProcedure;
            objCommand.Parameters.AddWithValue("@NAME", Name.Text);
            objCommand.Parameters.AddWithValue("@IMG", rblImage.SelectedValue);
            objCommand.Parameters.AddWithValue("@GENDER", rblGender.SelectedValue);

            string checklist = "";
            for(int i = 0; i < cblDepartment.Items.Count; i++)
            {
                if(cblDepartment.Items[i].Selected)
                {
                    if (checklist == "")
                    {
                        checklist = cblDepartment.Items[i].Value;
                    }
                    else
                    {
                        checklist += " " + cblDepartment.Items[i].Value;
                    }
                }
            }

            objCommand.Parameters.AddWithValue("@DEPARTMENT", checklist);
            objCommand.Parameters.AddWithValue("@SALARY", ddlSalary.SelectedValue);
            objCommand.Parameters.AddWithValue("@START_DATE", ddlDay.SelectedValue + "/" + ddlMonth.SelectedValue + "/" + ddlYear.SelectedValue);
            objCommand.Parameters.AddWithValue("@NOTES", Notes.Text);
            objConnection.Open();
            var dataReader = objCommand.ExecuteReader();
            if(dataReader != null)
            {
                Session["data"] = dataReader;
                Response.Redirect("HomePage.aspx");
                Label7.Text = "Data added successfully.";
                Label7.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                Label7.Text = "Something went wrong. Try Again.";
                Label7.ForeColor = System.Drawing.Color.Red;
            }
            objConnection.Close();
        }
    }
}