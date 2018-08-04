using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BookStore.Models;

namespace BookStore.Areas.AdminManager.Models
{
    public class BookContext
    {
        public static List<SACH> getAllBooks()
        {
            using (var db = new booksEntities())
            {
                var query = from sach in db.SACH select sach;
                return query.OrderByDescending(x => x.NGAY_BAN).ToList<SACH>();
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
        public static void addBook(SACH book,List<string> matheloai,List<string> TACGIA,string maNXB) {
            book.NGAY_BAN = System.DateTime.Now;
            using (var db = new booksEntities())
            {
                foreach(string mtl in matheloai) { 
                THE_LOAI tl = db.THE_LOAI.Where(theloai => theloai.MA_THE_LOAI == mtl).Select(theloai => theloai).FirstOrDefault();
                    tl.SACH.Add(book);
                }
                NHA_XUAT_BAN nxb = db.NHA_XUAT_BAN.Where(nxban => nxban.MA_NXB == maNXB).Select(nxban => nxban).FirstOrDefault();
                nxb.SACH.Add(book);

                foreach (string tacgia in TACGIA) { 
                TAC_GIA tg = db.TAC_GIA.Where(au => au.TEN_TAC_GIA.Contains(tacgia.Trim())).Select(tgia=>tgia).FirstOrDefault();
                    if (tg == null)
                    {
                        addAuthor(tacgia.Trim());
                        tg = db.TAC_GIA.Where(au => au.TEN_TAC_GIA.Contains(tacgia.Trim())).Select(tgia => tgia).FirstOrDefault();
                    }
                    tg.SACH.Add(book);
                }
                book.DANH_GIA_TOT = book.TONG_DANH_GIA = 0;
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
        public static SACH getBookbyMS(int MS)
        {
            using (var db = new booksEntities())
            {
                var sach = db.SACH.Where(x => x.MA_SACH == MS).Select(x => x).FirstOrDefault();
                var sachtacgia = db.SACH.Include("TAC_GIA");
                var sachtheloai = db.SACH.Include("THE_LOAI");
                var sachnxb = db.SACH.Include("NHA_XUAT_BAN");
                if (sach != null)
                    return sach;
                return null;
            }
        }

        public static void UpdateBook(BookDetails bookdetails)
        {
            if (bookdetails == null) return;
            using (var db = new booksEntities())
            {
                for(int index =0;index<bookdetails.tg.Count;index++)
                {
                    TAC_GIA tacgia = bookdetails.tg[index];
                    bookdetails.tg[index] = db.TAC_GIA.Where(x => x.TEN_TAC_GIA == tacgia.TEN_TAC_GIA).FirstOrDefault();
                    if (bookdetails.tg[index] == null)
                    {
                        addAuthor(tacgia.TEN_TAC_GIA.Trim());
                        bookdetails.tg[index] = db.TAC_GIA.Where(au => au.TEN_TAC_GIA.Contains(tacgia.TEN_TAC_GIA.Trim())).Select(tgia => tgia).FirstOrDefault();
                    }
                }
                for (int index = 0; index < bookdetails.tl.Count; index++)
                {
                    THE_LOAI theloai = bookdetails.tl[index];
                    theloai = db.THE_LOAI.Where(x => x.MA_THE_LOAI == theloai.MA_THE_LOAI).FirstOrDefault();
                    bookdetails.tl[index] = theloai;
                }
                string manxb = bookdetails.nxb.MA_NXB;
                bookdetails.nxb = db.NHA_XUAT_BAN.Where(x => x.MA_NXB == manxb).FirstOrDefault();
                var query = db.SACH.Where(x => x.MA_SACH == bookdetails.sach.MA_SACH).Select(x => x).FirstOrDefault();
                var bookAuthor = db.SACH.Include("TAC_GIA");
                var bookCate = db.SACH.Include("THE_LOAI");
                if (query != null)
                {
                    query.TEN_SACH = bookdetails.sach.TEN_SACH;
                    query.NOI_DUNG = bookdetails.sach.NOI_DUNG;
                    query.GIA = bookdetails.sach.GIA;
                    if(bookdetails.sach.ANH != null)
                        query.ANH = bookdetails.sach.ANH;
                    if (query.TAC_GIA != bookdetails.tg)
                    {
                        foreach (TAC_GIA au in query.TAC_GIA)
                            au.SACH.Remove(query);
                        foreach (TAC_GIA au in bookdetails.tg)
                            au.SACH.Add(query);
                    }
                    if(query.THE_LOAI!= bookdetails.tl)
                    {
                        foreach (THE_LOAI cate in query.THE_LOAI)
                            cate.SACH.Remove(query);
                        foreach (THE_LOAI cate in bookdetails.tl)
                            cate.SACH.Add(query);
                    }
                    db.SaveChanges();
                }
            }
        }
    }
}
