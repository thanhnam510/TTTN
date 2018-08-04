using BookStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BookStore.Controllers
{
    public class ProductsController : Controller
    {
        // GET: Products
        public ActionResult Index(string search)
        {
            List<ProductView> books = new List<ProductView>();
            string[] temp = null;
            if (search == "")
                RedirectToAction("Index");
            else temp = search.Split('?');
            if (temp.Count() == 1 )
            {
                switch (search)
                {
                    case "All":
                        books = BookViewContext.getAllBooksIncAuthor();
                        break;
                    case "Top":
                        books = BookViewContext.getTopBooksIncAuthor();
                        break;
                    default:
                        books = BookViewContext.getTopBooksIncAuthorByCategory(search);
                        break;
                }
            }
            else
                
                books = temp[0] == "1"? BookViewContext.getTopBooksIncAuthorByAuthor(temp[1]):BookViewContext.getTopBooksIncAuthorByName(temp[1]);

           
                return View(books);
            
        }
        public ActionResult generateKeyWord(string search, string type)
        {
            string keyWord = type == "name" ? "2?":"1?";
            keyWord += search;
            return RedirectToAction("Index","Products",new { search = keyWord });
        }
    }

}