CREATE TABLE [dbo].[CDDGUserCountry](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NULL,
	[CreatedTS] [datetime] NULL,
	[CreatedBy] [varchar](10) NULL,
	[UpdatedBy] [varchar](10) NULL,
	[UpdatedTS] [datetime] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [XPKCDDGUSERCOUNTRY] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
