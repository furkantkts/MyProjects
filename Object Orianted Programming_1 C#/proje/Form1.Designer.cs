namespace proje
{
    partial class Form1
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
            this.personelEkleButton = new System.Windows.Forms.Button();
            this.maasHesaplaButton = new System.Windows.Forms.Button();
            this.richTextBox1 = new System.Windows.Forms.RichTextBox();
            this.araButton = new System.Windows.Forms.Button();
            this.kimlikLabel = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.maasLabel = new System.Windows.Forms.Label();
            this.damgaLabel = new System.Windows.Forms.Label();
            this.emekliLabel = new System.Windows.Forms.Label();
            this.brutLabel = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // personelEkleButton
            // 
            this.personelEkleButton.Location = new System.Drawing.Point(12, 114);
            this.personelEkleButton.Name = "personelEkleButton";
            this.personelEkleButton.Size = new System.Drawing.Size(169, 40);
            this.personelEkleButton.TabIndex = 0;
            this.personelEkleButton.Text = "Personel Bilgilerini Ekle";
            this.personelEkleButton.UseVisualStyleBackColor = true;
            this.personelEkleButton.Click += new System.EventHandler(this.personelEkleButton_Click);
            // 
            // maasHesaplaButton
            // 
            this.maasHesaplaButton.Location = new System.Drawing.Point(187, 114);
            this.maasHesaplaButton.Name = "maasHesaplaButton";
            this.maasHesaplaButton.Size = new System.Drawing.Size(147, 40);
            this.maasHesaplaButton.TabIndex = 1;
            this.maasHesaplaButton.Text = "Maaş Hesapla";
            this.maasHesaplaButton.UseVisualStyleBackColor = true;
            this.maasHesaplaButton.Click += new System.EventHandler(this.maasHesaplaButton_Click);
            // 
            // richTextBox1
            // 
            this.richTextBox1.Location = new System.Drawing.Point(12, 12);
            this.richTextBox1.Name = "richTextBox1";
            this.richTextBox1.Size = new System.Drawing.Size(751, 96);
            this.richTextBox1.TabIndex = 2;
            this.richTextBox1.Text = "";
            // 
            // araButton
            // 
            this.araButton.Location = new System.Drawing.Point(641, 114);
            this.araButton.Name = "araButton";
            this.araButton.Size = new System.Drawing.Size(122, 40);
            this.araButton.TabIndex = 4;
            this.araButton.Text = "Ara";
            this.araButton.UseVisualStyleBackColor = true;
            this.araButton.Click += new System.EventHandler(this.araButton_Click);
            // 
            // kimlikLabel
            // 
            this.kimlikLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.kimlikLabel.Location = new System.Drawing.Point(340, 114);
            this.kimlikLabel.Name = "kimlikLabel";
            this.kimlikLabel.Size = new System.Drawing.Size(188, 40);
            this.kimlikLabel.TabIndex = 5;
            this.kimlikLabel.Text = "11 Haneli T.C.\'nizi Girin:";
            this.kimlikLabel.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(534, 123);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(101, 22);
            this.textBox1.TabIndex = 6;
            this.textBox1.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // textBox2
            // 
            this.textBox2.AcceptsReturn = true;
            this.textBox2.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.textBox2.Location = new System.Drawing.Point(12, 222);
            this.textBox2.Multiline = true;
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(339, 90);
            this.textBox2.TabIndex = 7;
            this.textBox2.TextChanged += new System.EventHandler(this.textBox2_TextChanged);
            // 
            // maasLabel
            // 
            this.maasLabel.Location = new System.Drawing.Point(577, 255);
            this.maasLabel.Name = "maasLabel";
            this.maasLabel.Size = new System.Drawing.Size(186, 53);
            this.maasLabel.TabIndex = 8;
            this.maasLabel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // damgaLabel
            // 
            this.damgaLabel.Location = new System.Drawing.Point(389, 222);
            this.damgaLabel.Name = "damgaLabel";
            this.damgaLabel.Size = new System.Drawing.Size(172, 23);
            this.damgaLabel.TabIndex = 9;
            // 
            // emekliLabel
            // 
            this.emekliLabel.Location = new System.Drawing.Point(389, 272);
            this.emekliLabel.Name = "emekliLabel";
            this.emekliLabel.Size = new System.Drawing.Size(172, 23);
            this.emekliLabel.TabIndex = 10;
            // 
            // brutLabel
            // 
            this.brutLabel.Location = new System.Drawing.Point(389, 322);
            this.brutLabel.Name = "brutLabel";
            this.brutLabel.Size = new System.Drawing.Size(172, 23);
            this.brutLabel.TabIndex = 11;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(775, 460);
            this.Controls.Add(this.brutLabel);
            this.Controls.Add(this.emekliLabel);
            this.Controls.Add(this.damgaLabel);
            this.Controls.Add(this.maasLabel);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.kimlikLabel);
            this.Controls.Add(this.araButton);
            this.Controls.Add(this.richTextBox1);
            this.Controls.Add(this.maasHesaplaButton);
            this.Controls.Add(this.personelEkleButton);
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "PERSONEL";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button personelEkleButton;
        private System.Windows.Forms.Button maasHesaplaButton;
        private System.Windows.Forms.RichTextBox richTextBox1;
        private System.Windows.Forms.Button araButton;
        private System.Windows.Forms.Label kimlikLabel;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.Label maasLabel;
        private System.Windows.Forms.Label damgaLabel;
        private System.Windows.Forms.Label emekliLabel;
        private System.Windows.Forms.Label brutLabel;
    }
}

