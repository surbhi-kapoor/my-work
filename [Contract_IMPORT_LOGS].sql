CREATE TABLE [dbo].[Contract_IMPORT_LOGS](

	[Id] [int] IDENTITY(1,1) NOT NULL,
	T_USER [nvarchar](max) NULL,
	T_DATE datetime,
	TRECORDS [nvarchar](250) NULL,
	IMPORTSUCCESS [nvarchar](250) NULL,
	TFILENAME [nvarchar](max) NULL,	
	ADID [nvarchar](max) NULL

PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

