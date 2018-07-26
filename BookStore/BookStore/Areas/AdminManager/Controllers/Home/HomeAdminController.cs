using BookStore;
using BookStore.Areas.AdminManager.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.Mvc;

namespace TravelTour1.Areas.AdminManager.Controllers.Home
{
    public class HomeAdminController : Controller
    {
        // GET: AdminManager/HomeAdmin
        public ActionResult Index()
        {
            List<SACH> books = BookContext.getAllBooks();
            return View(books);
        }
        public ActionResult Create()
        {
            List<THE_LOAI> cate = BookContext.getAllCatagories();
            List<NHA_XUAT_BAN> nxbs = BookContext.getAllNXB();
            SelectList cateList = new SelectList(cate, "MA_THE_LOAI", "TEN_THE_LOAI");
            SelectList NXBList = new SelectList(nxbs, "MA_NXB", "TEN_NXB");
            
            ViewBag.NXBList = NXBList;
            ViewBag.CategoryList = cateList;
            return View();
        }

        [HttpPost]
        public ActionResult SaveNewBook(SACH sach, string TACGIA,string NXB,string THELOAI,HttpPostedFileBase Attachment)
        {
            if (Request.Files.Count > 0)
            {

                var file = Request.Files[0];

                if (file != null && file.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(file.FileName);
                    var path = Path.Combine(Server.MapPath("~/img/Books"), fileName);
                    file.SaveAs(path);
                    sach.ANH = "/img/Books/" + fileName;
                    List<SACH> lst = BookContext.getAllBooks();
                    try
                    {
                        BookContext.addBook(sach,THELOAI,TACGIA,NXB);
                        return RedirectToAction("Index");
                    }
                    catch (Exception ex)
                    {
                        Content("<script>alert('" + ex.Message + "');</script>");
                        return RedirectToAction("Index");
                    }
                }
            }
            return RedirectToAction("Index");
        }


    }
}