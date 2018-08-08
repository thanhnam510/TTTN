using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookStore.Models
{
    public class XtractModule
    {
        List<string> Terms;
        List<float> TermValues;
        private List<float> G = new List<float>();
        private List<float> N;
        private List<float> P;
        private List<CamXuc> noidung;
        private List<CamXuc> tongquat;
        private List<CamXuc> tacgia;
        private List<CamXuc> trinhbay;
        private List<CamXuc> chatluong;
        private string tong_quat = "Sách";

        private void Xtract_Load(object sender, EventArgs e)
        {

        }

        private void createVector()
        {
            N = new List<float>();
            P = new List<float>();
            G = new List<float>();
            foreach (float value in TermValues)
            {
                if (value == 0)
                {
                    N.Add(value);
                    P.Add(value);
                    G.Add(value);
                    continue;
                }
                if (value > 0)
                {
                    N.Add(0);
                    P.Add(value);
                    G.Add(value);
                }
                else
                {
                    if (value == -999)
                        continue;
                    N.Add(value);
                    P.Add(0);
                    G.Add(value);
                }
            }
        }
        private string cal()
        {
            if (G.Count == 0)
                return "trung lập";
            double cosinNG = Math.Round(cosin(N), 3);
            double cosinPG = Math.Round(cosin(P), 3);
            double kq = cosinPG - cosinNG;
            if (kq == 0)
            {
                return "trung lập";
            }
            else
            {
                return kq > 0 ? "tích cực" : "tiêu cực";
            }
        }

        private double cosin(List<float> X)
        {
            double cosin;
            double sumPowX = 0; //numeratorX
            double sumPowG = 0;
            double denominator = 0;
            for (int i = 0; i < G.Count; i++)
            {
                sumPowX += Math.Pow(X[i], 2);
                sumPowG += Math.Pow(G[i], 2);
            }
            denominator = Math.Sqrt(sumPowX) * Math.Sqrt(sumPowG);
            cosin = denominator == 0 ? 0 : (sumPowX / denominator);
            return cosin;
        }


        public void Xtract(string vanBan)
        {
            noidung = new List<CamXuc>();
            tacgia = new List<CamXuc>();
            chatluong = new List<CamXuc>();
            tongquat = new List<CamXuc>();
            trinhbay = new List<CamXuc>();
            string[] sentences_Separators = { ".", "!", "?", "...", "\n" };
            string[] phrases_Separators = { ",", ";", "và", "với", "mà", "hoặc", "nhưng", "vì", "tuy", "vậy" };
            string[] sentences = vanBan.Split(sentences_Separators, StringSplitOptions.RemoveEmptyEntries);
            string[] words;
            string[] pharses;
            Terms = new List<string>();
            TermValues = new List<float>();
            foreach (String sentence in sentences)
            {
                pharses = sentence.Split(phrases_Separators, StringSplitOptions.RemoveEmptyEntries);
                List<string> temp = new List<string>(); // list tạm chứa ~ đặc trưng cảm xúc.
                string Term = "";

                List<string> temp2 = new List<string>();
                // do là rút trích từ phải qua nên phải bắt đầu từ phải qua để không bỏ sót vị ngữ
                // vd: Nội dung rất hay, thú vị
                for (int index = pharses.Length - 1; index >= 0; index--)
                {
                    bool isStart = true;
                    words = pharses[index].Split(' ');
                    int start = 0;
                    int stop = words.Length;
                    bool isStop = false;
                    while (isStop == false && stop >= 0)
                    {
                        Term = "";
                        for (int i = start; i < stop; i++)
                            Term += words[i] + " ";
                        Term = Term.Trim();
                        int ret = findTerm(Term);
                        if (ret != 0) // nếu có trong database
                        {
                            if (ret == 1)  // là đặc trưng cảm xúc
                            {
                                temp.Add(Term.Trim());
                            }
                            else // la ngữ nghĩa (ret > 2)
                            {
                                if (ret == 3)
                                {
                                    Term = "Tác giả";
                                }
                                temp2.Add(Term);
                                if (temp.Count != 0 && isStart)
                                {
                                    getWeightWithOutNguNghia(temp);
                                    temp = new List<string>();

                                }
                            }
                            if (start == 0) // khong con de rut trich
                            {
                                isStop = true;
                            }
                            else // gan lai start va stop, tiep tuc rut trich
                            {
                                stop = start;
                                start = 0;
                            }
                            isStart = false;
                        }
                        else // neu tu khong co trong tu dien
                        {
                            if (start == stop)
                            {
                                stop--;
                                start = 0;
                            }
                            else
                                start++;
                        }

                    }
                    if (temp.Count != 0 && temp2.Count != 0)
                    {
                        for (int i = temp2.Count - 1; i >= 0; i--)
                        {
                            string NN = temp2[i];
                            int j = 0;
                            while (temp.Count != 0 && j < temp.Count)
                            {

                                string t = temp[j];
                                float ts = getWeight(NN, t);
                                if (ts == -999)
                                {
                                    j++;
                                    continue;
                                }
                                // lấy trọng số của các từ cảm xúc của ngữ nghĩa vừa tìm được
                                TermValues.Add(ts);
                                // thêm từ cảm xúc vào mảng các cụm từ
                                Terms.Add(t.Trim());
                                temp.RemoveAt(j);
                                j = 0;
                                Terms.Add(NN);
                                TermValues.Add(-999);
                            }
                        }
                        temp = new List<string>();
                        temp2 = new List<string>();
                    }
                }
                getWeightWithOutNguNghia(temp);

            }
        }
        

        public void getWeightWithNguNghia(String NN, List<String> CamXucs)
        {
            foreach (string t in CamXucs)
            {
                // lấy trọng số của các từ cảm xúc của ngữ nghĩa vừa tìm được
                TermValues.Add(getWeight(NN, t));
                // thêm từ cảm xúc vào mảng các cụm từ
                Terms.Add(t.Trim());
            }
        }

        public void getWeightWithOutNguNghia(List<String> CamXucs)
        {
            foreach (string t in CamXucs)
            {
                // lấy trọng số của các từ cảm xúc của ngữ nghĩa vừa tìm được
                TermValues.Add(getWeight(tong_quat, t));
                // thêm từ cảm xúc vào mảng các cụm từ
                Terms.Add(t.Trim());
            }
        }


        public string getEvaluate(string vanBan)
        {
            Xtract(vanBan);
            createVector();
            return cal();
        }

        private int findTerm(string Term)
        {
            int result = 0;
            using (var db = new Emo_DictionaryEntities())
            {
                result = db.SP_TimKiem(Term).FirstOrDefault().Value;
                if (result == 0) {
                    using (var db1 = new booksEntities())
                    {
                        var query = db1.TAC_GIA.Where(tg => tg.TEN_TAC_GIA == Term).ToList();
                        if (query.Count != 0)
                            result = 3;
                    }
                }

            }
            return result;
        }

        private float getWeight(string nguNghia, string camxuc)
        {
            
            try
            {
                using (var db = new Emo_DictionaryEntities())
                {
                    var a = db.SP_LayTrongSo(nguNghia, camxuc).FirstOrDefault();
                    string khiacanh = a.KHIA_CANH;
                    float weight;
                    weight = (float)a.TRONG_SO;
                    addKhiaCanh(khiacanh, camxuc, weight);
                    return weight;
                }
            }
            catch (Exception ex)
            {
                return -999;
            }
        }

        private void addKhiaCanh(string khiacanh, string cx, float trongso)
        {
            switch (khiacanh)
            {
                case "Nội dung":
                    noidung.Add(new CamXuc(cx, trongso));
                    break;
                case "Tác giả":
                    tacgia.Add(new CamXuc(cx, trongso));
                    break;
                case "Chất lượng":
                    chatluong.Add(new CamXuc(cx, trongso));
                    break;
                case "Tổng quát":
                    tongquat.Add(new CamXuc(cx, trongso));
                    break;
                case "Trình bày":
                    trinhbay.Add(new CamXuc(cx, trongso));
                    break;
                default:
                    break;
            }
        }
    }

    }

