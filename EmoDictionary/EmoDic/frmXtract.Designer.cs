namespace EmoDic
{
    partial class frmXtract
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.txtA = new System.Windows.Forms.TextBox();
            this.btnStart = new DevExpress.XtraEditors.SimpleButton();
            this.lbrs = new System.Windows.Forms.Label();
            this.lbrs2 = new System.Windows.Forms.Label();
            this.lbTongQuat = new System.Windows.Forms.Label();
            this.mcBtn = new DevExpress.XtraEditors.SimpleButton();
            this.label1 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // txtA
            // 
            this.txtA.Location = new System.Drawing.Point(28, 12);
            this.txtA.Multiline = true;
            this.txtA.Name = "txtA";
            this.txtA.Size = new System.Drawing.Size(624, 121);
            this.txtA.TabIndex = 0;
            // 
            // btnStart
            // 
            this.btnStart.Location = new System.Drawing.Point(173, 159);
            this.btnStart.Name = "btnStart";
            this.btnStart.Size = new System.Drawing.Size(121, 31);
            this.btnStart.TabIndex = 1;
            this.btnStart.Text = "Extract";
            this.btnStart.Click += new System.EventHandler(this.btnStart_Click);
            // 
            // lbrs
            // 
            this.lbrs.AutoSize = true;
            this.lbrs.Font = new System.Drawing.Font("Times New Roman", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.lbrs.Location = new System.Drawing.Point(12, 258);
            this.lbrs.Name = "lbrs";
            this.lbrs.Size = new System.Drawing.Size(33, 17);
            this.lbrs.TabIndex = 2;
            this.lbrs.Text = "1111";
            // 
            // lbrs2
            // 
            this.lbrs2.AutoSize = true;
            this.lbrs2.Font = new System.Drawing.Font("Times New Roman", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.lbrs2.Location = new System.Drawing.Point(12, 193);
            this.lbrs2.Name = "lbrs2";
            this.lbrs2.Size = new System.Drawing.Size(27, 17);
            this.lbrs2.TabIndex = 3;
            this.lbrs2.Text = "111";
            // 
            // lbTongQuat
            // 
            this.lbTongQuat.AutoSize = true;
            this.lbTongQuat.Font = new System.Drawing.Font("Times New Roman", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.lbTongQuat.Location = new System.Drawing.Point(12, 224);
            this.lbTongQuat.Name = "lbTongQuat";
            this.lbTongQuat.Size = new System.Drawing.Size(0, 17);
            this.lbTongQuat.TabIndex = 4;
            // 
            // mcBtn
            // 
            this.mcBtn.Location = new System.Drawing.Point(365, 159);
            this.mcBtn.Name = "mcBtn";
            this.mcBtn.Size = new System.Drawing.Size(121, 31);
            this.mcBtn.TabIndex = 5;
            this.mcBtn.Text = "Machine Learning";
            this.mcBtn.Click += new System.EventHandler(this.mcBtn_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 11.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(163)));
            this.label1.Location = new System.Drawing.Point(12, 392);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(39, 17);
            this.label1.TabIndex = 6;
            this.label1.Text = "11111";
            // 
            // frmXtract
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(720, 445);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.mcBtn);
            this.Controls.Add(this.lbTongQuat);
            this.Controls.Add(this.lbrs2);
            this.Controls.Add(this.lbrs);
            this.Controls.Add(this.btnStart);
            this.Controls.Add(this.txtA);
            this.Name = "frmXtract";
            this.Text = "Rút trích văn bản";
            this.Load += new System.EventHandler(this.Xtract_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtA;
        private DevExpress.XtraEditors.SimpleButton btnStart;
        private System.Windows.Forms.Label lbrs;
        private System.Windows.Forms.Label lbrs2;
        private System.Windows.Forms.Label lbTongQuat;
        private DevExpress.XtraEditors.SimpleButton mcBtn;
        private System.Windows.Forms.Label label1;
    }
}

