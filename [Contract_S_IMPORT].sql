 /***************************************************          
CREATED BY   :  Sudhanshu Shekhar
CREATED DATE  : 28-Nov-2022
MODIFIED BY   : 
MODIFIED DATE  :
DESCRIPTION   : 
***************************************************/  

CREATE PROCEDURE [dbo].[Contract_S_IMPORT]   --'C://ABC//','222','Narayan.Khajuria','riya.gupta'       
 @FILENAME [nvarchar](max),          
 @RECORDS [nvarchar](10),          
 @USER [nvarchar](250),          
 @ADID [nvarchar](250)          
WITH EXECUTE AS CALLER          
AS          
BEGIN          
 DECLARE @MSG NVARCHAR(MAX)          
 BEGIN TRY 

 --INSERT RECORD IN LOG TABLE          
  DECLARE @LOGID BIGINT,@COUNT_EFFECTED_RECORD INT          
  SET @COUNT_EFFECTED_RECORD=0          
  INSERT INTO [Contract_IMPORT_LOGS](T_USER,T_DATE,TRECORDS,IMPORTSUCCESS,TFILENAME,ADID)          
  SELECT @USER,GETDATE(),@RECORDS,'',@FILENAME,@ADID          
 --GET THE LOG RECORD ID          
  SET @LOGID=@@IDENTITY          
          
  
                
           
	 INSERT INTO Contract_EXT(FolderPath,TFileName,Assignee,QAAssignee,VendorName,DEffectiveDate,DExpirationDate,cbDocumentType,cbAgreementType,
	 TotalContractValue,cbExtractionStatus,DTDATE,RecordStatus,DImportDate,ImportID,DCompleteDate,Tuser)    
    
		SELECT COL1 AS FolderPath, COL2 As FileName, COL3 As Assignee, COL4 As QAAssignee, COL5 as VendorName, 
		CAST(ISNULL(COL6,'1900-01-01') AS DATE) AS DEffectiveDate,
		CAST(ISNULL(COL7,'1900-01-01') AS DATE) AS DExpirationDate,
		isnull((select id from Contract_DocumentType_Master where name=e.COL8 ),'1') AS  cbDocumentType,
		isnull((select id from Contract_AgreementType_Master where name=e.COL9 ),'1') AS  cbAgreementType,
		--isNull(stuff((select ',' + CAST(ID as nvarchar(Max)) from (select ID from Contract_AgreementType_Master where Name in(select Data from Split(e.COL9,','))) u for xml path('')),1,1,''),1) as cbAgreementType,
		COL10 as TotalContractValue,
		isnull((select id from Contract_ExtractionStatus_Master where name=e.COL11 ),'1') AS  cbExtractionStatus,
		'1900-01-01' as DTDATE,
		1 as RecordStatus,
		getdate() as DImportDate,
		@LOGID AS ImportID,
		'1900-01-01' as DCompleteDate,
		@ADID AS Tuser
	   FROM Contract_Import e 
          
        SET @COUNT_EFFECTED_RECORD=@@ROWCOUNT   
          
      --start update log          
       UPDATE [Contract_IMPORT_LOGS] SET IMPORTSUCCESS=@COUNT_EFFECTED_RECORD WHERE ID=@LOGID          
      --end update log            
      --Start truncate import table          
       truncate table Contract_Import          
      --end truncate import table          
    
      --Get count of inserted records          
       SELECT COUNT(*),@RECORDS FROM Contract_EXT WHERE IMPORTID=@LOGID        
   
 END TRY          
 BEGIN CATCH          
 --truncate table Contract_Import          
  --SET @MSG='subID not in correct format or import issue!!'               
  --RAISERROR (@MSG,16,1)          
  set @MSG = cast(Error_Message() as nvarchar); 
  IF @MSG='Conversion failed when convert'
  BEGIN 
  RAISERROR ('Please enter correct value in Date Fields',16,1)     
       truncate table Contract_Import       
  
  END
  ELSE 
  BEGIN 
  RAISERROR (@MSG,16,1)          
       truncate table Contract_Import          

  END
       
 END CATCH          
END          


