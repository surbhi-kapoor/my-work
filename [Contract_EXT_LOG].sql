CREATE TABLE [dbo].[Contract_EXT_LOG](

	[Id] [int] IDENTITY(1,1) NOT NULL,
	FolderPath [nvarchar](max) NULL,
	TFileName [nvarchar](max) NULL,
	Assignee [nvarchar](250) NULL,
	QAAssignee [nvarchar](250) NULL,
	VendorName [nvarchar](max) NULL,
	DEffectiveDate datetime,
	DExpirationDate datetime,
	cbDocumentType [nvarchar](10) NULL,
	cbAgreementType [nvarchar](10) NULL,
	TotalContractValue [nvarchar](max) NULL,
	cbExtractionStatus [nvarchar](10) NULL,
	DTDATE datetime,
	RecordStatus bit,
	DImportDate datetime,
	ImportID int,
	DCompleteDate datetime,
	Tuser [nvarchar](max) NULL,
	EXTID int,
	EXTMoveDATE datetime

PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


