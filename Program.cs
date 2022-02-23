// See https://aka.ms/new-console-template for more information
using System;
using System.Runtime.InteropServices;


namespace  FiscalPrinterPnP {
    public class PnPLoader {
        [DllImport("pnpdll")] public static extern string PFabrepuerto(String port);
        [DllImport("pnpdll")] public static extern string PFrepx();
        [DllImport("pnpdll")] public static extern string PFcierrapuerto();
    }
    public class Program {
        PnPLoader loader;

        public Program(string port) {
            loader = new PnPLoader();
            string result = PnPLoader.PFabrepuerto(port);    
            Console.WriteLine("PFabrepuerto: {0}", result);
            result = PnPLoader.PFrepx();
            Console.WriteLine("PFrepx: {0}", result);
            result = PnPLoader.PFcierrapuerto();
            Console.WriteLine("PFcierrapuerto: {0}", result);
        }
        public static void Main(string[] args) {
            new Program(args[0]);
        }
    }
}

