using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using System.Net;
using System.IO;

namespace informer_Net
{
    static class Program
    {
        /// <summary>
        /// Главная точка входа для приложения.
        /// </summary>
        [STAThread]


        

        static void Main()
        {

         //   String playlist = GetTextByURL("playlist.txt"); 

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            System.Windows.Forms.Cursor.Hide();
            Application.Run(new Form1());
            System.Windows.Forms.Cursor.Show();

            


        }
    }
}
