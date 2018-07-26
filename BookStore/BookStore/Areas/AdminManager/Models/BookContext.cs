using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookStore.Areas.AdminManager.Models
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
        public static List<THE_LOAI> getAllCatagories()
        {
            using (var db = new booksEntities())
            {
                List<THE_LOAI> theloais = (from tl in db.THE_LOAI select tl).ToList();
                return theloais;
            }
        }
        public static List<TAC_GIA> getAllAuthors()
        {
            using (var db = new booksEntities())
            {
                List<TAC_GIA> tacGias = (from tg in db.TAC_GIA select tg).ToList();
                return tacGias;
            }
        }
        public static List<NHA_XUAT_BAN> getAllNXB()
        {
            using (var db = new booksEntities())
            {
                List<NHA_XUAT_BAN> nxbs = (from nxb in db.NHA_XUAT_BAN select nxb).ToList();
                return nxbs;
            }
        }
        public static void addAuthor(string tenTacGia)
        {
            TAC_GIA tacgia = new TAC_GIA();
            tacgia.TEN_TAC_GIA = tenTacGia;
            using (var db = new booksEntities())
            {
                db.TAC_GIA.Add(tacgia);
                db.SaveChanges();
            }
        }
        public static void addBook(SACH book,string matheloai,string TACGIA,string maNXB) {
            book.NGAY_BAN = System.DateTime.Now;
            using (var db = new booksEntities())
            {
                
                THE_LOAI tl = db.THE_LOAI.Where(theloai => theloai.MA_THE_LOAI == matheloai).Select(theloai => theloai).FirstOrDefault();
                NHA_XUAT_BAN nxb = db.NHA_XUAT_BAN.Where(nxban => nxban.MA_NXB == maNXB).Select(nxban => nxban).FirstOrDefault();
                TAC_GIA tg = db.TAC_GIA.Where(tacgia => tacgia.TEN_TAC_GIA.Contains(TACGIA.Trim())).Select(tgia=>tgia).FirstOrDefault();
                if(tg == null)
                {
                    addAuthor(TACGIA.Trim());
                    tg = db.TAC_GIA.Where(tacgia => tacgia.TEN_TAC_GIA.Contains(TACGIA.Trim())).Select(tgia => tgia).FirstOrDefault();
                }
                nxb.SACH.Add(book);
                tg.SACH.Add(book);
                tl.SACH.Add(book);
                db.SACH.Add(book);
                db.SaveChanges();
            }
        }
        public static void update(SACH book)
        {
            int MS = Convert.ToInt32(book.MA_SACH);
            using (var db = new booksEntities())
            {
                SACH sach = db.SACH.Where(x => x.MA_SACH == MS).Select(x => x).FirstOrDefault();
                if(sach != null)
                {
                    sach.TEN_SACH = book.TEN_SACH;
                    sach.NOI_DUNG = book.NOI_DUNG;
                    sach.GIA = book.GIA;
                }
            }
        }
        public static SACH getBook(string id)
        {
            using (var db = new booksEntities())
            {
                int MA_SACH = Convert.ToInt32(id);
                SACH sach = db.SACH.Where(x => x.MA_SACH == MA_SACH).Select(x => x).FirstOrDefault();
                if (sach != null)
                    return sach;
                return null;
            }
        }
    }
}
