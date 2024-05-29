using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using API.Utility;
namespace API.DataAccess
{
    public static class Helper
    {
        public static int GetColumnOrder(SqlDataReader reader,string name)
        {
            int columnOrdinal = reader.GetOrdinal(name);
            return columnOrdinal;
        }
        public static T GetValue<T>(this SqlDataReader sqlDataReader, string columnName)
        {
            var value = sqlDataReader[columnName];

            return value == System.DBNull.Value ? default(T) : (T)value;
        }
        public static string GetMD5HashData(string data)
        {
            //create new instance of md5
            MD5 md5 = MD5.Create();

            //convert the input text to array of bytes
            byte[] hashData = md5.ComputeHash(Encoding.Default.GetBytes(data));

            //create new instance of StringBuilder to save hashed data
            StringBuilder returnValue = new StringBuilder();

            //loop for each byte and add it to StringBuilder
            for (int i = 0; i < hashData.Length; i++)
            {
                returnValue.Append(hashData[i].ToString());
            }

            // return hexadecimal string
            return returnValue.ToString();

        }

        public static bool ValidateMD5HashData(string inputData, string storedHashData)
        {
            //hash input text and save it string variable
            string getHashInputData = GetMD5HashData(inputData);

            if (string.Compare(getHashInputData, storedHashData) == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
		
		public static string ConverOrderListToSQL(string commandText,List<OrderByModel> orderBy)
        {
            if (orderBy != null && orderBy.Count > 0)
            {
                var newCommandText = commandText;
                Regex yourRegex = new Regex(@"(?<=by\s+).*?(?=\s+OFFSET)");
                string orderStr = "";
                foreach (var r in orderBy)
                {
                    orderStr = orderStr + r.ColumnName + " " + r.OrderDir + ",";
                }
                orderStr = orderStr.Trim(',');
                newCommandText = yourRegex.Replace(newCommandText, orderStr);
                return newCommandText;
            }
            return string.Empty;
        }
		public static object GetNullableParameter(object value)
        {
            if (value != null)
            {
                return value;
            }
            else
            {
                return DBNull.Value;
            }
        }
        /// <summary>
        /// Reads all available bytes from reader
        /// </summary>
        /// <param name="reader"></param>
        /// <param name="ordinal"></param>
        /// <returns></returns>
        public static byte[] GetBytes(SqlDataReader reader, string name)
        {
            int ordinal = reader.GetOrdinal(name);
            byte[] result = null;

            if (!reader.IsDBNull(ordinal))
            {
                long size = reader.GetBytes(ordinal, 0, null, 0, 0); //get the length of data 
                result = new byte[size];
                int bufferSize = 1024;
                long bytesRead = 0;
                int curPos = 0;
                while (bytesRead < size)
                {
                    bytesRead += reader.GetBytes(ordinal, curPos, result, curPos, bufferSize);
                    curPos += bufferSize;
                }
            }

            return result;
        }
    }
}

