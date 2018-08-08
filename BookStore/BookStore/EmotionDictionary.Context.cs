﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class Emo_DictionaryEntities : DbContext
    {
        public Emo_DictionaryEntities()
            : base("name=Emo_DictionaryEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<DAC_TRUNG_CAM_XUC> DAC_TRUNG_CAM_XUC { get; set; }
        public virtual DbSet<DAC_TRUNG_NGU_NGHIA> DAC_TRUNG_NGU_NGHIA { get; set; }
        public virtual DbSet<TRONG_SO> TRONG_SO { get; set; }
   
    
        public virtual ObjectResult<Nullable<int>> SP_TimKiem(string term)
        {
            var termParameter = term != null ?
                new ObjectParameter("Term", term) :
                new ObjectParameter("Term", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<int>>("SP_TimKiem", termParameter);
        }
    
        public virtual ObjectResult<SP_LayTrongSo1_Result> SP_LayTrongSo(string thuc_the_y_nghia, string thuc_the_cam_xuc)
        {
            var thuc_the_y_nghiaParameter = thuc_the_y_nghia != null ?
                new ObjectParameter("Thuc_the_y_nghia", thuc_the_y_nghia) :
                new ObjectParameter("Thuc_the_y_nghia", typeof(string));
    
            var thuc_the_cam_xucParameter = thuc_the_cam_xuc != null ?
                new ObjectParameter("Thuc_the_cam_xuc", thuc_the_cam_xuc) :
                new ObjectParameter("Thuc_the_cam_xuc", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<SP_LayTrongSo1_Result>("SP_LayTrongSo1", thuc_the_y_nghiaParameter, thuc_the_cam_xucParameter);
        }
    }
}
