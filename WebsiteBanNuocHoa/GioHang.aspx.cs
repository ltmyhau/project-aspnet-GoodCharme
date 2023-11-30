using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebsiteBanNuocHoa
{
    public partial class GioHang : System.Web.UI.Page
    {
        DataTable dt = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        protected void LoadData()
        {
            if (Session["GioHang"] != null)
            {
                dt = (DataTable)Session["GioHang"];
                grdGioHang.DataSource = dt;
                grdGioHang.DataBind();
                grdGioHang.Visible = true;
                pnlGioHangTrong.Visible = false;
                pnlDatHang.Visible = true;

                if (dt != null)
                {
                    double tong = TinhTongTien(dt);
                    Session["tong"] = tong;
                    lblTongTien.Text = String.Format("{0:0,000}", tong);
                }

                int soLuong = dt.Rows.Count;
                if (soLuong == 0)
                {
                    grdGioHang.Visible = false;
                    pnlGioHangTrong.Visible = true;
                    pnlDatHang.Visible = false;
                }
            }
            else
            {
                grdGioHang.Visible = false;
                pnlGioHangTrong.Visible = true;
                pnlDatHang.Visible = false;
            }
        }

        protected void grdGioHang_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            dt = (DataTable)Session["GioHang"];
            GridViewRow row = grdGioHang.Rows[e.RowIndex];
            dt.Rows[row.DataItemIndex].Delete();
            grdGioHang.EditIndex = -1;
            Session["GioHang"] = dt;
            LoadData();
        }

        protected double TinhTongTien(DataTable dt)
        {
            if (dt == null)
                return 0;
            double sum = 0;
            foreach (DataRow row in dt.Rows)
                sum += Convert.ToDouble(row["ThanhTien"]);
            return sum;
        }
    }
}