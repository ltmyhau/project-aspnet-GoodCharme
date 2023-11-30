using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebsiteBanNuocHoa
{
    public partial class ThemSanPham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            string conStr = WebConfigurationManager.ConnectionStrings["QLBH_NuocHoa"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            SqlDataAdapter adapt = new SqlDataAdapter();
            adapt.SelectCommand = new SqlCommand("SELECT * FROM SanPham", con);
            DataTable dt = new DataTable();
            adapt.Fill(dt);
            string strFileUpload = "";
            try
            {
                if (upHinh.HasFile)
                {
                    strFileUpload = "~/images/" + upHinh.FileName;
                    string path = Server.MapPath("/Images/") + upHinh.FileName;
                    upHinh.PostedFile.SaveAs(path);
                }
                adapt.InsertCommand = new SqlCommand("INSERT INTO SanPham (TenSP, GiaBan, DungTich, MaLoaiSP, HinhSP) VALUES (@TenSP, @GiaBan, @DungTich, @MaLoaiSP, @HinhSP)", con);
                adapt.InsertCommand.Parameters.AddWithValue("@TenSP", txtTenSP.Text);
                adapt.InsertCommand.Parameters.AddWithValue("@GiaBan", txtGiaBan.Text);
                adapt.InsertCommand.Parameters.AddWithValue("@DungTich", Convert.ToDouble(txtDungTich.Text));
                adapt.InsertCommand.Parameters.AddWithValue("@MaLoaiSP", Convert.ToInt32(drpLoaiSP.SelectedValue));
                adapt.InsertCommand.Parameters.AddWithValue("@HinhSP", strFileUpload);
                DataRow row = dt.NewRow();
                row["TenSP"] = "@TenSP";
                row["GiaBan"] = Convert.ToDouble(txtGiaBan.Text);
                row["DungTich"] = Convert.ToInt32(txtDungTich.Text);
                row["MaLoaiSP"] = Convert.ToInt32(drpLoaiSP.SelectedValue);
                row["HinhSP"] = "@HinhSP";
                dt.Rows.Add(row);
                adapt.Update(dt);
                lblThongBao.Text = "Thêm thành công!";
            }
            catch (Exception ex)
            {
                lblThongBao.Text = ex.Message;
            }
        }
    }
}