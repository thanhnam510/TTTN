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
            List<Y_KIEN> cmt = BookViewContext.getComments(ms).OrderByDescending(n => n.NGAY).ToList();
            List<Y_KIEN> Positivecmts = cmt.Where(yk =>yk.DANH_GIA == "tích cực").ToList();
            List<Y_KIEN> Negativecmts = cmt.Where(yk => yk.DANH_GIA == "tiêu cực").ToList();
            List<Y_KIEN> Neutralcmts = cmt.Where(yk => yk.DANH_GIA == "trung lập").ToList();
            ViewBag.PositiveCmts = Positivecmts;
            ViewBag.NegativeCmts = Negativecmts;
            ViewBag.NeutralCmts = Neutralcmts;
            BookDetails book = BookDetails.getBookDetails(ms);
            return View(book);
        }
        [HttpPost]
        public JsonResult SaveComment(int ma_sach, string cmt)
        {
            BookViewContext.addComment(ma_sach, cmt);
            return Json("abc", JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult getPositiveComments(int ma_sach)
        {
            List<Y_KIEN> cmts = BookViewContext.getPositiveComments(ma_sach);
            return Json(new {list = cmts}, JsonRequestBehavior.AllowGet);
        }
    }
}