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
    public partial class DSSanPham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ma = "";
            if (Request.QueryString["MaLoaiSP"] != null)
            {
                ma = Request.QueryString["MaLoaiSP"];
                string cmdStr = "SELECT MaSP, TenSP, GiaBan, HinhSP FROM SanPham WHERE MaLoaiSP = '" + ma + "'";
                srcSanPham.SelectCommand = cmdStr;
                srcSanPham.DataBind();
            }

            if (Request.QueryString["MaNhomSP"] != null)
            {
                ma = Request.QueryString["MaNhomSP"];
                string cmdStr = "SELECT MaSP, TenSP, GiaBan, HinhSP FROM SanPham, LoaiSP WHERE SanPham.MaLoaiSP = LoaiSP.MaLoaiSP AND MaNhomSP = '" + ma + "'";
                srcSanPham.SelectCommand = cmdStr;
                srcSanPham.DataBind();
            }
        }

        protected void btnLocGia_Click(object sender, EventArgs e)
        {

        }
    }
}