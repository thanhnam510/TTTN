//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BookStore
{
    using System;
    using System.Collections.Generic;
    
    public partial class SACH
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SACH()
        {
            this.Y_KIEN = new HashSet<Y_KIEN>();
            this.NHA_XUAT_BAN = new HashSet<NHA_XUAT_BAN>();
            this.TAC_GIA = new HashSet<TAC_GIA>();
            this.THE_LOAI = new HashSet<THE_LOAI>();
        }
    
        public int MA_SACH { get; set; }
        public string TEN_SACH { get; set; }
        public string NOI_DUNG { get; set; }
        public string ANH { get; set; }
        public string GIA { get; set; }
        public System.DateTime NGAY_BAN { get; set; }
        public Nullable<int> DANH_GIA_TOT { get; set; }
        public Nullable<int> TONG_DANH_GIA { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Y_KIEN> Y_KIEN { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NHA_XUAT_BAN> NHA_XUAT_BAN { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TAC_GIA> TAC_GIA { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<THE_LOAI> THE_LOAI { get; set; }
    }
}
