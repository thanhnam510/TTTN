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
        public static SACH getBooks(int maSach)
        {
            using (var db = new booksEntities())
            {
                var query = db.SACH.Where(s => s.MA_SACH == maSach);
                var theloai = db.SACH.Where(s => s.MA_SACH == maSach).SelectMany(s => s.THE_LOAI);
                var tgs = db.SACH.Where(s => s.MA_SACH == maSach).SelectMany(s => s.TAC_GIA);
                var nxban = db.SACH.Where(s => s.MA_SACH == maSach).SelectMany(s => s.NHA_XUAT_BAN);
                return query.FirstOrDefault();
            }
        }

    }
}