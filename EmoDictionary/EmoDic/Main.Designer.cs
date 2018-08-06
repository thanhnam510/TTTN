namespace EmoDic
{
    partial class Main
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
            this.components = new System.ComponentModel.Container();
            this.tHUC_THELabel = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnWatch = new System.Windows.Forms.Button();
            this.btnXtract = new System.Windows.Forms.Button();
            this.aft = new System.Windows.Forms.GroupBox();
            this.checkBox1 = new System.Windows.Forms.CheckBox();
            this.panel1 = new System.Windows.Forms.Panel();
            this.checkAllA = new System.Windows.Forms.CheckBox();
            this.a5 = new System.Windows.Forms.CheckBox();
            this.a4 = new System.Windows.Forms.CheckBox();
            this.a3 = new System.Windows.Forms.CheckBox();
            this.a2 = new System.Windows.Forms.CheckBox();
            this.a1 = new System.Windows.Forms.CheckBox();
            this.bf = new System.Windows.Forms.GroupBox();
            this.checkBox11 = new System.Windows.Forms.CheckBox();
            this.checkBox10 = new System.Windows.Forms.CheckBox();
            this.checkBox9 = new System.Windows.Forms.CheckBox();
            this.checkBox8 = new System.Windows.Forms.CheckBox();
            this.checkBox7 = new System.Windows.Forms.CheckBox();
            this.checkBox2 = new System.Windows.Forms.CheckBox();
            this.checkBox6 = new System.Windows.Forms.CheckBox();
            this.checkBox5 = new System.Windows.Forms.CheckBox();
            this.checkBox4 = new System.Windows.Forms.CheckBox();
            this.checkBox3 = new System.Windows.Forms.CheckBox();
            this.panel2 = new System.Windows.Forms.Panel();
            this.checkAllB = new System.Windows.Forms.CheckBox();
            this.b6 = new System.Windows.Forms.CheckBox();
            this.b5 = new System.Windows.Forms.CheckBox();
            this.b4 = new System.Windows.Forms.CheckBox();
            this.b3 = new System.Windows.Forms.CheckBox();
            this.b2 = new System.Windows.Forms.CheckBox();
            this.b1 = new System.Windows.Forms.CheckBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.label4 = new System.Windows.Forms.Label();
            this.cbKhiaCanh = new System.Windows.Forms.ComboBox();
            this.ttCb = new System.Windows.Forms.ComboBox();
            this.dtnnBS = new System.Windows.Forms.BindingSource(this.components);
            this.edDS = new EmoDic.Emo_DictionaryDataSet();
            this.btnThemWS = new System.Windows.Forms.Button();
            this.spnW = new DevExpress.XtraEditors.SpinEdit();
            this.label1 = new System.Windows.Forms.Label();
            this.btnThemWOS = new System.Windows.Forms.Button();
            this.alert = new System.Windows.Forms.Label();
            this.seed = new System.Windows.Forms.Label();
            this.txtSeed = new System.Windows.Forms.TextBox();
            this.btnThemTTYN = new System.Windows.Forms.Button();
            this.dtnnTA = new EmoDic.Emo_DictionaryDataSetTableAdapters.DAC_TRUNG_NGU_NGHIATableAdapter();
            this.tableAdapterManager = new EmoDic.Emo_DictionaryDataSetTableAdapters.TableAdapterManager();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.alert2lb = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txtMA = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtTTYN = new System.Windows.Forms.TextBox();
            this.checkBox12 = new System.Windows.Forms.CheckBox();
            this.checkBox13 = new System.Windows.Forms.CheckBox();
            this.checkBox14 = new System.Windows.Forms.CheckBox();
            this.checkBox15 = new System.Windows.Forms.CheckBox();
            this.checkBox16 = new System.Windows.Forms.CheckBox();
            this.checkBox17 = new System.Windows.Forms.CheckBox();
            this.groupBox1.SuspendLayout();
            this.aft.SuspendLayout();
            this.panel1.SuspendLayout();
            this.bf.SuspendLayout();
            this.panel2.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtnnBS)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.edDS)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.spnW.Properties)).BeginInit();
            this.groupBox3.SuspendLayout();
            this.SuspendLayout();
            // 
            // tHUC_THELabel
            // 
            this.tHUC_THELabel.AutoSize = true;
            this.tHUC_THELabel.Location = new System.Drawing.Point(34, 30);
            this.tHUC_THELabel.Name = "tHUC_THELabel";
            this.tHUC_THELabel.Size = new System.Drawing.Size(95, 13);
            this.tHUC_THELabel.TabIndex = 8;
            this.tHUC_THELabel.Text = "Thực thể ý nghĩa :";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btnWatch);
            this.groupBox1.Controls.Add(this.btnXtract);
            this.groupBox1.Controls.Add(this.aft);
            this.groupBox1.Controls.Add(this.bf);
            this.groupBox1.Dock = System.Windows.Forms.DockStyle.Top;
            this.groupBox1.Location = new System.Drawing.Point(0, 0);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(0);
            this.groupBox1.Size = new System.Drawing.Size(1011, 151);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            // 
            // btnWatch
            // 
            this.btnWatch.Location = new System.Drawing.Point(837, 44);
            this.btnWatch.Name = "btnWatch";
            this.btnWatch.Size = new System.Drawing.Size(111, 23);
            this.btnWatch.TabIndex = 2;
            this.btnWatch.Text = "Xem tử điển";
            this.btnWatch.UseVisualStyleBackColor = true;
            this.btnWatch.Click += new System.EventHandler(this.btnWatch_Click);
            // 
            // btnXtract
            // 
            this.btnXtract.Location = new System.Drawing.Point(837, 104);
            this.btnXtract.Name = "btnXtract";
            this.btnXtract.Size = new System.Drawing.Size(111, 23);
            this.btnXtract.TabIndex = 3;
            this.btnXtract.Text = "Rút trích";
            this.btnXtract.UseVisualStyleBackColor = true;
            this.btnXtract.Click += new System.EventHandler(this.btnXtract_Click);
            // 
            // aft
            // 
            this.aft.Controls.Add(this.checkBox1);
            this.aft.Controls.Add(this.panel1);
            this.aft.Controls.Add(this.a5);
            this.aft.Controls.Add(this.a4);
            this.aft.Controls.Add(this.a3);
            this.aft.Controls.Add(this.a2);
            this.aft.Controls.Add(this.a1);
            this.aft.Dock = System.Windows.Forms.DockStyle.Left;
            this.aft.Location = new System.Drawing.Point(593, 14);
            this.aft.Name = "aft";
            this.aft.Size = new System.Drawing.Size(223, 137);
            this.aft.TabIndex = 6;
            this.aft.TabStop = false;
            this.aft.Text = "Sau";
            // 
            // checkBox1
            // 
            this.checkBox1.AutoSize = true;
            this.checkBox1.Checked = true;
            this.checkBox1.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox1.Location = new System.Drawing.Point(93, 68);
            this.checkBox1.Name = "checkBox1";
            this.checkBox1.Size = new System.Drawing.Size(44, 17);
            this.checkBox1.TabIndex = 18;
            this.checkBox1.Tag = "1";
            this.checkBox1.Text = "quá";
            this.checkBox1.UseVisualStyleBackColor = true;
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
            this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel1.Controls.Add(this.checkAllA);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(3, 17);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(217, 23);
            this.panel1.TabIndex = 17;
            // 
            // checkAllA
            // 
            this.checkAllA.AutoSize = true;
            this.checkAllA.Location = new System.Drawing.Point(8, 3);
            this.checkAllA.Name = "checkAllA";
            this.checkAllA.Size = new System.Drawing.Size(82, 17);
            this.checkAllA.TabIndex = 0;
            this.checkAllA.Text = "Chọn tất cả";
            this.checkAllA.UseVisualStyleBackColor = true;
            // 
            // a5
            // 
            this.a5.AutoSize = true;
            this.a5.Checked = true;
            this.a5.CheckState = System.Windows.Forms.CheckState.Checked;
            this.a5.Location = new System.Drawing.Point(93, 46);
            this.a5.Name = "a5";
            this.a5.Size = new System.Drawing.Size(62, 17);
            this.a5.TabIndex = 16;
            this.a5.Tag = "2";
            this.a5.Text = "hết sảy";
            this.a5.UseVisualStyleBackColor = true;
            // 
            // a4
            // 
            this.a4.AutoSize = true;
            this.a4.Checked = true;
            this.a4.CheckState = System.Windows.Forms.CheckState.Checked;
            this.a4.Location = new System.Drawing.Point(11, 111);
            this.a4.Name = "a4";
            this.a4.Size = new System.Drawing.Size(61, 17);
            this.a4.TabIndex = 15;
            this.a4.Tag = "1";
            this.a4.Text = "lắm lắm";
            this.a4.UseVisualStyleBackColor = true;
            // 
            // a3
            // 
            this.a3.AutoSize = true;
            this.a3.Checked = true;
            this.a3.CheckState = System.Windows.Forms.CheckState.Checked;
            this.a3.Location = new System.Drawing.Point(11, 89);
            this.a3.Name = "a3";
            this.a3.Size = new System.Drawing.Size(62, 17);
            this.a3.TabIndex = 14;
            this.a3.Tag = "2";
            this.a3.Text = "hết sức";
            this.a3.UseVisualStyleBackColor = true;
            // 
            // a2
            // 
            this.a2.AutoSize = true;
            this.a2.Checked = true;
            this.a2.CheckState = System.Windows.Forms.CheckState.Checked;
            this.a2.Location = new System.Drawing.Point(12, 67);
            this.a2.Name = "a2";
            this.a2.Size = new System.Drawing.Size(57, 17);
            this.a2.TabIndex = 13;
            this.a2.Tag = "1";
            this.a2.Text = "cực kỳ";
            this.a2.UseVisualStyleBackColor = true;
            // 
            // a1
            // 
            this.a1.AutoSize = true;
            this.a1.Checked = true;
            this.a1.CheckState = System.Windows.Forms.CheckState.Checked;
            this.a1.Location = new System.Drawing.Point(12, 46);
            this.a1.Name = "a1";
            this.a1.Size = new System.Drawing.Size(43, 17);
            this.a1.TabIndex = 12;
            this.a1.Tag = "1";
            this.a1.Text = "cực";
            this.a1.UseVisualStyleBackColor = true;
            // 
            // bf
            // 
            this.bf.Controls.Add(this.checkBox17);
            this.bf.Controls.Add(this.checkBox16);
            this.bf.Controls.Add(this.checkBox15);
            this.bf.Controls.Add(this.checkBox14);
            this.bf.Controls.Add(this.checkBox13);
            this.bf.Controls.Add(this.checkBox12);
            this.bf.Controls.Add(this.checkBox11);
            this.bf.Controls.Add(this.checkBox10);
            this.bf.Controls.Add(this.checkBox9);
            this.bf.Controls.Add(this.checkBox8);
            this.bf.Controls.Add(this.checkBox7);
            this.bf.Controls.Add(this.checkBox2);
            this.bf.Controls.Add(this.checkBox6);
            this.bf.Controls.Add(this.checkBox5);
            this.bf.Controls.Add(this.checkBox4);
            this.bf.Controls.Add(this.checkBox3);
            this.bf.Controls.Add(this.panel2);
            this.bf.Controls.Add(this.b6);
            this.bf.Controls.Add(this.b5);
            this.bf.Controls.Add(this.b4);
            this.bf.Controls.Add(this.b3);
            this.bf.Controls.Add(this.b2);
            this.bf.Controls.Add(this.b1);
            this.bf.Dock = System.Windows.Forms.DockStyle.Left;
            this.bf.Location = new System.Drawing.Point(0, 14);
            this.bf.Name = "bf";
            this.bf.Size = new System.Drawing.Size(593, 137);
            this.bf.TabIndex = 5;
            this.bf.TabStop = false;
            this.bf.Text = "Trước";
            // 
            // checkBox11
            // 
            this.checkBox11.AutoSize = true;
            this.checkBox11.Checked = true;
            this.checkBox11.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox11.Location = new System.Drawing.Point(142, 43);
            this.checkBox11.Name = "checkBox11";
            this.checkBox11.Size = new System.Drawing.Size(76, 17);
            this.checkBox11.TabIndex = 28;
            this.checkBox11.Tag = "-0.5";
            this.checkBox11.Text = "không quá";
            this.checkBox11.UseVisualStyleBackColor = true;
            // 
            // checkBox10
            // 
            this.checkBox10.AutoSize = true;
            this.checkBox10.Checked = true;
            this.checkBox10.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox10.Location = new System.Drawing.Point(230, 110);
            this.checkBox10.Name = "checkBox10";
            this.checkBox10.Size = new System.Drawing.Size(64, 17);
            this.checkBox10.TabIndex = 27;
            this.checkBox10.Tag = "-1";
            this.checkBox10.Text = "cứ khen";
            this.checkBox10.UseVisualStyleBackColor = true;
            // 
            // checkBox9
            // 
            this.checkBox9.AutoSize = true;
            this.checkBox9.Checked = true;
            this.checkBox9.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox9.Location = new System.Drawing.Point(75, 110);
            this.checkBox9.Name = "checkBox9";
            this.checkBox9.Size = new System.Drawing.Size(54, 17);
            this.checkBox9.TabIndex = 26;
            this.checkBox9.Tag = "-0.25";
            this.checkBox9.Text = "khá là";
            this.checkBox9.UseVisualStyleBackColor = true;
            // 
            // checkBox8
            // 
            this.checkBox8.AutoSize = true;
            this.checkBox8.Checked = true;
            this.checkBox8.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox8.Location = new System.Drawing.Point(75, 66);
            this.checkBox8.Name = "checkBox8";
            this.checkBox8.Size = new System.Drawing.Size(45, 17);
            this.checkBox8.TabIndex = 25;
            this.checkBox8.Tag = "2";
            this.checkBox8.Text = "siêu";
            this.checkBox8.UseVisualStyleBackColor = true;
            // 
            // checkBox7
            // 
            this.checkBox7.AutoSize = true;
            this.checkBox7.Checked = true;
            this.checkBox7.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox7.Location = new System.Drawing.Point(231, 66);
            this.checkBox7.Name = "checkBox7";
            this.checkBox7.Size = new System.Drawing.Size(82, 17);
            this.checkBox7.TabIndex = 24;
            this.checkBox7.Tag = "-1";
            this.checkBox7.Text = "chẳng được";
            this.checkBox7.UseVisualStyleBackColor = true;
            // 
            // checkBox2
            // 
            this.checkBox2.AutoSize = true;
            this.checkBox2.Checked = true;
            this.checkBox2.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox2.Location = new System.Drawing.Point(142, 110);
            this.checkBox2.Name = "checkBox2";
            this.checkBox2.Size = new System.Drawing.Size(82, 17);
            this.checkBox2.TabIndex = 23;
            this.checkBox2.Tag = "-1";
            this.checkBox2.Text = "không được";
            this.checkBox2.UseVisualStyleBackColor = true;
            // 
            // checkBox6
            // 
            this.checkBox6.AutoSize = true;
            this.checkBox6.Checked = true;
            this.checkBox6.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox6.Location = new System.Drawing.Point(231, 89);
            this.checkBox6.Name = "checkBox6";
            this.checkBox6.Size = new System.Drawing.Size(55, 17);
            this.checkBox6.TabIndex = 22;
            this.checkBox6.Tag = "-1";
            this.checkBox6.Text = "chẳng";
            this.checkBox6.UseVisualStyleBackColor = true;
            // 
            // checkBox5
            // 
            this.checkBox5.AutoSize = true;
            this.checkBox5.Checked = true;
            this.checkBox5.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox5.Location = new System.Drawing.Point(231, 46);
            this.checkBox5.Name = "checkBox5";
            this.checkBox5.Size = new System.Drawing.Size(43, 17);
            this.checkBox5.TabIndex = 21;
            this.checkBox5.Tag = "-1";
            this.checkBox5.Text = "chả";
            this.checkBox5.UseVisualStyleBackColor = true;
            // 
            // checkBox4
            // 
            this.checkBox4.AutoSize = true;
            this.checkBox4.Checked = true;
            this.checkBox4.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox4.Location = new System.Drawing.Point(143, 89);
            this.checkBox4.Name = "checkBox4";
            this.checkBox4.Size = new System.Drawing.Size(55, 17);
            this.checkBox4.TabIndex = 20;
            this.checkBox4.Tag = "-1";
            this.checkBox4.Text = "không";
            this.checkBox4.UseVisualStyleBackColor = true;
            // 
            // checkBox3
            // 
            this.checkBox3.AutoSize = true;
            this.checkBox3.Checked = true;
            this.checkBox3.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox3.Location = new System.Drawing.Point(75, 89);
            this.checkBox3.Name = "checkBox3";
            this.checkBox3.Size = new System.Drawing.Size(43, 17);
            this.checkBox3.TabIndex = 19;
            this.checkBox3.Tag = "-0.25";
            this.checkBox3.Text = "khá";
            this.checkBox3.UseVisualStyleBackColor = true;
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
            this.panel2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.panel2.Controls.Add(this.checkAllB);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel2.Location = new System.Drawing.Point(3, 17);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(587, 23);
            this.panel2.TabIndex = 18;
            // 
            // checkAllB
            // 
            this.checkAllB.AutoSize = true;
            this.checkAllB.Location = new System.Drawing.Point(8, 3);
            this.checkAllB.Name = "checkAllB";
            this.checkAllB.Size = new System.Drawing.Size(82, 17);
            this.checkAllB.TabIndex = 1;
            this.checkAllB.Text = "Chọn tất cả";
            this.checkAllB.UseVisualStyleBackColor = true;
            // 
            // b6
            // 
            this.b6.AutoSize = true;
            this.b6.Checked = true;
            this.b6.CheckState = System.Windows.Forms.CheckState.Checked;
            this.b6.Location = new System.Drawing.Point(75, 46);
            this.b6.Name = "b6";
            this.b6.Size = new System.Drawing.Size(62, 17);
            this.b6.TabIndex = 7;
            this.b6.Tag = "1.5";
            this.b6.Text = "hết sức";
            this.b6.UseVisualStyleBackColor = true;
            // 
            // b5
            // 
            this.b5.AutoSize = true;
            this.b5.Checked = true;
            this.b5.CheckState = System.Windows.Forms.CheckState.Checked;
            this.b5.Location = new System.Drawing.Point(143, 66);
            this.b5.Name = "b5";
            this.b5.Size = new System.Drawing.Size(44, 17);
            this.b5.TabIndex = 6;
            this.b5.Tag = "1";
            this.b5.Text = "quá";
            this.b5.UseVisualStyleBackColor = true;
            // 
            // b4
            // 
            this.b4.AutoSize = true;
            this.b4.Checked = true;
            this.b4.CheckState = System.Windows.Forms.CheckState.Checked;
            this.b4.Location = new System.Drawing.Point(12, 112);
            this.b4.Name = "b4";
            this.b4.Size = new System.Drawing.Size(53, 17);
            this.b4.TabIndex = 5;
            this.b4.Tag = "1.5";
            this.b4.Text = "cực kì";
            this.b4.UseVisualStyleBackColor = true;
            // 
            // b3
            // 
            this.b3.AutoSize = true;
            this.b3.Checked = true;
            this.b3.CheckState = System.Windows.Forms.CheckState.Checked;
            this.b3.Location = new System.Drawing.Point(12, 90);
            this.b3.Name = "b3";
            this.b3.Size = new System.Drawing.Size(43, 17);
            this.b3.TabIndex = 4;
            this.b3.Tag = "1";
            this.b3.Text = "cực";
            this.b3.UseVisualStyleBackColor = true;
            // 
            // b2
            // 
            this.b2.AutoSize = true;
            this.b2.Checked = true;
            this.b2.CheckState = System.Windows.Forms.CheckState.Checked;
            this.b2.Location = new System.Drawing.Point(12, 68);
            this.b2.Name = "b2";
            this.b2.Size = new System.Drawing.Size(51, 17);
            this.b2.TabIndex = 1;
            this.b2.Tag = "1";
            this.b2.Text = "rất là";
            this.b2.UseVisualStyleBackColor = true;
            // 
            // b1
            // 
            this.b1.AutoSize = true;
            this.b1.Checked = true;
            this.b1.CheckState = System.Windows.Forms.CheckState.Checked;
            this.b1.Location = new System.Drawing.Point(12, 46);
            this.b1.Name = "b1";
            this.b1.Size = new System.Drawing.Size(40, 17);
            this.b1.TabIndex = 1;
            this.b1.Tag = "1";
            this.b1.Text = "rất";
            this.b1.UseVisualStyleBackColor = true;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.label4);
            this.groupBox2.Controls.Add(this.cbKhiaCanh);
            this.groupBox2.Controls.Add(this.tHUC_THELabel);
            this.groupBox2.Controls.Add(this.ttCb);
            this.groupBox2.Controls.Add(this.btnThemWS);
            this.groupBox2.Controls.Add(this.spnW);
            this.groupBox2.Controls.Add(this.label1);
            this.groupBox2.Controls.Add(this.btnThemWOS);
            this.groupBox2.Controls.Add(this.alert);
            this.groupBox2.Controls.Add(this.seed);
            this.groupBox2.Controls.Add(this.txtSeed);
            this.groupBox2.Dock = System.Windows.Forms.DockStyle.Top;
            this.groupBox2.Location = new System.Drawing.Point(0, 151);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(1011, 149);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Thêm từ điển";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(762, 31);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(70, 19);
            this.label4.TabIndex = 11;
            this.label4.Text = "Khía cạnh";
            // 
            // cbKhiaCanh
            // 
            this.cbKhiaCanh.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbKhiaCanh.FormattingEnabled = true;
            this.cbKhiaCanh.Items.AddRange(new object[] {
            "Tổng quát",
            "Nội dung",
            "Tác giả",
            "Chất lượng",
            "Trình bày"});
            this.cbKhiaCanh.Location = new System.Drawing.Point(766, 52);
            this.cbKhiaCanh.Name = "cbKhiaCanh";
            this.cbKhiaCanh.Size = new System.Drawing.Size(141, 21);
            this.cbKhiaCanh.TabIndex = 10;
            // 
            // ttCb
            // 
            this.ttCb.DataSource = this.dtnnBS;
            this.ttCb.DisplayMember = "THUC_THE";
            this.ttCb.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.ttCb.FormattingEnabled = true;
            this.ttCb.Location = new System.Drawing.Point(37, 52);
            this.ttCb.Name = "ttCb";
            this.ttCb.Size = new System.Drawing.Size(160, 21);
            this.ttCb.TabIndex = 9;
            this.ttCb.ValueMember = "ID";
            // 
            // dtnnBS
            // 
            this.dtnnBS.DataMember = "DAC_TRUNG_NGU_NGHIA";
            this.dtnnBS.DataSource = this.edDS;
            // 
            // edDS
            // 
            this.edDS.DataSetName = "Emo_DictionaryDataSet";
            this.edDS.EnforceConstraints = false;
            this.edDS.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // btnThemWS
            // 
            this.btnThemWS.Location = new System.Drawing.Point(294, 91);
            this.btnThemWS.Name = "btnThemWS";
            this.btnThemWS.Size = new System.Drawing.Size(152, 23);
            this.btnThemWS.TabIndex = 8;
            this.btnThemWS.Text = "Thêm";
            this.btnThemWS.UseVisualStyleBackColor = true;
            this.btnThemWS.Click += new System.EventHandler(this.button1_Click_1);
            // 
            // spnW
            // 
            this.spnW.EditValue = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.spnW.Location = new System.Drawing.Point(640, 53);
            this.spnW.Name = "spnW";
            this.spnW.Properties.Buttons.AddRange(new DevExpress.XtraEditors.Controls.EditorButton[] {
            new DevExpress.XtraEditors.Controls.EditorButton(DevExpress.XtraEditors.Controls.ButtonPredefines.Combo)});
            this.spnW.Properties.Mask.EditMask = "f2";
            this.spnW.Size = new System.Drawing.Size(100, 20);
            this.spnW.TabIndex = 7;
            this.spnW.EditValueChanged += new System.EventHandler(this.spinEdit1_EditValueChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(636, 31);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(62, 19);
            this.label1.TabIndex = 6;
            this.label1.Text = "Trọng số";
            // 
            // btnThemWOS
            // 
            this.btnThemWOS.Location = new System.Drawing.Point(489, 91);
            this.btnThemWOS.Name = "btnThemWOS";
            this.btnThemWOS.Size = new System.Drawing.Size(152, 23);
            this.btnThemWOS.TabIndex = 5;
            this.btnThemWOS.Text = "Thêm không seed";
            this.btnThemWOS.UseVisualStyleBackColor = true;
            this.btnThemWOS.Click += new System.EventHandler(this.update_Click);
            // 
            // alert
            // 
            this.alert.AutoSize = true;
            this.alert.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.alert.ForeColor = System.Drawing.Color.Red;
            this.alert.Location = new System.Drawing.Point(211, 26);
            this.alert.Name = "alert";
            this.alert.Size = new System.Drawing.Size(0, 19);
            this.alert.TabIndex = 4;
            // 
            // seed
            // 
            this.seed.AutoSize = true;
            this.seed.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.seed.Location = new System.Drawing.Point(227, 26);
            this.seed.Name = "seed";
            this.seed.Size = new System.Drawing.Size(92, 19);
            this.seed.TabIndex = 1;
            this.seed.Text = "Từ cảm xúc:  ";
            // 
            // txtSeed
            // 
            this.txtSeed.Location = new System.Drawing.Point(231, 52);
            this.txtSeed.Name = "txtSeed";
            this.txtSeed.Size = new System.Drawing.Size(375, 21);
            this.txtSeed.TabIndex = 0;
            // 
            // btnThemTTYN
            // 
            this.btnThemTTYN.Location = new System.Drawing.Point(294, 95);
            this.btnThemTTYN.Name = "btnThemTTYN";
            this.btnThemTTYN.Size = new System.Drawing.Size(126, 23);
            this.btnThemTTYN.TabIndex = 2;
            this.btnThemTTYN.Text = "Thêm ";
            this.btnThemTTYN.UseVisualStyleBackColor = true;
            this.btnThemTTYN.Click += new System.EventHandler(this.add_Click);
            // 
            // dtnnTA
            // 
            this.dtnnTA.ClearBeforeFill = true;
            // 
            // tableAdapterManager
            // 
            this.tableAdapterManager.BackupDataSetBeforeUpdate = false;
            this.tableAdapterManager.DAC_TRUNG_CAM_XUCTableAdapter = null;
            this.tableAdapterManager.DAC_TRUNG_NGU_NGHIATableAdapter = this.dtnnTA;
            this.tableAdapterManager.TRONG_SOTableAdapter = null;
            this.tableAdapterManager.UpdateOrder = EmoDic.Emo_DictionaryDataSetTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete;
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.alert2lb);
            this.groupBox3.Controls.Add(this.label3);
            this.groupBox3.Controls.Add(this.txtMA);
            this.groupBox3.Controls.Add(this.label2);
            this.groupBox3.Controls.Add(this.txtTTYN);
            this.groupBox3.Controls.Add(this.btnThemTTYN);
            this.groupBox3.Dock = System.Windows.Forms.DockStyle.Top;
            this.groupBox3.Location = new System.Drawing.Point(0, 300);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(1011, 241);
            this.groupBox3.TabIndex = 4;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Thêm thực thể ý nghĩa";
            // 
            // alert2lb
            // 
            this.alert2lb.AutoSize = true;
            this.alert2lb.Location = new System.Drawing.Point(107, 17);
            this.alert2lb.Name = "alert2lb";
            this.alert2lb.Size = new System.Drawing.Size(0, 13);
            this.alert2lb.TabIndex = 6;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(103, 42);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(83, 19);
            this.label3.TabIndex = 5;
            this.label3.Text = "Mã thực thể";
            // 
            // txtMA
            // 
            this.txtMA.Location = new System.Drawing.Point(107, 68);
            this.txtMA.Name = "txtMA";
            this.txtMA.Size = new System.Drawing.Size(172, 21);
            this.txtMA.TabIndex = 4;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(295, 42);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(63, 19);
            this.label2.TabIndex = 3;
            this.label2.Text = "Thực thể";
            // 
            // txtTTYN
            // 
            this.txtTTYN.Location = new System.Drawing.Point(297, 68);
            this.txtTTYN.Name = "txtTTYN";
            this.txtTTYN.Size = new System.Drawing.Size(375, 21);
            this.txtTTYN.TabIndex = 2;
            // 
            // checkBox12
            // 
            this.checkBox12.AutoSize = true;
            this.checkBox12.Checked = true;
            this.checkBox12.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox12.Location = new System.Drawing.Point(309, 43);
            this.checkBox12.Name = "checkBox12";
            this.checkBox12.Size = new System.Drawing.Size(96, 17);
            this.checkBox12.TabIndex = 29;
            this.checkBox12.Tag = "-1";
            this.checkBox12.Text = "không có được";
            this.checkBox12.UseVisualStyleBackColor = true;
            // 
            // checkBox13
            // 
            this.checkBox13.AutoSize = true;
            this.checkBox13.Checked = true;
            this.checkBox13.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox13.Location = new System.Drawing.Point(309, 66);
            this.checkBox13.Name = "checkBox13";
            this.checkBox13.Size = new System.Drawing.Size(82, 17);
            this.checkBox13.TabIndex = 30;
            this.checkBox13.Tag = "-1";
            this.checkBox13.Text = "không được";
            this.checkBox13.UseVisualStyleBackColor = true;
            // 
            // checkBox14
            // 
            this.checkBox14.AutoSize = true;
            this.checkBox14.Checked = true;
            this.checkBox14.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox14.Location = new System.Drawing.Point(309, 90);
            this.checkBox14.Name = "checkBox14";
            this.checkBox14.Size = new System.Drawing.Size(78, 17);
            this.checkBox14.TabIndex = 31;
            this.checkBox14.Tag = "-0.5";
            this.checkBox14.Text = "không mấy";
            this.checkBox14.UseVisualStyleBackColor = true;
            // 
            // checkBox15
            // 
            this.checkBox15.AutoSize = true;
            this.checkBox15.Checked = true;
            this.checkBox15.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox15.Location = new System.Drawing.Point(309, 110);
            this.checkBox15.Name = "checkBox15";
            this.checkBox15.Size = new System.Drawing.Size(40, 17);
            this.checkBox15.TabIndex = 32;
            this.checkBox15.Tag = "-0.5";
            this.checkBox15.Text = "hơi";
            this.checkBox15.UseVisualStyleBackColor = true;
            // 
            // checkBox16
            // 
            this.checkBox16.AutoSize = true;
            this.checkBox16.Checked = true;
            this.checkBox16.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox16.Location = new System.Drawing.Point(426, 66);
            this.checkBox16.Name = "checkBox16";
            this.checkBox16.Size = new System.Drawing.Size(57, 17);
            this.checkBox16.TabIndex = 33;
            this.checkBox16.Tag = "-0.75";
            this.checkBox16.Text = "hơi hơi";
            this.checkBox16.UseVisualStyleBackColor = true;
            // 
            // checkBox17
            // 
            this.checkBox17.AutoSize = true;
            this.checkBox17.Checked = true;
            this.checkBox17.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox17.Location = new System.Drawing.Point(426, 43);
            this.checkBox17.Name = "checkBox17";
            this.checkBox17.Size = new System.Drawing.Size(64, 17);
            this.checkBox17.TabIndex = 34;
            this.checkBox17.Tag = "2";
            this.checkBox17.Text = "đặc biết";
            this.checkBox17.UseVisualStyleBackColor = true;
            // 
            // Main
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1011, 485);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.Name = "Main";
            this.Text = "Main";
            this.Load += new System.EventHandler(this.Main_Load);
            this.groupBox1.ResumeLayout(false);
            this.aft.ResumeLayout(false);
            this.aft.PerformLayout();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.bf.ResumeLayout(false);
            this.bf.PerformLayout();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtnnBS)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.edDS)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.spnW.Properties)).EndInit();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Button btnThemTTYN;
        private System.Windows.Forms.Label seed;
        private System.Windows.Forms.TextBox txtSeed;
        private System.Windows.Forms.GroupBox aft;
        private System.Windows.Forms.GroupBox bf;
        private System.Windows.Forms.CheckBox a5;
        private System.Windows.Forms.CheckBox a4;
        private System.Windows.Forms.CheckBox a3;
        private System.Windows.Forms.CheckBox a2;
        private System.Windows.Forms.CheckBox a1;
        private System.Windows.Forms.CheckBox b6;
        private System.Windows.Forms.CheckBox b5;
        private System.Windows.Forms.CheckBox b4;
        private System.Windows.Forms.CheckBox b3;
        private System.Windows.Forms.CheckBox b2;
        private System.Windows.Forms.CheckBox b1;
        private System.Windows.Forms.Label alert;
        private System.Windows.Forms.Button btnThemWOS;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.CheckBox checkAllA;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.CheckBox checkAllB;
        private System.Windows.Forms.Button btnWatch;
        private DevExpress.XtraEditors.SpinEdit spnW;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnXtract;
        private System.Windows.Forms.Button btnThemWS;
        private Emo_DictionaryDataSet edDS;
        private System.Windows.Forms.BindingSource dtnnBS;
        private Emo_DictionaryDataSetTableAdapters.DAC_TRUNG_NGU_NGHIATableAdapter dtnnTA;
        private Emo_DictionaryDataSetTableAdapters.TableAdapterManager tableAdapterManager;
        private System.Windows.Forms.ComboBox ttCb;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtTTYN;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtMA;
        private System.Windows.Forms.Label alert2lb;
        private System.Windows.Forms.CheckBox checkBox1;
        private System.Windows.Forms.CheckBox checkBox3;
        private System.Windows.Forms.CheckBox checkBox6;
        private System.Windows.Forms.CheckBox checkBox5;
        private System.Windows.Forms.CheckBox checkBox4;
        private System.Windows.Forms.Label tHUC_THELabel;
        private System.Windows.Forms.CheckBox checkBox7;
        private System.Windows.Forms.CheckBox checkBox2;
        private System.Windows.Forms.CheckBox checkBox9;
        private System.Windows.Forms.CheckBox checkBox8;
        private System.Windows.Forms.CheckBox checkBox10;
        private System.Windows.Forms.ComboBox cbKhiaCanh;
        private System.Windows.Forms.CheckBox checkBox11;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.CheckBox checkBox14;
        private System.Windows.Forms.CheckBox checkBox13;
        private System.Windows.Forms.CheckBox checkBox12;
        private System.Windows.Forms.CheckBox checkBox16;
        private System.Windows.Forms.CheckBox checkBox15;
        private System.Windows.Forms.CheckBox checkBox17;
    }
}