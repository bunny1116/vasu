//using WF.ERMT.Application.DataEntities.DataEntities;
using System.Collections.Generic;
using WF.ERMT.Application.Entities.CustomEntities;
using WF.ERMT.Application.Core.Interfaces.Business;
using System;

namespace WF.ERMT.Application.Services.PEPDetails
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in both code and config file together.
    public class PEPDetails : IPEPDetails
    {
        private readonly IPEPDetailsBusiness pepdetailsbusiness;
        private readonly IAutoAssignment autoassignmentbusiness;

        public PEPDetails(IPEPDetailsBusiness pepdetailsbusiness, IAutoAssignment autoassignmentbusiness)
        {
            this.pepdetailsbusiness = pepdetailsbusiness;
            this.autoassignmentbusiness = autoassignmentbusiness;
        }

　
        public IEnumerable<PEPEntity> GetAllPEPDetails()
        {
            var pepList = pepdetailsbusiness.GetAllPEPDetails();
            return pepList;
        }

        public PEPEntity GetSinglePEPbyid(int? pepid)
        {
            var pep = pepdetailsbusiness.GetSinglePEPbyid(pepid);
            return pep;
        }

        public void DeleteRowsFromRelatedTablesForRejectionWorkflow(int pepid)
        {
            pepdetailsbusiness.DeleteRowsFromRelatedTablesForRejectionWorkflow(pepid);
           
        }

        public void UpdateRowsFromRelatedTablesForRejectionWorkflow(int pepid)
        {
            pepdetailsbusiness.UpdateRowsFromRelatedTablesForRejectionWorkflow(pepid);

        }

        public RequestAssignmentEntity GetSingleRequestAssignmentRowbyid(int? reqId, string reqType)
        {
            var reqAssignment = autoassignmentbusiness.GetSingleRequestAssignmentbyid(reqId, reqType);
            return reqAssignment;
        }

        public int UpdateRequestAssignmentRow(RequestAssignmentEntity reqAssignment)
        {
            var result = autoassignmentbusiness.UpdateRequestAssignmentRow(reqAssignment);
            return result;

        }

        public RequestAssignmentEntity AddNew(RequestAssignmentEntity reqAssignment)
        {
            var result = autoassignmentbusiness.AddNew(reqAssignment);
            return result;

        }

        public IEnumerable<EcnEntity> GetEcnByPepId(int? pepid)
        {
            var ecn = pepdetailsbusiness.GetEcnByPepId(pepid);
            return ecn;
        }

        public PEPEntity AddNew(PEPEntity pep)
        {
            var result = pepdetailsbusiness.AddNew(pep);
            autoassignmentbusiness.AssignPepRequest(pep);
            return result;

        }

        public PEPChangeRequestEntity AddNewChangeRequest(PEPEntity pep)
        {
            var result = pepdetailsbusiness.AddNewChangeRequest(pep);
            //pep.CRId = result.ChangeRequestId;
            
            return result;

        }

        public void AssignPepRequest(PEPEntity pep)
        {
            autoassignmentbusiness.AssignPepRequest(pep);

        }
        public EcnEntity AddNewEcn(EcnEntity ecn)
        {
            var result = pepdetailsbusiness.AddNewEcn(ecn);
            return result;
        }

　
        public PepHistoryEntity AddNewPepHistory(PepHistoryEntity pep)
        {
            var result = pepdetailsbusiness.AddNewPepHistory(pep);
            return result;
        }

        public LobPepEntity AddNewLobPep(LobPepEntity lobpep)
        {
            var result = pepdetailsbusiness.AddNewLobPep(lobpep);
            return result;
        }

        public PrimaryPepCountryLobEntity AddNewPrimaryPepLob(PrimaryPepCountryLobEntity primarypeplob)
        {
            var result = pepdetailsbusiness.AddNewPrimaryPepCountryLob(primarypeplob);
            return result;
        }

        public PrimaryPepAssociatedCountryLobEntity AddNewPrimaryPepAssociatedCountryLob(PrimaryPepAssociatedCountryLobEntity primarypepassociatedcountrylob)
        {
            var result = pepdetailsbusiness.AddNewPrimaryPepAssociatedCountryLob(primarypepassociatedcountrylob);
            return result;
        }

        public CustomerEntity AddNewCustomer(CustomerEntity customer)
        {
            var result = pepdetailsbusiness.AddNewCustomer(customer);
            return result;
        }

        public CustomerCountryLobEntity AddNewCustomerCountryLob(CustomerCountryLobEntity custcountrylob)
        {
            var result = pepdetailsbusiness.AddNewCustomerCountryLob(custcountrylob);
            return result;
        }

　
        public AttachmentEntity AddNewAttachment(AttachmentEntity attachment)
        {
            var result = pepdetailsbusiness.AddNewAttachment(attachment);
            return result;
        }

        public AttachmentEntity GetAttachment(int id)
        {
            var result = pepdetailsbusiness.GetAttachment(id);
            return result;
        }

        public AttachmentEntity GetAttachmentRelatedtoPepId(int id)
        {
            var result = pepdetailsbusiness.GetAttachmentRelatedtoPepId(id);
            return result;
        }

　
　
        public int UpdateAttachment(AttachmentEntity attachment)
        {
            var result = pepdetailsbusiness.UpdateAttachment(attachment);
            return result;
        }

        public int Update(PEPEntity pep)
        {
            var result = pepdetailsbusiness.Update(pep);
            return result;

        }

        public int UpdateEcn(EcnEntity ecn)
        {
            var result = pepdetailsbusiness.UpdateEcn(ecn);
            return result;

        }

　
        public int Delete(PEPEntity pep)
        {
            var result = pepdetailsbusiness.Delete(pep);
            return result;

        }

        public DashBoardViewModel GetPDTDashboardDetails(int userId)
        {
            var pepList = pepdetailsbusiness.GetPDTDashboardDetails(userId);
            return pepList;
        }

        public DashBoardViewModel GetAllPEPFormsCreatedByLOBUser(string userId)
        {
            var pepList = pepdetailsbusiness.GetAllPEPFormsCreatedByLOBUser(userId);
            return pepList;
        }

        public SearchDetailsViewModel GetPEPSearchDetails(SearchPEPEntity searchDetails)
        {
            var pepList = pepdetailsbusiness.GetPEPSearchDetails(searchDetails);
            return pepList;
        }

        public DashBoardViewModel GetPDTManagerDashboardDetails()
        {

　
            var pepList = pepdetailsbusiness.GetPDTManagerDashboardDetails();
            return pepList;

        }

        public DisplayPepInformationListViewModel GetPepListForUserId(int userId, string pepStatus)
        {
            var aa = pepdetailsbusiness.GetOpenRequestPepListForUserId(userId, pepStatus);

            return aa;
        }

        public PrimaryPepEntity AddNewPrimaryPep(PrimaryPepEntity primarypep)
        {
            var result = pepdetailsbusiness.AddNewPrimaryPep(primarypep);
            return result;
        }

        public int UpdateCRforPEP(PEPEntity pepdetails)
        {
            var result = pepdetailsbusiness.UpdateCRforPEP(pepdetails);
            return result;
        }

        public PEPEntity GetSinglePEPbyidforCR(int? pepid, int crid)
        {
            var result = pepdetailsbusiness.GetSinglePEPbyidforCR(pepid, crid);
            return result;
        }

        public int AcceptPEPDeterminationFormCR(int? pepId, int crid)
        {
           var result =  pepdetailsbusiness.AcceptPEPDeterminationFormCR(pepId, crid);
            return result;
        }

        public int CancelPepRequest(int? pepId, string cancelcomments)
        {
            var result = pepdetailsbusiness.CancelPepRequest(pepId, cancelcomments);
            return result;
        }

        public int RejectPEPDeterminationFormCR(int? pepId,int crid)
        {
            var result = pepdetailsbusiness.RejectPEPDeterminationFormCR(pepId,crid);
            return result;
        }

        public IEnumerable<PepRequestAutoAssignmentEntity> GetCPTMembersTeamAssignments()
        {
            var result = pepdetailsbusiness.GetCPTMembersTeamAssignments();
            return result;
        }

        public int updateCPTMembersTeamAssignments(PepRequestAutoAssignmentEntity entity)
        {
            var result = pepdetailsbusiness.updateCPTMembersTeamAssignments(entity);
            return result;
        }

        public IEnumerable<PEPChangeRequestEntity> GEtCrsforpepid(int? pepId)
        {
            var result = pepdetailsbusiness.GEtCrsforpepid(pepId);
            return result;
        }
        public IEnumerable<PepHistoryViewModel> GetAllHistory(int pepId)
        {
            var pepList = pepdetailsbusiness.GetAllHistory(pepId);
            return pepList;
        }

        public PEPChangeRequestEntity GetCrDetailsbyCrid(int? changeRequestID)
        {
            var CrDetail = pepdetailsbusiness.GetCrDetailsbyCrid(changeRequestID);
            return CrDetail;
        }
    }
    
}
