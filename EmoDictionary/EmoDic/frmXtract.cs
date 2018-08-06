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
        List<float> TermValues;
        private List<float> G = new List<float>();
        private List<float> N;
        private List<float> P;
        private List<CamXuc> noidung;
        private List<CamXuc> tongquat;
        private List<CamXuc> tacgia;
        private List<CamXuc> trinhbay;
        private List<CamXuc> chatluong;
        private string tong_quat ="Sách";
        public frmXtract()
        {
            InitializeComponent();
        }

        private void Xtract_Load(object sender, EventArgs e)
        {

        }

        private void createVector(List<float> TermValue)
        {
            N = new List<float>();
            P = new List<float>();
            G = new List<float>();
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

        private double cosin(List<float> X)
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
            lbrs.Text = "Tổng quát :";
            for (int index = 0; index < tongquat.Count; index++)
            {
                CamXuc tu = tongquat[index];
                lbrs.Text += tu.tu + ": " + tu.trongso + " | ";
            }
            lbrs.Text += "\nNội dung : ";
            for (int index = 0; index < noidung.Count; index++)
            {
                CamXuc tu = noidung[index];
                lbrs.Text += tu.tu + ": " + tu.trongso + " | ";
            }
            lbrs.Text += "\nTác giả: ";
            for (int index = 0; index < tacgia.Count; index++)
            {
                CamXuc tu = tacgia[index];
                lbrs.Text += tu.tu + ": " + tu.trongso + " | ";
            }
            lbrs.Text += "\nChất lượng : ";
            for (int index = 0; index < chatluong.Count; index++)
            {
                CamXuc tu = chatluong[index];
                lbrs.Text += tu.tu + ": " + tu.trongso + " | ";
            }
            lbrs.Text += "\nTrình bày : ";
            for (int index = 0; index < trinhbay.Count; index++)
            {
                CamXuc tu = trinhbay[index];
                lbrs.Text += tu.tu + ": " + tu.trongso + " | ";
            }
            lbTongQuat.Text = "";
            for(int index =0 ;index < Terms.Count;index ++ )
                lbTongQuat.Text += Terms[index] + ": " + TermValues[index] + " | ";

            createVector(TermValues);
            cal();
        }

        private void Xtract()
        {
            noidung = new List<CamXuc>();
            tacgia = new List<CamXuc>();
            chatluong = new List<CamXuc>();
            tongquat = new List<CamXuc>();
            trinhbay = new List<CamXuc>();
            string[] sentences_Separators = { ".", "!", "?", "...", "\n" };
            string[] phrases_Separators = { ",", ";","và", "với", "thì","mà","hoặc","nhưng","vì","tuy","vậy"};
            string[] sentences = txtA.Text.Split(sentences_Separators, StringSplitOptions.RemoveEmptyEntries);
            string[] words;
            string[] pharses;
            Terms = new List<string>();
            TermValues = new List<float>();
            if (Program.KetNoi() == 0) return;
            foreach (String sentence in sentences)
            {
                pharses = sentence.Split(phrases_Separators, StringSplitOptions.RemoveEmptyEntries);
                List<string> temp = new List<string>(); // list tạm chứa ~ đặc trưng cảm xúc.
                string Term = "";
                int ret = 0;
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
                        ret = findTerm(Term);
                        if (ret != 0) // nếu có trong database
                        {
                            if (ret == 1)  // là đặc trưng cảm xúc
                            {
                                temp.Add(Term.Trim());
                            }
                            else // la ngữ nghĩa (ret == 2)
                            {
                                temp2.Add(Term);
                                if (temp.Count != 0 && isStart)
                                {
                                        getWeightWONguNghia(temp);
                                        temp = new List<string>();
                                    
                                }
                            }
                            if (start == 0) // khong con de rut trich
                                isStop = true;
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
                            Terms.Add(t.Trim());
                        }
                        temp = new List<string>();
                        temp2 = new List<string>();
                    }

                }
                getWeightWONguNghia(temp);
                
            }
        }
        public void getWeightWONguNghia(List<String> CamXuc)
        {
            foreach (string t in CamXuc)
            {
                // lấy trọng số của các từ cảm xúc của ngữ nghĩa vừa tìm được
                TermValues.Add(getWeight(tong_quat, t));
                // thêm từ cảm xúc vào mảng các cụm từ
                Terms.Add(t.Trim());
            }
        }


        private int findTerm(string Term)
        {
            SqlDataReader myReader;
            string strLenh = "exec dbo.SP_TimKiem N'" + Term + "'";
            myReader = Program.ExecSqlDataReader(strLenh);
            myReader.Read();
            int ret = myReader.GetInt32(0);
            myReader.Close();
            return ret;
        }

        private float getWeight(string nguNghia,string camxuc)
        {
            SqlDataReader myReader = null;
            string strLenh = "exec dbo.SP_LayTrongSo N'" + nguNghia + "',N'" + camxuc + "'";
            SqlCommand sqlcmd = new SqlCommand(strLenh, Program.conn);
            sqlcmd.CommandType = CommandType.Text;
            if (Program.conn.State == ConnectionState.Closed)
                Program.conn.Open();
            try
            {
                    myReader = sqlcmd.ExecuteReader();
                    myReader.Read();
                    float weight = (float)myReader.GetDouble(0);
                    string khiacanh = myReader.GetString(1);
                    addKhiaCanh(khiacanh, camxuc,weight);
                    myReader.Close();
                    return weight;
            }
            catch(Exception ex)
            {
                myReader.Close();
                return -999;
            }
        }

        private void addKhiaCanh(string khiacanh,string cx,float trongso)
        {
            switch (khiacanh)
            {
                case "Nội dung":
                    noidung.Add(new CamXuc(cx,trongso));
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
