using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookStore.Models
{
    public class BookDetails
    {
        public SACH sach;
        public TAC_GIA[] tg;
        public THE_LOAI tl;
        public NHA_XUAT_BAN nxb;

        public BookDetails()
        {

        }

        public BookDetails(SACH sach, TAC_GIA[] tg, THE_LOAI tl, NHA_XUAT_BAN nxb)
        {
            this.sach = sach;
            this.tg = tg;
            this.tl = tl;
            this.nxb = nxb;
        }

        public static BookDetails getBookDetails(int maSach)
        {
            using (var db = new booksEntities())
            {
                var theloai = db.SACH.Where(s => s.MA_SACH == maSach).SelectMany(s => s.THE_LOAI);
                THE_LOAI Catagory = theloai.FirstOrDefault();
                var tgs = db.SACH.Where(s => s.MA_SACH == maSach).SelectMany(s => s.TAC_GIA);
                TAC_GIA[] Authors = tgs.ToArray();
                var nxban = db.SACH.Where(s => s.MA_SACH == maSach).SelectMany(s => s.NHA_XUAT_BAN);
                NHA_XUAT_BAN publisher = nxban.FirstOrDefault();
                var sachdetail = db.SACH.Where(s => s.MA_SACH == maSach);
                SACH book = sachdetail.FirstOrDefault();
                return new BookDetails(book, Authors, Catagory, publisher);
            }
        }
    }
}