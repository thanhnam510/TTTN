using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmoDic
{
    class DuLieuChuanHoa
    {
        public double TQ { get; set; }
        public double ND { get; set; }
        public double TG { get; set; }
        public double CL { get; set; }
        public double TB { get; set; }
        static DuLieuChuanHoa PCentroid = new DuLieuChuanHoa(0.5948,1.0086,0.1724,0.181,0.1296);
        static DuLieuChuanHoa NCentroid = new DuLieuChuanHoa(-0.4091,-0.4886,-0.2727,-0.0909,-0.0568);
        static DuLieuChuanHoa NeuCentroid = new DuLieuChuanHoa(-0.02,-0.08,-0.08,0.08,0.1);

        public DuLieuChuanHoa(double tQ, double nD, double tG, double cL, double tB)
        {
            TQ = tQ;
            ND = nD;
            TG = tG;
            CL = cL;
            TB = tB;
        }
        public DuLieuChuanHoa()
        {

        }
        public DuLieuChuanHoa(List<CamXuc> tQ, List<CamXuc> nD, List<CamXuc> tG, List<CamXuc> cL, List<CamXuc> tB)
        {
            TQ = getPresentValue(tQ);
            ND = getPresentValue(nD);
            TG = getPresentValue(tG);
            CL = getPresentValue(cL);
            TB = getPresentValue(tB);
        }
        public float getPresentValue(List<CamXuc> khiacanh)
        {
            if (khiacanh.Count == 0)
                return 0;
            if (khiacanh.Count == 1)
                return khiacanh[0].trongso;
            List<float> tieucuc = new List<float>();
            List<float> tichcuc = new List<float>();
            foreach (CamXuc cx in khiacanh)
            {
                if (cx.trongso < 0)
                    tieucuc.Add(cx.trongso);
                else
                    tichcuc.Add(cx.trongso);
            }
            int NCount = tieucuc.Count;
            int PCount = tichcuc.Count;
            if (tieucuc.Count == 0)
                return tichcuc.Max();
            if (tichcuc.Count == 0)
                return tieucuc.Min();
                for (int i = 0; i < PCount || i < NCount; i++)
                {
                float result = tichcuc[PCount - i] + tieucuc[i];
                if (result != 0)
                    return result;
                }
            int a = PCount - NCount;
            if (a == 0) return 0;
            return a<0? tieucuc[PCount] : tichcuc[PCount - a];
            

        }
        public void sort(List<float> vector)
        {
            for(int i =0;i<vector.Count-1;i++)
            {
                float max = vector[i];
                for (int j=1; j < vector.Count; j++)
                {
                    if (vector[j] > max)
                    {
                        float temp = vector[j];
                        vector[j] = max;
                        vector[i] = temp;
                    }
                }
            }
        }

        public string evaluate()
        {
            string result = "tích cực";
            double distanceP = euclideanDistance(this, PCentroid);
            double min = distanceP;
            double distanceN = euclideanDistance(this, NCentroid);
            if (distanceN < min) {
                min = distanceN;
                result = "tiêu cực";
            }
            double distanceNeu = euclideanDistance(this, NeuCentroid);
            if (distanceNeu < min) {
                result = "trung lập";
                min = distanceNeu;
            }
            return result;
        }

        public double euclideanDistance(DuLieuChuanHoa data,DuLieuChuanHoa centroid)
        {
            double distance = 0;
            distance += Math.Pow(data.TQ - centroid.TQ, 2);
            distance += Math.Pow(data.ND - centroid.ND, 2);
            distance += Math.Pow(data.TG - centroid.TG, 2);
            distance += Math.Pow(data.CL - centroid.CL, 2);
            distance += Math.Pow(data.TB - centroid.TB, 2);
            distance = Math.Sqrt(distance);
            return distance;
        }

    }
}
