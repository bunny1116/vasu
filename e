using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using WF.ERMT.Application.Business;
using WF.ERMT.Application.Entities.CustomEntities;

namespace WF.ERMT.Application.Web.Utility
{
    public class EmailNotification
    {
        public static void SendEmail(string toAddress, string subject, string body)
        {

            try
            {
                string senderID = ConfigurationManager.AppSettings["SenderEmail"];
                //string senderPassword = ConfigurationManager.AppSettings["EmailPwd"]; // sender password here…

                SmtpClient smtp = new SmtpClient
                {
                    Host = ConfigurationManager.AppSettings["smtp"],
                    //"mail-relay.cps.wellsfargo.net",
                    //Credentials = new System.Net.NetworkCredential(senderID, senderPassword),
                    Timeout = 30000,
                };
                MailMessage message = new MailMessage(senderID, toAddress, subject, body);
                message.IsBodyHtml = true;
                smtp.Send(message);
            }
            catch(Exception ex)
            {
                //todo: logging
            }

　
        }

        public static void PEPStatusChangedtoCompleted(PEPEntity pepdetail)
        {
            var toAddress = pepdetail.RequestorEmail;
            var subject = string.Empty;
            if (pepdetail.ECN[0] != null)
            {
                 subject = "PEP Request - " + pepdetail.PepId + ", ECN - " + pepdetail.ECN[0].ToString() + ", Customer - " + pepdetail.Customer_Name + " has been Completed.";
            }
            else
            {
                 subject = "PEP Request - " + pepdetail.PepId + ", Customer - " + pepdetail.Customer_Name + " has been Completed.";
            }
            var name = pepdetail.RequestorFirstName;
            var body = "Hello " + name + ",<br/><br/>The PEP Request# " + pepdetail.PepId + " raised for the Customer, " + pepdetail.Customer_Name + " has been Completed, with the following comments - <br/><br/><I>" + pepdetail.PepDeterminationComments + "</I><br/><br/>Thanks.";
            SendEmail(toAddress, subject, body);
        }

        public static void PEPStatusChangedtoRejected(PEPEntity pepdetail)
        {
            var toAddress = pepdetail.RequestorEmail;
            var subject = string.Empty;
            if (pepdetail.ECN[0] != null)
            {
                subject = "PEP Request - " + pepdetail.PepId + ", ECN - " + pepdetail.ECN[0].ToString() + ", Customer - " + pepdetail.Customer_Name + " has been Completed.";
            }
            else
            {
                subject = "PEP Request - " + pepdetail.PepId + ", Customer - " + pepdetail.Customer_Name + " has been Completed.";
            }
          //  var subject = "PEP Request - " + pepdetail.PepId + "ECN - " + pepdetail.ECN.ToString() + "Customer - " + pepdetail.Customer_Name + " has been Completed.";
            var name = pepdetail.RequestorFirstName;
            var body = "Hello " + name + ",<br/><br/>The PEP Request# " + pepdetail.PepId + " raised for the Customer, " + pepdetail.Customer_Name + " has been Rejected, with the following comments - <br/><br/><I>" + pepdetail.PepDeterminationComments + "</I><br/>Please do the needful.<br/><br/>Thanks.";
            SendEmail(toAddress, subject, body);
        }
        public static void CRAccepted(PEPEntity pepdetail)
        {
            var toAddress = pepdetail.RequestorEmail;
            var subject = string.Empty;
            if (pepdetail.ECN[0] != null)
            {
                subject = "CR has been Accepted on PEP Request - " + pepdetail.PepId + ", ECN - " + pepdetail.ECN[0].ToString() + ", Customer - " + pepdetail.Customer_Name;
            }
            else
            {
                subject = "CR has been Accepted on PEP Request - " + pepdetail.PepId + ", Customer - " + pepdetail.Customer_Name;
            }
            //  var subject = "PEP Request - " + pepdetail.PepId + "ECN - " + pepdetail.ECN.ToString() + "Customer - " + pepdetail.Customer_Name + " has been Completed.";
            var name = pepdetail.RequestorFirstName;
            var body = "Hello " + name + ",<br/><br/>CR has been Accepted for the PEP Request# " + pepdetail.PepId + " for the Customer " + pepdetail.Customer_Name + "<br/>Please do the needful.<br/><br/>Thanks.";
            SendEmail(toAddress, subject, body);
        }

        public static void CRRejected(PEPEntity pepdetail)
        {
            var toAddress = pepdetail.RequestorEmail;
            var subject = string.Empty;
            if (pepdetail.ECN[0] != null)
            {
                subject = "CR has been Rejected on PEP Request - " + pepdetail.PepId + ", ECN - " + pepdetail.ECN[0].ToString() + ", Customer - " + pepdetail.Customer_Name;
            }
            else
            {
                subject = "CR has been Rejected on PEP Request - " + pepdetail.PepId + ", Customer - " + pepdetail.Customer_Name;
            }
            //  var subject = "PEP Request - " + pepdetail.PepId + "ECN - " + pepdetail.ECN.ToString() + "Customer - " + pepdetail.Customer_Name + " has been Completed.";
            var name = pepdetail.RequestorFirstName;
            var body = "Hello " + name + ",<br/><br/>CR has been Rejected for the PEP Request# " + pepdetail.PepId + " for the Customer " + pepdetail.Customer_Name + "<br/>Please do the needful.<br/><br/>Thanks.";
            SendEmail(toAddress, subject, body);
        }

        public static void NewCPTMemberRoleAdded(UserEntity userEntity, IEnumerable<UserRoleEntity> users)
        {
            var emails = users.Where(x => x.RoleID == 27 && x.EndDate==null).Select(i => i.User.Email).ToList();

            StringBuilder toaddress = new StringBuilder();
            string toaddreSS= String.Empty;

            for (int i = 0; i < emails.Count; i++)
            {
                toaddreSS = toaddreSS + emails[i].Trim() +string.Concat((i!=emails.Count-1)?",":String.Empty);
                toaddreSS.TrimEnd();
            }
                     
            var subject = "New CPT Member Added Please take action";
            
            //  var subject = "PEP Request - " + pepdetail.PepId + "ECN - " + pepdetail.ECN.ToString() + "Customer - " + pepdetail.Customer_Name + " has been Completed.";
           // var name = pepdetail.RequestorFirstName;
            var body = "Hello, Team Manager, <br/><br/>A new CPT Member was added in auto assignment. <b>Please set up Auto Assignment and Allocation Threshold for this user.</b><br/><br/>Thanks.";
            SendEmail(toaddreSS, subject, body);
        }

        
    }

}
