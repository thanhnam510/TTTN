using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace EmoDic
{
    public partial class frmXtract : Form
    {
        List<string> Terms;
        List<int> TermValues;
        private List<int> G = new List<int>();
        private List<int> N;
        private List<int> P;
        public frmXtract()
        {
            InitializeComponent();
        }

        private void Xtract_Load(object sender, EventArgs e)
        {

        }

        private void createVector(List<int> TermValue)
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
        private void cal()
        {
            double cosinNG = Math.Round(cosin(N), 3);
            double cosinPG = Math.Round(cosin(P), 3);
            double kq = cosinPG - cosinNG;
            if (kq == 0)
            {
                lbrs2.Text = "Ý kiến trung lập";
            }
            else
            {
                if (kq > 0)
                {
                    lbrs2.Text = "Ý kiến tích cực";
                }
                else
                {
                    lbrs2.Text = "Ý kiến tiêu cực";
                }
            }


            lbrs.Text += "\ncosin(N,G)=" + cosinNG + "\nconsin(P,G)=" + cosinPG;
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


        private void btnStart_Click(object sender, EventArgs e)
        {
            lbrs.Text = "";
            Xtract();
            for (int index = 0; index < Terms.Count; index++)
            {
                lbrs.Text += Terms[index] + ": " + TermValues[index] + " | ";
            }
            createVector(TermValues);
            cal();
        }

        private void Xtract()
        {
            string[] sentences_Separators = { ".", "!", "?" };
            string[] phrases_Separators = { ",", ";" };
            string[] sentences = txtA.Text.Split(sentences_Separators, StringSplitOptions.RemoveEmptyEntries);
            string[] words;
            string[] pharses;
            Terms = new List<string>();
            TermValues = new List<int>();
            if (Program.KetNoi() == 0) return;
            foreach (String sentence in sentences)
            {
                pharses = sentence.Split(phrases_Separators, StringSplitOptions.RemoveEmptyEntries);
                foreach (string pharse in pharses)
                {
                    words = pharse.Split(' ');
                    int start = 0;
                    int stop = words.Length;
                    bool isStop = false;
                    string Term = "";
                    List<string> temp = new List<string>();
                    while (isStop == false && stop >= 0)
                    {
                        Term = "";
                        for (int i = start; i < stop; i++)
                            Term += words[i] + " ";
                        int ret = findTerm(Term);
                        if (ret != 0) // neu tu co trong tu dien
                        {
                            if (ret == 1)  // la tu cam xuc
                            {
                                temp.Add(Term.Trim());
                            }
                            else // la ngu nghia (ret == 2)
                            {
                                foreach (string t in temp) // ket thuc 1 cau truc cau
                                {
                                    TermValues.Add(getWeight(Term.Trim(), t));
                                    Terms.Add(t.Trim());
                                }
                                Terms.Add(Term.Trim());
                                TermValues.Add(-999);
                                temp = new List<string>();
                            }
                            if (start == 0) // khong con de rut trich
                                isStop = true;
                            else // gan lai start va stop, tiep tuc rut trich
                            {
                                stop = start;
                                start = 0;
                            }
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
                }
            }
                }

        private int findTerm(string Term)
        {
            SqlDataReader myReader;
            string strLenh = "exec dbo.SP_TimKiem N'" + Term.Trim() + "'";
            myReader = Program.ExecSqlDataReader(strLenh);
            myReader.Read();
            int ret = myReader.GetInt32(0);
            myReader.Close();
            return ret;
        }

        private int getWeight(string nguNghia,string camxuc)
        {
            SqlDataReader myReader;
            string strLenh = "exec dbo.SP_LayTrongSo N'" + nguNghia + "',N'" + camxuc + "'";
            myReader = Program.ExecSqlDataReader(strLenh);
            myReader.Read();
            int weight = myReader.GetInt32(0);
            myReader.Close();
            return weight;
        }

    }
}
