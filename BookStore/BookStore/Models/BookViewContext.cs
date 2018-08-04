using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookStore.Models
{
    public class BookViewContext

    {
        public static List<SACH> getAllBooks()
        {
            using (var db = new booksEntities())
            {
                var query = from sach in db.SACH select sach;
                return query.OrderByDescending(x => x.NGAY_BAN).ToList<SACH>();
            }
        }

        public static void addComment(int maSach, string Noidung)
        {
            using (var db = new booksEntities())
            {
                Y_KIEN cmt = new Y_KIEN();
                cmt.NOI_DUNG = Noidung;
                cmt.MA_SACH = maSach;
                cmt.NGAY = System.DateTime.Now;
                XtractModule xtract = new XtractModule();
                cmt.DANH_GIA = xtract.getEvaluate(Noidung);
                var book = db.SACH.Where(s => s.MA_SACH == maSach).FirstOrDefault();
                book.TONG_DANH_GIA += 1;
                book.DANH_GIA_TOT += cmt.DANH_GIA.Equals("tích cực") ? 1 : 0;
                db.Y_KIEN.Add(cmt);
                db.SaveChanges();
            }
        }

        public static List<Y_KIEN> getPositiveComments(int maSach)
        {
            using (var db = new booksEntities())
            {
                var query = db.Y_KIEN.Where(cmt => cmt.MA_SACH == maSach && cmt.DANH_GIA == "tích cực").Select(cmts => cmts);
                return query.OrderByDescending(x => x.NGAY).ToList();
            }

        }
        public static List<Y_KIEN> getNegativeComments(int maSach)
        {
            using (var db = new booksEntities())
            {
                var query = db.Y_KIEN.Where(cmt => cmt.MA_SACH == maSach && cmt.DANH_GIA == "tiêu cực").Select(cmts => cmts);
                return query.OrderByDescending(x => x.NGAY).ToList();
            }

        }
        public static List<Y_KIEN> getComments(int maSach)
        {
            using (var db = new booksEntities())
            {
                var query = db.Y_KIEN.Where(cmt => cmt.MA_SACH == maSach);
                return query.ToList();
            }


        }
            public static List<ProductView> getAllBooksIncAuthor()
        {
            using (var db = new booksEntities())
            {
                var query = from sach in db.SACH select sach;
                var BookAuthor = db.SACH.Include("TAC_GIA");
                var b = query.Select(s => new { book = s, percent = s.TONG_DANH_GIA == 0 ? -1 : Math.Round((double)(s.DANH_GIA_TOT * 100.0 / s.TONG_DANH_GIA), 2) });
                List<ProductView> final = new List<ProductView>();
                foreach(var pv in b)
                {
                    final.Add(new ProductView(pv.book,pv.percent));
                }
                return final.OrderByDescending(x=>x.book.NGAY_BAN).ToList();
            }
        }

        public static List<ProductView> getTopBooksIncAuthor()
        {
            return getAllBooksIncAuthor().OrderByDescending(x => x.percent).ToList();
        }

        public static List<ProductView> getTopBooksIncAuthorByCategory(String tentheloai)
        {
            using (var db = new booksEntities())
            {
                List<ProductView> final = new List<ProductView>();
                var query = from s in db.SACH select s;
                var BookAuthor = db.SACH.Include("TAC_GIA");
                var tl = db.THE_LOAI.Where(t => t.TEN_THE_LOAI == tentheloai).Select(t => t.SACH).ToList();
                if (tl.Count != 0)
                {
                    var listMS = tl[0].Select(s => s.MA_SACH).ToArray();
                    var listB = BookAuthor.Where(s => listMS.Contains(s.MA_SACH)).Select(s => new { book = s, percent = s.TONG_DANH_GIA == 0 ? -1 : Math.Round((double)(s.DANH_GIA_TOT * 100.0 / s.TONG_DANH_GIA), 2) });
                    final = new List<ProductView>();
                    foreach (var pv in listB)
                    {
                        final.Add(new ProductView(pv.book, pv.percent));
                    }
                }
                return final.OrderByDescending(x => x.percent).ToList();
            }
        }
        public static List<ProductView> getTopBooksIncAuthorByAuthor(String tentacgia)
        {
            using (var db = new booksEntities())
            {
                List<ProductView> final = new List<ProductView>();
                var query = from s in db.SACH select s;
                var BookAuthor = db.SACH.Include("TAC_GIA");
                var tg = db.TAC_GIA.Where(t => t.TEN_TAC_GIA == tentacgia).Select(t => t.SACH).ToList();
                if (tg.Count != 0)
                {
                    var listMS = tg[0].Select(s => s.MA_SACH).ToArray();
                    var listB = BookAuthor.Where(s => listMS.Contains(s.MA_SACH)).Select(s => new { book = s, percent = s.TONG_DANH_GIA == 0 ? -1 : Math.Round((double)(s.DANH_GIA_TOT * 100.0 / s.TONG_DANH_GIA), 2) });
                    final = new List<ProductView>();
                    foreach (var pv in listB)
                    {
                        final.Add(new ProductView(pv.book, pv.percent));
                    }
                }
                return final.OrderByDescending(x => x.percent).ToList();
            }
        }

        public static List<ProductView> getTopBooksIncAuthorByName(String tensach)
        {
            using (var db = new booksEntities())
            {
                var query = from s in db.SACH select s;
                var BookAuthor = db.SACH.Include("TAC_GIA");
                var listB = BookAuthor.Where(s => s.TEN_SACH.Contains(tensach)).Select(s => new { book = s, percent = s.TONG_DANH_GIA == 0 ? -1 : Math.Round((double)(s.DANH_GIA_TOT * 100.0 / s.TONG_DANH_GIA), 2) });
                List<ProductView> final = new List<ProductView>();
                foreach (var pv in listB)
                {
                    final.Add(new ProductView(pv.book, pv.percent));
                }
                return final.OrderByDescending(x => x.percent).ToList();
            }
        }

    }
}