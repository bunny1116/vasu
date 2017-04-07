using AutoMapper;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
using WF.ERMT.Application.Core.Interfaces.Business;
using WF.ERMT.Application.Core.Interfaces.DataAccess;
using WF.ERMT.Application.DataAccess.Interfaces;
using WF.ERMT.Application.DataAccess.UnitOfWork;
using WF.ERMT.Application.DataEntities.EntityFramework;
//using WF.ERMT.Application.DataEntities.DataEntities;
using WF.ERMT.Application.Entities.CustomEntities;

namespace WF.ERMT.Application.Business
{
    public class PEPDetails : IPEPDetailsBusiness
    {
        private readonly IPepHistoryDataAccess pephistorydataaccess;
        private readonly ICustomerCountryLobDataAccess customercountrylobdataaccess;
        private readonly IPrimaryPepLobDataAccess primarypeplobdataaccess;
        private readonly IPrimaryPepAssociatedCountryLobDataAccess primarypepassociatedcountrylobdataaccess;
        private readonly IPrimaryPepDataAccess primarypepdataaccess;
        private readonly ILobPepDataAccess lobpepdataaccess;
        private readonly ICustomerDataAccess customerdataaccess;
        private readonly IPEPDetailsDataAccess pepdetailsdataccess;
        private readonly IEcnDataAccess ecndataaccess;
        private readonly IAttachmentDataAccess attachmentdataaccess;
        private readonly IUnitOfWork unitOfWork;
        private readonly IUserDetailsDataAccess userDetailsDataAccess;
        private readonly IRequestAssignmentDataAccess requestAssignmentDataAccess;
        private readonly IChangeRequestDataAccess changeRequestDataAccess;
        private readonly IRequestAutoAssignmentDataAccess requestAutoAssignmentDataAccess;

        private readonly IUserDetailsDataAccess userdetailsDataAccess;

        private readonly IHolidayCalenderDataAccess holidayCalenderDataAccess;

        public PEPDetails(IPEPDetailsDataAccess pepdetailsdataccess, IEcnDataAccess ecndataaccess, IAttachmentDataAccess attachmentdataaccess, ILobPepDataAccess lobpepdataaccess, IUserDetailsDataAccess userDetailsDataAccess, IRequestAssignmentDataAccess requestAssignmentDataAccess, IPrimaryPepDataAccess primarypepdataaccess, ICustomerDataAccess customerdataaccess, IChangeRequestDataAccess changeRequestDataAccess, IPrimaryPepLobDataAccess primarypeplobdataaccess, IPrimaryPepAssociatedCountryLobDataAccess primarypepassociatedcountrylobdataaccess, ICustomerCountryLobDataAccess customercountrylobdataaccess, IRequestAutoAssignmentDataAccess requestAutoAssignmentDataAccess, IUserDetailsDataAccess userdetailsDataAccess, IPepHistoryDataAccess pephistorydataaccess, IHolidayCalenderDataAccess holidayCalenderDataAccess, IUnitOfWork unitofwork)
        {
            this.pepdetailsdataccess = pepdetailsdataccess;
            this.ecndataaccess = ecndataaccess;
            this.unitOfWork = unitofwork;
            this.attachmentdataaccess = attachmentdataaccess;
            this.lobpepdataaccess = lobpepdataaccess;
            this.userDetailsDataAccess = userDetailsDataAccess;
            this.requestAssignmentDataAccess = requestAssignmentDataAccess;
            this.primarypepdataaccess = primarypepdataaccess;
            this.customerdataaccess = customerdataaccess;
            this.changeRequestDataAccess = changeRequestDataAccess;
            this.primarypeplobdataaccess = primarypeplobdataaccess;
            this.primarypepassociatedcountrylobdataaccess = primarypepassociatedcountrylobdataaccess;
            this.customercountrylobdataaccess = customercountrylobdataaccess;
            this.requestAutoAssignmentDataAccess = requestAutoAssignmentDataAccess;
            this.userDetailsDataAccess = userDetailsDataAccess;
            this.pephistorydataaccess = pephistorydataaccess;
            this.holidayCalenderDataAccess = holidayCalenderDataAccess;
        }

        public PEPEntity AddNew(PEPEntity PEP)
        {
            Mapper.CreateMap<PEPEntity, CDDGPep>();
            var a = Mapper.Map<PEPEntity, CDDGPep>(PEP);
            var result = pepdetailsdataccess.AddNew(a);
            //todo: use automapper to do reverse mapping
            PEP.PepId = result.PepId;
            return PEP;
        }

        public EcnEntity AddNewEcn(EcnEntity Ecn)
        {
            Mapper.CreateMap<EcnEntity, CDDGEcn>();
            var a = Mapper.Map<EcnEntity, CDDGEcn>(Ecn);
            var result = ecndataaccess.AddNew(a);
            //todo: use automapper to do reverse mapping
            Ecn.ECNID = result.EcnId;
            return Ecn;
        }

　
        public PepHistoryEntity AddNewPepHistory(PepHistoryEntity pep)
        {
            Mapper.CreateMap<PepHistoryEntity, CDDGPepHistory>();
            var a = Mapper.Map<PepHistoryEntity, CDDGPepHistory>(pep);
            var result = pephistorydataaccess.AddNew(a);
            //todo: use automapper to do reverse mapping
            pep.PepHistoryId = result.PepHistoryId;
            return pep;
        }

　
　
        public LobPepEntity AddNewLobPep(LobPepEntity LobPep)
        {
            Mapper.CreateMap<LobPepEntity, CDDGLobPep>();
            var a = Mapper.Map<LobPepEntity, CDDGLobPep>(LobPep);
            var result = lobpepdataaccess.AddNew(a);
            //todo: use automapper to do reverse mapping
            LobPep.LobPepId = result.LobPepId;
            return LobPep;
        }

        public PrimaryPepCountryLobEntity AddNewPrimaryPepCountryLob(PrimaryPepCountryLobEntity PrimaryPepLob)
        {
            Mapper.CreateMap<PrimaryPepCountryLobEntity, CDDGPrimaryPepCountryLob>();
            var a = Mapper.Map<PrimaryPepCountryLobEntity, CDDGPrimaryPepCountryLob>(PrimaryPepLob);
            var result = primarypeplobdataaccess.AddNew(a);
            //todo: use automapper to do reverse mapping
            PrimaryPepLob.PrimaryPepLobId = result.PrimaryPepLobId;
            return PrimaryPepLob;
        }

        public PrimaryPepAssociatedCountryLobEntity AddNewPrimaryPepAssociatedCountryLob(PrimaryPepAssociatedCountryLobEntity primarypepassociatedcountrylob)
        {
            Mapper.CreateMap<PrimaryPepAssociatedCountryLobEntity, CDDGPrimaryPepAssociatedCountryLob>();
            var a = Mapper.Map<PrimaryPepAssociatedCountryLobEntity, CDDGPrimaryPepAssociatedCountryLob>(primarypepassociatedcountrylob);
            var result = primarypepassociatedcountrylobdataaccess.AddNew(a);
            //todo: use automapper to do reverse mapping
            primarypepassociatedcountrylob.PrimaryPepLobId = result.PrimaryPepLobId;
            return primarypepassociatedcountrylob;
        }

        public CustomerCountryLobEntity AddNewCustomerCountryLob(CustomerCountryLobEntity custcountrylob)
        {
            Mapper.CreateMap<CustomerCountryLobEntity, CDDGCustomerCountryLob>();
            var a = Mapper.Map<CustomerCountryLobEntity, CDDGCustomerCountryLob>(custcountrylob);
            var result = customercountrylobdataaccess.AddNew(a);
            //todo: use automapper to do reverse mapping
            custcountrylob.CustomerId = result.CustomerId;
            return custcountrylob;
        }

　
        public CustomerEntity AddNewCustomer(CustomerEntity customer)
        {
            Mapper.CreateMap<CustomerEntity, CDDGCustomer>();
            var a = Mapper.Map<CustomerEntity, CDDGCustomer>(customer);
            var result = customerdataaccess.AddNew(a);
            //todo: use automapper to do reverse mapping
            customer.CustomerID = result.CustomerID;
            return customer;
        }

        public PrimaryPepEntity AddNewPrimaryPep(PrimaryPepEntity PrimaryPep)
        {
            Mapper.CreateMap<PrimaryPepEntity, CDDGPrimaryPep>();
            var a = Mapper.Map<PrimaryPepEntity, CDDGPrimaryPep>(PrimaryPep);
            var result = primarypepdataaccess.AddNew(a);
            //todo: use automapper to do reverse mapping
            PrimaryPep.PrimaryPepId = result.PrimaryPepId;
            return PrimaryPep;
        }

        public AttachmentEntity AddNewAttachment(AttachmentEntity attachment)
        {
            Mapper.CreateMap<AttachmentEntity, CDDGAttachment>();
            var a = Mapper.Map<AttachmentEntity, CDDGAttachment>(attachment);
            var result = attachmentdataaccess.AddNew(a);
            //todo: use automapper to do reverse mapping
            attachment.AttachmentID = result.AttachmentID;
            return attachment;
        }

        public int Delete(PEPEntity PEP)
        {
            var a = Mapper.Map<CDDGPep>(PEP);
            var result = pepdetailsdataccess.Delete(a);
            return result;
        }

        public DashBoardViewModel GetAllPendingApprovalPEPForms()
        {
            DashBoardViewModel dashboard = new DashBoardViewModel();

            var pepList = pepdetailsdataccess.FindAllBy(x => x.DeterminationUpdationDate == null && x.EndDate == null);
            Mapper.CreateMap<CDDGPep, PEPEntity>();
            var pepDetails = Mapper.Map<IEnumerable<CDDGPep>, IEnumerable<PEPEntity>>(pepList);

　
　
　
　
　
            return dashboard;
        }

        public IEnumerable<EcnEntity> GetEcnByPepId(int? pepid)
        {
            var ecnList = ecndataaccess.FindAllBy(x => x.PepId == pepid && x.EndDate == null);
            Mapper.CreateMap<CDDGEcn, EcnEntity>();
            var result = Mapper.Map<IEnumerable<CDDGEcn>, IEnumerable<EcnEntity>>(ecnList);
            // var list = Mapper.Map<IEnumerable<PEPEntity>>(pepList);
            return result;
        }

        public IEnumerable<PEPEntity> GetAllPEPDetails()
        {
            var pepList = pepdetailsdataccess.GetAll();
            Mapper.CreateMap<CDDGPep, PEPEntity>();
            var result = Mapper.Map<IEnumerable<CDDGPep>, IEnumerable<PEPEntity>>(pepList);
            // var list = Mapper.Map<IEnumerable<PEPEntity>>(pepList);

            return result;
        }

        public DashBoardViewModel GetAllPEPFormsCreatedByLOBUser(string userId)
        {
            DashBoardViewModel dashBoard = new DashBoardViewModel();
            DisplayPepInformationListViewModel peplist = new DisplayPepInformationListViewModel();
            List<DisplayListViewModel> pepDetails = new List<DisplayListViewModel>();

            var pepList = pepdetailsdataccess.FindAllBy(x => x.PepRequestStatusId != 4 && x.CreatedBy == userId && x.EndDate == null);
            foreach (var cddg in pepList)
            {
                cddg.CDDGEcns = cddg.CDDGEcns.Where(x => x.PepRequestStatusID == 1 && x.PepId == cddg.PepId && x.EndDate == null).ToList();
                cddg.CDDGLobPeps = cddg.CDDGLobPeps.Where(x => x.PepRequestStatusID == 1 && x.PepId == cddg.PepId && x.EndDate == null).ToList();
                cddg.CDDGAttachments = cddg.CDDGAttachments.Where(x => x.PepRequestStatusID == 1 && x.PepId == cddg.PepId && x.EndDate == null).ToList();
                cddg.CDDGPrimaryPeps = cddg.CDDGPrimaryPeps.Where(x => x.PepRequestStatusID == 1 && x.PepId == cddg.PepId && x.EndDate == null).ToList();
                foreach (var l in cddg.CDDGPrimaryPeps)
                {
                    l.CDDGPrimaryPepCountryLobs = l.CDDGPrimaryPepCountryLobs.Where(x => x.EndDate == null).ToList();
                }
                // cddg.CDDGRequestAssignments = cddg.CDDGRequestAssignments.Where(x => x.PepRequestStatusID == 1 && x.PepId == cddg.PepId && x.EndDate == null).ToList();
            }
            Mapper.CreateMap<CDDGPep, DisplayListViewModel>();
            Mapper.CreateMap<PEPEntity, CDDGPep>();

            //All pending requests
            DisplayPepInformationListViewModel peplist1 = new DisplayPepInformationListViewModel();
            var pepids1 = pepList.Where(x => x.PepRequestStatusId == 1).Select(x => x.PepId).ToList();
            var pepdetails1 = GetPepDetailsFromPepIds(pepids1);
            pepDetails = Mapper.Map<List<CDDGPep>, List<DisplayListViewModel>>(pepdetails1);
            pepDetails = GetSLADetails(pepDetails);

            pepDetails.Where(x => x.Status != null && x.Status.ToUpper() == "COMPLETED").ToList().ForEach(x => x.SLAExpiryTime = "0");
            peplist1.PepList = pepDetails;
            peplist1.HeaderInfo = "Pending Requests";
            dashBoard.UserPendingRequests = peplist1;

            //All CR requests
            DisplayPepInformationListViewModel peplist2 = new DisplayPepInformationListViewModel();
            var pepids2 = pepList.Where(x => x.PepRequestStatusId == 2).Select(x => x.PepId).ToList();
            //var pepdetails2 = GetPepDetailsFromPepIds(pepids2);
            List<int?> pepids = pepids2.Select(i => (int?)i).ToList();
            List<DisplayListViewModel> pepDetailsCR = new List<DisplayListViewModel>(); ;

            var pepdetailscr = GetPEPCRDetails(pepids);
            List<int> pepwithcrs = pepdetailscr.Select(x => x.ChangeRequestId).ToList();

            foreach (var crid in pepwithcrs)
            {

                var pep = GetSinglePEPbyidforCRbyCRid(crid);
                var crnoid = changeRequestDataAccess.FindSingleBy(x => x.ChangeRequestId == crid);

　
                //int pepidcurrent = pep.PepId;
                var display = Mapper.Map<CDDGPep, DisplayListViewModel>(pep);

                //List<int> pepwithcrs1 = pepdetailscr.Where(x => x.PepId == pep.PepId).Select(x => x.ChangeRequestId).ToList();
                //Dictionary<int?, List<int>> pepwithcr = new Dictionary<int?, List<int>>();
                //pepwithcr.Add(pep.PepId, pepwithcrs1);
                display.ChangeRequestId = crid;
                display.pepidwithcrid = pep.PepId.ToString() + "- " + crnoid.CrNo.ToString();

                //display.pepidwithcrid = pepwithcr;
                pepDetailsCR.Add(display);

            }

　
            // var pepdetailscr = GetPEPCRDetails(pepids);

            //  var cpmpletepepdetailsforCR = Mapper.Map<IEnumerable<PEPEntity>, IEnumerable<CDDGPep>>(pepforCR);
            //pepDetails = Mapper.Map<List<CDDGPep>, List<DisplayListViewModel>>(pepforCR);
            var pepidsforcancelled = pepList.Where(x => x.PepRequestStatusId == 3 || x.PepRequestStatusId == 6).Select(x => x.PepId).ToList();
            var pepdetailscancelled = GetPepDetailsFromPepIds(pepidsforcancelled);

            var pepDetailscancelled = Mapper.Map<List<CDDGPep>, List<DisplayListViewModel>>(pepdetailscancelled);
            pepDetailsCR.AddRange(pepDetailscancelled);
            pepDetailsCR = GetSLADetails(pepDetailsCR);
            peplist2.HeaderInfo = "Change/Canceled Requests";
            peplist2.PepList = pepDetailsCR.OrderBy(x => x.CreatedTS).ToList();
            dashBoard.UserCRRequests = peplist2;

            //SLA
            var pepIdsforSLA = pepList.Select(j => j.PepId).ToList();
            var holidaylist = holidayCalenderDataAccess.GetAll().Select(i => i.HolidayDate).ToList();
            int countdate = 0;
            Dictionary<string, List<string>> pepwithCounterDate = new Dictionary<string, List<string>>();
            List<string> counterdate = new List<string>();
            pepList.ToList().ForEach(y =>
            {
                for (DateTime date = y.CreatedTS; date.Date <= y.CreatedTS.AddHours(72); date = date.AddDays(1))
                {
                    foreach (DateTime holidaydate in holidaylist)
                    {
                        if (holidaydate.ToString("d").Equals(date.ToString("d")))
                        {
                            countdate++;
                            counterdate.Add(countdate.ToString());
                        }
                    }
                }
                if (counterdate.Count > 0)
                {
                    if (!pepwithCounterDate.Keys.Contains(y.PepId.ToString()))
                    {
                        pepwithCounterDate.Add(y.PepId.ToString(), counterdate);
                        int index = pepIdsforSLA.IndexOf(y.PepId);
                        pepIdsforSLA.RemoveAt(index);
                    }
                }

                countdate = 0;
                counterdate = new List<string>();
            });

            List<int> pepIDlistSLAsaturday;
            List<int> pepIDlistSLAsunday;
            List<int> pepIDlistSLA;
            List<int> pepIDSLAsaturday = new List<int>();
            List<int> pepIDSLAsunday = new List<int>();
            List<int> pepIDSLA = new List<int>();
            if (pepwithCounterDate.Count > 0)
            {
                foreach (var pepid in pepwithCounterDate)
                {

                    pepIDSLAsaturday = pepList.Where(x => x.PepId == Int32.Parse(pepid.Key) && x.CreatedTS.DayOfWeek.ToString() == "Saturday").Where(x => x.CreatedTS.Add(new TimeSpan(2 + Int32.Parse(pepid.Value.Last()), 0, 0, 0)).AddHours(72) <= DateTime.Now.AddHours(24)).ToList().Select(x => x.PepId).ToList();
                    pepIDSLAsunday = pepList.Where(x => x.PepId == Int32.Parse(pepid.Key) && x.CreatedTS.DayOfWeek.ToString() == "Sunday").Where(x => x.CreatedTS.Add(new TimeSpan(1 + Int32.Parse(pepid.Value.Last()), 0, 0, 0)).AddHours(72) <= DateTime.Now.AddHours(24)).ToList().Select(x => x.PepId).ToList();
                    pepIDSLA = pepList.Where(x => x.PepId == Int32.Parse(pepid.Key) && x.CreatedTS.AddDays(Int32.Parse(pepid.Value.Last())).AddHours(72) <= DateTime.Now.AddHours(24)).ToList().Select(x => x.PepId).ToList();

                }

            }
            pepIDlistSLAsaturday = pepList.Where(x => pepIdsforSLA.Contains(x.PepId) && (x.PepRequestStatusId == 1 || x.PepRequestStatusId == 2) && x.CreatedTS.DayOfWeek.ToString() == "Saturday").Where(x => x.CreatedTS.Add(new TimeSpan(2, 0, 0, 0)).AddHours(72) <= DateTime.Now.AddHours(24)).ToList().Select(x => x.PepId).ToList();
            pepIDlistSLAsunday = pepList.Where(x => pepIdsforSLA.Contains(x.PepId) && (x.PepRequestStatusId == 1 || x.PepRequestStatusId == 2) && x.CreatedTS.DayOfWeek.ToString() == "Sunday").Where(x => x.CreatedTS.Add(new TimeSpan(1, 0, 0, 0)).AddHours(72) <= DateTime.Now.AddHours(24)).ToList().Select(x => x.PepId).ToList();
            pepIDlistSLA = pepList.Where(x => pepIdsforSLA.Contains(x.PepId) && (x.PepRequestStatusId == 1 || x.PepRequestStatusId == 2) && x.CreatedTS.AddHours(72) <= DateTime.Now.AddHours(24)).ToList().Select(x => x.PepId).ToList();

            if (pepIDSLAsaturday.Count > 0)
                pepIDlistSLAsaturday.AddRange(pepIDSLAsaturday);
            if (pepIDSLAsunday.Count > 0)
                pepIDlistSLAsunday.AddRange(pepIDSLAsunday);
            if (pepIDSLA.Count > 0)
                pepIDlistSLA.AddRange(pepIDSLA);

            pepIDlistSLA.AddRange(pepIDlistSLAsaturday);
            pepIDlistSLA.AddRange(pepIDlistSLAsunday);

            List<CDDGPep> peplist4 = GetPepDetailsFromPepIds(pepIDlistSLA);
            DisplayPepInformationListViewModel peplist3 = new DisplayPepInformationListViewModel();
            pepDetails = Mapper.Map<List<CDDGPep>, List<DisplayListViewModel>>(peplist4);
            pepDetails = GetSLADetails(pepDetails);
            peplist3.HeaderInfo = "Requests Approaching SLA";
            peplist3.PepList = pepDetails.OrderBy(x => x.CreatedTS).ToList();
            dashBoard.UserSLARequests = peplist3;

            //Rejected
            var pepIDlistRejected = pepList.Where(x => x.PepRequestStatusId == 5).Select(x => x.PepId).ToList();
            List<CDDGPep> peplist5 = GetPepDetailsFromPepIds(pepIDlistRejected);
            DisplayPepInformationListViewModel peplistR = new DisplayPepInformationListViewModel();
            pepDetails = Mapper.Map<List<CDDGPep>, List<DisplayListViewModel>>(peplist5);
            pepDetails = GetSLADetails(pepDetails);
            peplistR.HeaderInfo = "Rejected Requests";
            peplistR.PepList = pepDetails;
            dashBoard.UserRejectedRequests = peplistR;

　
            return dashBoard;
        }

        private List<DisplayListViewModel> GetSLADetails(List<DisplayListViewModel> pepDetails)
        {
            var holidaylist = holidayCalenderDataAccess.GetAll().Select(i => i.HolidayDate).ToList();
            int countdate = 0;
            var pepIdsforSLA = pepDetails.Select(x => x.PepId).ToList();
            Dictionary<string, List<string>> pepwithCounterDate = new Dictionary<string, List<string>>();
            List<string> counterdate = new List<string>();
            pepDetails.ToList().ForEach(y =>
            {
                for (DateTime date = y.CreatedTS; date.Date <= y.CreatedTS.AddHours(72); date = date.AddDays(1))
                {
                    foreach (DateTime holidaydate in holidaylist)
                    {
                        if (holidaydate.ToString("d").Equals(date.ToString("d")))
                        {
                            countdate++;
                            counterdate.Add(countdate.ToString());
                        }
                    }
                }
                if (counterdate.Count > 0)
                {
                    if (!pepwithCounterDate.Keys.Contains(y.PepId.ToString()))
                    {
                        pepwithCounterDate.Add(y.PepId.ToString(), counterdate);
                        int index = pepIdsforSLA.IndexOf(y.PepId);
                        pepIdsforSLA.RemoveAt(index);
                    }
                    
                }

                countdate = 0;
                counterdate = new List<string>();
            });

            

            pepDetails.ToList().ForEach(x =>
            {
                if (x.CreatedTS.DayOfWeek.ToString() == "Saturday")
                {
                    if (pepwithCounterDate.Count > 0)
                    {
                        foreach (var pepid in pepwithCounterDate)
                        {
                            if (x.PepId == Int32.Parse(pepid.Key))
                            {
                                x.SLAExpiryTime = x.CreatedTS.Add(new TimeSpan(2 + Int32.Parse(pepid.Value.Last()), 0, 0, 0)).AddHours(72).ToString("h:mm tt");
                                x.SLAExpiryDate = x.CreatedTS.Add(new TimeSpan(2 + Int32.Parse(pepid.Value.Last()), 0, 0, 0)).AddHours(72).ToString("d");
                            }
                            else {
                                x.SLAExpiryTime = x.CreatedTS.Add(new TimeSpan(2, 0, 0, 0)).AddHours(72).ToString("h:mm tt");
                                x.SLAExpiryDate = x.CreatedTS.Add(new TimeSpan(2, 0, 0, 0)).AddHours(72).ToString("d");
                            }
                        }
                    }
                    else {
                        x.SLAExpiryTime = x.CreatedTS.Add(new TimeSpan(2, 0, 0, 0)).AddHours(72).ToString("h:mm tt");
                        x.SLAExpiryDate = x.CreatedTS.Add(new TimeSpan(2, 0, 0, 0)).AddHours(72).ToString("d");
                    }
                }
                if (x.CreatedTS.DayOfWeek.ToString() == "Sunday")
                {
                    if (pepwithCounterDate.Count > 0)
                    {
                        foreach (var pepid in pepwithCounterDate)
                        {
                            if (x.PepId == Int32.Parse(pepid.Key))
                            {
                                x.SLAExpiryTime = x.CreatedTS.Add(new TimeSpan(1 + Int32.Parse(pepid.Value.Last()), 0, 0, 0)).AddHours(72).ToString("h:mm tt");
                                x.SLAExpiryDate = x.CreatedTS.Add(new TimeSpan(1 + Int32.Parse(pepid.Value.Last()), 0, 0, 0)).AddHours(72).ToString("d");
                            }
                            else {
                                x.SLAExpiryTime = x.CreatedTS.Add(new TimeSpan(1, 0, 0, 0)).AddHours(72).ToString("h:mm tt");
                                x.SLAExpiryDate = x.CreatedTS.Add(new TimeSpan(1, 0, 0, 0)).AddHours(72).ToString("d");
                            }
                        }
                    }
                    else {
                        x.SLAExpiryTime = x.CreatedTS.Add(new TimeSpan(1, 0, 0, 0)).AddHours(72).ToString("h:mm tt");
                        x.SLAExpiryDate = x.CreatedTS.Add(new TimeSpan(1, 0, 0, 0)).AddHours(72).ToString("d");
                    }
                }
                if (x.CreatedTS.DayOfWeek.ToString() != "Sunday" || x.CreatedTS.DayOfWeek.ToString() != "Saturday")
                {
                    if (pepwithCounterDate.Count > 0)
                    {
                        foreach (var pepid in pepwithCounterDate)
                        {
                            if (x.PepId == Int32.Parse(pepid.Key))
                            {
                                x.SLAExpiryTime = x.CreatedTS.Add(new TimeSpan(Int32.Parse(pepid.Value.Last()), 0, 0, 0)).AddHours(72).ToString("h:mm tt");
                                x.SLAExpiryDate = x.CreatedTS.Add(new TimeSpan(Int32.Parse(pepid.Value.Last()), 0, 0, 0)).AddHours(72).ToString("d");
                            }
                            else {
                                x.SLAExpiryTime = x.CreatedTS.AddHours(72).ToString("h:mm tt");
                                x.SLAExpiryDate = x.CreatedTS.AddHours(72).ToString("d");
                            }
                        }
                    }
                    else
                    {
                        x.SLAExpiryTime = x.CreatedTS.AddHours(72).ToString("h:mm tt");
                        x.SLAExpiryDate = x.CreatedTS.AddHours(72).ToString("d");
                    }
                }

　
            });

            return pepDetails;
        }

        private CDDGPep GetSinglePEPbyidforCRbyCRid(int crid)
        {
            CDDGPep cddgpep = new CDDGPep();
            var pep = changeRequestDataAccess.GetAll().Where(x => x.ChangeRequestId == crid && x.EndDate == null).FirstOrDefault();
            //int crcount = pep.Count();

　
            //foreach (CDDGChangeRequest crpep in pep)
            // {
            Mapper.CreateMap<CDDGChangeRequest, CDDGPep>();
            cddgpep = Mapper.Map<CDDGPep>(pep);

            cddgpep.CDDGEcns = ecndataaccess.GetAll().Where(x => x.PepId == pep.PepId && x.PepRequestStatusID == 2 && x.ChangeRequestID == pep.ChangeRequestId).ToList();
            cddgpep.CDDGLobPeps = lobpepdataaccess.GetAll().Where(x => x.PepId == pep.PepId && x.PepRequestStatusID == 2 && x.ChangeRequestID == pep.ChangeRequestId).ToList();
            cddgpep.CDDGAttachments = attachmentdataaccess.GetAll().Where(x => x.PepId == pep.PepId && x.PepRequestStatusID == 2 && x.ChangeRequestID == pep.ChangeRequestId).ToList();
            cddgpep.CDDGPrimaryPeps = primarypepdataaccess.GetAll().Where(x => x.PepId == pep.PepId && x.PepRequestStatusID == 2 && x.ChangeRequestID == pep.ChangeRequestId).ToList();

            cddgpep.CDDGRequestAssignments = requestAssignmentDataAccess.GetAll().Where(x => x.PepId == pep.PepId).ToList();
            cddgpep.CreatedTS = pepdetailsdataccess.FindSingleBy(x => x.PepId == pep.PepId).CreatedTS;

            return cddgpep;
            // }

　
　
　
            //Mapper.CreateMap<CDDGPep, PEPEntity>();
            //var result = Mapper.Map<PEPEntity>(cddgpep);
            //result.PepRequestStatus = result.PEPRequestStatu.StatusName;

            ////todo: change the Email to UserAcc.
            //var ue = userDetailsDataAccess.FindSingleBy(x => x.Email == result.CreatedBy);
            //Mapper.CreateMap<CDDGUser, UserEntity>();
            //var user = Mapper.Map<UserEntity>(ue);

            //result.RequestorFirstName = user.FirstName;
            //result.RequestorLastName = user.LastName;
            //result.RequestorAU = user.AU;
            //result.RequestorEmail = user.Email;

            //if (result.Ecns != null)
            //{

            //    result.ECN = new List<string>();
            //    result.Flagged = new List<string>();
            //    result.DateFlagged = new List<string>();
            //    foreach (var ecna in result.Ecns)
            //    {
            //        result.ECN.Add(ecna.ECN);
            //        if (ecna.IsFlagged == true)
            //        {
            //            result.Flagged.Add("Y");
            //            result.DateFlagged.Add(ecna.DateFlagged.ToString());
            //        }
            //        else if (ecna.IsFlagged == false)
            //        {
            //            result.Flagged.Add("N");
            //            result.DateFlagged.Add("");
            //        }
            //        else
            //        {
            //            result.Flagged.Add("");
            //            result.DateFlagged.Add("");
            //        }
            //    }

            //}

　
            //if ((result.Attachments != null) && (result.Attachments.Count > 0))
            //{
            //    result.Attachment = result.Attachments.ToList().First();
            //}

            //if (result.Customer != null)
            //{
            //    result.Customer_Name = result.Customer.CustomerName;
            //    result.CustomerStatusId = result.Customer.CustomerStatu.StatusId.ToString();
            //    if (result.Customer.IsEntity == true)
            //    {
            //        result.CustomerType = "Entity";
            //        result.PEPEntityName = result.Customer.EntityName;
            //        result.EntityFormationCountry = result.Customer.EntityFormationCountry.ToString();
            //    }
            //    else
            //    {
            //        result.CustomerType = "Individual";
            //        result.IndividualFirstName = result.Customer.IndividualFirstName;
            //        result.IndividualLastName = result.Customer.IndividualLastName;
            //        result.IndividualMiddleName = result.Customer.IndividualMiddleName;
            //        result.IndividualLastName2 = result.Customer.IndividualLastName2;
            //        result.IndividualAKAName = result.Customer.IndividualAKAName;
            //        result.DateofBirth = result.Customer.IndividualDoB;
            //        result.CountryofcitizenshipId = result.Customer.IndividualCitizenshipCountry;
            //    }

　
            //}

　
            //if (result.LobPeps != null)
            //{
            //    result.LOB = result.LobPeps.Select(x => x.Lob.LobId.ToString()).ToList();
            //    result.MajorLOB = result.LobPeps.Select(x => x.Lob.MajorLob.MajorLOBName).ToList();
            //}

            //if (pep.CDDGPrimaryPeps != null)
            //{
            //    result.PrimaryPepFirstName = pep.CDDGPrimaryPeps.Select(x => x.FirstName).ToList();
            //    result.PrimaryPepLastName = pep.CDDGPrimaryPeps.Select(x => x.LastName).ToList();
            //    result.PrimaryPepLastName2 = pep.CDDGPrimaryPeps.Select(x => x.LastName2).ToList();
            //    result.PrimaryPepMiddleName = pep.CDDGPrimaryPeps.Select(x => x.MiddleName).ToList();
            //    result.PrimaryPepAKAName = pep.CDDGPrimaryPeps.Select(x => x.AKAName).ToList();
            //    result.PrimaryPepPosition = pep.CDDGPrimaryPeps.Select(x => x.PrimaryPepPositionId.ToString()).ToList();
            //    result.PrimaryPepAssociation = pep.CDDGPrimaryPeps.Select(x => x.PrimaryPepAssociationId.ToString()).ToList();
            //    result.PepAssociatedCountry = pep.CDDGPrimaryPeps.Select(x => x.PrimaryPepAssociatedCountryId.ToString()).ToList();
            //    result.PrimaryPepCountry = pep.CDDGPrimaryPeps.Select(x => x.PrimaryPepCountryId.ToString()).ToList();
            //    result.PrimaryPepBSAApproval = pep.CDDGPrimaryPeps.Select(x => x.CountryBSAApprovalId.ToString()).ToList();
            //    //result.PrimaryPepCountryRiskDesignation = pep.CDDGPrimaryPeps.Select(x => x.CountryRiskDesignationId.ToString()).ToList();
            //    result.PrimaryPepCountryRiskDesignation = pep.CDDGPrimaryPeps.Select(x => x.CDDGCountry1.CDDGCountryRiskDesignation.RiskDesignation).ToList();
            //    result.PrimaryPepCountryLobDate = pep.CDDGPrimaryPeps.Select(x => x.CountryLobDate.ToString()).ToList();

            //    result.PrimarypepCountryLOB = new List<List<string>>();
            //    result.PrimarypepCountryLOBCSV = new List<string>();
            //    foreach (var l in pep.CDDGPrimaryPeps)
            //    {
            //        if (l.CDDGPrimaryPepCountryLobs != null)
            //        {
            //            var loblist = l.CDDGPrimaryPepCountryLobs.Select(x => x.LobId.ToString()).ToList();
            //            result.PrimarypepCountryLOB.Add(loblist);
            //            result.PrimarypepCountryLOBCSV.Add(String.Join(",", loblist.ToArray()));
            //        }
            //        else
            //        {
            //            result.PrimarypepCountryLOB.Add(new List<string>());
            //            result.PrimarypepCountryLOBCSV.Add("");
            //        }
            //    }

            //}
            //if (result.IsPep == true)
            //{
            //    result.Pep = "Y";
            //}
            //else if (result.IsPep == false)
            //{
            //    result.Pep = "N";
            //}

            ////result.PrimaryPepCountry = new List<string>();
            ////result.PrimaryPepBSAApproval = new List<string>();
            ////result.PrimaryPepCountryRiskDesignation = new List<string>();
            ////result.PrimaryPepCountryLobDate = new List<string>();

            ////List<string> changedproperties = ComparePEPs(pepid, result);
            ////result.changedpropertiesforCR = changedproperties;
            //return result;
        }

        private List<CDDGChangeRequest> GetPEPCRDetails(List<int?> pepids2)
        {
            return changeRequestDataAccess.GetAll().Where(x => pepids2.Contains(x.PepId) && x.EndDate == null).ToList();
        }

        private List<CDDGPep> GetPepDetailsFromPepIds(List<int> pepIDlistSLA)
        {
            return pepdetailsdataccess.GetAllPepWithChildDetails().Where(x => pepIDlistSLA.Contains(x.PepId)).ToList();
        }

　
        public SearchDetailsViewModel GetPEPSearchDetails(SearchPEPEntity searchDetails)
        {

            SearchDetailsViewModel result = new SearchDetailsViewModel();

            //var item = GetAllPEPDetails();
            var item = pepdetailsdataccess.GetAllPepWithChildDetails();

            //IEnumerable<CDDGPep> item = new List<CDDGPep>();

            foreach (var cddg in item)
            {
                cddg.CDDGEcns = cddg.CDDGEcns.Where(x => x.PepRequestStatusID == 1 && x.PepId == cddg.PepId && x.EndDate == null).ToList();
                cddg.CDDGLobPeps = cddg.CDDGLobPeps.Where(x => x.PepRequestStatusID == 1 && x.PepId == cddg.PepId && x.EndDate == null).ToList();
                cddg.CDDGAttachments = cddg.CDDGAttachments.Where(x => x.PepRequestStatusID == 1 && x.PepId == cddg.PepId && x.EndDate == null).ToList();
                cddg.CDDGPrimaryPeps = cddg.CDDGPrimaryPeps.Where(x => x.PepRequestStatusID == 1 && x.PepId == cddg.PepId && x.EndDate == null).ToList();
                foreach (var l in cddg.CDDGPrimaryPeps)
                {
                    l.CDDGPrimaryPepCountryLobs = l.CDDGPrimaryPepCountryLobs.Where(x => x.EndDate == null).ToList();
                }
                //cddg.CDDGRequestAssignments = cddg.CDDGRequestAssignments.Where(x => x.PepRequestStatusID == 1 && x.PepId == cddg.PepId && x.EndDate == null).ToList();
            }

            if (searchDetails.filter == "Contains")
            {
                if (searchDetails.pepid != 0)
                {
                    if (!string.IsNullOrWhiteSpace(Convert.ToString(searchDetails.pepid)))
                    {
                        item = item.Where(s => s.PepId.ToString().Contains(Convert.ToString(searchDetails.pepid)));
                    }
                }
                if (!string.IsNullOrWhiteSpace(searchDetails.ecn))
                {
                    item = item.Where(s => s.CDDGEcns.Count > 0 && s.CDDGEcns.Any(x => x.Ecn.ToLower().Contains(searchDetails.ecn.ToLower())));
                }
                if (!string.IsNullOrWhiteSpace(searchDetails.customername))
                {
                    item = item.Where(s => s.CDDGCustomer != null && s.CDDGCustomer.CustomerName.ToLower().Contains(searchDetails.customername.ToLower()));
                }
                if (!string.IsNullOrWhiteSpace(searchDetails.entity))
                {
                    item = item.Where(s => s.CDDGCustomer != null && (bool)s.CDDGCustomer.IsEntity ? s.CDDGCustomer.EntityName.ToLower().Contains(searchDetails.entity.ToLower()) : s.CDDGCustomer.IndividualFirstName.ToLower().Contains(searchDetails.entity.ToLower()));
                }
                if (!string.IsNullOrWhiteSpace(searchDetails.primarypep))
                {
                    item = item.Where(s => s.CDDGPrimaryPeps.Count > 0 && s.CDDGPrimaryPeps.Any(x => x.FirstName.ToLower().Contains(searchDetails.primarypep.ToLower()) || x.LastName.ToLower().Contains(searchDetails.primarypep.ToLower()) || (x.MiddleName != null && x.MiddleName.ToLower().Contains(searchDetails.primarypep.ToLower())) || (x.LastName2 != null && x.LastName2.ToLower().Contains(searchDetails.primarypep.ToLower())) || x.AKAName.ToLower().Contains(searchDetails.primarypep.ToLower())));
                }
                if (!string.IsNullOrWhiteSpace(searchDetails.wcis))
                {
                        item = item.Where(s => !string.IsNullOrWhiteSpace(s.WCISNumber) && s.WCISNumber.ToString().Contains(searchDetails.wcis));
                }
                
            }
            if (searchDetails.filter == "StartsWith")
            {
                if (searchDetails.pepid != 0)
                {
                    if (!string.IsNullOrWhiteSpace(Convert.ToString(searchDetails.pepid)))
                    {
                        item = item.Where(s => s.PepId.ToString().StartsWith(Convert.ToString(searchDetails.pepid)));
                    }
                }
                if (!string.IsNullOrWhiteSpace(searchDetails.ecn))
                {
                    item = item.Where(s => s.CDDGEcns.Count > 0 && s.CDDGEcns.Any(x => x.Ecn.ToLower().StartsWith(searchDetails.ecn.ToLower())));
                }
                if (!string.IsNullOrWhiteSpace(searchDetails.customername))
                {
                    item = item.Where(s => s.CDDGCustomer != null && s.CDDGCustomer.CustomerName.ToLower().StartsWith(searchDetails.customername.ToLower()));
                }
                if (!string.IsNullOrWhiteSpace(searchDetails.entity))
                {
                    item = item.Where(s => s.CDDGCustomer != null && (bool)s.CDDGCustomer.IsEntity ? s.CDDGCustomer.EntityName.ToLower().StartsWith(searchDetails.entity.ToLower()) : s.CDDGCustomer.IndividualFirstName.ToLower().StartsWith(searchDetails.entity.ToLower()));
                }
                if (!string.IsNullOrWhiteSpace(searchDetails.primarypep))
                {
                    item = item.Where(s => s.CDDGPrimaryPeps.Count > 0 && s.CDDGPrimaryPeps.Any(x => x.FirstName.ToLower().StartsWith(searchDetails.primarypep.ToLower()) || x.LastName.ToLower().StartsWith(searchDetails.primarypep.ToLower()) || (x.MiddleName != null && x.MiddleName.ToLower().StartsWith(searchDetails.primarypep.ToLower())) || (x.LastName2 != null && x.LastName2.ToLower().StartsWith(searchDetails.primarypep.ToLower())) || x.AKAName.ToLower().StartsWith(searchDetails.primarypep.ToLower())));
                }

                if (!string.IsNullOrWhiteSpace(searchDetails.wcis))
                {
                    item = item.Where(s => !string.IsNullOrWhiteSpace(s.WCISNumber) && s.WCISNumber.ToString().StartsWith(searchDetails.wcis));
                }
                
            }
            if (searchDetails.filter == "EndsWith")
            {
                if (searchDetails.pepid != 0)
                {
                    if (!string.IsNullOrWhiteSpace(Convert.ToString(searchDetails.pepid)))
                    {
                        item = item.Where(s => s.PepId.ToString().EndsWith(Convert.ToString(searchDetails.pepid)));
                    }
                }
                if (!string.IsNullOrWhiteSpace(searchDetails.ecn))
                {
                    item = item.Where(s => s.CDDGEcns.Count > 0 && s.CDDGEcns.Any(x => x.Ecn.ToLower().EndsWith(searchDetails.ecn.ToLower())));
                }
                if (!string.IsNullOrWhiteSpace(searchDetails.customername))
                {
                    item = item.Where(s => s.CDDGCustomer != null && s.CDDGCustomer.CustomerName.ToLower().EndsWith(searchDetails.customername.ToLower()));
                }
                if (!string.IsNullOrWhiteSpace(searchDetails.entity))
                {
                    item = item.Where(s => s.CDDGCustomer != null && (bool)s.CDDGCustomer.IsEntity ? s.CDDGCustomer.EntityName.ToLower().EndsWith(searchDetails.entity.ToLower()) : s.CDDGCustomer.IndividualFirstName.ToLower().EndsWith(searchDetails.entity.ToLower()));
                }
                if (!string.IsNullOrWhiteSpace(searchDetails.primarypep))
                {
                    item = item.Where(s => s.CDDGPrimaryPeps.Count > 0 && s.CDDGPrimaryPeps.Any(x => x.FirstName.ToLower().EndsWith(searchDetails.primarypep.ToLower()) || x.LastName.ToLower().EndsWith(searchDetails.primarypep.ToLower()) || (x.MiddleName != null && x.MiddleName.ToLower().EndsWith(searchDetails.primarypep.ToLower())) || (x.LastName2 != null && x.LastName2.ToLower().EndsWith(searchDetails.primarypep.ToLower())) || x.AKAName.ToLower().EndsWith(searchDetails.primarypep.ToLower())));
                }
                if (!string.IsNullOrWhiteSpace(searchDetails.wcis))
                {
                    item = item.Where(s => !string.IsNullOrWhiteSpace(s.WCISNumber) && s.WCISNumber.ToString().EndsWith(searchDetails.wcis));
                }
                
            }
            if (searchDetails.filter == "ExactMatch")
            {
                if (searchDetails.pepid != 0)
                {
                    if (!string.IsNullOrWhiteSpace(Convert.ToString(searchDetails.pepid)))
                    {
                        item = item.Where(s => s.PepId.ToString().Equals(Convert.ToString(searchDetails.pepid)));
                    }
                }
                if (!string.IsNullOrWhiteSpace(searchDetails.ecn))
                {
                    item = item.Where(s => s.CDDGEcns.Count > 0 && s.CDDGEcns.Any(x => x.Ecn.ToLower().Equals(searchDetails.ecn.ToLower())));
                }
                if (!string.IsNullOrWhiteSpace(searchDetails.customername))
                {
                    item = item.Where(s => s.CDDGCustomer != null && s.CDDGCustomer.CustomerName.ToLower().Equals(searchDetails.customername.ToLower()));
                }
                if (!string.IsNullOrWhiteSpace(searchDetails.entity))
                {
                    item = item.Where(s => s.CDDGCustomer != null && (bool)s.CDDGCustomer.IsEntity ? s.CDDGCustomer.EntityName.ToLower().Equals(searchDetails.entity.ToLower()) : s.CDDGCustomer.IndividualFirstName.ToLower().Equals(searchDetails.entity.ToLower()));
                }
                if (!string.IsNullOrWhiteSpace(searchDetails.primarypep))
                {
                    item = item.Where(s => s.CDDGPrimaryPeps.Count > 0 && s.CDDGPrimaryPeps.Any(x => x.FirstName.ToLower().Equals(searchDetails.primarypep.ToLower()) || x.LastName.ToLower().Equals(searchDetails.primarypep.ToLower()) || (x.MiddleName != null && x.MiddleName.ToLower().Equals(searchDetails.primarypep.ToLower())) || (x.LastName2 != null && x.LastName2.ToLower().Equals(searchDetails.primarypep.ToLower())) || x.AKAName.ToLower().Equals(searchDetails.primarypep.ToLower())));
                }
                if (!string.IsNullOrWhiteSpace(searchDetails.wcis))
                {
                   item = item.Where(s => !string.IsNullOrWhiteSpace(s.WCISNumber) && s.WCISNumber.ToString().Equals(searchDetails.wcis));
                }
                
            }

            if (searchDetails.typeofSearch == "CR")
            {
                item = item.Where(x => x.CreatedBy == searchDetails.userid && x.EndDate == null).ToList();
            }

            var pepDetails = Mapper.Map<IEnumerable<CDDGPep>, IEnumerable<DisplayListViewModel>>(item);

            var holidaylist = holidayCalenderDataAccess.GetAll().Select(i => i.HolidayDate).ToList();
            int countdate = 0;
            var pepIdsforSLA = pepDetails.Select(x => x.PepId).ToList();
            Dictionary<string, List<string>> pepwithCounterDate = new Dictionary<string, List<string>>();
            List<string> counterdate = new List<string>();
            pepDetails.ToList().ForEach(y =>
            {
                for (DateTime date = y.CreatedTS; date.Date <= y.CreatedTS.AddHours(72); date = date.AddDays(1))
                {
                    foreach (DateTime holidaydate in holidaylist)
                    {
                        if (holidaydate.ToString("d").Equals(date.ToString("d")))
                        {
                            countdate++;
                            counterdate.Add(countdate.ToString());
                        }
                    }
                }
                if (counterdate.Count > 0)
                {
                    if (!pepwithCounterDate.Keys.Contains(y.PepId.ToString()))
                    {
                        pepwithCounterDate.Add(y.PepId.ToString(), counterdate);
                        int index = pepIdsforSLA.IndexOf(y.PepId);
                        pepIdsforSLA.RemoveAt(index);
                    }
                }

                countdate = 0;
                counterdate = new List<string>();
            });

　
　
            pepDetails.ToList().ForEach(x =>
            {
                if (x.CreatedTS.DayOfWeek.ToString() == "Saturday")
                {
                    if (pepwithCounterDate.Count > 0)
                    {
                        foreach (var pepid in pepwithCounterDate)
                        {
                            if (x.PepId == Int32.Parse(pepid.Key))
                            {
                                x.SLAExpiryTime = x.CreatedTS.Add(new TimeSpan(2 + Int32.Parse(pepid.Value.Last()), 0, 0, 0)).AddHours(72).ToString("h:mm tt");
                                x.SLAExpiryDate = x.CreatedTS.Add(new TimeSpan(2 + Int32.Parse(pepid.Value.Last()), 0, 0, 0)).AddHours(72).ToString("d");
                            }
                            else {
                                x.SLAExpiryTime = x.CreatedTS.Add(new TimeSpan(2, 0, 0, 0)).AddHours(72).ToString("h:mm tt");
                                x.SLAExpiryDate = x.CreatedTS.Add(new TimeSpan(2, 0, 0, 0)).AddHours(72).ToString("d");
                            }
                        }
                    }
                    else {
                        x.SLAExpiryTime = x.CreatedTS.Add(new TimeSpan(2, 0, 0, 0)).AddHours(72).ToString("h:mm tt");
                        x.SLAExpiryDate = x.CreatedTS.Add(new TimeSpan(2, 0, 0, 0)).AddHours(72).ToString("d");
                    }
                }
                if (x.CreatedTS.DayOfWeek.ToString() == "Sunday")
                {
                    if (pepwithCounterDate.Count > 0)
                    {
                        foreach (var pepid in pepwithCounterDate)
                        {
                            if (x.PepId == Int32.Parse(pepid.Key))
                            {
                                x.SLAExpiryTime = x.CreatedTS.Add(new TimeSpan(1 + Int32.Parse(pepid.Value.Last()), 0, 0, 0)).AddHours(72).ToString("h:mm tt");
                                x.SLAExpiryDate = x.CreatedTS.Add(new TimeSpan(1 + Int32.Parse(pepid.Value.Last()), 0, 0, 0)).AddHours(72).ToString("d");
                            }
                            else {
                                x.SLAExpiryTime = x.CreatedTS.Add(new TimeSpan(1, 0, 0, 0)).AddHours(72).ToString("h:mm tt");
                                x.SLAExpiryDate = x.CreatedTS.Add(new TimeSpan(1, 0, 0, 0)).AddHours(72).ToString("d");
                            }
                        }
                    }
                    else {
                        x.SLAExpiryTime = x.CreatedTS.Add(new TimeSpan(1, 0, 0, 0)).AddHours(72).ToString("h:mm tt");
                        x.SLAExpiryDate = x.CreatedTS.Add(new TimeSpan(1, 0, 0, 0)).AddHours(72).ToString("d");
                    }
                }
                if (x.CreatedTS.DayOfWeek.ToString() != "Sunday" || x.CreatedTS.DayOfWeek.ToString() != "Saturday")
                {
                    if (pepwithCounterDate.Count > 0)
                    {
                        foreach (var pepid in pepwithCounterDate)
                        {
                            if (x.PepId == Int32.Parse(pepid.Key))
                            {
                                x.SLAExpiryTime = x.CreatedTS.Add(new TimeSpan(Int32.Parse(pepid.Value.Last()), 0, 0, 0)).AddHours(72).ToString("h:mm tt");
                                x.SLAExpiryDate = x.CreatedTS.Add(new TimeSpan(Int32.Parse(pepid.Value.Last()), 0, 0, 0)).AddHours(72).ToString("d");
                            }
                            else {
                                x.SLAExpiryTime = x.CreatedTS.AddHours(72).ToString("h:mm tt");
                                x.SLAExpiryDate = x.CreatedTS.AddHours(72).ToString("d");
                            }
                        }
                    }
                    else
                    {
                        x.SLAExpiryTime = x.CreatedTS.AddHours(72).ToString("h:mm tt");
                        x.SLAExpiryDate = x.CreatedTS.AddHours(72).ToString("d");
                    }
                }

　
            });

　
            DisplayPepInformationListViewModel searchResults = new DisplayPepInformationListViewModel();
            searchResults.PepList = pepDetails.ToList();
            searchResults.HeaderInfo = "Search Results";

            result.SearchResult = searchResults;

　
　
            //var result1 = Mapper.Map<IEnumerable<CDDGPep>, IEnumerable<PEPEntity>>(item);
            //// var list = Mapper.Map<IEnumerable<PEPEntity>>(pepList);

            return result;
        }

        public PEPEntity GetSinglePEPbyid(int? pepid)
        {
            var pep = pepdetailsdataccess.FindSingleBy(x => x.PepId == pepid && x.EndDate == null);

            Mapper.CreateMap<CDDGPep, PEPEntity>();
            var result = Mapper.Map<PEPEntity>(pep);

            //filter after automapper is run, to avoid ef change detection issue during pep update
            result.Ecns = result.Ecns.Where(x => x.EndDate == null && x.PepRequestStatusID == 1).ToList();
            result.LobPeps= result.LobPeps.Where(x => x.EndDate == null && x.PepRequestStatusID == 1).ToList();
            result.Attachments= result.Attachments.Where(x => x.EndDate == null && x.PepRequestStatusID == 1).ToList();
            result.PrimaryPeps = result.PrimaryPeps.Where(x => x.EndDate == null && x.PepRequestStatusID == 1).ToList();

            result.PepRequestStatus = result.PEPRequestStatu.StatusName;

            //todo: change the Email to UserAcc.
            var ue = userDetailsDataAccess.FindSingleBy(x => x.LanID == result.CreatedBy);
            Mapper.CreateMap<CDDGUser, UserEntity>();
            var user = Mapper.Map<UserEntity>(ue);

            if (result.RequestorFirstName != null)
            {
                result.RequestorFirstName = user.FirstName;
                result.RequestorLastName = user.LastName;
                result.RequestorAU = user.AU;
                result.RequestorEmail = user.Email;
            }

　
　
            if (result.Ecns != null && result.Ecns.Count > 0)
            {

                result.ECN = new List<string>();
                result.Flagged = new List<string>();
                result.DateFlagged = new List<string>();
                result.PrimaryEcnNotProvided = result.Ecns.ToList()[0].PrimaryEcnNotProvided;
                foreach (var ecna in result.Ecns)
                {
                    result.ECN.Add(ecna.ECN);
                    if (ecna.IsFlagged == true)
                    {
                        result.Flagged.Add("Y");
                        result.DateFlagged.Add(ecna.DateFlagged.HasValue ? ecna.DateFlagged.Value.ToShortDateString() : null);
                    }
                    else if (ecna.IsFlagged == false)
                    {
                        result.Flagged.Add("N");
                        result.DateFlagged.Add("");
                    }
                    else
                    {
                        result.Flagged.Add("");
                        result.DateFlagged.Add("");
                    }
                }

            }

　
            if ((result.Attachments != null) && (result.Attachments.Count > 0))
            {
                result.Attachment = result.Attachments.ToList().First();
            }

            if (result.Customer != null)
            {
                result.Customer_Name = result.Customer.CustomerName;
                result.CustomerStatusId = result.Customer.CustomerStatu.StatusId.ToString();
                if (result.Customer.IsEntity == true)
                {
                    result.CustomerType = "Entity";
                    result.PEPEntityName = result.Customer.EntityName;
                    result.EntityFormationCountry = result.Customer.EntityFormationCountry.ToString();
                    result.EntityFormationCountryBSAApproval = result.Customer.CountryBSAApprovalId.ToString();
                    result.EntityFormationCountryRiskDesignation = result.Customer.Country.CountryRiskDesignation.RiskDesignation;

                    result.EntityFormationCountryLOB = new List<string>();
                    if (pep.CDDGCustomer.CDDGCustomerCountryLobs != null)
                    {
                        var loblist = pep.CDDGCustomer.CDDGCustomerCountryLobs.Select(x => x.LobId.ToString()).ToList();
                        result.EntityFormationCountryLOB = loblist;

                    }
                    else
                    {
                        result.EntityFormationCountryLOB = new List<string>();
                    }

                }
                else
                {
                    result.CustomerType = "Individual";
                    result.IndividualFirstName = result.Customer.IndividualFirstName;
                    result.IndividualLastName = result.Customer.IndividualLastName;
                    result.IndividualMiddleName = result.Customer.IndividualMiddleName;
                    result.IndividualLastName2 = result.Customer.IndividualLastName2;
                    result.IndividualAKAName = result.Customer.IndividualAKAName;
                    result.DateofBirth = result.Customer.IndividualDoB;
                    result.CountryofcitizenshipId = result.Customer.IndividualCitizenshipCountry;

                    result.CountryofcitizenshipBSAApproval = result.Customer.CountryBSAApprovalId.ToString();
                    result.CountryofcitizenshipRiskDesignation = result.Customer.Country1.CountryRiskDesignation.RiskDesignation;

                    result.CountryofcitizenshipLOB = new List<string>();
                    if (pep.CDDGCustomer.CDDGCustomerCountryLobs != null)
                    {
                        var loblist = pep.CDDGCustomer.CDDGCustomerCountryLobs.Select(x => x.LobId.ToString()).ToList();
                        result.CountryofcitizenshipLOB = loblist;

                    }
                    else
                    {
                        result.CountryofcitizenshipLOB = new List<string>();
                    }
                }

　
            }

　
            if (result.LobPeps != null)
            {
                result.LOB = result.LobPeps.Select(x => x.Lob.LobId.ToString()).ToList();
                result.MajorLOB = result.LobPeps.Select(x => x.Lob.MajorLob.MajorLOBName).ToList();
            }

            if (pep.CDDGPrimaryPeps != null)
            {
                result.PrimaryPepId=pep.CDDGPrimaryPeps.Where(x => x.EndDate == null && x.PepRequestStatusID==1).Select(x=>x.PrimaryPepId).ToList();
                result.PrimaryPepFirstName = pep.CDDGPrimaryPeps.Where(x=>x.EndDate == null && x.PepRequestStatusID == 1).Select(x => x.FirstName).ToList();
                result.PrimaryPepLastName = pep.CDDGPrimaryPeps.Where(x => x.EndDate == null && x.PepRequestStatusID == 1).Select(x => x.LastName).ToList();
                result.PrimaryPepLastName2 = pep.CDDGPrimaryPeps.Where(x => x.EndDate == null && x.PepRequestStatusID == 1).Select(x => x.LastName2).ToList();
                result.PrimaryPepMiddleName = pep.CDDGPrimaryPeps.Where(x => x.EndDate == null && x.PepRequestStatusID == 1).Select(x => x.MiddleName).ToList();
                result.PrimaryPepAKAName = pep.CDDGPrimaryPeps.Where(x => x.EndDate == null && x.PepRequestStatusID == 1).Select(x => x.AKAName).ToList();
                result.PrimaryPepPositionOpenField = pep.CDDGPrimaryPeps.Where(x => x.EndDate == null && x.PepRequestStatusID == 1).Select(x => x.PrimaryPepPositionOpenField).ToList();
                result.PrimaryPepPosition = pep.CDDGPrimaryPeps.Where(x => x.EndDate == null && x.PepRequestStatusID == 1).Select(x => x.PrimaryPepPositionId.ToString()).ToList();
                result.PrimaryPepAssociation = pep.CDDGPrimaryPeps.Where(x => x.EndDate == null && x.PepRequestStatusID == 1).Select(x => x.PrimaryPepAssociationId.ToString()).ToList();
                result.PepAssociatedCountry = pep.CDDGPrimaryPeps.Where(x => x.EndDate == null && x.PepRequestStatusID == 1).Select(x => x.PrimaryPepAssociatedCountryId.ToString()).ToList();
                result.PrimaryPepAssociatedCountryBSAApproval = pep.CDDGPrimaryPeps.Where(x => x.EndDate == null && x.PepRequestStatusID == 1).Select(x => x.AssociatedCountryBSAApprovalId.ToString()).ToList();
                result.PrimaryPepAssociatedCountryRiskDesignation = pep.CDDGPrimaryPeps.Where(x => x.EndDate == null && x.PepRequestStatusID == 1).Select(x => x.CDDGCountry.CDDGCountryRiskDesignation.RiskDesignation).ToList();
                //result.PrimaryPepAssociatedCountryLobDate = pep.CDDGPrimaryPeps.Select(x => x.AssociatedCountryLobDate.ToString()).ToList();

                result.PrimaryPepCountry = pep.CDDGPrimaryPeps.Where(x => x.EndDate == null && x.PepRequestStatusID == 1).Select(x => x.PrimaryPepCountryId.ToString()).ToList();
                result.PrimaryPepBSAApproval = pep.CDDGPrimaryPeps.Where(x => x.EndDate == null && x.PepRequestStatusID == 1).Select(x => x.CountryBSAApprovalId.ToString()).ToList();
                //result.PrimaryPepCountryRiskDesignation = pep.CDDGPrimaryPeps.Select(x => x.CountryRiskDesignationId.ToString()).ToList();
                result.PrimaryPepCountryRiskDesignation = pep.CDDGPrimaryPeps.Where(x => x.EndDate == null && x.PepRequestStatusID == 1).Select(x => x.CDDGCountry1.CDDGCountryRiskDesignation.RiskDesignation).ToList();
                result.PrimaryPepCountryLobDate = pep.CDDGPrimaryPeps.Where(x => x.EndDate == null && x.PepRequestStatusID == 1).Select(x => x.CountryLobDate.HasValue ? x.CountryLobDate.Value.ToShortDateString() : null).ToList();

                result.PrimarypepCountryLOB = new List<List<string>>();
                result.PrimarypepCountryLOBCSV = new List<string>();
                result.PrimarypepAssociatedCountryLOB = new List<List<string>>();
                result.PrimarypepAssociatedCountryLOBCSV = new List<string>();
                foreach (var l in pep.CDDGPrimaryPeps.Where(x => x.EndDate == null && x.PepRequestStatusID == 1))
                {
                    if (l.CDDGPrimaryPepCountryLobs.Where(x => x.EndDate == null) != null)
                    {
                        var loblist = l.CDDGPrimaryPepCountryLobs.Where(x => x.EndDate == null).Select(x => x.LobId.ToString()).ToList();
                        result.PrimarypepCountryLOB.Add(loblist);
                        result.PrimarypepCountryLOBCSV.Add(String.Join(",", loblist.ToArray()));
                    }
                    else
                    {
                        result.PrimarypepCountryLOB.Add(new List<string>());
                        result.PrimarypepCountryLOBCSV.Add("");
                    }
                    if (l.CDDGPrimaryPepAssociatedCountryLobs.Where(x => x.EndDate == null) != null)
                    {
                        var loblist = l.CDDGPrimaryPepAssociatedCountryLobs.Where(x => x.EndDate == null).Select(x => x.LobId.ToString()).ToList();
                        result.PrimarypepAssociatedCountryLOB.Add(loblist);
                        result.PrimarypepAssociatedCountryLOBCSV.Add(String.Join(",", loblist.ToArray()));
                    }
                    else
                    {
                        result.PrimarypepAssociatedCountryLOB.Add(new List<string>());
                        result.PrimarypepAssociatedCountryLOBCSV.Add("");
                    }
                }

　
            }

            if (result.IsPep == true)
            {
                result.Pep = "Y";
            }
            else if (result.IsPep == false)
            {
                result.Pep = "N";
            }

            if(result.IsHoganFlagSet == true)
            {
                result.HoganFlagged = "Y";

            }
            else if (result.IsHoganFlagSet == false)
            {
                result.HoganFlagged = "N";
            }
            return result;
        }

        public void DeleteRowsFromRelatedTablesForRejectionWorkflow(int pepid)
        {
            int result = 0;
           
            var pep = pepdetailsdataccess.FindSingleBy(x => x.PepId == pepid && x.EndDate == null);

            for (int i = (pep.CDDGEcns.Count - 1); i >= 0; i--)
            {
                result = ecndataaccess.Delete(pep.CDDGEcns.ToList()[i]);
            }

            for (int i = (pep.CDDGLobPeps.Count - 1); i >= 0; i--)
            {
                result = lobpepdataaccess.Delete(pep.CDDGLobPeps.ToList()[i]);
            }

            for (int i = (pep.CDDGPrimaryPeps.Count - 1); i >= 0; i--)
            {
                for (int j = (pep.CDDGPrimaryPeps.ToList()[i].CDDGPrimaryPepAssociatedCountryLobs.Count - 1); j >= 0; j--)
                {
                    result = primarypepassociatedcountrylobdataaccess.Delete(pep.CDDGPrimaryPeps.ToList()[i].CDDGPrimaryPepAssociatedCountryLobs.ToList()[j]);
                }

                for (int k = (pep.CDDGPrimaryPeps.ToList()[i].CDDGPrimaryPepCountryLobs.Count - 1); k >= 0; k--)
                {
                    result = primarypeplobdataaccess.Delete(pep.CDDGPrimaryPeps.ToList()[i].CDDGPrimaryPepCountryLobs.ToList()[k]);
                }
                result = primarypepdataaccess.Delete(pep.CDDGPrimaryPeps.ToList()[i]);
            }

        }

　
        public void UpdateRowsFromRelatedTablesForRejectionWorkflow(int pepid)
        {
            var pep = pepdetailsdataccess.FindSingleBy(x => x.PepId == pepid && x.EndDate == null);

            pep.CDDGEcns.ToList().ForEach(x => x.EndDate = DateTime.Now);
            pep.CDDGEcns.ToList().ForEach(x => x.PepRequestStatusID = 5);

            foreach (CDDGEcn ecn in pep.CDDGEcns)
            {
                ecndataaccess.Update(ecn);
            }

            pep.CDDGLobPeps.ToList().ForEach(x => x.EndDate = DateTime.Now);
            pep.CDDGLobPeps.ToList().ForEach(x => x.PepRequestStatusID = 5);

            foreach (CDDGLobPep lobpep in pep.CDDGLobPeps)
            {
                lobpepdataaccess.Update(lobpep);
            }

            for (int i = (pep.CDDGPrimaryPeps.Count - 1); i >= 0; i--)
            {
                pep.CDDGPrimaryPeps.ToList().ForEach(x => x.EndDate = DateTime.Now);
                pep.CDDGPrimaryPeps.ToList().ForEach(x => x.PepRequestStatusID = 5);

　
                pep.CDDGPrimaryPeps.ToList()[i].CDDGPrimaryPepAssociatedCountryLobs.ToList().ForEach(x => x.EndDate = DateTime.Now);
                //pep.CDDGPrimaryPeps.ToList()[i].CDDGPrimaryPepAssociatedCountryLobs.ToList().ForEach(x => x.PepRequestStatusID = 5);
                for (int j = (pep.CDDGPrimaryPeps.ToList()[i].CDDGPrimaryPepAssociatedCountryLobs.Count - 1); j >= 0; j--)
                {
                    primarypepassociatedcountrylobdataaccess.Update(pep.CDDGPrimaryPeps.ToList()[i].CDDGPrimaryPepAssociatedCountryLobs.ToList()[j]);
                }

　
                pep.CDDGPrimaryPeps.ToList()[i].CDDGPrimaryPepCountryLobs.ToList().ForEach(x => x.EndDate = DateTime.Now);
                //pep.CDDGPrimaryPeps.ToList()[i].CDDGPrimaryPepCountryLobs.ToList().ForEach(x => x.PepRequestStatusID = 5);
                for (int k = (pep.CDDGPrimaryPeps.ToList()[i].CDDGPrimaryPepCountryLobs.Count - 1); k >= 0; k--)
                {
                    primarypeplobdataaccess.Update(pep.CDDGPrimaryPeps.ToList()[i].CDDGPrimaryPepCountryLobs.ToList()[k]);
                }

                primarypepdataaccess.Update(pep.CDDGPrimaryPeps.ToList()[i]);
            }

        }

　
        public PEPEntity GetSinglePEPbyidforCR(int? pepid, int crid)
        {
            if (crid == 0)
            {
                var pepDB = pepdetailsdataccess.FindSingleBy(x => x.PepId == pepid);
                //if (pepDB.PepRequestStatusId == 6 || pepDB.PepRequestStatusId == 3)
                //{
                var peentitydetails = GetSinglePEPbyid(pepid);

                // }
                return peentitydetails;
            }

            else {
                CDDGPep cddgpep = new CDDGPep();
                var pep = changeRequestDataAccess.GetAll().Where(x => x.ChangeRequestId == crid && x.EndDate == null).FirstOrDefault();
                //int crcount = pep.Count();

　
                //foreach (CDDGChangeRequest crpep in pep)
                // {
                Mapper.CreateMap<CDDGChangeRequest, CDDGPep>();
                cddgpep = Mapper.Map<CDDGPep>(pep);

                cddgpep.CDDGEcns = ecndataaccess.GetAll().Where(x => x.PepId == pep.PepId && x.PepRequestStatusID == 2 && x.ChangeRequestID == pep.ChangeRequestId).ToList();
                cddgpep.CDDGLobPeps = lobpepdataaccess.GetAll().Where(x => x.PepId == pep.PepId && x.PepRequestStatusID == 2 && x.ChangeRequestID == pep.ChangeRequestId).ToList();
                cddgpep.CDDGAttachments = attachmentdataaccess.GetAll().Where(x => x.PepId == pep.PepId && x.PepRequestStatusID == 2 && x.ChangeRequestID == pep.ChangeRequestId).ToList();
                cddgpep.CDDGPrimaryPeps = primarypepdataaccess.GetAll().Where(x => x.PepId == pep.PepId && x.PepRequestStatusID == 2 && x.ChangeRequestID == pep.ChangeRequestId).ToList();
                foreach (var l in cddgpep.CDDGPrimaryPeps)
                {
                    l.CDDGPrimaryPepCountryLobs = l.CDDGPrimaryPepCountryLobs.Where(x => x.EndDate == null).ToList();
                    l.CDDGPrimaryPepAssociatedCountryLobs = l.CDDGPrimaryPepAssociatedCountryLobs.Where(x => x.EndDate == null).ToList();
                }
                //cddgpep.CDDGRequestAssignments = requestAssignmentDataAccess.GetAll().Where(x => x.PepId == pep.PepId && x.PepRequestStatusID == 2 && x.ChangeRequestID == pep.ChangeRequestId).ToList();

                // }

　
　
　
                Mapper.CreateMap<CDDGPep, PEPEntity>();
                var result = Mapper.Map<PEPEntity>(cddgpep);
                result.PepRequestStatus = result.PEPRequestStatu.StatusName;
                result.CrNo = pep.CrNo;
                //todo: change the Email to UserAcc.
                var ue = userDetailsDataAccess.FindSingleBy(x => x.LanID == result.CreatedBy);
                Mapper.CreateMap<CDDGUser, UserEntity>();
                var user = Mapper.Map<UserEntity>(ue);

                result.RequestorFirstName = user.FirstName;
                result.RequestorLastName = user.LastName;
                result.RequestorAU = user.AU;
                result.RequestorEmail = user.Email;

                if (result.Ecns != null && result.Ecns.Count > 0)
                {

                    result.ECN = new List<string>();
                    result.Flagged = new List<string>();
                    result.DateFlagged = new List<string>();
                    result.PrimaryEcnNotProvided = result.Ecns.ToList()[0].PrimaryEcnNotProvided;
                    foreach (var ecna in result.Ecns)
                    {
                        result.ECN.Add(ecna.ECN);
                        if (ecna.IsFlagged == true)
                        {
                            result.Flagged.Add("Y");
                            result.DateFlagged.Add(ecna.DateFlagged.HasValue ? ecna.DateFlagged.Value.ToShortDateString() : null);
                        }
                        else if (ecna.IsFlagged == false)
                        {
                            result.Flagged.Add("N");
                            result.DateFlagged.Add("");
                        }
                        else
                        {
                            result.Flagged.Add("");
                            result.DateFlagged.Add("");
                        }
                    }

                }

　
                if ((result.Attachments != null) && (result.Attachments.Count > 0))
                {
                    result.Attachment = result.Attachments.ToList().First();
                }

                if (result.Customer != null)
                {
                    result.Customer_Name = result.Customer.CustomerName;
                    result.CustomerStatusId = result.Customer.CustomerStatu.StatusId.ToString();
                    if (result.Customer.IsEntity == true)
                    {
                        result.CustomerType = "Entity";
                        result.PEPEntityName = result.Customer.EntityName;
                        result.EntityFormationCountry = result.Customer.EntityFormationCountry.ToString();
                        result.EntityFormationCountryBSAApproval = result.Customer.CountryBSAApprovalId.ToString();
                        result.EntityFormationCountryRiskDesignation = result.Customer.Country.CountryRiskDesignation.RiskDesignation;

                        result.EntityFormationCountryLOB = new List<string>();
                        if (pep.CDDGCustomer.CDDGCustomerCountryLobs != null)
                        {
                            var loblist = pep.CDDGCustomer.CDDGCustomerCountryLobs.Select(x => x.LobId.ToString()).ToList();
                            result.EntityFormationCountryLOB = loblist;

                        }
                        else
                        {
                            result.EntityFormationCountryLOB = new List<string>();
                        }

                    }
                    else
                    {
                        result.CustomerType = "Individual";
                        result.IndividualFirstName = result.Customer.IndividualFirstName;
                        result.IndividualLastName = result.Customer.IndividualLastName;
                        result.IndividualMiddleName = result.Customer.IndividualMiddleName;
                        result.IndividualLastName2 = result.Customer.IndividualLastName2;
                        result.IndividualAKAName = result.Customer.IndividualAKAName;
                        result.DateofBirth = result.Customer.IndividualDoB;
                        result.CountryofcitizenshipId = result.Customer.IndividualCitizenshipCountry;

                        result.CountryofcitizenshipBSAApproval = result.Customer.CountryBSAApprovalId.ToString();
                        result.CountryofcitizenshipRiskDesignation = result.Customer.Country1.CountryRiskDesignation.RiskDesignation;

                        result.CountryofcitizenshipLOB = new List<string>();
                        if (pep.CDDGCustomer.CDDGCustomerCountryLobs != null)
                        {
                            var loblist = pep.CDDGCustomer.CDDGCustomerCountryLobs.Select(x => x.LobId.ToString()).ToList();
                            result.CountryofcitizenshipLOB = loblist;

                        }
                        else
                        {
                            result.CountryofcitizenshipLOB = new List<string>();
                        }
                    }

　
                }

　
                if (result.LobPeps != null)
                {
                    result.LOB = result.LobPeps.Select(x => x.Lob.LobId.ToString()).ToList();
                    result.MajorLOB = result.LobPeps.Select(x => x.Lob.MajorLob.MajorLOBName).ToList();
                }

                if (cddgpep.CDDGPrimaryPeps != null)
                {
                    result.PrimaryPepId =  cddgpep.CDDGPrimaryPeps.Select(x => x.PrimaryPepId).ToList();
                    result.PrimaryPepFirstName = cddgpep.CDDGPrimaryPeps.Select(x => x.FirstName).ToList();
                    result.PrimaryPepLastName = cddgpep.CDDGPrimaryPeps.Select(x => x.LastName).ToList();
                    result.PrimaryPepLastName2 = cddgpep.CDDGPrimaryPeps.Select(x => x.LastName2).ToList();
                    result.PrimaryPepMiddleName = cddgpep.CDDGPrimaryPeps.Select(x => x.MiddleName).ToList();
                    result.PrimaryPepAKAName = cddgpep.CDDGPrimaryPeps.Select(x => x.AKAName).ToList();
                    result.PrimaryPepPositionOpenField = cddgpep.CDDGPrimaryPeps.Select(x => x.PrimaryPepPositionOpenField).ToList();
                    result.PrimaryPepPosition = cddgpep.CDDGPrimaryPeps.Select(x => x.PrimaryPepPositionId.ToString()).ToList();
                    result.PrimaryPepAssociation = cddgpep.CDDGPrimaryPeps.Select(x => x.PrimaryPepAssociationId.ToString()).ToList();
                    result.PepAssociatedCountry = cddgpep.CDDGPrimaryPeps.Select(x => x.PrimaryPepAssociatedCountryId.ToString()).ToList();
                    result.PrimaryPepAssociatedCountryBSAApproval = cddgpep.CDDGPrimaryPeps.Select(x => x.AssociatedCountryBSAApprovalId.ToString()).ToList();
                    result.PrimaryPepAssociatedCountryRiskDesignation = cddgpep.CDDGPrimaryPeps.Select(x => x.CDDGCountry.CDDGCountryRiskDesignation.RiskDesignation).ToList();
                    //result.PrimaryPepAssociatedCountryLobDate = pep.CDDGPrimaryPeps.Select(x => x.AssociatedCountryLobDate.ToString()).ToList();

                    result.PrimaryPepCountry = cddgpep.CDDGPrimaryPeps.Select(x => x.PrimaryPepCountryId.ToString()).ToList();
                    result.PrimaryPepBSAApproval = cddgpep.CDDGPrimaryPeps.Select(x => x.CountryBSAApprovalId.ToString()).ToList();
                    //result.PrimaryPepCountryRiskDesignation = pep.CDDGPrimaryPeps.Select(x => x.CountryRiskDesignationId.ToString()).ToList();
                    result.PrimaryPepCountryRiskDesignation = cddgpep.CDDGPrimaryPeps.Select(x => x.CDDGCountry1.CDDGCountryRiskDesignation.RiskDesignation).ToList();
                    result.PrimaryPepCountryLobDate = cddgpep.CDDGPrimaryPeps.Select(x => x.CountryLobDate.HasValue ? x.CountryLobDate.Value.ToShortDateString() : null).ToList();

                    result.PrimarypepCountryLOB = new List<List<string>>();
                    result.PrimarypepCountryLOBCSV = new List<string>();
                    result.PrimarypepAssociatedCountryLOB = new List<List<string>>();
                    result.PrimarypepAssociatedCountryLOBCSV = new List<string>();
                    foreach (var l in cddgpep.CDDGPrimaryPeps)
                    {
                        if (l.CDDGPrimaryPepCountryLobs != null)
                        {
                            var loblist = l.CDDGPrimaryPepCountryLobs.Select(x => x.LobId.ToString()).ToList();
                            result.PrimarypepCountryLOB.Add(loblist);
                            result.PrimarypepCountryLOBCSV.Add(String.Join(",", loblist.ToArray()));
                        }
                        else
                        {
                            result.PrimarypepCountryLOB.Add(new List<string>());
                            result.PrimarypepCountryLOBCSV.Add("");
                        }
                        if (l.CDDGPrimaryPepAssociatedCountryLobs != null)
                        {
                            var loblist = l.CDDGPrimaryPepAssociatedCountryLobs.Select(x => x.LobId.ToString()).ToList();
                            result.PrimarypepAssociatedCountryLOB.Add(loblist);
                            result.PrimarypepAssociatedCountryLOBCSV.Add(String.Join(",", loblist.ToArray()));
                        }
                        else
                        {
                            result.PrimarypepAssociatedCountryLOB.Add(new List<string>());
                            result.PrimarypepAssociatedCountryLOBCSV.Add("");
                        }
                    }

　
                }

　
                if (result.IsPep == true)
                {
                    result.Pep = "Y";
                }
                else if (result.IsPep == false)
                {
                    result.Pep = "N";
                }

                if (result.IsHoganFlagSet == true)
                {
                    result.HoganFlagged = "Y";

                }
                else if (result.IsHoganFlagSet == false)
                {
                    result.HoganFlagged = "N";
                }

　
                Dictionary<string,List<string>> changedproperties = ComparePEPs(pepid, result);
                result.changedpropertiesforCR = changedproperties;
                return result;
            }
        }

        private Dictionary<string, List<string>> ComparePEPs(int? pepid, PEPEntity pepentity2)
        {
            var pepentity1 = GetSinglePEPbyid(pepid);
            Dictionary<string, List<string>> result = new Dictionary<string, List<string>>();
            EqualityComparer equal = new EqualityComparer();
            if (!equal.Equals(pepentity1, pepentity2))
            {
                result = equal.ChangedProperties;
            }
            
            
            return result;
        }

　
        public int Update(PEPEntity PEP)
        {
            Mapper.CreateMap<PEPEntity, CDDGPep>();
            var a = Mapper.Map<CDDGPep>(PEP);
            var result = pepdetailsdataccess.Update(a);
            return result;
        }

　
        public int UpdateEcn(EcnEntity ECN)
        {
            Mapper.CreateMap<EcnEntity, CDDGEcn>();
            var a = Mapper.Map<CDDGEcn>(ECN);
            var result = ecndataaccess.Update(a);
            return result;
        }

        public AttachmentEntity GetAttachment(int id)
        {
            //Mapper.CreateMap<PEPEntity, CDDGPep>();
            //var a = Mapper.Map<CDDGPep>(id);
            var result = attachmentdataaccess.FindSingleBy(x => x.AttachmentID == id);
            var a = Mapper.Map<AttachmentEntity>(result);
            return a;
        }

        public AttachmentEntity GetAttachmentRelatedtoPepId(int id)
        {
            //Mapper.CreateMap<PEPEntity, CDDGPep>();
            //var a = Mapper.Map<CDDGPep>(id);
            var result = attachmentdataaccess.FindSingleBy(x => x.PepId == id && x.EndDate == null);
            var a = Mapper.Map<AttachmentEntity>(result);
            return a;
        }

        public int UpdateAttachment(AttachmentEntity attachment)
        {
            Mapper.CreateMap<AttachmentEntity, CDDGAttachment>();
            var a = Mapper.Map<CDDGAttachment>(attachment);
            var result = attachmentdataaccess.Update(a);
            return result;
        }
        public IEnumerable<PepHistoryViewModel> GetAllHistory(int pepId)
        {
            Mapper.CreateMap<CDDGPep, PepHistoryViewModel>();
            var ecnforhistoryList = ecndataaccess.GetAll().Where(x => x.PepId == pepId && x.PepRequestStatusID == 1);
            var pephistoryList = pepdetailsdataccess.GetAllPepWithChildDetails().Where(x => x.EndDate == null && x.PepId==pepId);
           
            var peplist = Mapper.Map<IEnumerable<CDDGPep>, IEnumerable<PepHistoryViewModel>>(pephistoryList);
            var ecnlist = Mapper.Map<IEnumerable<CDDGEcn>, IEnumerable<EcnEntity>>(ecnforhistoryList);
            if(peplist.ToList().Count>0 && ecnlist.ToList().Count>0)
            peplist.ToList().FirstOrDefault().Ecn = ecnlist.ToList();
            return peplist;
        }
     
        public DashBoardViewModel GetPDTManagerDashboardDetails()
        {
            DashBoardViewModel dashBoard = new DashBoardViewModel();

　
            #region User Wise Pending Peps
            List<consultantWisePepListViewModel> users = NewMethod("1");
            dashBoard.consultantWisePendingRequests = users;
            dashBoard.consultantWisePendingRequestsCount = users.Select(x => x.Requests.Count).Sum();

　
            #endregion

            #region User Wise CR
            users = NewMethod("2|3|6");
            dashBoard.consultantWiseCRRequests = users;
            dashBoard.consultantWiseCRRequestsCount = users.Select(x => x.Requests.Count).Sum();

            #endregion

            #region User Wise SLA
            users = NewMethod("SLA");
            dashBoard.consultantWiseSLARequests = users;
            dashBoard.consultantWiseSLARequestsCount = users.Select(x => x.Requests.Count).Sum();

            #endregion

            #region User Wise Rejected
            users = NewMethod("5");
            dashBoard.consultantWiseRejectedRequests = users;
            dashBoard.consultantWiseRejectedRequestsCount = users.Select(x => x.Requests.Count).Sum();

            #endregion

　
            return dashBoard;
        }

        private List<consultantWisePepListViewModel> NewMethod(string pepStatus)
        {
            List<CDDGPep> peplist;
            var ConpepList = requestAssignmentDataAccess.GetAll().Where(x=>x.EndDate==null).GroupBy(u => u.CDDGUser).Select(y => new { consultant = y.Key, Requests = y.Select(q => q.CDDGPep).ToList(), ChangeRequest= y.Select(k=> new { pepid=k.PepId, crid= k.ChangeRequestID}) }).ToList();
           // var ConpepListCR = requestAssignmentDataAccess.GetAll().Where(x => x.EndDate == null && x.ChangeRequestID!=null).GroupBy(u => u.CDDGUser).Select(y => new { consultant = y.Key, Requests = y.Select(q => q.CDDGPep).ToList(), ChangRequest = y.Select(j => j.ChangeRequestID).ToList() }).ToList();
            Mapper.CreateMap<CDDGPep, consultantWisePepListViewModel>().ForMember(a => a.consultantName, b => b.MapFrom(c => c.CreatedBy));

            #region All Requests
            //Mapper.CreateMap<CDDGPep, DisplayListViewModel>().ForMember(a => a.Country, b => b.MapFrom(c => c.CDDGCountry)).ForMember(a => a.Customer, b => b.MapFrom(c => c.CDDGCustomer))
            //    .ForMember(a => a.PrimaryEcn, b => b.MapFrom(c => c.CDDGEcns.Where(e => e.EcnSeqValNum == 1.ToString()).Select(k => k.Ecn).FirstOrDefault()))
            // .ForMember(a => a.PrimaryPep, b => b.MapFrom(c => c.CDDGPrimaryPeps.Select(k => k.PrimaryPepId.ToString()).FirstOrDefault()))
            // .ForMember(a => a.AssignedTo, b => b.MapFrom(c => c.CDDGRequestAssignments.Select(k => k.CDDGUser.FirstName).FirstOrDefault()))
            // .ForMember(a => a.Status, b => b.MapFrom(c => c.CDDGPEPRequestStatu.StatusName))
            // .ForMember(a => a.Entity, b => b.MapFrom(c => c.CDDGPepType.PepType));

            List<consultantWisePepListViewModel> users = new List<consultantWisePepListViewModel>();

            foreach (var item in ConpepList)
            {
                List<CDDGPep> peprequests;
                List<CDDGPep> peprequestsCR;

                var pepwithcrs = item.ChangeRequest.Where(i => i.crid != null).Select(x => x.crid).ToList();

                var pepidsCr = changeRequestDataAccess.GetAll().Where(i => pepwithcrs.Contains(i.ChangeRequestId) && i.EndDate == null).Select(x => x.ChangeRequestId).ToList();
               // peprequestsCR = pepdetailsdataccess.GetAll().Where(x => pepidscr.Contains(x.PepId) && x.EndDate == null).ToList();

                //var crs = item.ChangRequest.Where(i => i != null);
                    var pepidsassigned = item.ChangeRequest.Where(i => i.crid == null).Select(x => x.pepid).ToList();
                    peprequests = pepdetailsdataccess.GetAll().Where(x => pepidsassigned.Contains(x.PepId) && x.EndDate == null).ToList();
                
               
              
                string headerMessage = null;
                consultantWisePepListViewModel Consultant = new consultantWisePepListViewModel();
                Consultant.consultantName = item.consultant.FirstName + " " + item.consultant.LastName;
                Consultant.consultantId = item.consultant.UserID;
                // provide filters 

                if (pepStatus.ToUpper().Contains("SLA"))
                {
                    peprequests.RemoveAll(x => x == null);
                    // peplist = item.Requests.ToList().Where(x => x.PepRequestStatusId != 4 && x.CreatedTS.AddDays(10) <= DateTime.Now.AddDays(-3)).ToList();
                    var pepIdsforSLA = peprequests.Where(x => x.PepRequestStatusId == 1 || x.PepRequestStatusId == 2).Select(p => p.PepId).ToList();
                    var holidaylist = holidayCalenderDataAccess.GetAll().Select(i => i.HolidayDate).ToList();
                    int countdate = 0;
                    Dictionary<string, List<string>> pepwithCounterDate = new Dictionary<string, List<string>>();
                    List<string> counterdate = new List<string>();
                    peprequests.ToList().Where(x=>x.PepRequestStatusId == 1 || x.PepRequestStatusId == 2).ToList().ForEach(y =>
                    {
                        for (DateTime date = y.CreatedTS; date.Date <= y.CreatedTS.AddHours(72); date = date.AddDays(1))
                        {
                            foreach (DateTime holidaydate in holidaylist)
                            {
                                if (holidaydate.ToString("d").Equals(date.ToString("d")))
                                {
                                    countdate++;
                                    counterdate.Add(countdate.ToString());
                                }
                            }
                        }
                        if (counterdate.Count > 0)
                        {
                            pepwithCounterDate.Add(y.PepId.ToString(), counterdate);
                            int index = pepIdsforSLA.IndexOf(y.PepId);
                            pepIdsforSLA.RemoveAt(index);
                        }

                        countdate = 0;
                        counterdate = new List<string>();
                    });

                    List<int> pepIDlistSLAsaturday;
                    List<int> pepIDlistSLAsunday;
                    List<int> pepIDlistSLA;
                    List<int> pepIDSLAsaturday = new List<int>();
                    List<int> pepIDSLAsunday = new List<int>();
                    List<int> pepIDSLA = new List<int>();
                    if (pepwithCounterDate.Count > 0)
                    {
                        foreach (var pepid in pepwithCounterDate)
                        {

                            pepIDSLAsaturday = peprequests.Where(x => x.PepId == Int32.Parse(pepid.Key) && x.CreatedTS.DayOfWeek.ToString() == "Saturday").Where(x => x.CreatedTS.Add(new TimeSpan(2 + Int32.Parse(pepid.Value.Last()), 0, 0, 0)).AddHours(72) <= DateTime.Now.AddHours(24)).ToList().Select(x => x.PepId).ToList();
                            pepIDSLAsunday = peprequests.Where(x => x.PepId == Int32.Parse(pepid.Key) && x.CreatedTS.DayOfWeek.ToString() == "Sunday").Where(x => x.CreatedTS.Add(new TimeSpan(1 + Int32.Parse(pepid.Value.Last()), 0, 0, 0)).AddHours(72) <= DateTime.Now.AddHours(24)).ToList().Select(x => x.PepId).ToList();
                            pepIDSLA = peprequests.Where(x => x.PepId == Int32.Parse(pepid.Key) && x.CreatedTS.AddDays(Int32.Parse(pepid.Value.Last())).AddHours(72) <= DateTime.Now.AddHours(24)).ToList().Select(x => x.PepId).ToList();

                        }

                    }
                    pepIDlistSLAsaturday = peprequests.Where(x => pepIdsforSLA.Contains(x.PepId) && (x.PepRequestStatusId == 1 || x.PepRequestStatusId == 2) && x.CreatedTS.DayOfWeek.ToString() == "Saturday").Where(x => x.CreatedTS.Add(new TimeSpan(2, 0, 0, 0)).AddHours(72) <= DateTime.Now.AddHours(24)).ToList().Select(x => x.PepId).ToList();
                    pepIDlistSLAsunday = peprequests.Where(x => pepIdsforSLA.Contains(x.PepId) && (x.PepRequestStatusId == 1 || x.PepRequestStatusId == 2) && x.CreatedTS.DayOfWeek.ToString() == "Sunday").Where(x => x.CreatedTS.Add(new TimeSpan(1, 0, 0, 0)).AddHours(72) <= DateTime.Now.AddHours(24)).ToList().Select(x => x.PepId).ToList();
                    pepIDlistSLA = peprequests.Where(x => pepIdsforSLA.Contains(x.PepId) && (x.PepRequestStatusId == 1 || x.PepRequestStatusId == 2) && x.CreatedTS.AddHours(72) <= DateTime.Now.AddHours(24)).ToList().Select(x => x.PepId).ToList();

                    if (pepIDSLAsaturday.Count > 0)
                        pepIDlistSLAsaturday.AddRange(pepIDSLAsaturday);
                    if (pepIDSLAsunday.Count > 0)
                        pepIDlistSLAsunday.AddRange(pepIDSLAsunday);
                    if (pepIDSLA.Count > 0)
                        pepIDlistSLA.AddRange(pepIDSLA);

                    pepIDlistSLA.AddRange(pepIDlistSLAsaturday);
                    pepIDlistSLA.AddRange(pepIDlistSLAsunday);

                    List<CDDGPep> peplist4SLA = GetPepDetailsFromPepIds(pepIDlistSLA);

                    headerMessage = "Total Requests Approching SLA for: ";
                    Consultant.Requests = Mapper.Map<IEnumerable<CDDGPep>, IEnumerable<DisplayListViewModel>>(peplist4SLA).ToList();
                    Consultant.headerMessage = headerMessage.ToUpper();
                    users.Add(Consultant);
                }
                else
                {
                    List<int?> pepStatuses = pepStatus.Split('|').Select(Int32.Parse).Cast<int?>().ToList();
                    peprequests.RemoveAll(x => x == null);
                    List<DisplayListViewModel> pepDetailsCR = new List<DisplayListViewModel>(); ;
                    if (pepStatuses.Contains(2) || pepStatuses.Contains(6) || pepStatuses.Contains(3))
                    {
                        DisplayPepInformationListViewModel peplist2 = new DisplayPepInformationListViewModel();
                        //var pepids2 = peprequestsCR.Where(x => x.PepRequestStatusId == 2).Select(x => x.PepId).ToList();
                        //var pepdetails2 = GetPepDetailsFromPepIds(pepids2);
                       // List<int?> pepids = pepids2.Select(i => (int?)i).ToList();

                        //var pepdetailscr = GetPEPCRDetails(pepids);
                       // List<int> pepwithcrs = pepdetailscr.Select(x => x.ChangeRequestId).ToList();
                        foreach (int crid in pepidsCr)
                        {

                            var pep = GetSinglePEPbyidforCRbyCRid(crid);
                            var crnoid = changeRequestDataAccess.FindSingleBy(x => x.ChangeRequestId == crid);

　
                            //int pepidcurrent = pep.PepId;
                            var display = Mapper.Map<CDDGPep, DisplayListViewModel>(pep);

                            //List<int> pepwithcrs1 = pepdetailscr.Where(x => x.PepId == pep.PepId).Select(x => x.ChangeRequestId).ToList();
                            //Dictionary<int?, List<int>> pepwithcr = new Dictionary<int?, List<int>>();
                            //pepwithcr.Add(pep.PepId, pepwithcrs1);
                            display.ChangeRequestId = crid;
                            display.pepidwithcrid = pep.PepId.ToString() + "- " + crnoid.CrNo.ToString();
                            display.AssignedTo = requestAssignmentDataAccess.FindSingleBy(x => x.ChangeRequestID == crid).CDDGUser.FirstName.ToString();
                            //display.pepidwithcrid = pepwithcr;
                            pepDetailsCR.Add(display);

                        }

                        var pepidsforcancelled = peprequests.Where(x => x.PepRequestStatusId == 3 || x.PepRequestStatusId == 6).Select(x => x.PepId).ToList();
                        var pepdetailscancelled = GetPepDetailsFromPepIds(pepidsforcancelled);

                        var pepDetailscancelled = Mapper.Map<List<CDDGPep>, List<DisplayListViewModel>>(pepdetailscancelled);
                        pepDetailsCR.AddRange(pepDetailscancelled);
                        Consultant.Requests = pepDetailsCR.OrderBy(x => x.CreatedTS).ToList();
                        headerMessage = "Total Requests for: ";
                        Consultant.headerMessage = headerMessage.ToUpper();
                        users.Add(Consultant);
                    }
                    else {
                        peprequests.RemoveAll(x => x == null);
                        peplist = peprequests.ToList().Where(x => x.EndDate == null && pepStatuses.Contains(x.PepRequestStatusId)).ToList();
                       // peplist= pepdetailsdataccess.GetAll().Where(i=> peplist.Contains(i.pepid))
                        headerMessage = "Total Requests for: ";
                        Consultant.Requests = Mapper.Map<IEnumerable<CDDGPep>, IEnumerable<DisplayListViewModel>>(peplist).ToList();
                        Consultant.headerMessage = headerMessage.ToUpper();
                        users.Add(Consultant);
                    }

　
                }

　
            }

            return users;
        }

　
　
        public DisplayPepInformationListViewModel GetOpenRequestPepListForUserId(int userId, string pepStatus)
        {
            string msg = null;
            IEnumerable<CDDGPep> pepRecords;

            DisplayPepInformationListViewModel pepList = new DisplayPepInformationListViewModel();
            var pepIdsassignedtouser = requestAssignmentDataAccess.GetAll().Where(x => x.CDDGUser.UserID == userId && x.EndDate == null && x.ChangeRequestID==null).Select(p => p.PepId).ToList();
            var pepIdsassignedtouserCR = requestAssignmentDataAccess.GetAll().Where(x => x.CDDGUser.UserID == userId && x.EndDate == null && x.ChangeRequestID!=null).Select(p => p.ChangeRequestID).ToList();
            var pepIds = pepdetailsdataccess.GetAll().Where(x => pepIdsassignedtouser.Contains(x.PepId) && x.EndDate == null).Select(p => p.PepId).ToList();
            var pepIdsCr = changeRequestDataAccess.GetAll().Where(i => pepIdsassignedtouserCR.Contains(i.ChangeRequestId) && i.EndDate == null).Select(x => x.ChangeRequestId).ToList(); 
            var pepIdsforSLA = pepdetailsdataccess.GetAll().Where(x => pepIdsassignedtouser.Contains(x.PepId) && x.EndDate == null && (x.PepRequestStatusId == 1 || x.PepRequestStatusId == 2)).Select(p => p.PepId).ToList();
            var user = userDetailsDataAccess.GetAll().Where(x => x.UserID == userId).FirstOrDefault();

            if (pepStatus.ToUpper().Contains("SLA"))
            {
                //pepRecords = pepdetailsdataccess.GetAll().Where(x => pepIds.Contains(x.PepId) && x.CreatedTS.AddDays(10) <= DateTime.Now.AddDays(-3)).ToList();

                var holidaylist = holidayCalenderDataAccess.GetAll().Select(i => i.HolidayDate).ToList();

                int countdate = 0;
                Dictionary<string , List<string>> pepwithCounterDate = new Dictionary<string, List<string>>();
                List<string> counterdate = new List<string>();
                pepdetailsdataccess.GetAll().ToList().Where(x => pepIds.Contains(x.PepId) && (x.PepRequestStatusId == 1 || x.PepRequestStatusId == 2)).ToList().ForEach(y =>
                {
                    for (DateTime date = y.CreatedTS; date.Date <= y.CreatedTS.AddHours(72); date = date.AddDays(1))
                    {
                        foreach (DateTime holidaydate in holidaylist)
                        {
                            if (holidaydate.ToString("d").Equals(date.ToString("d")))
                            {
                                countdate++;
                                counterdate.Add(countdate.ToString());
                            }
                        }
                    }
                    if (counterdate.Count > 0)
                    {
                        pepwithCounterDate.Add(y.PepId.ToString(), counterdate);
                        int index= pepIdsforSLA.IndexOf(y.PepId);
                        pepIdsforSLA.RemoveAt(index);
                    }

                    countdate = 0;
                    counterdate = new List<string>();
                });

                List<int> pepIDlistSLAsaturday;
                List<int> pepIDlistSLAsunday;
                List<int> pepIDlistSLA;
                List<int> pepIDSLAsaturday =new List<int>();
                List<int> pepIDSLAsunday= new List<int>();
                List<int> pepIDSLA = new List<int>();
                if (pepwithCounterDate.Count > 0)
                {
                    foreach (var pepid in pepwithCounterDate)
                    {

                       pepIDSLAsaturday = pepdetailsdataccess.GetAll().ToList().Where(x => x.PepId== Int32.Parse(pepid.Key) && x.CreatedTS.DayOfWeek.ToString() == "Saturday").Where(x => x.CreatedTS.Add(new TimeSpan(2 + Int32.Parse(pepid.Value.Last()), 0, 0, 0)).AddHours(72) <= DateTime.Now.AddHours(24)).ToList().Select(x => x.PepId).ToList();
                       pepIDSLAsunday = pepdetailsdataccess.GetAll().ToList().Where(x => x.PepId == Int32.Parse(pepid.Key) && x.CreatedTS.DayOfWeek.ToString() == "Sunday").Where(x => x.CreatedTS.Add(new TimeSpan(1 + Int32.Parse(pepid.Value.Last()), 0, 0, 0)).AddHours(72) <= DateTime.Now.AddHours(24)).ToList().Select(x => x.PepId).ToList();
                       pepIDSLA = pepdetailsdataccess.GetAll().ToList().Where(x => x.PepId == Int32.Parse(pepid.Key) && x.CreatedTS.AddDays(Int32.Parse(pepid.Value.Last())).AddHours(72) <= DateTime.Now.AddHours(24)).ToList().Select(x => x.PepId).ToList();
                        
                    }

                }
                    pepIDlistSLAsaturday = pepdetailsdataccess.GetAll().ToList().Where(x => pepIdsforSLA.Contains(x.PepId) && (x.PepRequestStatusId == 1 || x.PepRequestStatusId == 2) && x.CreatedTS.DayOfWeek.ToString() == "Saturday").Where(x => x.CreatedTS.Add(new TimeSpan(2, 0, 0, 0)).AddHours(72) <= DateTime.Now.AddHours(24)).ToList().Select(x => x.PepId).ToList();
                    pepIDlistSLAsunday = pepdetailsdataccess.GetAll().ToList().Where(x => pepIdsforSLA.Contains(x.PepId) && (x.PepRequestStatusId == 1 || x.PepRequestStatusId == 2) && x.CreatedTS.DayOfWeek.ToString() == "Sunday").Where(x => x.CreatedTS.Add(new TimeSpan(1, 0, 0, 0)).AddHours(72) <= DateTime.Now.AddHours(24)).ToList().Select(x => x.PepId).ToList();
                    pepIDlistSLA = pepdetailsdataccess.GetAll().ToList().Where(x => pepIdsforSLA.Contains(x.PepId) && (x.PepRequestStatusId == 1 || x.PepRequestStatusId == 2) && x.CreatedTS.AddHours(72) <= DateTime.Now.AddHours(24)).ToList().Select(x => x.PepId).ToList();

                if(pepIDSLAsaturday.Count>0)
                pepIDlistSLAsaturday.AddRange(pepIDSLAsaturday);
                if (pepIDSLAsunday.Count > 0)
                    pepIDlistSLAsunday.AddRange(pepIDSLAsunday);
                if (pepIDSLA.Count > 0)
                    pepIDlistSLA.AddRange(pepIDSLA);

　
　
                pepIDlistSLA.AddRange(pepIDlistSLAsaturday);
                pepIDlistSLA.AddRange(pepIDlistSLAsunday);

                List<CDDGPep> peplist4SLA = GetPepDetailsFromPepIds(pepIDlistSLA);

                pepList.HeaderInfo = "Requests Approaching SLA";
                pepList.PepList = Mapper.Map<IEnumerable<CDDGPep>, IEnumerable<DisplayListViewModel>>(peplist4SLA).ToList();
                pepList.PepList = GetSLADetails(pepList.PepList.ToList());
            }
            else
            {
                List<int?> pepStatuses = pepStatus.Split('|').Select(Int32.Parse).Cast<int?>().ToList();
                List<DisplayListViewModel> pepDetailsCR = new List<DisplayListViewModel>(); ;
                if (pepStatuses.Contains(2) || pepStatuses.Contains(6) || pepStatuses.Contains(3))
                {
                    DisplayPepInformationListViewModel peplist2 = new DisplayPepInformationListViewModel();
                    //var pepids2 = pepdetailsdataccess.GetAll().Where(x => pepIdsCr.Contains(x.PepId) && x.PepRequestStatusId == 2).Select(x => x.PepId).ToList();
                    //var pepdetails2 = GetPepDetailsFromPepIds(pepids2);
                   // List<int?> pepids = pepids2.Select(i => (int?)i).ToList();

                   // var pepdetailscr = GetPEPCRDetails(pepids);
                    //List<int> pepwithcrs = pepdetailscr.Select(x => x.ChangeRequestId).ToList();
                    foreach (var crid in pepIdsCr)
                    {

                        var pep = GetSinglePEPbyidforCRbyCRid(crid);
                        var crnoid = changeRequestDataAccess.FindSingleBy(x => x.ChangeRequestId == crid);

　
                        //int pepidcurrent = pep.PepId;
                        var display = Mapper.Map<CDDGPep, DisplayListViewModel>(pep);

                        //List<int> pepwithcrs1 = pepdetailscr.Where(x => x.PepId == pep.PepId).Select(x => x.ChangeRequestId).ToList();
                        //Dictionary<int?, List<int>> pepwithcr = new Dictionary<int?, List<int>>();
                        //pepwithcr.Add(pep.PepId, pepwithcrs1);
                        display.ChangeRequestId = crid;
                        display.pepidwithcrid = pep.PepId.ToString() + "- " + crnoid.CrNo.ToString();
                        display.AssignedTo = requestAssignmentDataAccess.FindSingleBy(x => x.ChangeRequestID == crid).CDDGUser.FirstName.ToString();
                        //display.pepidwithcrid = pepwithcr;
                        pepDetailsCR.Add(display);

                    }

                    var pepidsforcancelled = pepdetailsdataccess.GetAll().Where(x => pepIds.Contains(x.PepId) && (x.PepRequestStatusId == 3 || x.PepRequestStatusId == 6 )).Select(x => x.PepId).ToList();
                    var pepdetailscancelled = GetPepDetailsFromPepIds(pepidsforcancelled);

                    var pepDetailscancelled = Mapper.Map<List<CDDGPep>, List<DisplayListViewModel>>(pepdetailscancelled);
                    pepDetailsCR.AddRange(pepDetailscancelled);
                    pepDetailsCR = GetSLADetails(pepDetailsCR);
                    pepList.HeaderInfo = "Change/Canceled Request";
                    pepList.PepList = pepDetailsCR.OrderBy(x => x.CreatedTS).ToList();
                }
                else {
                    pepRecords = pepdetailsdataccess.GetAll().Where(x => pepIds.Contains(x.PepId) && pepStatuses.Contains(x.PepRequestStatusId)).ToList();
                    pepList.PepList = Mapper.Map<IEnumerable<CDDGPep>, IEnumerable<DisplayListViewModel>>(pepRecords).ToList();
                    pepList.PepList = GetSLADetails(pepList.PepList.ToList());

                }

            }

            pepList.HeaderInfo = msg + user.FirstName.ToUpper() + " " + user.LastName.ToUpper();

            return pepList;
        }

        public DashBoardViewModel GetPDTDashboardDetails(int userId)
        {
            DashBoardViewModel dashBoard = new DashBoardViewModel();

            var pepInitial = requestAssignmentDataAccess.GetAll().Where(x => x.UserId == userId && x.EndDate == null && x.ChangeRequestID == null).Select(x => x.PepId).ToList();
            var pepCrs = requestAssignmentDataAccess.GetAll().Where(x => x.UserId == userId && x.EndDate == null && x.ChangeRequestID != null).Select(x => x.ChangeRequestID).ToList();
            var pepList = pepdetailsdataccess.GetAllPepWithChildDetails().Where(x => pepInitial.Contains(x.PepId) && x.PepRequestStatusId != 4).ToList();
            var pepListCR = changeRequestDataAccess.GetAll().Where(i => pepCrs.Contains(i.ChangeRequestId) && i.EndDate == null).Select(x => x.ChangeRequestId).ToList();
            //todo: work around for demo. Need to be worked on.
            // var pepList = pepdetailsdataccess.FindAllBy(x => x.PepRequestStatusId != 4 && x.CreatedBy == "heena.solanki@wellsfargo.com" && x.EndDate == null).ToList();
            foreach (var cddg in pepList)
            {
                cddg.CDDGEcns = cddg.CDDGEcns.Where(x => x.PepRequestStatusID == 1 && x.PepId == cddg.PepId && x.EndDate == null).ToList();
                cddg.CDDGLobPeps = cddg.CDDGLobPeps.Where(x => x.PepRequestStatusID == 1 && x.PepId == cddg.PepId && x.EndDate == null).ToList();
                cddg.CDDGAttachments = cddg.CDDGAttachments.Where(x => x.PepRequestStatusID == 1 && x.PepId == cddg.PepId && x.EndDate == null).ToList();
                cddg.CDDGPrimaryPeps = cddg.CDDGPrimaryPeps.Where(x => x.PepRequestStatusID == 1 && x.PepId == cddg.PepId && x.EndDate == null).ToList();
                foreach (var l in cddg.CDDGPrimaryPeps)
                {
                    l.CDDGPrimaryPepCountryLobs = l.CDDGPrimaryPepCountryLobs.Where(x => x.EndDate == null).ToList();
                }
                //cddg.CDDGRequestAssignments = cddg.CDDGRequestAssignments.Where(x => x.PepRequestStatusID == 1 && x.PepId == cddg.PepId && x.EndDate == null).ToList();
            }

            #region User  Pending Peps          

            DisplayPepInformationListViewModel list = new DisplayPepInformationListViewModel();
            list.PepList = Mapper.Map<IEnumerable<CDDGPep>, IEnumerable<DisplayListViewModel>>(pepList.Where(x => x.PepRequestStatusId == 1)).ToList();
            list.PepList = GetSLADetails(list.PepList.ToList());

            list.HeaderInfo = "Pending Requests ";
            dashBoard.UserPendingRequests = list;

            #endregion

            #region User Wise CR
            //list = new DisplayPepInformationListViewModel();
            //list.PepList = Mapper.Map<IEnumerable<CDDGPep>, IEnumerable<DisplayListViewModel>>(pepList.Where(x => x.PepRequestStatusId == 2 || x.PepRequestStatusId == 3 || x.PepRequestStatusId == 6)).ToList();

            DisplayPepInformationListViewModel peplist2 = new DisplayPepInformationListViewModel();
           // var pepids2 = pepListCR.Where(x => x.PepRequestStatusId == 2).Select(x => x.PepId).ToList();
            //var pepdetails2 = GetPepDetailsFromPepIds(pepids2);
            //List<int?> pepids = pepids2.Select(i => (int?)i).ToList();
            List<DisplayListViewModel> pepDetailsCR = new List<DisplayListViewModel>();

            //var pepdetailscr = GetPEPCRDetails(pepids);

            //List<int> pepwithcrs = pepdetailscr.Select(x => x.ChangeRequestId).ToList();
            foreach (var crid in pepListCR)
            {

                var pep = GetSinglePEPbyidforCRbyCRid(crid);
                var crnoid = changeRequestDataAccess.FindSingleBy(x => x.ChangeRequestId == crid);

　
                //int pepidcurrent = pep.PepId;
                var display = Mapper.Map<CDDGPep, DisplayListViewModel>(pep);

                //List<int> pepwithcrs1 = pepdetailscr.Where(x => x.PepId == pep.PepId).Select(x => x.ChangeRequestId).ToList();
                //Dictionary<int?, List<int>> pepwithcr = new Dictionary<int?, List<int>>();
                //pepwithcr.Add(pep.PepId, pepwithcrs1);
                display.ChangeRequestId = crid;
                display.pepidwithcrid = pep.PepId.ToString() + "- " + crnoid.CrNo.ToString();
                display.AssignedTo = requestAssignmentDataAccess.FindSingleBy(x => x.ChangeRequestID == crid).CDDGUser.FirstName.ToString();
                //display.pepidwithcrid = pepwithcr;
                pepDetailsCR.Add(display);

            }
            //foreach (var crid in pepwithcrs)
            //{
            //    var pep = GetSinglePEPbyidforCRbyCRid(crid);
            //    var display = Mapper.Map<CDDGPep, DisplayListViewModel>(pep);

            //    List<int> pepwithcrs1 = pepdetailscr.Where(x => x.PepId == pep.PepId).Select(x => x.ChangeRequestId).ToList();
            //    Dictionary<int?, List<int>> pepwithcr = new Dictionary<int?, List<int>>();
            //    pepwithcr.Add(pep.PepId, pepwithcrs1);
            //    display.ChangeRequestId = crid;
            //    display.pepidwithcrid = pepwithcr;
            //    pepDetailsCR.Add(display);
            //    //pepforCR.Add(pep);
            //}

            // var pepdetailscr = GetPEPCRDetails(pepids);

            //  var cpmpletepepdetailsforCR = Mapper.Map<IEnumerable<PEPEntity>, IEnumerable<CDDGPep>>(pepforCR);
            //pepDetails = Mapper.Map<List<CDDGPep>, List<DisplayListViewModel>>(pepforCR);
            var pepidsforcancelled = pepList.Where(x => x.PepRequestStatusId == 3 || x.PepRequestStatusId == 6).Select(x => x.PepId).ToList();
            var pepdetailscancelled = GetPepDetailsFromPepIds(pepidsforcancelled);

            var pepDetailscancelled = Mapper.Map<List<CDDGPep>, List<DisplayListViewModel>>(pepdetailscancelled);
            pepDetailsCR.AddRange(pepDetailscancelled);
            pepDetailsCR = GetSLADetails(pepDetailsCR);
            peplist2.PepList = pepDetailsCR.OrderBy(x => x.CreatedTS).ToList();
            peplist2.HeaderInfo = "Change/Canceled Requests";
            dashBoard.UserCRRequests = peplist2;

　
            // plist.HeaderInfo = "Change/Canceled Requests";
            //dashBoard.UserCRRequests = list;

            #endregion

            #region User SLA
            list = new DisplayPepInformationListViewModel();
            //list.PepList = Mapper.Map<IEnumerable<CDDGPep>, IEnumerable<DisplayListViewModel>>(pepList.Where(x => x.CreatedTS.AddDays(10) <= DateTime.Now.AddDays(-3))).ToList();

            var pepIdsforSLA = pepList.Where(x => x.PepRequestStatusId == 1 || x.PepRequestStatusId == 2).Select(j => j.PepId).ToList();
            var holidaylist = holidayCalenderDataAccess.GetAll().Select(i => i.HolidayDate).ToList();
            int countdate = 0;
            Dictionary<string, List<string>> pepwithCounterDate = new Dictionary<string, List<string>>();
            List<string> counterdate = new List<string>();
            pepList.ToList().Where(x => x.PepRequestStatusId == 1 || x.PepRequestStatusId == 2).ToList().ForEach(y =>
            {
                for (DateTime date = y.CreatedTS; date.Date <= y.CreatedTS.AddHours(72); date = date.AddDays(1))
                {
                    foreach (DateTime holidaydate in holidaylist)
                    {
                        if (holidaydate.ToString("d").Equals(date.ToString("d")))
                        {
                            countdate++;
                            counterdate.Add(countdate.ToString());
                        }
                    }
                }
                if (counterdate.Count > 0)
                {
                    pepwithCounterDate.Add(y.PepId.ToString(), counterdate);
                    int index = pepIdsforSLA.IndexOf(y.PepId);
                    pepIdsforSLA.RemoveAt(index);
                }

                countdate = 0;
                counterdate = new List<string>();
            });

            List<int> pepIDlistSLAsaturday;
            List<int> pepIDlistSLAsunday;
            List<int> pepIDlistSLA;
            List<int> pepIDSLAsaturday = new List<int>();
            List<int> pepIDSLAsunday = new List<int>();
            List<int> pepIDSLA = new List<int>();
            if (pepwithCounterDate.Count > 0)
            {
                foreach (var pepid in pepwithCounterDate)
                {

                    pepIDSLAsaturday = pepList.Where(x => x.PepId == Int32.Parse(pepid.Key) && x.CreatedTS.DayOfWeek.ToString() == "Saturday").Where(x => x.CreatedTS.Add(new TimeSpan(2 + Int32.Parse(pepid.Value.Last()), 0, 0, 0)).AddHours(72) <= DateTime.Now.AddHours(24)).ToList().Select(x => x.PepId).ToList();
                    pepIDSLAsunday = pepList.Where(x => x.PepId == Int32.Parse(pepid.Key) && x.CreatedTS.DayOfWeek.ToString() == "Sunday").Where(x => x.CreatedTS.Add(new TimeSpan(1 + Int32.Parse(pepid.Value.Last()), 0, 0, 0)).AddHours(72) <= DateTime.Now.AddHours(24)).ToList().Select(x => x.PepId).ToList();
                    pepIDSLA = pepList.Where(x => x.PepId == Int32.Parse(pepid.Key) && x.CreatedTS.AddDays(Int32.Parse(pepid.Value.Last())).AddHours(72) <= DateTime.Now.AddHours(24)).ToList().Select(x => x.PepId).ToList();

                }

            }
            pepIDlistSLAsaturday = pepList.Where(x => pepIdsforSLA.Contains(x.PepId) && (x.PepRequestStatusId == 1 || x.PepRequestStatusId == 2) && x.CreatedTS.DayOfWeek.ToString() == "Saturday").Where(x => x.CreatedTS.Add(new TimeSpan(2, 0, 0, 0)).AddHours(72) <= DateTime.Now.AddHours(24)).ToList().Select(x => x.PepId).ToList();
            pepIDlistSLAsunday = pepList.Where(x => pepIdsforSLA.Contains(x.PepId) && (x.PepRequestStatusId == 1 || x.PepRequestStatusId == 2) && x.CreatedTS.DayOfWeek.ToString() == "Sunday").Where(x => x.CreatedTS.Add(new TimeSpan(1, 0, 0, 0)).AddHours(72) <= DateTime.Now.AddHours(24)).ToList().Select(x => x.PepId).ToList();
            pepIDlistSLA = pepList.Where(x => pepIdsforSLA.Contains(x.PepId) && (x.PepRequestStatusId == 1 || x.PepRequestStatusId == 2) && x.CreatedTS.AddHours(72) <= DateTime.Now.AddHours(24)).ToList().Select(x => x.PepId).ToList();

            if (pepIDSLAsaturday.Count > 0)
                pepIDlistSLAsaturday.AddRange(pepIDSLAsaturday);
            if (pepIDSLAsunday.Count > 0)
                pepIDlistSLAsunday.AddRange(pepIDSLAsunday);
            if (pepIDSLA.Count > 0)
                pepIDlistSLA.AddRange(pepIDSLA);

            pepIDlistSLA.AddRange(pepIDlistSLAsaturday);
            pepIDlistSLA.AddRange(pepIDlistSLAsunday);

            List<CDDGPep> peplist4SLA = GetPepDetailsFromPepIds(pepIDlistSLA);
            list.PepList = Mapper.Map<List<CDDGPep>, List<DisplayListViewModel>>(peplist4SLA);
            list.PepList = GetSLADetails(list.PepList.ToList());

            list.HeaderInfo = "Requests Approaching SLA";
            dashBoard.UserSLARequests = list;

            #endregion

            #region User Rejected
            list = new DisplayPepInformationListViewModel();
            list.PepList = Mapper.Map<IEnumerable<CDDGPep>, IEnumerable<DisplayListViewModel>>(pepList.Where(x => x.PepRequestStatusId == 5)).ToList();
            list.PepList = GetSLADetails(list.PepList.ToList());
            list.HeaderInfo = "Rejected Requests";
            dashBoard.UserRejectedRequests = list;

            #endregion

　
            return dashBoard;
        }

        public PEPChangeRequestEntity AddNewChangeRequest(PEPEntity PEP)
        {
            PEPChangeRequestEntity changeRequest = new PEPChangeRequestEntity();
            Mapper.CreateMap<PEPEntity, CDDGChangeRequest>();
            var a = Mapper.Map<PEPEntity, CDDGChangeRequest>(PEP);
            var result = changeRequestDataAccess.AddNew(a);
            //todo: use automapper to do reverse mapping
            // Ecn.ECNID = result.EcnId;
            changeRequest.ChangeRequestId = result.ChangeRequestId;
            return changeRequest;
        }

        public int UpdateCRforPEP(PEPEntity pepdetails)
        {
            Mapper.CreateMap<PEPEntity, CDDGPep>();
            //Mapper.CreateMap<PEPRequestStatuEntity, CDDGPEPRequestStatu>();

　
            // Mapper.CreateMap<PEPEntity, CDDGPep>().ForMember(cv => cv.CDDGPEPRequestStatu, m => m.MapFrom(s => s.PEPRequestStatu));
            var a = Mapper.Map<PEPEntity, CDDGPep>(pepdetails);
            //CDDGPep a = new CDDGPep();
            //a.PepRequestStatusId = pepdetails.PepRequestStatusId;
            //a.PreviousPepRequestStatusid = pepdetails.PreviousPepRequestStatusid;
            //a.PepId = (int)pepdetails.PepId;
            var result = pepdetailsdataccess.UpdateCRforPEP(a);
            return result;
        }

        public int AcceptPEPDeterminationFormCR(int? pepid, int crid)
        {
            var pepDB = pepdetailsdataccess.FindSingleBy(x => x.PepId == pepid);
            if (pepDB.PepRequestStatusId == 6)
            {
                pepDB.PepRequestStatusId = 3;
                pepDB.PreviousPepRequestStatusid = null;
                var pepCrs = changeRequestDataAccess.GetAll().Where(x => x.PepId == pepid && x.EndDate == null && x.PepRequestStatusId == 2).ToList();

                pepCrs.ForEach(x => x.EndDate = DateTime.Now);
                pepCrs.ForEach(x => x.PepRequestStatusId =3);

                foreach (var cr in pepCrs)
                {
                    changeRequestDataAccess.Update(cr);
                }
                bool hasCRECN = ecndataaccess.GetAll().Where(x => x.PepId == pepid).Any(x => x.PepRequestStatusID.Value == 2);
                if (hasCRECN)
                {
                    var ecnChangeStatustoComplete = ecndataaccess.GetAll().Where(x => x.PepId == pepid && x.PepRequestStatusID == 1 && x.EndDate == null).ToList();
                    ecnChangeStatustoComplete.ForEach(x => x.EndDate = DateTime.Now);
                    ecnChangeStatustoComplete.ForEach(x => x.PepRequestStatusID = 3);
                    foreach (CDDGEcn ecn in ecnChangeStatustoComplete)
                    {
                        ecndataaccess.Update(ecn);
                    }
                }

　
                //lobpep
                bool hasCRlobpep = lobpepdataaccess.GetAll().Where(x => x.PepId == pepid).Any(x => x.PepRequestStatusID.Value == 2);
                if (hasCRlobpep)
                {
                    var lobpepChangeStatustoComplete = lobpepdataaccess.GetAll().Where(x => x.PepId == pepid && x.PepRequestStatusID == 1 && x.EndDate == null).ToList();
                    lobpepChangeStatustoComplete.ForEach(x => x.EndDate = DateTime.Now);
                    lobpepChangeStatustoComplete.ForEach(x => x.PepRequestStatusID = 3);
                    foreach (CDDGLobPep lob in lobpepChangeStatustoComplete)
                    {
                        lobpepdataaccess.Update(lob);
                    }
                   
                }

　
　
                //cddgattachment

                //CDDGEcns.Any(x => x.Ecn.ToLower().Contains(searchDetails.ecn.ToLower())

                bool hasCRattachment = attachmentdataaccess.GetAll().Where(x => x.PepId == pepid).Any(x => x.PepRequestStatusID.Value == 2);
                if (hasCRattachment)
                {
                    var attachmentChangeStatustoComplete = attachmentdataaccess.GetAll().Where(x => x.PepId == pepid && x.PepRequestStatusID == 1 && x.EndDate == null).ToList();
                    attachmentChangeStatustoComplete.ForEach(x => x.EndDate = DateTime.Now);
                    attachmentChangeStatustoComplete.ForEach(x => x.PepRequestStatusID = 3);
                    foreach (CDDGAttachment att in attachmentChangeStatustoComplete)
                    {
                        attachmentdataaccess.Update(att);
                    }
                   
                }

　
　
                //primary pep
                bool hasCRprimarypep = primarypepdataaccess.GetAll().Where(x => x.PepId == pepid).Any(x => x.PepRequestStatusID.Value == 2);
                if (hasCRprimarypep)
                {
                    var primarypepChangeStatustoComplete = primarypepdataaccess.GetAll().Where(x => x.PepId == pepid && x.PepRequestStatusID == 1 && x.EndDate == null).ToList();
                    primarypepChangeStatustoComplete.ForEach(x => x.EndDate = DateTime.Now);
                    primarypepChangeStatustoComplete.ForEach(x => x.PepRequestStatusID = 3);
                    foreach (CDDGPrimaryPep pri in primarypepChangeStatustoComplete)
                    {
                        primarypepdataaccess.Update(pri);
                    }
                }

                var result = pepdetailsdataccess.Update(pepDB);
                return result;
            }
            else {
                var pep = changeRequestDataAccess.GetAll().Where(x => x.PepId == pepid && x.EndDate == null && x.PepRequestStatusId == 2).ToList();

                var pepentity = pep.OrderBy(x => x.CreatedTS).FirstOrDefault();

                if (pepentity.ChangeRequestId != crid)
                {
                    return 0;
                }
                else
                {
                    Mapper.CreateMap<CDDGChangeRequest, CDDGPep>();
                    var cddgpep = Mapper.Map<CDDGPep>(pepentity);

　
                    pepdetailsdataccess.Update(cddgpep);

                    pepentity.EndDate = DateTime.Now;
                    //pepentity.PepRequestStatusId = 4;
                    changeRequestDataAccess.Update(pepentity);

　
                    if (pep.Count() == 1)
                    {
                        pepDB.PepRequestStatusId = pepDB.PreviousPepRequestStatusid;
                        pepDB.PreviousPepRequestStatusid = null;
                        pepDB.CreatedTS = DateTime.Now;
                        pepdetailsdataccess.UpdateCRforPEPwithDate(pepDB);
                    }

　
                    //ECN

                    bool hasCRECN = ecndataaccess.GetAll().Where(x => x.PepId == pepid).Any(x => x.PepRequestStatusID.Value == 2);
                    if (hasCRECN)
                    {
                        var ecnChangeStatustoComplete = ecndataaccess.GetAll().Where(x => x.PepId == pepid && x.PepRequestStatusID == 1 && x.EndDate == null).ToList();
                        ecnChangeStatustoComplete.ForEach(x => x.EndDate = DateTime.Now);
                        //ecnChangeStatustoComplete.ForEach(x => x.PepRequestStatusID = 4);
                        foreach (CDDGEcn ecn in ecnChangeStatustoComplete)
                        {
                            ecndataaccess.Update(ecn);
                        }
                        var data = ecndataaccess.GetAll().Where(x => x.PepId == pepid && x.ChangeRequestID == pepentity.ChangeRequestId);
                        data.ToList().ForEach(x => x.PepRequestStatusID = 1);
                        foreach (CDDGEcn ecn in data)
                        {
                            ecndataaccess.Update(ecn);
                        }
                    }

　
                    //lobpep
                    bool hasCRlobpep = lobpepdataaccess.GetAll().Where(x => x.PepId == pepid).Any(x => x.PepRequestStatusID.Value == 2);
                    if (hasCRlobpep)
                    {
                        var lobpepChangeStatustoComplete = lobpepdataaccess.GetAll().Where(x => x.PepId == pepid && x.PepRequestStatusID == 1 && x.EndDate == null).ToList();
                        lobpepChangeStatustoComplete.ForEach(x => x.EndDate = DateTime.Now);
                        // lobpepChangeStatustoComplete.ForEach(x => x.PepRequestStatusID = 4);
                        foreach (CDDGLobPep lob in lobpepChangeStatustoComplete)
                        {
                            lobpepdataaccess.Update(lob);
                        }
                        var lobpep = lobpepdataaccess.GetAll().Where(x => x.PepId == pepid && x.ChangeRequestID == pepentity.ChangeRequestId);
                        lobpep.ToList().ForEach(x => x.PepRequestStatusID = 1);
                        foreach (CDDGLobPep lob in lobpep)
                        {
                            lobpepdataaccess.Update(lob);
                        }
                    }

　
　
                    //cddgattachment

                    //CDDGEcns.Any(x => x.Ecn.ToLower().Contains(searchDetails.ecn.ToLower())

                    bool hasCRattachment = attachmentdataaccess.GetAll().Where(x => x.PepId == pepid).Any(x => x.PepRequestStatusID.Value == 2);
                    if (hasCRattachment)
                    {
                        var attachmentChangeStatustoComplete = attachmentdataaccess.GetAll().Where(x => x.PepId == pepid && x.PepRequestStatusID == 1 && x.EndDate == null).ToList();
                        attachmentChangeStatustoComplete.ForEach(x => x.EndDate = DateTime.Now);
                        // attachmentChangeStatustoComplete.ForEach(x => x.PepRequestStatusID = 4);
                        foreach (CDDGAttachment att in attachmentChangeStatustoComplete)
                        {
                            attachmentdataaccess.Update(att);
                        }
                        var attachment = attachmentdataaccess.GetAll().Where(x => x.PepId == pepid && x.ChangeRequestID == pepentity.ChangeRequestId);
                        attachment.ToList().ForEach(x => x.PepRequestStatusID = 1);
                        foreach (CDDGAttachment att in attachment)
                        {
                            attachmentdataaccess.Update(att);
                        }
                    }

　
　
                    //primary pep
                    bool hasCRprimarypep = primarypepdataaccess.GetAll().Where(x => x.PepId == pepid).Any(x => x.PepRequestStatusID.Value == 2);
                    if (hasCRprimarypep)
                    {
                        var primarypepChangeStatustoComplete = primarypepdataaccess.GetAll().Where(x => x.PepId == pepid && x.PepRequestStatusID == 1 && x.EndDate == null).ToList();
                        primarypepChangeStatustoComplete.ForEach(x => x.EndDate = DateTime.Now);
                        // primarypepChangeStatustoComplete.ForEach(x => x.PepRequestStatusID = 4);
                        foreach (CDDGPrimaryPep pri in primarypepChangeStatustoComplete)
                        {
                            primarypepdataaccess.Update(pri);
                        }
                        var primarypep = primarypepdataaccess.GetAll().Where(x => x.PepId == pepid && x.ChangeRequestID == pepentity.ChangeRequestId);
                        primarypep.ToList().ForEach(x => x.PepRequestStatusID = 1);
                        foreach (CDDGPrimaryPep pri in primarypep)
                        {
                            primarypepdataaccess.Update(pri);
                        }
                    }

　
　
                    //request assignment
                    //bool hasCRreassignment = requestAssignmentDataAccess.GetAll().Where(x => x.PepId == pepid).Any(x => x.PepRequestStatusID.Value == 2);
                    //if (hasCRreassignment)
                    //{
                    //    var reqAssignmentChangeStatustoComplete = requestAssignmentDataAccess.GetAll().Where(x => x.PepId == pepid && x.PepRequestStatusID == 1 && x.EndDate == null).ToList();
                    //    reqAssignmentChangeStatustoComplete.ForEach(x => x.EndDate = DateTime.Now);
                    //    // reqAssignmentChangeStatustoComplete.ForEach(x => x.PepRequestStatusID = 4);
                    //    foreach (CDDGRequestAssignment req in reqAssignmentChangeStatustoComplete)
                    //    {
                    //        requestAssignmentDataAccess.Update(req);
                    //    }
                    //    var reqAssignment = requestAssignmentDataAccess.GetAll().Where(x => x.PepId == pepid && x.ChangeRequestID == pepentity.ChangeRequestId);
                    //    reqAssignment.ToList().ForEach(x => x.PepRequestStatusID = 1);
                    //    foreach (CDDGRequestAssignment req in reqAssignment)
                    //    {
                    //        requestAssignmentDataAccess.Update(req);
                    //    }
                    //}

                    return 1;
                }
            }

　
        }

        public int CancelPepRequest(int? pepId, string cancelcomments)
        {
            var pep = pepdetailsdataccess.FindSingleBy(x => x.PepId == pepId);
            pep.PreviousPepRequestStatusid = pep.PepRequestStatusId;
            pep.PepRequestStatusId = 6;
            pep.PepCancellationComments = cancelcomments;
            var result = pepdetailsdataccess.Update(pep);
            return result;
        }

        public int RejectPEPDeterminationFormCR(int? pepid, int crid)
        {
            var pepDB = pepdetailsdataccess.FindSingleBy(x => x.PepId == pepid);
            if (pepDB.PepRequestStatusId == 6)
            {
                pepDB.PepRequestStatusId = pepDB.PreviousPepRequestStatusid;
                pepDB.PreviousPepRequestStatusid = null;
                var result = pepdetailsdataccess.Update(pepDB);
                return result;
            }
            else {
                var pep = changeRequestDataAccess.GetAll().Where(x => x.PepId == pepid && x.EndDate == null && x.PepRequestStatusId == 2).ToList();

                var pepentity = pep.Where(x => x.ChangeRequestId == crid).FirstOrDefault();

                Mapper.CreateMap<CDDGChangeRequest, CDDGPep>();
                var cddgpep = Mapper.Map<CDDGPep>(pepentity);

　
                //pepdetailsdataccess.UpdateAllExceptStatus(cddgpep);

                pepentity.EndDate = DateTime.Now;
                pepentity.PepRequestStatusId = 5;
                changeRequestDataAccess.Update(pepentity);

　
                if (pep.Count() == 1)
                {
                    pepDB.PepRequestStatusId = pepDB.PreviousPepRequestStatusid;
                    pepDB.PreviousPepRequestStatusid = null;
                    pepdetailsdataccess.UpdateCRforPEP(pepDB);

                }

　
                //ECN

                bool hasCRECN = ecndataaccess.GetAll().Where(x => x.PepId == pepid).Any(x => x.PepRequestStatusID.Value == 2);
                if (hasCRECN)
                {
                    //var ecnChangeStatustoComplete = ecndataaccess.GetAll().Where(x => x.PepId == pepid && x.PepRequestStatusID == 1 && x.EndDate == null).ToList();
                    //ecnChangeStatustoComplete.ForEach(x => x.EndDate = DateTime.Now);
                    //ecnChangeStatustoComplete.ForEach(x => x.PepRequestStatusID = 3);
                    //foreach (CDDGEcn ecn in ecnChangeStatustoComplete)
                    //{
                    //    ecndataaccess.Update(ecn);
                    //}
                    var data = ecndataaccess.GetAll().Where(x => x.PepId == pepid && x.ChangeRequestID == pepentity.ChangeRequestId);
                    data.ToList().ForEach(x => x.PepRequestStatusID = 5);
                    foreach (CDDGEcn ecn in data)
                    {
                        ecndataaccess.Update(ecn);
                    }
                }

                //lobpep
                bool hasCRlobpep = lobpepdataaccess.GetAll().Where(x => x.PepId == pepid).Any(x => x.PepRequestStatusID.Value == 2);
                if (hasCRlobpep)
                {
                    //var lobpepChangeStatustoComplete = lobpepdataaccess.GetAll().Where(x => x.PepId == pepid && x.PepRequestStatusID == 1 && x.EndDate == null).ToList();
                    //lobpepChangeStatustoComplete.ForEach(x => x.EndDate = DateTime.Now);
                    //lobpepChangeStatustoComplete.ForEach(x => x.PepRequestStatusID = 4);
                    //foreach (CDDGLobPep lob in lobpepChangeStatustoComplete)
                    //{
                    //    lobpepdataaccess.Update(lob);
                    //}
                    var lobpep = lobpepdataaccess.GetAll().Where(x => x.PepId == pepid && x.ChangeRequestID == pepentity.ChangeRequestId);
                    lobpep.ToList().ForEach(x => x.PepRequestStatusID = 5);
                    foreach (CDDGLobPep lob in lobpep)
                    {
                        lobpepdataaccess.Update(lob);
                    }
                }

　
　
                //cddgattachment

                //CDDGEcns.Any(x => x.Ecn.ToLower().Contains(searchDetails.ecn.ToLower())

                bool hasCRattachment = attachmentdataaccess.GetAll().Where(x => x.PepId == pepid).Any(x => x.PepRequestStatusID.Value == 2);
                if (hasCRattachment)
                {
                    //var attachmentChangeStatustoComplete = attachmentdataaccess.GetAll().Where(x => x.PepId == pepid && x.PepRequestStatusID == 1 && x.EndDate == null).ToList();
                    //attachmentChangeStatustoComplete.ForEach(x => x.EndDate = DateTime.Now);
                    //attachmentChangeStatustoComplete.ForEach(x => x.PepRequestStatusID = 4);
                    //foreach (CDDGAttachment att in attachmentChangeStatustoComplete)
                    //{
                    //    attachmentdataaccess.Update(att);
                    //}
                    var attachment = attachmentdataaccess.GetAll().Where(x => x.PepId == pepid && x.ChangeRequestID == pepentity.ChangeRequestId);
                    attachment.ToList().ForEach(x => x.PepRequestStatusID = 5);
                    foreach (CDDGAttachment att in attachment)
                    {
                        attachmentdataaccess.Update(att);
                    }
                }

　
　
                //primary pep
                bool hasCRprimarypep = primarypepdataaccess.GetAll().Where(x => x.PepId == pepid).Any(x => x.PepRequestStatusID.Value == 2);
                if (hasCRprimarypep)
                {
                    //var primarypepChangeStatustoComplete = primarypepdataaccess.GetAll().Where(x => x.PepId == pepid && x.PepRequestStatusID == 1 && x.EndDate == null).ToList();
                    //primarypepChangeStatustoComplete.ForEach(x => x.EndDate = DateTime.Now);
                    //primarypepChangeStatustoComplete.ForEach(x => x.PepRequestStatusID = 4);
                    //foreach (CDDGPrimaryPep pri in primarypepChangeStatustoComplete)
                    //{
                    //    primarypepdataaccess.Update(pri);
                    //}
                    var primarypep = primarypepdataaccess.GetAll().Where(x => x.PepId == pepid && x.ChangeRequestID == pepentity.ChangeRequestId);
                    primarypep.ToList().ForEach(x => x.PepRequestStatusID = 5);
                    foreach (CDDGPrimaryPep pri in primarypep)
                    {
                        primarypepdataaccess.Update(pri);
                    }
                }

　
　
                //request assignment
                //bool hasCRreassignment = requestAssignmentDataAccess.GetAll().Where(x => x.PepId == pepid).Any(x => x.PepRequestStatusID.Value == 2);
                //if (hasCRreassignment)
                //{
                //    //var reqAssignmentChangeStatustoComplete = requestAssignmentDataAccess.GetAll().Where(x => x.PepId == pepid && x.PepRequestStatusID == 1 && x.EndDate == null).ToList();
                //    //reqAssignmentChangeStatustoComplete.ForEach(x => x.EndDate = DateTime.Now);
                //    //reqAssignmentChangeStatustoComplete.ForEach(x => x.PepRequestStatusID = 4);
                //    //foreach (CDDGRequestAssignment req in reqAssignmentChangeStatustoComplete)
                //    //{
                //    //    requestAssignmentDataAccess.Update(req);
                //    //}
                //    var reqAssignment = requestAssignmentDataAccess.GetAll().Where(x => x.PepId == pepid && x.ChangeRequestID == pepentity.ChangeRequestId);
                //    reqAssignment.ToList().ForEach(x => x.PepRequestStatusID = 5);
                //    foreach (CDDGRequestAssignment req in reqAssignment)
                //    {
                //        requestAssignmentDataAccess.Update(req);
                //    }
                //}

                return 1;
            }
        }

        public IEnumerable<PepRequestAutoAssignmentEntity> GetCPTMembersTeamAssignments()
        {
            var result = requestAutoAssignmentDataAccess.GetAll().Where(x=>x.EndDate==null);
            Mapper.CreateMap<CDDGPepRequestAutoAssignment, PepRequestAutoAssignmentEntity>();
            
            //.ForMember(a => a.RoleName, b => b.MapFrom(c => c.CDDGUser.CDDGUserRoles.Where(x=>x.UserID== c.UserId).Select(x => x.CDDGRole.RoleName).FirstOrDefault().ToString()));

            var pepautoassignmententity = Mapper.Map<IEnumerable<CDDGPepRequestAutoAssignment>, IEnumerable<PepRequestAutoAssignmentEntity>>(result);
            pepautoassignmententity.ToList().ForEach(x => x.RoleName = "CPT- PEP Determination Team");
            pepautoassignmententity.ToList().ForEach(x =>
            {
                if (x.AutoAssignmentBlackOutStartDate != null)
                    x.AutoAssignmentBlackOutStartDate = x.AutoAssignmentBlackOutStartDate.Value.Date;
                if (x.AutoAssignmentBlackOutEndDate != null)
                    x.AutoAssignmentBlackOutEndDate = x.AutoAssignmentBlackOutEndDate.Value.Date;
            });
            return pepautoassignmententity;
        }

        public int updateCPTMembersTeamAssignments(PepRequestAutoAssignmentEntity entity)
        {
            if (entity.NolongerTeamMember)
            {
                var user = userDetailsDataAccess.FindSingleBy(x => x.UserID == entity.UserId);
                user.EndDate = DateTime.Now;
                userDetailsDataAccess.Update(user);
            }

            Mapper.CreateMap<PepRequestAutoAssignmentEntity, CDDGPepRequestAutoAssignment>();
            var a = Mapper.Map<CDDGPepRequestAutoAssignment>(entity);
            var result = requestAutoAssignmentDataAccess.Update(a);
            return result;
        }

        public IEnumerable<PEPChangeRequestEntity> GEtCrsforpepid(int? pepId)
        {
            var data = changeRequestDataAccess.GetAll().Where(x => x.PepId == pepId && x.EndDate == null);
            Mapper.CreateMap<CDDGChangeRequest, PEPChangeRequestEntity>();
            var result = Mapper.Map<IEnumerable<CDDGChangeRequest>, IEnumerable<PEPChangeRequestEntity>>(data);
            return result;
        }

        public PEPChangeRequestEntity GetCrDetailsbyCrid(int? changeRequestID)
        {
            var Crdetail= changeRequestDataAccess.FindSingleBy(x => x.ChangeRequestId == changeRequestID);
            Mapper.CreateMap<CDDGChangeRequest, PEPChangeRequestEntity>();
            var Cr = Mapper.Map<PEPChangeRequestEntity>(Crdetail);
            return Cr;
        }
    }
}
#endregion
