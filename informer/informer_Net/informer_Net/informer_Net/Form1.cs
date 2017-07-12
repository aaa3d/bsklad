using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace informer_Net
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            Skybound.Gecko.Xpcom.Initialize("xulrunner");
            InitializeComponent();

            axWindowsMediaPlayer1.settings.setMode("loop", true);


            this.geckoWebBrowser1.Navigate("http://192.168.0.3/informer");


            

        }


        public static Rectangle ImRect(Rectangle clipRect, Size imageSize)
        {
            int h = clipRect.Height;
            int w = clipRect.Width;


            double hh = (double)h / (double)imageSize.Height;
            double ww = (double)w / (double)imageSize.Width;


            int rw, rh;

            if (ww < hh)
            {
                //width
                rw = w;
                rh = (int)(imageSize.Height * ww);
            }
            else
            {
                rw = (int)(imageSize.Width * hh);
                rh = h;
            }
            //ширина, высота. надо отцентровать. для этого сместить начало.
            //dx = w - rw;  203 - 120 = 83/2 = 
            Point loc = clipRect.Location;
            loc.Offset((w - rw) / 2, (h - rh) / 2);
            Rectangle r = new Rectangle(loc, new Size(rw, rh));
            //            location.Offset((w-rw)/2+18, (h-rh)/2+30);
            return r;
        }

        private void webBrowser1_DocumentCompleted(object sender, WebBrowserDocumentCompletedEventArgs e)
        {

        }

        private void axWindowsMediaPlayer1_MediaChange(object sender, AxWMPLib._WMPOCXEvents_MediaChangeEvent e)
        {
            Size videoSize = new Size(axWindowsMediaPlayer1.currentMedia.imageSourceWidth, axWindowsMediaPlayer1.currentMedia.imageSourceHeight);
            
            
            Rectangle clipRect = new Rectangle(425, 195, 835, 595); 
            //Rectangle viewRect = new Rectangle(285, 100, 1024 - 285-30, 768 - 200);
            Rectangle newRect = ImRect(clipRect, videoSize);

            axWindowsMediaPlayer1.Location = newRect.Location;
            axWindowsMediaPlayer1.Size = newRect.Size;

            axWindowsMediaPlayer1.stretchToFit = true;
        }
    }
}
