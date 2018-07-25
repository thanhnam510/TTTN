using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookStore.Models
{
    public class BookContext

    {
        public static List<SACH> getAllBooks()
        {
            using (var db = new booksEntities())
            {
                var query = from sach in db.SACH select sach;
                return query.OrderBy(x => x.NGAY_BAN).ToList<SACH>();
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
                db.Y_KIEN.Add(cmt);
                db.SaveChanges();
            }
        }

        public static List<Y_KIEN> getPositiveComments(int maSach)
        {
            using (var db = new booksEntities())
            {
                var query = db.Y_KIEN.Where(cmt => cmt.MA_SACH == maSach && cmt.DANH_GIA == "tích cực").Select(cmts => cmts);
                return query.OrderBy(x => x.NGAY).ToList();
            }

        }
        public static List<Y_KIEN> getNegativeComments(int maSach)
        {
            using (var db = new booksEntities())
            {
                var query = db.Y_KIEN.Where(cmt => cmt.MA_SACH == maSach && cmt.DANH_GIA == "tiêu cực").Select(cmts => cmts);
                return query.OrderBy(x => x.NGAY).ToList();
            }

        }
    }
}