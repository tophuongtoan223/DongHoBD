using PagedList;
using Project_LTW.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_LTW.Controllers
{

    public class HomeController : Controller
    {
        LoginDataContext db = new LoginDataContext();

        public ActionResult Index(int? page)
        {
            var spMoi = db.DongHos.OrderByDescending(x => x.NgayCapNhat).Take(30).ToPagedList(page ?? 1,20);
            return View(spMoi);
        }
        public ActionResult Bestsaler()
        {
            var spbanchay = db.DongHos.OrderByDescending(x => x.NgayCapNhat).Take(10).ToList();
            return View(spbanchay);
        }
        public ActionResult Chitietsanpham(int id)
        {
            //lây ra chi tiet san pham theo id truyen vao
            var dongho = from s in db.DongHos
                         where s.MaDongHo == id
                         select s;
            return View(dongho.Single());
        }
        public ActionResult Contact()
        {
            return View();
        }
        public ActionResult DonghobannhieuPartial()
        {
            return PartialView(db.DongHos.OrderByDescending(s => s.SoLuongBan).Take(6).ToList());
        }
        public ActionResult LoaiDongHo(int id)
        {
            return View(db.DongHos.Where(x => x.MaLoai == id).ToList());
        }
        public ActionResult PhanLoaiPartial()
        {
            return PartialView(db.PhanLoais.ToList());
        }
        //public ActionResult TimKiem(string search, int? page)
        //{
        //    ViewBag.KQ = search;
        //    var model = DanhSachTimKiem(search, page);
        //    return View(model);
        //}
        //    public IPagedList<DongHo> DanhSachTimKiem(string search, int? page)

        //    {
        //        LoginDataContext shop = new LoginDataContext();
        //        var model = shop.DongHos.Where(s => s.TenDongHo.ToLower().Contains(search.ToLower())).OrderByDescending(c => c.MaDongHo);
        //        int pageSize = 10;
        //        int pageNumber = (page ?? 1);
        //        model.ToPagedList(pageNumber, pageSize);
        //        return model.ToPagedList(pageNumber, pageSize);
        //    }
        //}
        public ActionResult LoginLogout()
        {
            return View("LoginLogoutPartial");
        }
        public ActionResult BinhLuan()
        {
            return View();
        }
        public ActionResult KienThucDongHo()
        {
            return View();
        }
    }
}
