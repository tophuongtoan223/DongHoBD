using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project_LTW.Models;
using PagedList;
using PagedList.Mvc;
using System.IO;

namespace Project_LTW.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        LoginDataContext db = new LoginDataContext();
        // GET: Admin/Home
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult DanhSach()
        {

            return View(db.DongHos.ToList());
        }
        public ActionResult Edit(int id)
        {
            return View(db.DongHos.SingleOrDefault(m => m.MaDongHo == id));
        }
        [HttpPost]
        public ActionResult Edit(int id, DongHo model)
        {
            DongHo item = db.DongHos.SingleOrDefault(m => m.MaDongHo == id);
            item.MaDongHo = model.MaDongHo;
            item.TenDongHo = model.TenDongHo;
            item.AnhBia = model.AnhBia;
            item.GiaBan = model.GiaBan;
            item.NgaySanXuat = model.NgaySanXuat;
            item.SoLuong = model.SoLuong;
            item.GiamGia = model.GiamGia;
            item.SoLuongBan = model.SoLuongBan;
            item.MaLoai = model.MaLoai;
            db.SubmitChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Details(int id)
        {
            return View(db.DongHos.SingleOrDefault(m => m.MaDongHo == id));
        }
       
        public ActionResult Delete(int id)
        {
            return View(db.DongHos.SingleOrDefault(m => m.MaDongHo == id));
        }
        [HttpPost]
        public ActionResult Delete(int id, DongHo model)
        {
            DongHo item = db.DongHos.SingleOrDefault(m => m.MaDongHo == id);
            db.DongHos.DeleteOnSubmit(model);
            db.SubmitChanges();
            return RedirectToAction("Index");
        }
        public ActionResult DongHo()
        {
            return View(db.DongHos.ToList());
        }
        public ActionResult Phantrang(int? page, string searchString)
        {
            int iPageNum = (page ?? 1);
            int iPageSize = 5;
            ViewBag.searchString = searchString;
            //var list = db.DongHos.ToList().OrderByDescending(n => n.NgayCapNhat).ToPagedList(iPageNum, iPageSize);
            return View(db.DongHos.ToList().OrderBy(n => n.SoLuongBan).ToPagedList(iPageNum, iPageSize));
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        //[HttpGet]
        //public ActionResult Delete(int id)
        //{
        //    var DongHo = db.DongHos.SingleOrDefault(n => n.MaDongHo == id);
        //    if (DongHo == null)
        //    {
        //        Response.SubStatusCode = 404;
        //        return null;
        //    }
        //    return View(DongHo);
        //}
        //[HttpPost, ActionName("Delete")]
        //public ActionResult DeleteConfirm(int id, FormCollection f)
        //{
        //    var DongHo = db.DongHos.SingleOrDefault(n => n.MaDongHo == id);
        //    if (DongHo == null)
        //    {
        //        Response.StatusCode = 404;
        //        return null;
        //    }
        //    var ctdh = db.CHITIETDONHANGs.Where(ct => ct.MaDongHo == id);
        //    if (ctdh.Count() > 0)
        //    {

        //    }
        //}
    }
}