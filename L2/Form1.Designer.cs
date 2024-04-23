
namespace Lab2
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
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.data_grid_view_child = new System.Windows.Forms.DataGridView();
            this.data_grid_view_parent = new System.Windows.Forms.DataGridView();
            this.update_button = new System.Windows.Forms.Button();
            this.refresh_button = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.data_grid_view_child)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.data_grid_view_parent)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.25F);
            this.label1.Location = new System.Drawing.Point(12, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(135, 25);
            this.label1.TabIndex = 0;
            this.label1.Text = "Parent Table";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.25F);
            this.label2.Location = new System.Drawing.Point(12, 329);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(121, 25);
            this.label2.TabIndex = 1;
            this.label2.Text = "Child Table";
            // 
            // data_grid_view_child
            // 
            this.data_grid_view_child.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.data_grid_view_child.Location = new System.Drawing.Point(12, 357);
            this.data_grid_view_child.Name = "data_grid_view_child";
            this.data_grid_view_child.Size = new System.Drawing.Size(1038, 331);
            this.data_grid_view_child.TabIndex = 2;
            // 
            // data_grid_view_parent
            // 
            this.data_grid_view_parent.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.data_grid_view_parent.Location = new System.Drawing.Point(12, 37);
            this.data_grid_view_parent.Name = "data_grid_view_parent";
            this.data_grid_view_parent.Size = new System.Drawing.Size(1038, 289);
            this.data_grid_view_parent.TabIndex = 5;
            // 
            // update_button
            // 
            this.update_button.Font = new System.Drawing.Font("Microsoft Sans Serif", 25.25F);
            this.update_button.Location = new System.Drawing.Point(1056, 37);
            this.update_button.Name = "update_button";
            this.update_button.Size = new System.Drawing.Size(181, 289);
            this.update_button.TabIndex = 6;
            this.update_button.Text = "Update";
            this.update_button.UseVisualStyleBackColor = true;
            this.update_button.Click += new System.EventHandler(this.update_button_Click);
            // 
            // refresh_button
            // 
            this.refresh_button.Font = new System.Drawing.Font("Microsoft Sans Serif", 25.25F);
            this.refresh_button.Location = new System.Drawing.Point(1056, 357);
            this.refresh_button.Name = "refresh_button";
            this.refresh_button.Size = new System.Drawing.Size(181, 331);
            this.refresh_button.TabIndex = 7;
            this.refresh_button.Text = "Refresh";
            this.refresh_button.UseVisualStyleBackColor = true;
            this.refresh_button.Click += new System.EventHandler(this.refresh_button_Click);
            // 
            // Form1
            // 
            this.ClientSize = new System.Drawing.Size(1249, 700);
            this.Controls.Add(this.refresh_button);
            this.Controls.Add(this.update_button);
            this.Controls.Add(this.data_grid_view_parent);
            this.Controls.Add(this.data_grid_view_child);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.data_grid_view_child)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.data_grid_view_parent)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DataGridView data_grid_view_parent;
        private System.Windows.Forms.DataGridView data_grid_view_child;
        private System.Windows.Forms.Button update_button;
        private System.Windows.Forms.Button refresh_button;
    }
}

