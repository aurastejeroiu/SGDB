using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Lab2
{
    public partial class Form1 : Form
    {
        SqlConnection connection = new SqlConnection("DataSource=DESKTOP-GRBO5MG; Initial Catalog=Events_Planning; Integrated Security=True");
        DataSet data_set;
        SqlDataAdapter data_adapter_parent;
        SqlDataAdapter data_adapter_child;
        SqlCommandBuilder sql_command_buider;
        BindingSource binding_source_parent;
        BindingSource binding_source_child;
        DataRelation relation;
        string foreign_key = "FK_Parent_Child";

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            Console.WriteLine(getParentTableName());
            Console.WriteLine(getChildTableName());
            Console.WriteLine(getParentQuery());
            Console.WriteLine(getChildQuery());


            connection.ConnectionString = "Data Source         = DON-COPSI-PC\\SQLEXPRESS;" +
                                          "Initial Catalog     = ComputerPartsWharehouseManagement;" +
                                          "Integrated Security = SSPI;";
            connection.Open();

            update_table_data();

        }

        private string getChildTableForeignKey()
        {
            // string id = "producer"; // TODO: read from xml config
            string foreign_key = ConfigurationManager.AppSettings.Get("child_table_foreign_key");
            return foreign_key;
        }

        private string getParentTablePrimaryKey()
        {
            // string id = "producer_name"; // TODO: read from xml config
            string primary_key = ConfigurationManager.AppSettings.Get("parent_table_primary_key");
            return primary_key;
        }

        private string getChildQuery()
        {
            string querry = "select * from " + getChildTableName();
            return querry;
        }

        private string getChildTableName()
        {
            //string table_name = "Monitor"; // TODO: read from xml config
            string table_name = ConfigurationManager.AppSettings.Get("child_table_name");
            return table_name;
        }

        private string getParentQuery()
        {
            string querry = "select * from " + getParentTableName();
            return querry;
        }

        private string getParentTableName()
        {
            //string table_name = "Producer"; // TODO: read from xml config
            string table_name = ConfigurationManager.AppSettings.Get("parent_table_name");
            return table_name;
        }

        private void update_button_Click(object sender, EventArgs e)
        {
            try
            {
                data_adapter_child.Update(data_set, getChildTableName());
                data_adapter_parent.Update(data_set, getParentTableName());
            }
            catch (Exception exception)
            {
                MessageBox.Show(exception.Message);
            }
        }

        private void refresh_button_Click(object sender, EventArgs e)
        {
            update_table_data();
        }

        private void update_table_data()
        {
            data_set = new DataSet();

            //SqlDataAdapter data_adapter_parent = new SqlDataAdapter("select * from Producer", connection);
            data_adapter_parent = new SqlDataAdapter(getParentQuery(), connection);
            data_adapter_parent.Fill(data_set, getParentTableName());
            sql_command_buider = new SqlCommandBuilder(data_adapter_parent);
            //SqlDataAdapter data_adapter_parent = new SqlDataAdapter("select * from Monitor", connection);
            data_adapter_child = new SqlDataAdapter(getChildQuery(), connection);
            data_adapter_child.Fill(data_set, getChildTableName());
            sql_command_buider = new SqlCommandBuilder(data_adapter_child);

            relation = new DataRelation(foreign_key,
                                               data_set.Tables[getParentTableName()].Columns[getParentTablePrimaryKey()],
                                               data_set.Tables[getChildTableName()].Columns[getChildTableForeignKey()]);
            data_set.Relations.Add(relation);

            binding_source_parent = new BindingSource();
            binding_source_parent.DataSource = data_set;
            binding_source_parent.DataMember = getParentTableName();


            binding_source_child = new BindingSource();
            binding_source_child.DataSource = binding_source_parent;
            binding_source_child.DataMember = foreign_key;

            data_grid_view_parent.DataSource = binding_source_parent;
            data_grid_view_child.DataSource = binding_source_child;
        }
    }
}
