using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using NetCoreProject.Models;
namespace NetCoreProject.Controllers
{
    public class ClientController : Controller
    {
        private static string GetIPAddress()
        {
            StringBuilder sb = new StringBuilder();
            String strHostName = string.Empty;
            strHostName = Dns.GetHostName();
            sb.Append("Host Name: " + strHostName);
            // IPHostEntry ipHostEntry = Dns.GetHostEntry(strHostName);
            // IPAddress[] address = ipHostEntry.AddressList;
            // sb.Append(" IP Address: " + address[4].ToString());
            // sb.AppendLine();
            return sb.ToString();
        }

        private static List<ClientViewModel> Clients = new List<ClientViewModel>()
        {
            new ClientViewModel
            {
                Name = GetIPAddress(),
                Lastname = "Rodriguez",
                Age = 22
            },
            new ClientViewModel
            {
                Name = "hello",
                Lastname = "Pereira",
                Age = 11
            },
        };
        // GET: Client
        public IActionResult Index()
        {
            return View(Clients);
        }
    }
}