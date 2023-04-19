 /***************************************************          
CREATED BY   :  Ankita Bansal
CREATED DATE  : 28-Nov-2022
MODIFIED BY   : 
MODIFIED DATE  :
DESCRIPTION   : 
***************************************************/  

Create View Contract_V_QA
as
select c.id,c.FolderPath,c.TFileName,c.Assignee,c.QAAssignee,c.VendorName,c.DEffectiveDate,c.DExpirationDate,d.Name as cbDocumentType,A.Name as cbAgreementType,c.TotalContractValue,
E.Name as cbExtractionStatus,c.DTDate,c.RecordStatus from Contract_QA c JOIN Contract_DocumentType_Master d ON  d.id=c.cbDocumentType
JOIN Contract_AgreementType_Master A ON A.Id=c.cbAgreementType
JOIN Contract_ExtractionStatus_Master E ON E.Id=c.cbExtractionStatus