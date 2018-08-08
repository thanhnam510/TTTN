using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookStore.Models
{
    public class CamXuc
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