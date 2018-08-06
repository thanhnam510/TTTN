using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmoDic
{
    class CamXuc
    {
        public string tu { get; set; }
        public float trongso { get; set; }

        public CamXuc(string tu, float trongso)
        {
            this.tu = tu;
            this.trongso = trongso;
        }
    }
}
