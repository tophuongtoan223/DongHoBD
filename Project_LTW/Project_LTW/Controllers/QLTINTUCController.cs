//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.Mvc;
//using System.IO;
//using Project_LTW.Models;

//namespace Project_LTW.Controllers
//{
//    public class QLTINTUCController : Controller
//    {
//        // GET: QLTINTUC
//        public ActionResult Index()
//        {
//            if (Session["UserName"] == null)
//            {
//                return RedirectToAction("Index", "Login");
//            }
//            else
//            {
//                LoginDataContext shop = new LoginDataContext();
//                var model = shop.TinTucs.OrderByDescending(t => t.MaTin).ToList();
//                return View(model);
//            }
//        }
//        [HttpGet]
//        public ActionResult ThemTin()
//        {
//            if (Session["UserName"] == null)
//            {
//                return RedirectToAction("Index", "Login");
//            }
//            else
//            {
//                return View();
//            }
//        }
//        [HttpPost]
//        [ValidateInput(false)]
//        public ActionResult ThemTin(TinTuc model, HttpPostedFileBase file)
//        {
//            if (Session["UserName"] == null)
//            {
//                return RedirectToAction("Index", "Login");
//            }
//            else
//            {
//                LoginDataContext shop = new LoginDataContext();
//                TinTuc tin = new TinTuc();
//                tin.TieuDe = model.TieuDe;
//                file = file ?? Request.Files["file"];
//                if (file != null && file.ContentLength > 0)
//                {
//                    var fileName = Path.GetFileName(file.FileName);
//                    if (fileName != null)
//                    {
//                        var path = Path.Combine(Server.MapPath("~/images/news/"), fileName);
//                        file.SaveAs(path);
//                        tin.Anh = "/images/news/" + fileName;


//                    }
//                }
//                else
//                {
//                    tin.Anh = "/images/p-1.png";


//                }
//                tin.NoiDung = model.NoiDung;
//                tin.NguoiDang = 1;
//                tin.NgayDang = model.NgayDang;
//                //tin.NgayDang = DateTime.Now;
//                shop.TinTucs.Add(tin);
//                shop.SaveChanges();
//                Response.Redirect("Index");
//                return RedirectToAction("Index", model);
//            }
//        }
//        [HttpGet]
//        public ActionResult SuaTin(int id)
//        {
//            if (Session["UserName"] == null)
//            {
//                return RedirectToAction("Index", "Login");
//            }
//            else
//            {
//                MaTin = id;
//                LoginDataContext shop = new LoginDataContext();
//                var model = shop.TinTucs.SingleOrDefault(s => s.MaTin == id);

//                return View(model);
//            }
//        }
//        [HttpPost]
//        [ValidateInput(false)]
//        public ActionResult SuaTin(TinTuc tin, string img, HttpPostedFileBase file)
//        {
//            if (Session["MaTk"] == null)
//            {
//                return RedirectToAction("Index", "Login");
//            }
//            else
//            {
//                file = file ?? Request.Files["file"];

//                ShopWatchesEntities1 shop = new ShopWatchesEntities1();
//                var tintuc = shop.TinTucs.SingleOrDefault(s => s.MaTin == matin);


//                if (file != null && file.ContentLength > 0)
//                {
//                    var fileName = Path.GetFileName(file.FileName);
//                    if (fileName != null)
//                    {
//                        var path = Path.Combine(Server.MapPath("~/images/news/"), fileName);
//                        file.SaveAs(path);
//                        tintuc.TieuDe = tin.TieuDe;
//                        tintuc.NoiDung = tin.NoiDung;
//                        tintuc.NgayDang = tin.NgayDang;
//                        tintuc.Anh = "/images/news/" + fileName;
//                        shop.SaveChanges();
//                    }
//                }
//                else
//                {
//                    tintuc.TieuDe = tin.TieuDe;
//                    tintuc.NoiDung = tin.NoiDung;
//                    tintuc.Anh = img;
//                    tintuc.NgayDang = tin.NgayDang;
//                    shop.SaveChanges();
//                }


//                var model = shop.TinTucs.OrderByDescending(s => s.MaTin).ToList();
//                return View("Index", model);
//            }

//        }


//        public ActionResult XoaTin(int id)
//        {
//            if (Session["MaTk"] == null)
//            {
//                return RedirectToAction("Index", "Login");
//            }
//            else
//            {
//                LoginDataContext shop = new LoginDataContext();
//                var model = shop.TinTucs.OrderByDescending(s => s.MaTin).ToList();

//                var TinTuc = shop.TinTucs.SingleOrDefault(s => s.MaTin == id);
//                if (TinTuc != null)
//                {
//                    shop.TinTucs.Remove(TinTuc);
//                    shop.SaveChanges();
//                }

//                return RedirectToAction("Index", model);
//            }
//        }
//}