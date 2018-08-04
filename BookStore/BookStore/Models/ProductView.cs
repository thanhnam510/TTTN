using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookStore.Models
{
    public class ProductView
    {
        public SACH book { get; set; }
        public double percent { get; set; }

        public ProductView()
        {
        }

        public ProductView(SACH book, double percent)
        {
            this.book = book;
            this.book.TAC_GIA = book.TAC_GIA;
            this.percent = percent;
        }
    }

}