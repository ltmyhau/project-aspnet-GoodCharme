using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebsiteBanNuocHoa
{
    public partial class Main : System.Web.UI.MasterPage
    {
        DataTable dt = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Url.AbsolutePath.ToLower().Contains("/giohang.aspx"))
            {
                pnlFooter.Visible = false;
            }
            else
            {
                pnlFooter.Visible = true;
            }

            if (!IsPostBack)
            {
                DataBind();
            }

            if (Session["GioHang"] != null)
            {
                dt = (DataTable)Session["GioHang"];
                lblSoLuong.Text = dt.Rows.Count.ToString();
            }
        }
    }
}