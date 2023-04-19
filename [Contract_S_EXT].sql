

 /***************************************************          
CREATED BY   :  Sudhanshu Shekhar
CREATED DATE  : 28-Nov-2022
MODIFIED BY   : Pranjal Pawar
MODIFIED DATE  : 28-Nov-2022 16:59
DESCRIPTION   : 
***************************************************/  

ALTER PROCEDURE [dbo].[Contract_S_EXT]   
 @USER [nvarchar](250),          
 @ADID [nvarchar](250),
 @ID int, 
 @Window nvarchar(10),
@VendorName [nvarchar](250),  
@DEffectiveDate [nvarchar](250),  
@DExpirationDate [nvarchar](250),  
@cbDocumentType [nvarchar](250),  
@cbAgreementType [nvarchar](250),  
@TotalContractValue [nvarchar](250),  
@cbExtractionStatus [nvarchar](250)

AS     
IF @Window='EXT'
BEGIN        
INSERT INTO Contract_EXT_LOG(FolderPath,TFileName,Assignee,QAAssignee,VendorName,DEffectiveDate,DExpirationDate,cbDocumentType,cbAgreementType,TotalContractValue
,cbExtractionStatus,DTDATE,RecordStatus,DImportDate,ImportID,DCompleteDate,Tuser,EXTID,EXTMoveDATE)
SELECT FolderPath,TFileName,Assignee,QAAssignee,VendorName,DEffectiveDate,DExpirationDate,cbDocumentType,cbAgreementType,TotalContractValue
,cbExtractionStatus,DTDATE,RecordStatus,DImportDate,ImportID,DCompleteDate,Tuser,ID,GETDATE()  FROM Contract_EXT WHERE ID=@ID;
 
UPDATE Contract_EXT SET VendorName=@VendorName,DEffectiveDate=@DEffectiveDate,DExpirationDate=@DExpirationDate,cbDocumentType=@cbDocumentType,
cbAgreementType=@cbAgreementType,TotalContractValue=@TotalContractValue
,cbExtractionStatus=@cbExtractionStatus,DTDATE=Getdate(),Tuser=@ADID WHERE ID=@ID;

IF @cbExtractionStatus=3
BEGIN
UPDATE Contract_EXT SET RecordStatus=0,DCompleteDate=GETDATE() WHERE ID=@ID
END

END
ELSE IF @Window='QA'
BEGIN        
INSERT INTO Contract_QA_LOG(FolderPath,TFileName,Assignee,QAAssignee,VendorName,DEffectiveDate,DExpirationDate,cbDocumentType,cbAgreementType,TotalContractValue
,cbExtractionStatus,DTDATE,RecordStatus,DImportDate,ImportID,DCompleteDate,Tuser,EXTID,EXTMoveDATE)
SELECT FolderPath,TFileName,Assignee,QAAssignee,VendorName,DEffectiveDate,DExpirationDate,cbDocumentType,cbAgreementType,TotalContractValue
,cbExtractionStatus,DTDATE,RecordStatus,DImportDate,ImportID,DCompleteDate,Tuser,ID,GETDATE()  FROM Contract_QA WHERE ID=@ID;
 
UPDATE Contract_QA SET VendorName=@VendorName,DEffectiveDate=@DEffectiveDate,DExpirationDate=@DExpirationDate,cbDocumentType=@cbDocumentType,
cbAgreementType=@cbAgreementType,TotalContractValue=@TotalContractValue
,cbExtractionStatus=@cbExtractionStatus,DTDATE=Getdate(),Tuser=@ADID WHERE ID=@ID;

IF @cbExtractionStatus=3
BEGIN
UPDATE Contract_QA SET RecordStatus=0,DCompleteDate=GETDATE() WHERE ID=@ID
END

END