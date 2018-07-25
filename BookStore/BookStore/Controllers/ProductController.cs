using BookStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
namespace BookStore.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult ProductInfo(string maSach)
        {
            int ms = Convert.ToInt32(maSach);
            List<Y_KIEN> Pcmts = BookContext.getPositiveComments(ms);
            List<Y_KIEN> Ncmts = BookContext.getNegativeComments(ms);
            ViewBag.PositiveCmts = Pcmts;
            ViewBag.NegativeCmts = Ncmts;
            BookDetails book = BookDetails.getBookDetails(ms);
            return View(book);
        }
        [HttpPost]
        public JsonResult SaveComment(int ma_sach, string cmt)
        {
            BookContext.addComment(ma_sach, cmt);
            return Json("abc", JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult getPositiveComments(int ma_sach)
        {
            List<Y_KIEN> cmts = BookContext.getPositiveComments(ma_sach);
            return Json(new {list = cmts}, JsonRequestBehavior.AllowGet);
        }
    }
}