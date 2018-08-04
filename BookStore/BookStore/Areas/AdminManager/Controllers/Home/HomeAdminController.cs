using BookStore;
using BookStore.Areas.AdminManager.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.Mvc;
using BookStore.Models;

namespace TravelTour1.Areas.AdminManager.Controllers.Home
{
    public class HomeAdminController : Controller
    {
        // GET: AdminManager/HomeAdmin
        public ActionResult Index()
        {
            List<SACH> book = BookContext.getAllBooks();
            return View(book);
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
        public ActionResult SaveNewBook(SACH sach, string TACGIA, string TACGIA2, string TACGIA3, string NXB,string THELOAI, string THELOAI2, string THELOAI3, HttpPostedFileBase Attachment)
        {
            List<string> tl = new List<string>();
            if ("" != THELOAI) tl.Add(THELOAI);
            if ("" != THELOAI2) tl.Add(THELOAI2);
            if ("" != THELOAI3) tl.Add(THELOAI3);
            List<string> tg = new List<string>();
            if ("" != TACGIA) tg.Add(TACGIA);
            if ("" != TACGIA2) tg.Add(TACGIA2);
            if ("" != TACGIA3) tg.Add(TACGIA3);
            if(tl.Count==0 || tg.Count == 0)
            {
                Content("<script>alert(' Tac giả hoặc thể loại không được để trống ');</script>");
                return RedirectToAction("Index");
            }
            if (Request.Files.Count > 0)
            {
                var file = Request.Files[0];
                if (file != null && file.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(file.FileName);
                    var path = Path.Combine(Server.MapPath("~/img/Books"), fileName);
                    file.SaveAs(path);
                    sach.ANH = "/img/Books/" + fileName;
                    try
                    {
                        BookContext.addBook(sach,tl,tg,NXB);
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
        public ActionResult Update(int masach)
        {
            BookDetails books = BookDetails.getBookDetails(masach);
            List<THE_LOAI> cate = BookContext.getAllCatagories();
            List<NHA_XUAT_BAN> nxbs = BookContext.getAllNXB();
            SelectList cateList = new SelectList(cate, "MA_THE_LOAI", "TEN_THE_LOAI");
            SelectList NXBList = new SelectList(nxbs, "MA_NXB", "TEN_NXB");
            ViewBag.NXBList = NXBList;
            ViewBag.CategoryList = cateList;

            return View(books);
        }


        [HttpPost]
        public ActionResult SaveUpdateBook(SACH sach,List<THE_LOAI> tl,List<TAC_GIA> tg,NHA_XUAT_BAN nxb,string TACGIA,string THELOAI)
        {

            if ("" != THELOAI)
            {
                if (tl == null) tl = new List<THE_LOAI>();
                THE_LOAI cate = new THE_LOAI();
                cate.MA_THE_LOAI = THELOAI;
                tl.Add(cate);
            }

            if ("" != TACGIA)
            {
                if (tg == null) tg = new List<TAC_GIA>();
                TAC_GIA author = new TAC_GIA();
                author.TEN_TAC_GIA = TACGIA;
                tg.Add(author);
            }
            try
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
                    }
                }
                BookDetails book = new BookDetails(sach, tg, tl, nxb);
                BookContext.UpdateBook(book);
            }
            catch (Exception ex)
            {
                return Content("<script>alert(" + ex.Message + ");</script>");
            }
            return RedirectToAction("Index");
        }
    }
}