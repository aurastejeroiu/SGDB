using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
/*
    SqlConnection, SqlCommand, SqlDataReader, SqlDataAdapter
    DataSet:
        - DataTable:
            - DataRow
    
    For attendance:
        SqlCommand - ExecuteScalar
                   - ExecuteNonQuerry (Insert or Update or Delete)
                   - ExecuteReader
        SqlDataAdapter, DataSet - add a row
                                - update a row
                                - eliminate a row (delete, remove)
   
*/

namespace Lab1
{
    class Program
    {
        static void Main(string[] args)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = "Data Source         = DON-COPSI-PC\\SQLEXPRESS;" +
                                          "Initial Catalog     = ComputerPartsWharehouseManagement;" +
                                          "Integrated Security = SSPI;";

            DataSet data_set = new DataSet();
            SqlDataAdapter data_adapter = new SqlDataAdapter("select * from Monitor", connection);
            data_adapter.Fill(data_set, "Monitor");

            connection.Open();

            //Execute Scalar
            SqlCommand sqlCommand_scalar = new SqlCommand("select count(*) from Producer", connection);
            int producer_count = (int)sqlCommand_scalar.ExecuteScalar();
            Console.WriteLine("Producer count = " + producer_count);

            ////Update
            //SqlCommand update_non_querry = new SqlCommand();
            //update_non_querry.CommandText = "Update Monitor set model = 123213 where monitor_id = 1";
            //update_non_querry.CommandType = CommandType.Text;
            //update_non_querry.Connection = connection;
            //update_non_querry.ExecuteNonQuery();

            //Reader
            //SqlCommand select_command_reader = new SqlCommand("SELECT monitor_id, model FROM Monitor", connection);
            //SqlDataReader dr = select_command_reader.ExecuteReader();
            //while (dr.Read())
            //    Console.WriteLine("{0} \t {1}", dr.GetInt32(0), dr.GetString(1));

            //add a row
            DataTable table = data_set.Tables["Monitor"];
            DataRow new_row = table.NewRow();
            new_row["monitor_id"] = 7;
            new_row["release_date"] = "2010-10-30";
            new_row["model"] = "PG123";
            new_row["panel_type"] = "TN";
            new_row["refresh_rate"] = 100;
            new_row["producer"] = "Dell";
            SqlCommandBuilder commandBuilder = new SqlCommandBuilder(data_adapter);
            table.Rows.Add(new_row);
            data_adapter.Update(data_set, "Monitor");

            //update a row
            DataRow existing_row = table.Rows[2];
            existing_row["model"] = "salut";
            data_adapter.Update(data_set, "Monitor");



            //delete a row
            table.Rows.RemoveAt(7);
            data_adapter.Update(data_set, "Monitor");


            foreach (DataRow row in data_set.Tables["Monitor"].Rows)
            {
                Console.WriteLine("{0} {1}", row["monitor_id"], row["model"]);
            }



            connection.Close();
            //connection.Open();
            //Console.WriteLine("nice");
            //connection.Close();
        }
    }
}
