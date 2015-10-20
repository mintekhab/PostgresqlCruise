USE [CruiseBooking]
GO
/****** Object:  Schema [common]    Script Date: 9/17/2015 3:45:40 PM ******/
CREATE SCHEMA [common]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[TravelProductID] [int] NOT NULL,
	[TRL] [int] NOT NULL,
	[TUID] [int] NOT NULL,
	[TravelPackageTypeID] [tinyint] NOT NULL,
	[BookingEndDate] [smalldatetime] NOT NULL,
	[WizardID] [tinyint] NOT NULL,
	[MarketingProgramID] [smallint] NOT NULL,
	[PartnerID] [int] NOT NULL,
	[ReferralTrackingServiceID] [tinyint] NOT NULL,
	[ReferralTrackingNbr] [varchar](255) NOT NULL,
	[ABTestGroupID] [tinyint] NOT NULL,
	[ItineraryPurposeMask] [int] NOT NULL,
	[GroupAccountID] [int] NULL,
	[BookingDesc] [varchar](255) NOT NULL,
	[CreateDate] [smalldatetime] NOT NULL,
	[CreateTUID] [int] NOT NULL,
	[UpdateDate] [smalldatetime] NULL,
	[UpdateTUID] [int] NOT NULL,
	[LangID] [smallint] NULL,
	[GroupAccountDepartmentID] [int] NULL,
	[AgentAssistedBool] [tinyint] NOT NULL,
	[AffiliateID] [int] NULL,
	[OperatingUnitID] [int] NULL,
 CONSTRAINT [XPKBooking] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingAffiliateSource]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingAffiliateSource](
	[BookingID] [int] NOT NULL,
	[ShopperID] [varchar](255) NOT NULL,
	[LinkID] [varchar](255) NOT NULL,
	[PublisherWebSiteID] [varchar](255) NULL,
	[CreateDate] [smalldatetime] NOT NULL,
	[CreateTUID] [int] NOT NULL,
	[UpdateDate] [smalldatetime] NOT NULL,
	[UpdateTUID] [int] NOT NULL,
 CONSTRAINT [pkBookingAffiliateSource] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingAmount]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingAmount](
	[BookingID] [int] NOT NULL,
	[BookingAmountSeqNbr] [smallint] NOT NULL,
	[BookingAmountLevelID] [tinyint] NOT NULL,
	[BookingItemID] [int] NULL,
	[BookingItemInventorySeqNbr] [smallint] NULL,
	[BookingItemTypeID] [tinyint] NULL,
	[MonetaryClassID] [tinyint] NOT NULL,
	[MonetaryCalculationSystemID] [smallint] NOT NULL,
	[MonetaryCalculationID] [int] NOT NULL,
	[CurrencyCodeCost] [char](3) NOT NULL,
	[TransactionAmtCost] [money] NOT NULL,
	[BookingAmountRefCodeCost] [varchar](60) NOT NULL,
	[BookingAmountDescCost] [varchar](255) NOT NULL,
	[CurrencyCodePrice] [char](3) NOT NULL,
	[TransactionAmtPrice] [money] NOT NULL,
	[BookingAmountRefCodePrice] [varchar](60) NOT NULL,
	[BookingAmountDescPrice] [varchar](255) NOT NULL,
	[CancelBool] [bit] NOT NULL,
	[CreateDate] [datetime] NULL,
	[CreateTUID] [int] NOT NULL,
	[BookingAmountRowGUID] [varchar](36) NULL,
	[OrderOperationCorrelationID] [varchar](36) NULL,
	[PrimaryModificationReasonID] [smallint] NULL,
	[SecondaryModificationReasonID] [smallint] NULL,
 CONSTRAINT [XPKBookingAmount] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC,
	[BookingAmountSeqNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingAttributeExtension]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingAttributeExtension](
	[BookingID] [int] NOT NULL,
	[BookingAttributeExtSeqNbr] [tinyint] NOT NULL,
	[BookingItemID] [int] NULL,
	[BookingTravelerSeqNbr] [tinyint] NULL,
	[DomainTypeIDNameSpaceID] [int] NOT NULL,
	[BookingAttributeExtName] [varchar](100) NOT NULL,
	[BookingAttributeExtValue] [varchar](500) NOT NULL,
	[CreateDate] [smalldatetime] NOT NULL,
	[CreateTUID] [int] NOT NULL,
	[UpdateDate] [smalldatetime] NULL,
	[UpdateTUID] [int] NOT NULL,
 CONSTRAINT [XPKBookingAttributeExtension] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC,
	[BookingAttributeExtSeqNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingAuditEvent]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingAuditEvent](
	[BookingAuditEventID] [tinyint] NOT NULL,
	[BookingAuditEventVersionNbr] [tinyint] NOT NULL,
	[BookingAuditEventName] [varchar](60) NOT NULL,
	[BookingAuditEventDesc] [varchar](255) NOT NULL,
	[AuditObjectKeyFmt] [varchar](255) NULL,
	[AuditDescFmt] [varchar](1000) NULL,
	[StatusCode] [char](1) NOT NULL,
	[UpdateDate] [smalldatetime] NOT NULL,
	[LastUpdatedBy] [varchar](32) NOT NULL,
 CONSTRAINT [XPKBookingAuditEvent] PRIMARY KEY CLUSTERED 
(
	[BookingAuditEventID] ASC,
	[BookingAuditEventVersionNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingAuditLog]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingAuditLog](
	[BookingAuditEventID] [tinyint] NOT NULL,
	[BookingAuditEventVersionNbr] [tinyint] NOT NULL,
	[AuditActionID] [tinyint] NOT NULL,
	[TravelProductID] [int] NOT NULL,
	[BookingID] [int] NOT NULL,
	[BookingItemID] [int] NULL,
	[SequenceNbr] [int] NULL,
	[AuditObjectKeyValue] [varchar](255) NOT NULL,
	[AuditDesc] [varchar](2000) NOT NULL,
	[TransactionGUID] [varbinary](16) NOT NULL,
	[AuditTravelProductID] [int] NOT NULL,
	[AuditTUID] [int] NOT NULL,
	[AuditDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingItem]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingItem](
	[BookingItemID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NOT NULL,
	[BookingItemIDOriginal] [int] NULL,
	[BookingItemIDPrior] [int] NULL,
	[BookingItemTypeID] [tinyint] NOT NULL,
	[BookingItemStateID] [tinyint] NOT NULL,
	[BookingItemStateIDPending] [tinyint] NOT NULL,
	[BookingFulfillmentMethodID] [tinyint] NOT NULL,
	[BookingFulfillmentStateID] [tinyint] NOT NULL,
	[BookingFulfillmentDate] [smalldatetime] NULL,
	[UseDateBegin] [smalldatetime] NOT NULL,
	[UseDateEnd] [smalldatetime] NOT NULL,
	[BookingRecordSystemID] [tinyint] NOT NULL,
	[BookingRecordSystemReferenceCode] [varchar](35) NOT NULL,
	[AccountingVendorID] [int] NOT NULL,
	[SupplierBookingConfirmationCode] [varchar](50) NOT NULL,
	[SupplierBookingConfirmationDate] [smalldatetime] NULL,
	[SupplierCancelConfirmationCode] [varchar](50) NOT NULL,
	[SupplierCancelConfirmationDate] [smalldatetime] NULL,
	[BookingItemDesc] [varchar](255) NOT NULL,
	[CancelDate] [smalldatetime] NULL,
	[CancelTUID] [int] NULL,
	[CreateDate] [smalldatetime] NOT NULL,
	[CreateTUID] [int] NOT NULL,
	[UpdateDate] [smalldatetime] NULL,
	[UpdateTravelProductID] [int] NOT NULL,
	[UpdateTUID] [int] NOT NULL,
	[CRSReconstructDate] [smalldatetime] NULL,
	[DomainTypeIDSKUDomain] [int] NULL,
	[SKUID] [int] NULL,
	[BookingFulfillmentDateScheduled] [smalldatetime] NULL,
	[RevenueReportingTypeID] [tinyint] NULL,
	[ReserveDate] [smalldatetime] NULL,
	[ReserveTUID] [int] NULL,
	[BookDate] [smalldatetime] NULL,
	[BookTUID] [int] NULL,
	[DistributorBookingItemReferenceCode] [varchar](50) NULL,
	[ReserveEndDate] [smalldatetime] NULL,
 CONSTRAINT [XPKBookingItem] PRIMARY KEY NONCLUSTERED 
(
	[BookingItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingItemBookingTraveler]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingItemBookingTraveler](
	[BookingID] [int] NOT NULL,
	[BookingTravelerSeqNbr] [tinyint] NOT NULL,
	[BookingItemID] [int] NOT NULL,
	[PrimaryTravelerBool] [tinyint] NOT NULL,
	[BookingItemBookingTravelerLogID] [int] NULL,
	[CreateDate] [smalldatetime] NULL,
	[CreateTUID] [int] NOT NULL,
 CONSTRAINT [XPKBookingItemBookingTraveler] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC,
	[BookingTravelerSeqNbr] ASC,
	[BookingItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookingItemBookingTravelerLog]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingItemBookingTravelerLog](
	[BookingItemBookingTravelerLogID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NOT NULL,
	[BookingItemID] [int] NOT NULL,
	[BookingTravelerSeqNbr] [tinyint] NOT NULL,
	[PrimaryTravelerBool] [bit] NOT NULL,
	[BookingItemBookingTravelerLogIDPrior] [int] NULL,
	[CreateDateOriginal] [smalldatetime] NOT NULL,
	[CreateTUIDOriginal] [int] NOT NULL,
	[CreateDate] [smalldatetime] NOT NULL,
 CONSTRAINT [XPKBookingItemBookingTravelerLog] PRIMARY KEY CLUSTERED 
(
	[BookingItemBookingTravelerLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookingItemHold]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingItemHold](
	[BookingItemID] [int] NOT NULL,
	[BookingItemHoldTypeID] [tinyint] NOT NULL,
	[BookingItemHoldStatusID] [tinyint] NOT NULL,
	[BookingItemHoldExpirationDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [XPKBookingItemHold] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookingItemHoldLog]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingItemHoldLog](
	[BookingItemID] [int] NOT NULL,
	[BookingItemHoldTypeID] [tinyint] NOT NULL,
	[BookingItemHoldExpirationDate] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [XPKBookingItemHoldLog] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookingItemNotification]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingItemNotification](
	[BookingItemID] [int] NOT NULL,
	[NotificationID] [int] NOT NULL,
	[BookingNotificationTypeID] [tinyint] NOT NULL,
	[NotificationDate] [smalldatetime] NOT NULL,
	[TravelProductID] [int] NOT NULL,
	[CreateDate] [smalldatetime] NOT NULL,
	[CreateTUID] [int] NOT NULL,
 CONSTRAINT [XPKBookingItemNotification] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC,
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookingItemWaiver]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingItemWaiver](
	[BookingItemID] [int] NOT NULL,
	[WaiverCoverageExpirationPeriod] [smallint] NOT NULL,
	[WaiverExercisedDate] [smalldatetime] NULL,
	[PurchaseTypeID] [tinyint] NOT NULL,
	[BookingSystemDatabaseTypeID] [tinyint] NOT NULL,
	[BookingIDReference] [int] NULL,
	[BookingItemIDOriginalReference] [int] NULL,
	[BookingRecordSystemID] [tinyint] NOT NULL,
	[BookingRecordSystemReferenceCode] [varchar](30) NOT NULL,
 CONSTRAINT [pkBookingItemWaiver] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingLock]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingLock](
	[BookingID] [int] NOT NULL,
	[BookingStateID] [tinyint] NOT NULL,
	[BookingNewBool] [bit] NOT NULL,
	[TravelProductID] [int] NOT NULL,
	[TransactionGUID] [varbinary](16) NOT NULL,
	[CreateDate] [smalldatetime] NOT NULL,
	[CreateTUID] [int] NOT NULL,
 CONSTRAINT [XPKBookingLock] PRIMARY KEY NONCLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingText]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingText](
	[BookingID] [int] NOT NULL,
	[BookingTextSeqNbr] [tinyint] NOT NULL,
	[BookingItemID] [int] NULL,
	[BookingTextTypeID] [tinyint] NOT NULL,
	[BookingTxt] [varchar](7950) NOT NULL,
	[CreateDate] [smalldatetime] NOT NULL,
	[CreateTUID] [int] NOT NULL,
	[UpdateDate] [smalldatetime] NULL,
	[UpdateTUID] [int] NOT NULL,
 CONSTRAINT [XPKBookingText] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC,
	[BookingTextSeqNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingTraveler]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingTraveler](
	[BookingID] [int] NOT NULL,
	[BookingTravelerSeqNbr] [tinyint] NOT NULL,
	[ActiveBool] [bit] NOT NULL,
	[TUID] [int] NULL,
	[FirstName] [varchar](60) NOT NULL,
	[MiddleName] [varchar](60) NOT NULL,
	[LastName] [varchar](60) NOT NULL,
	[PersonalTitleID] [tinyint] NOT NULL,
	[PersonAgeYearCnt] [tinyint] NULL,
	[PersonAgeTypeID] [tinyint] NOT NULL,
	[UserEmailAdr] [varchar](132) NOT NULL,
	[PhoneCountryPrefixNbrDay] [varchar](10) NOT NULL,
	[PhoneAreaCodeNbrDay] [varchar](10) NOT NULL,
	[PhoneLocalNbrDay] [varchar](15) NOT NULL,
	[PhoneExtensionNbrDay] [varchar](15) NOT NULL,
	[PhoneCountryPrefixNbrEvening] [varchar](10) NOT NULL,
	[PhoneAreaCodeNbrEvening] [varchar](10) NOT NULL,
	[PhoneLocalNbrEvening] [varchar](15) NOT NULL,
	[PhoneExtensionNbrEvening] [varchar](15) NOT NULL,
	[PhoneCountryPrefixNbrFax] [varchar](10) NOT NULL,
	[PhoneAreaCodeNbrFax] [varchar](10) NOT NULL,
	[PhoneLocalNbrFax] [varchar](15) NOT NULL,
	[PhoneExtensionNbrFax] [varchar](15) NOT NULL,
	[AddressLine1] [varchar](40) NOT NULL,
	[AddressLine2] [varchar](40) NOT NULL,
	[AddressLine3] [varchar](40) NOT NULL,
	[AddressLine4] [varchar](40) NOT NULL,
	[AddressLine5] [varchar](40) NOT NULL,
	[CityName] [varchar](40) NOT NULL,
	[RegionName] [varchar](40) NOT NULL,
	[PostalCode] [varchar](20) NOT NULL,
	[CountryCode] [char](3) NOT NULL,
	[CreateDate] [smalldatetime] NOT NULL,
	[CreateTUID] [int] NOT NULL,
	[UpdateDate] [smalldatetime] NULL,
	[UpdateTUID] [int] NOT NULL,
	[BirthDate] [smalldatetime] NULL,
	[GenderID] [tinyint] NULL,
	[NationalityCountryCode] [char](3) NULL,
 CONSTRAINT [XPKBookingTraveler] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC,
	[BookingTravelerSeqNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingTravelerLoyaltyPlan]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingTravelerLoyaltyPlan](
	[BookingID] [int] NOT NULL,
	[BookingTravelerSeqNbr] [tinyint] NOT NULL,
	[BookingTravelerLoyaltyPlanSeqNbr] [tinyint] NOT NULL,
	[LineOfBusinessID] [tinyint] NOT NULL,
	[LoyaltyPlanVendorCode] [varchar](10) NOT NULL,
	[LoyaltyPlanMembershipNbr] [varchar](60) NOT NULL,
	[NotifyBool] [bit] NOT NULL,
	[CreateDate] [smalldatetime] NOT NULL,
	[CreateTUID] [int] NOT NULL,
	[UpdateDate] [smalldatetime] NULL,
	[UpdateTUID] [int] NOT NULL,
 CONSTRAINT [XPKBookingTravelerLoyaltyPlan] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC,
	[BookingTravelerSeqNbr] ASC,
	[BookingTravelerLoyaltyPlanSeqNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingTravelerUnicode]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingTravelerUnicode](
	[BookingID] [int] NOT NULL,
	[BookingTravelerSeqNbr] [tinyint] NOT NULL,
	[FirstName] [nvarchar](60) NOT NULL,
	[MiddleName] [nvarchar](60) NOT NULL,
	[LastName] [nvarchar](60) NOT NULL,
	[AddressLine1] [nvarchar](80) NOT NULL,
	[AddressLine2] [nvarchar](80) NOT NULL,
	[AddressLine3] [nvarchar](80) NOT NULL,
	[AddressLine4] [nvarchar](80) NOT NULL,
	[AddressLine5] [nvarchar](80) NOT NULL,
	[CityName] [nvarchar](40) NOT NULL,
	[RegionName] [nvarchar](40) NOT NULL,
	[CreateDate] [smalldatetime] NOT NULL,
	[CreateTUID] [int] NOT NULL,
	[UpdateDate] [smalldatetime] NULL,
	[UpdateTUID] [int] NOT NULL,
 CONSTRAINT [XPKBookingTravelerUnicode] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC,
	[BookingTravelerSeqNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DBBuildObject]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DBBuildObject](
	[RelativePath] [varchar](200) NOT NULL,
	[FileName] [varchar](200) NOT NULL,
	[FileDate] [datetime] NOT NULL,
	[MajorVersion] [varchar](10) NOT NULL,
	[MinorVersion] [varchar](10) NOT NULL,
	[BuildCount] [varchar](10) NOT NULL,
	[ObjectID] [int] NULL,
	[ObjectType] [char](2) NULL,
	[ObjectName] [varchar](200) NULL,
	[ObjectCrDate] [datetime] NULL,
 CONSTRAINT [XPKDBBuildObject] PRIMARY KEY CLUSTERED 
(
	[RelativePath] ASC,
	[FileName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RecordLocator]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordLocator](
	[RecordLocatorID] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [smalldatetime] NULL,
	[BookingID] [int] NULL,
 CONSTRAINT [PK_RecordLocator] PRIMARY KEY CLUSTERED 
(
	[RecordLocatorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RecordLocatorDetail]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecordLocatorDetail](
	[RecordLocatorDetailID] [int] IDENTITY(1,1) NOT NULL,
	[RecordLocatorID] [int] NULL,
	[RecordLocatorStateID] [int] NULL,
	[ContextID] [uniqueidentifier] NULL,
	[CreateDate] [smalldatetime] NULL,
	[IsLegacyRecordLocator] [bit] NOT NULL,
 CONSTRAINT [PK_RecordLocatorDetail] PRIMARY KEY CLUSTERED 
(
	[RecordLocatorDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RecordLocatorState]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecordLocatorState](
	[RecordLocatorStateID] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](30) NOT NULL,
 CONSTRAINT [PK_RecordLocatorState] PRIMARY KEY CLUSTERED 
(
	[RecordLocatorStateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReplicationPingTest]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReplicationPingTest](
	[ReplicationPingTestCode] [varchar](4) NOT NULL,
	[UpdateDate] [smalldatetime] NOT NULL,
 CONSTRAINT [XPKReplicationPingTest] PRIMARY KEY CLUSTERED 
(
	[ReplicationPingTestCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SystemSQLAgentJob]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemSQLAgentJob](
	[SystemSQLAgentJobID] [int] IDENTITY(1,1) NOT NULL,
	[JobName] [sysname] NOT NULL,
	[JobDescription] [varchar](256) NOT NULL,
	[CommandType] [tinyint] NOT NULL,
	[CommandName] [sysname] NOT NULL,
	[CommandArg] [varchar](1000) NOT NULL,
	[ScheduleName] [sysname] NOT NULL,
	[ScheduleStartTime] [int] NOT NULL,
 CONSTRAINT [XPKSystemSQLAgentJob] PRIMARY KEY CLUSTERED 
(
	[SystemSQLAgentJobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SystemValue]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemValue](
	[SystemValueName] [varchar](60) NOT NULL,
	[SystemValueValue] [varchar](255) NOT NULL,
 CONSTRAINT [XPKSystemValue] PRIMARY KEY CLUSTERED 
(
	[SystemValueName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[BookingAttributeExtensionCustomDataElement]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[BookingAttributeExtensionCustomDataElement] (
    BookingID,
    CustomDataElementID,
    CustomeDataElementValue,
    UpdateDate,
    UpdateTUID
)
as
/*
*********************************************************************
Copyright (C) 2001 Expedia, Inc.
All rights reserved.

Description:


Change History:
    Date        Author          Description
    ----------  --------------- ------------------------------------
    2003-03-24  Khuyen Bui      Created
*********************************************************************
*/

select  BookingID,
        cast(BookingAttributeExtName as int) as CustomDataElementID,
        cast(BookingAttributeExtValue as varchar(255)) as CustomDataElementValue,
        UpdateDate,
        UpdateTUID
from    dbo.BookingAttributeExtension
where   DomainTypeIDNameSpaceID = 319

GO
/****** Object:  View [dbo].[BookingAttributeExtensionPolicyException]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[BookingAttributeExtensionPolicyException] (
    BookingID,
    BookingItemID,
    PolicyExceptionID,
    UpdateDate,
    UpdateTUID
)
as
/*
*********************************************************************
Copyright (C) 2001 Expedia, Inc.
All rights reserved.

Description:


Change History:
    Date        Author          Description
    ----------  --------------- ------------------------------------
    2003-03-24  Khuyen Bui      Created
*********************************************************************
*/

select  BookingID,
        BookingItemID,
        cast(BookingAttributeExtValue as int) as PolicyExceptionID,
        UpdateDate,
        UpdateTUID
from    dbo.BookingAttributeExtension
where   DomainTypeIDNameSpaceID = 320

GO
/****** Object:  View [dbo].[BookingAttributeExtensionPolicyReasonCode]    Script Date: 9/17/2015 3:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[BookingAttributeExtensionPolicyReasonCode] (
    BookingID,
    BookingItemID,
    PolicyReasonCodeID,
    UpdateDate,
    UpdateTUID
)
as
/*
*********************************************************************
Copyright (C) 2001 Expedia, Inc.
All rights reserved.

Description:


Change History:
    Date        Author          Description
    ----------  --------------- ------------------------------------
    2003-03-24  Khuyen Bui      Created
*********************************************************************
*/

select  BookingID,
        BookingItemID,
        cast(BookingAttributeExtValue as int) as PolicyReasonCodeID,
        UpdateDate,
        UpdateTUID
from    dbo.BookingAttributeExtension
where   DomainTypeIDNameSpaceID = 321

GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT ((0)) FOR [AgentAssistedBool]
GO
ALTER TABLE [dbo].[RecordLocatorDetail] ADD  CONSTRAINT [DF_RecordLocatorDetail_IsLegacyRecordLocator]  DEFAULT ((1)) FOR [IsLegacyRecordLocator]
GO
ALTER TABLE [dbo].[ReplicationPingTest] ADD  CONSTRAINT [dfReplicationPingTest_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[BookingAffiliateSource]  WITH NOCHECK ADD  CONSTRAINT [fkBookingAffiliateSource_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BookingAffiliateSource] CHECK CONSTRAINT [fkBookingAffiliateSource_Booking]
GO
ALTER TABLE [dbo].[BookingAmount]  WITH CHECK ADD  CONSTRAINT [fkBookingAmount_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[BookingAmount] CHECK CONSTRAINT [fkBookingAmount_Booking]
GO
ALTER TABLE [dbo].[BookingAmount]  WITH CHECK ADD  CONSTRAINT [fkBookingAmount_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingAmount] CHECK CONSTRAINT [fkBookingAmount_BookingItem]
GO
ALTER TABLE [dbo].[BookingAttributeExtension]  WITH CHECK ADD  CONSTRAINT [fkBookingAttributeExtension_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[BookingAttributeExtension] CHECK CONSTRAINT [fkBookingAttributeExtension_Booking]
GO
ALTER TABLE [dbo].[BookingAttributeExtension]  WITH CHECK ADD  CONSTRAINT [fkBookingAttributeExtension_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingAttributeExtension] CHECK CONSTRAINT [fkBookingAttributeExtension_BookingItem]
GO
ALTER TABLE [dbo].[BookingAttributeExtension]  WITH CHECK ADD  CONSTRAINT [fkBookingAttributeExtension_BookingTraveler] FOREIGN KEY([BookingID], [BookingTravelerSeqNbr])
REFERENCES [dbo].[BookingTraveler] ([BookingID], [BookingTravelerSeqNbr])
GO
ALTER TABLE [dbo].[BookingAttributeExtension] CHECK CONSTRAINT [fkBookingAttributeExtension_BookingTraveler]
GO
ALTER TABLE [dbo].[BookingItem]  WITH CHECK ADD  CONSTRAINT [fkBookingItem_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[BookingItem] CHECK CONSTRAINT [fkBookingItem_Booking]
GO
ALTER TABLE [dbo].[BookingItem]  WITH CHECK ADD  CONSTRAINT [fkBookingItem_BookingItem_Original] FOREIGN KEY([BookingItemIDOriginal])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItem] CHECK CONSTRAINT [fkBookingItem_BookingItem_Original]
GO
ALTER TABLE [dbo].[BookingItem]  WITH CHECK ADD  CONSTRAINT [fkBookingItem_BookingItem_Prior] FOREIGN KEY([BookingItemIDPrior])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItem] CHECK CONSTRAINT [fkBookingItem_BookingItem_Prior]
GO
ALTER TABLE [dbo].[BookingItemBookingTraveler]  WITH CHECK ADD  CONSTRAINT [fkBookingItemBookingTraveler_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItemBookingTraveler] CHECK CONSTRAINT [fkBookingItemBookingTraveler_BookingItem]
GO
ALTER TABLE [dbo].[BookingItemBookingTraveler]  WITH CHECK ADD  CONSTRAINT [fkBookingItemBookingTraveler_BookingItemBookingTravelerLog] FOREIGN KEY([BookingItemBookingTravelerLogID])
REFERENCES [dbo].[BookingItemBookingTravelerLog] ([BookingItemBookingTravelerLogID])
GO
ALTER TABLE [dbo].[BookingItemBookingTraveler] CHECK CONSTRAINT [fkBookingItemBookingTraveler_BookingItemBookingTravelerLog]
GO
ALTER TABLE [dbo].[BookingItemBookingTraveler]  WITH CHECK ADD  CONSTRAINT [fkBookingItemBookingTraveler_BookingTraveler] FOREIGN KEY([BookingID], [BookingTravelerSeqNbr])
REFERENCES [dbo].[BookingTraveler] ([BookingID], [BookingTravelerSeqNbr])
GO
ALTER TABLE [dbo].[BookingItemBookingTraveler] CHECK CONSTRAINT [fkBookingItemBookingTraveler_BookingTraveler]
GO
ALTER TABLE [dbo].[BookingItemBookingTravelerLog]  WITH CHECK ADD  CONSTRAINT [fkBookingItemBookingTravelerLog_BookingItemBookingTravelerLog_Prior] FOREIGN KEY([BookingItemBookingTravelerLogIDPrior])
REFERENCES [dbo].[BookingItemBookingTravelerLog] ([BookingItemBookingTravelerLogID])
GO
ALTER TABLE [dbo].[BookingItemBookingTravelerLog] CHECK CONSTRAINT [fkBookingItemBookingTravelerLog_BookingItemBookingTravelerLog_Prior]
GO
ALTER TABLE [dbo].[BookingItemHold]  WITH CHECK ADD  CONSTRAINT [fkBookingItemHold_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItemHold] CHECK CONSTRAINT [fkBookingItemHold_BookingItem]
GO
ALTER TABLE [dbo].[BookingItemHoldLog]  WITH CHECK ADD  CONSTRAINT [fkBookingItemHoldLog_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItemHoldLog] CHECK CONSTRAINT [fkBookingItemHoldLog_BookingItem]
GO
ALTER TABLE [dbo].[BookingItemNotification]  WITH CHECK ADD  CONSTRAINT [fkBookingItemNotification_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItemNotification] CHECK CONSTRAINT [fkBookingItemNotification_BookingItem]
GO
ALTER TABLE [dbo].[BookingItemWaiver]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemWaiver_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BookingItemWaiver] CHECK CONSTRAINT [fkBookingItemWaiver_BookingItem]
GO
ALTER TABLE [dbo].[BookingLock]  WITH CHECK ADD  CONSTRAINT [fkBookingLock_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[BookingLock] CHECK CONSTRAINT [fkBookingLock_Booking]
GO
ALTER TABLE [dbo].[BookingText]  WITH CHECK ADD  CONSTRAINT [fkBookingText_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[BookingText] CHECK CONSTRAINT [fkBookingText_Booking]
GO
ALTER TABLE [dbo].[BookingText]  WITH CHECK ADD  CONSTRAINT [fkBookingText_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingText] CHECK CONSTRAINT [fkBookingText_BookingItem]
GO
ALTER TABLE [dbo].[BookingTraveler]  WITH CHECK ADD  CONSTRAINT [fkBookingTraveler_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[BookingTraveler] CHECK CONSTRAINT [fkBookingTraveler_Booking]
GO
ALTER TABLE [dbo].[BookingTravelerLoyaltyPlan]  WITH CHECK ADD  CONSTRAINT [fkBookingTravelerLoyaltyPlan_BookingTraveler] FOREIGN KEY([BookingID], [BookingTravelerSeqNbr])
REFERENCES [dbo].[BookingTraveler] ([BookingID], [BookingTravelerSeqNbr])
GO
ALTER TABLE [dbo].[BookingTravelerLoyaltyPlan] CHECK CONSTRAINT [fkBookingTravelerLoyaltyPlan_BookingTraveler]
GO
ALTER TABLE [dbo].[BookingTravelerUnicode]  WITH NOCHECK ADD  CONSTRAINT [fkBookingTravelerUnicode_BookingTraveler] FOREIGN KEY([BookingID], [BookingTravelerSeqNbr])
REFERENCES [dbo].[BookingTraveler] ([BookingID], [BookingTravelerSeqNbr])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BookingTravelerUnicode] CHECK CONSTRAINT [fkBookingTravelerUnicode_BookingTraveler]
GO
ALTER TABLE [dbo].[RecordLocatorDetail]  WITH CHECK ADD  CONSTRAINT [FK_RecordLocatorDetail_RecordLocator] FOREIGN KEY([RecordLocatorID])
REFERENCES [dbo].[RecordLocator] ([RecordLocatorID])
GO
ALTER TABLE [dbo].[RecordLocatorDetail] CHECK CONSTRAINT [FK_RecordLocatorDetail_RecordLocator]
GO
ALTER TABLE [dbo].[RecordLocatorDetail]  WITH CHECK ADD  CONSTRAINT [FK_RecordLocatorDetail_RecordLocatorState] FOREIGN KEY([RecordLocatorStateID])
REFERENCES [dbo].[RecordLocatorState] ([RecordLocatorStateID])
GO
ALTER TABLE [dbo].[RecordLocatorDetail] CHECK CONSTRAINT [FK_RecordLocatorDetail_RecordLocatorState]
GO
ALTER TABLE [dbo].[BookingItemBookingTraveler]  WITH CHECK ADD CHECK  (([PrimaryTravelerBool]=(1) OR [PrimaryTravelerBool]=(0)))
GO
