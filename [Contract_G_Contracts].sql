 /***************************************************          
CREATED BY   :  Sudhanshu Shekhar
CREATED DATE  : 28-Nov-2022
MODIFIED BY   : 
MODIFIED DATE  :
DESCRIPTION   : 
***************************************************/  
CREATE PROCEDURE [dbo].[Contract_G_Contracts]  
 @USER [nvarchar](250),          
 @ADID [nvarchar](250),
 @ID int,
 @Window [nvarchar](10)    
AS 
IF @Window='EXT' AND @ID=''
BEGIN       
SELECT id,FolderPath,TFileName,Assignee,QAAssignee,VendorName,DEffectiveDate,DExpirationDate,cbDocumentType,cbAgreementType,TotalContractValue
,cbExtractionStatus,DTDate,RecordStatus FROM Contract_V_EXT where Assignee=@USER
END
ELSE IF @Window='EXT' AND @ID<>''
BEGIN  
SELECT id,FolderPath,TFileName,Assignee,QAAssignee,VendorName,DEffectiveDate,DExpirationDate,cbDocumentType,cbAgreementType,TotalContractValue
,cbExtractionStatus,DTDate,RecordStatus FROM Contract_V_EXT where Assignee=@USER and ID=@ID
END
ELSE IF @Window='QA' AND @ID=''
BEGIN
SELECT id,FolderPath,TFileName,Assignee,QAAssignee,VendorName,DEffectiveDate,DExpirationDate,cbDocumentType,cbAgreementType,TotalContractValue
,cbExtractionStatus,DTDate,RecordStatus FROM Contract_V_QA where QAAssignee=@USER
END
ELSE IF @Window='QA' AND @ID<>''
BEGIN  
SELECT id,FolderPath,TFileName,Assignee,QAAssignee,VendorName,DEffectiveDate,DExpirationDate,cbDocumentType,cbAgreementType,TotalContractValue
,cbExtractionStatus,DTDate,RecordStatus FROM Contract_V_QA where QAAssignee=@USER and ID=@ID
END