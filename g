  //New Update 
                    bool HasPreviousCr = ecndataaccess.GetAll().Where(x => x.PepId == pepid).Any(x => x.PepRequestStatusID.Value == 2);
                    if (HasPreviousCr)
                    {
 var PreviousApprovedData = ecnChangeStatustoComplete.Where(x => x.ParentEcn == null).ToList();
                    int i = 1;
                    PreviousApprovedData.ToList().ForEach(x=>{
                        string seq =Convert.ToString(data.Count() + i);
                        x.EcnSeqVal = seq;
                        x.EcnSeqValNum = seq;
                        x.EndDate = null;
                        x.ChangeRequestID = pepentity.ChangeRequestId;
                    });
                    foreach (CDDGEcn item in PreviousApprovedData)
                    {
                        ecndataaccess.AddNew(item);
                    }
