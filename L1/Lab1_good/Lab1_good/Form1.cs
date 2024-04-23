using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Lab1_good
{
    public partial class Form1 : Form
    {

    SqlConnection sqlconn= new SqlConnection("DataSource=DESKTOP-GRBO5MG; Initial Catalog=Events_Planning; Integrated Security=True");
        SqlDataAdapter sqlDA = new SqlDataAdapter();
        DataSet ds = new DataSet();
        

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ds.Clear();
            sqlDA.SelectCommand = new SqlCommand("Select* from Menu", sqlconn);
            sqlDA.Fill(ds);
            Console.WriteLine(ds.Tables[0].Rows[37]["Name"]);
        }
    }
}
