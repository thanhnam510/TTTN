﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace EmoDic
{
    public partial class EmotionDictionary : Form
    {
        public EmotionDictionary()
        {
            InitializeComponent();
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            action();
            
        }

        private void action()
        {
            if (txtServer.Text == "")
            {
                lbInfo.Text = "Không được để trống ServerName";
                txtServer.Focus();
                return;
            }
            if (txtID.Text == "")
            {
                lbInfo.Text = "Không được để trống ID";
                txtID.Focus();
                return;
            }
            Program.Connect(txtServer.Text.Trim(), txtDB.Text.Trim(), txtID.Text.Trim(), txtPass.Text.Trim());
            if (Program.CheckConnectString())
                this.Close();
            else
                return;
        }
        private void txtServer_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
                action();
        }
    }
}
