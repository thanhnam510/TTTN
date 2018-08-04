using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookStore.Models
{
    public class XtractModule
    {
        List<string> Terms;
        List<int> TermValues;
        private List<int> G = new List<int>();
        private List<int> N;
        private List<int> P;
        private string tong_quat = "Sách";

        private void Xtract_Load(object sender, EventArgs e)
        {

        }

        private void createVector()
        {
            N = new List<int>();
            P = new List<int>();
            G = new List<int>();
            foreach (int value in TermValues)
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

        private double cosin(List<int> X)
        {
            double cosin;
            double sumPowX = 0; //numeratorX
            double sumPowG = 0;
            double denominator = 0;
            for (int i = 0; i < G.Count; i++)
            {
                sumPowX += (int)Math.Pow(X[i], 2);
                sumPowG += (int)Math.Pow(G[i], 2);
            }
            denominator = Math.Sqrt(sumPowX) * Math.Sqrt(sumPowG);
            cosin = denominator == 0 ? 0 : (sumPowX / denominator);
            return cosin;
        }


        public void Xtract(string vanBan)
        {
            string[] sentences_Separators = { ".", "!", "?", "...", "\n" };
            string[] phrases_Separators = { ",", ";", "và", "với", "thì","nhưng"};
            string[] sentences = vanBan.Split(sentences_Separators, StringSplitOptions.RemoveEmptyEntries);
            string[] words;
            string[] pharses;
            Terms = new List<string>();
            TermValues = new List<int>();
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
                        string NN = temp2[temp2.Count - 1];
                        Terms.Add(NN);
                        TermValues.Add(-999);
                        foreach (string t in temp)
                        {
                            // lấy trọng số của các từ cảm xúc của ngữ nghĩa vừa tìm được
                            TermValues.Add(getWeight(NN, t));
                            // thêm từ cảm xúc vào mảng các cụm từ
                            Terms.Add(t);
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

        private int getWeight(string nguNghia, string camxuc)
        {
            
            int weight;
            try
            {
                using (var db = new Emo_DictionaryEntities())
                {

                    weight = db.SP_LayTrongSo(nguNghia, camxuc).FirstOrDefault().Value;
                    return weight;
                }
            }
            catch
            {
                return -999;
            }
        }

    }
}
