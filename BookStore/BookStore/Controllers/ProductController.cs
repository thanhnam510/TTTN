using BookStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BookStore.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult ProductInfo(string maSach)
        {
            BookDetails book = BookDetails.getBookDetails(Convert.ToInt32(maSach));
            return View(book);
        }
    }
}