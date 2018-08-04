using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookStore.Models
{
    public class BookDetails
    {
        public SACH sach { get; set; }
        public List<TAC_GIA> tg { get; set; }
        public List<THE_LOAI> tl { get; set; }
        public NHA_XUAT_BAN nxb { get; set; }

        public BookDetails()
        {

        }

        public BookDetails(SACH sach, List<TAC_GIA> tg, List<THE_LOAI> tl, NHA_XUAT_BAN nxb)
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
                List<THE_LOAI> Catagory = theloai.ToList();
                var tgs = db.SACH.Where(s => s.MA_SACH == maSach).SelectMany(s => s.TAC_GIA);
                List<TAC_GIA> Authors = tgs.ToList();
                var nxban = db.SACH.Where(s => s.MA_SACH == maSach).SelectMany(s => s.NHA_XUAT_BAN);
                NHA_XUAT_BAN publisher = nxban.FirstOrDefault();
                var sachdetail = db.SACH.Where(s => s.MA_SACH == maSach);
                SACH book = sachdetail.FirstOrDefault();
                return new BookDetails(book, Authors, Catagory, publisher);
            }
        }
    }
}