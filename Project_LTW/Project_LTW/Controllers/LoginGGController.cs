﻿//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.Mvc;
//using ASPSnippets.GoogleAPI;
//using System.Web.Script.Serialization;
//using System.Net;
//using Project_LTW.Models;

//namespace Project_LTW.Controllers
//{
//    public class LoginGGController : Controller
//    {
//        // GET: LoginGG
//        public ActionResult Index()
//        {
//            return View();
//        }
//        [HttpPost]
//        [ValidateAntiForgeryToken]
//        public void LoginWithGooglePlus()
//        {
//            GoogleConnect.ClientId = "981925134994-aatfsqmns3gi8pikhjbfhbaac8glmbe7.apps.googleusercontent.com";
//            GoogleConnect.ClientSecret = "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";
//            GoogleConnect.RedirectUri = Request.Url.AbsoluteUri.Split('?')[0];
//            GoogleConnect.Authorize("profile", "email");
//        }
//        [ActionName("LoginWithGooglePlus")]
//        public ActionResult LoginWithGooglePlusConfirmed()
//        {
//            if (!string.IsNullOrEmpty(Request.QueryString["code"]))
//            {
//                string code = Request.QueryString["code"];
//                string json = GoogleConnect.Fetch("me", code);
//                GoogleProfile profile = new JavaScriptSerializer().Deserialize<GoogleProfile>(json);

//                BlogITEntities db = new BlogITEntities();

//                if (db.KhachHangs.Find(profile.Id) != null)
//                {
//                    Session["khachhang"] = db.KhachHangs.Find(profile.Id);
//                    return RedirectToAction("Index", "Home");
//                }
//                KhachHang khachHang = new KhachHang()
//                {
//                    ID = profile.Id,
//                    Name = profile.DisplayName,
//                    Email = profile.Emails.Find(email => email.Type == "account").Value,
//                    Gender = profile.Gender,
//                    Type = profile.ObjectType,
//                    ImageURL = profile.Id + System.IO.Path.GetExtension(profile.Image.Url.Split('?')[0])
//                };
//                using (var client = new WebClient())
//                {
//                    client.DownloadFile(profile.Image.Url, Server.MapPath("~/Photos/Users/" + khachHang.ImageURL));
//                }
//                Session["khachhang"] = khachHang;
//                db.KhachHangs.Add(khachHang);
//                db.SaveChanges();
//            }
//            if (Request.QueryString["error"] == "access_denied")
//            {
//                return Content("access_denied");
//            }
//            return RedirectToAction("Index", "Home");

//        }
//    }
//}