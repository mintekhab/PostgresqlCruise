USE [Insurance]
GO
/****** Object:  Schema [ins]    Script Date: 9/17/2015 3:43:16 PM ******/
CREATE SCHEMA [ins]
GO
/****** Object:  Table [ins].[Category]    Script Date: 9/17/2015 3:43:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ins].[Category](
	[CategoryID] [int] IDENTITY(0,1) NOT NULL,
	[CategoryName] [varchar](100) NOT NULL,
	[CategoryDescription] [varchar](200) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[LastUpdatedBy] [int] NOT NULL,
 CONSTRAINT [Category_PK] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ins].[Expression]    Script Date: 9/17/2015 3:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ins].[Expression](
	[ExpressionID] [int] IDENTITY(0,1) NOT NULL,
	[InternalExpressionName] [varchar](255) NOT NULL,
	[ExpressionDescription] [varchar](200) NULL,
	[ExpressionXML] [xml] NOT NULL,
	[VendorID] [int] NOT NULL,
	[ScheduleID] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[LastUpdatedBy] [int] NOT NULL,
 CONSTRAINT [Expression_PK] PRIMARY KEY CLUSTERED 
(
	[ExpressionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ins].[InsuranceProduct]    Script Date: 9/17/2015 3:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ins].[InsuranceProduct](
	[InsuranceProductID] [int] IDENTITY(0,1) NOT NULL,
	[InsuranceID] [int] NOT NULL,
	[InsuranceVendorID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[TemplateID] [int] NOT NULL,
	[SiteID] [int] NOT NULL,
	[LineOfBusinessID] [smallint] NOT NULL,
	[ProductName] [varchar](100) NOT NULL,
	[ProductDescription] [varchar](200) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[LastUpdateBy] [int] NOT NULL,
 CONSTRAINT [InsuranceProduct_PK] PRIMARY KEY CLUSTERED 
(
	[InsuranceProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [akInsuranceProduct_InsuranceID] UNIQUE NONCLUSTERED 
(
	[InsuranceID] ASC,
	[SiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ins].[ProductExpression]    Script Date: 9/17/2015 3:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ins].[ProductExpression](
	[ProductExpressionID] [int] IDENTITY(0,1) NOT NULL,
	[ExpressionID] [int] NOT NULL,
	[InsuranceProductID] [int] NOT NULL,
	[ProductExpressionName] [varchar](255) NOT NULL,
	[ExpressionType] [smallint] NOT NULL,
	[EffectiveDate] [date] NOT NULL,
	[TerminationDate] [date] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[LastUpdatedBy] [int] NOT NULL,
 CONSTRAINT [ProductExpression_PK] PRIMARY KEY CLUSTERED 
(
	[ProductExpressionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ins].[Schedule]    Script Date: 9/17/2015 3:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ins].[Schedule](
	[ScheduleID] [int] IDENTITY(0,1) NOT NULL,
	[InsuranceVendorID] [int] NOT NULL,
	[ScheduleName] [varchar](40) NOT NULL,
	[AxisCount] [smallint] NOT NULL,
	[ScheduleXML] [xml] NOT NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[TerminationDate] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[LastUpdatedBy] [int] NOT NULL,
 CONSTRAINT [Schedule_PK] PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [ins].[Template]    Script Date: 9/17/2015 3:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ins].[Template](
	[TemplateID] [int] IDENTITY(0,1) NOT NULL,
	[TemplateName] [varchar](100) NOT NULL,
	[InsuranceVendorID] [int] NOT NULL,
	[ViewReference] [varchar](200) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
	[LastUpdatedBy] [int] NOT NULL,
 CONSTRAINT [Template_PK] PRIMARY KEY CLUSTERED 
(
	[TemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [ins].[vExpression]    Script Date: 9/17/2015 3:43:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [ins].[vExpression] WITH SCHEMABINDING
                AS SELECT ExpressionID
                      ,InternalExpressionName
                      ,VendorID
                      ,ScheduleID
                  FROM ins.Expression
                  WHERE IsActive = 1
GO
ALTER TABLE [ins].[Expression]  WITH CHECK ADD  CONSTRAINT [Expression_Schedule_FK1] FOREIGN KEY([ScheduleID])
REFERENCES [ins].[Schedule] ([ScheduleID])
GO
ALTER TABLE [ins].[Expression] CHECK CONSTRAINT [Expression_Schedule_FK1]
GO
ALTER TABLE [ins].[InsuranceProduct]  WITH CHECK ADD  CONSTRAINT [InsuranceProduct_Category_FK1] FOREIGN KEY([CategoryID])
REFERENCES [ins].[Category] ([CategoryID])
GO
ALTER TABLE [ins].[InsuranceProduct] CHECK CONSTRAINT [InsuranceProduct_Category_FK1]
GO
ALTER TABLE [ins].[InsuranceProduct]  WITH CHECK ADD  CONSTRAINT [InsuranceProduct_Template_FK1] FOREIGN KEY([TemplateID])
REFERENCES [ins].[Template] ([TemplateID])
GO
ALTER TABLE [ins].[InsuranceProduct] CHECK CONSTRAINT [InsuranceProduct_Template_FK1]
GO
ALTER TABLE [ins].[ProductExpression]  WITH CHECK ADD  CONSTRAINT [ProductExpression_Expression_FK1] FOREIGN KEY([ExpressionID])
REFERENCES [ins].[Expression] ([ExpressionID])
GO
ALTER TABLE [ins].[ProductExpression] CHECK CONSTRAINT [ProductExpression_Expression_FK1]
GO
ALTER TABLE [ins].[ProductExpression]  WITH CHECK ADD  CONSTRAINT [ProductExpression_InsuranceProduct_FK1] FOREIGN KEY([InsuranceProductID])
REFERENCES [ins].[InsuranceProduct] ([InsuranceProductID])
GO
ALTER TABLE [ins].[ProductExpression] CHECK CONSTRAINT [ProductExpression_InsuranceProduct_FK1]
GO
