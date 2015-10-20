USE [GeneralBookingUS]
GO
/****** Object:  Schema [common]    Script Date: 9/17/2015 3:39:55 PM ******/
CREATE SCHEMA [common]
GO
/****** Object:  Schema [CPDMZNRTFRAUD-READ]    Script Date: 9/17/2015 3:39:55 PM ******/
CREATE SCHEMA [CPDMZNRTFRAUD-READ]
GO
/****** Object:  Schema [CPDMZNRT-READ]    Script Date: 9/17/2015 3:39:55 PM ******/
CREATE SCHEMA [CPDMZNRT-READ]
GO
/****** Object:  Schema [infauser]    Script Date: 9/17/2015 3:39:55 PM ******/
CREATE SCHEMA [infauser]
GO
/****** Object:  Schema [nrtfraud-read]    Script Date: 9/17/2015 3:39:55 PM ******/
CREATE SCHEMA [nrtfraud-read]
GO
/****** Object:  Schema [nrt-read]    Script Date: 9/17/2015 3:39:55 PM ******/
CREATE SCHEMA [nrt-read]
GO
/****** Object:  Schema [NRTUser]    Script Date: 9/17/2015 3:39:56 PM ******/
CREATE SCHEMA [NRTUser]
GO
/****** Object:  Schema [wbtools]    Script Date: 9/17/2015 3:39:56 PM ******/
CREATE SCHEMA [wbtools]
GO
/****** Object:  Table [dbo].[__AirBookingServiceFeeCharged]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__AirBookingServiceFeeCharged](
	[bookingid] [int] NOT NULL,
	[bookingitemid] [int] NOT NULL,
 CONSTRAINT [pk__AirBookingServiceFeeCharged] PRIMARY KEY CLUSTERED 
(
	[bookingid] ASC,
	[bookingitemid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
/****** Object:  Table [dbo].[Booking]    Script Date: 9/17/2015 3:39:56 PM ******/
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
	[ReferralTrackingNbr] [varchar](255) NULL,
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
	[AgentAssistedBool] [tinyint] NOT NULL DEFAULT (0),
	[AffiliateID] [int] NULL,
	[OperatingUnitID] [int] NULL,
 CONSTRAINT [XPKBooking] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingAffiliateSource]    Script Date: 9/17/2015 3:39:56 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingAmount]    Script Date: 9/17/2015 3:39:56 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingAttributeExtension]    Script Date: 9/17/2015 3:39:56 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingAuditEvent]    Script Date: 9/17/2015 3:39:56 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingAuditLog]    Script Date: 9/17/2015 3:39:56 PM ******/
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
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingItem]    Script Date: 9/17/2015 3:39:56 PM ******/
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
	[CancelType] [varchar](255) NULL,
	[CancelReason] [varchar](255) NULL,
 CONSTRAINT [XPKBookingItem] PRIMARY KEY NONCLUSTERED 
(
	[BookingItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingItemAir]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingItemAir](
	[BookingItemID] [int] NOT NULL,
	[BookingItineraryAirID] [int] NOT NULL,
	[AirAgentTypeID] [tinyint] NOT NULL,
	[AirAgentCode] [varchar](15) NULL,
	[AirlineCodeTicketing] [char](3) NOT NULL,
	[ElectronicPseudoCityCode] [varchar](15) NOT NULL,
	[AirCustomerReferenceNbr] [varchar](30) NOT NULL,
	[TicketExpirationDate] [smalldatetime] NULL,
	[AirCabinTypeID] [tinyint] NOT NULL,
	[PersonAgeTypeID] [tinyint] NOT NULL,
	[InfantInLapCnt] [tinyint] NOT NULL,
	[TransferableBool] [bit] NULL,
	[DealTourCode] [varchar](30) NOT NULL,
	[AirPricingAuthorityID] [tinyint] NOT NULL,
	[AirPricingCommandTxt] [varchar](100) NOT NULL,
	[DirectConnectExemptionTypeMask] [int] NOT NULL,
	[PaperTicketReasonMask] [int] NOT NULL,
	[BookingItemAirTransactionStateID] [tinyint] NULL,
	[BookingItemAirTransactionStateIDPending] [tinyint] NULL,
	[AirTicketEndorsementTxt] [varchar](58) NULL,
	[AirlineTicketingContractCode] [varchar](15) NULL,
	[AirPricingMarkupReferencePrice] [money] NULL,
	[AirPricingMarkupReferenceAirlineCode] [char](3) NULL,
	[AirPricingMarkupReferenceTypeId] [tinyint] NULL,
 CONSTRAINT [XPKBookingItemAir] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingItemAirInventory]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingItemAirInventory](
	[BookingItemID] [int] NOT NULL,
	[BookingItemInventorySeqNbr] [tinyint] NOT NULL,
	[BookingItemInventorySeqNbrPricing] [tinyint] NULL,
	[OrigDestSeqNbr] [tinyint] NOT NULL,
	[AirSegmentConfirmationStateID] [tinyint] NOT NULL,
	[AirSegmentUseStateID] [tinyint] NOT NULL,
	[AirTicketNbr] [varchar](20) NULL,
	[AirportCodeFrom] [char](3) NOT NULL,
	[AirportCodeTo] [char](3) NOT NULL,
	[AirlineCodeMarketing] [char](3) NOT NULL,
	[AirlineCodeOperating] [char](3) NULL,
	[FlightNumber] [smallint] NULL,
	[TravelDateBegin] [smalldatetime] NULL,
	[TravelDateEnd] [smalldatetime] NULL,
	[AirCabinTypeID] [tinyint] NOT NULL,
	[AirCabinTypeIDPricing] [tinyint] NOT NULL,
	[AirPassengerTypeCode] [char](3) NOT NULL,
	[AirBookingClassCode] [char](2) NOT NULL,
	[AirFareBasisCode] [varchar](15) NOT NULL,
	[AirTicketDesignatorCode] [varchar](15) NOT NULL,
	[AirInventorySKUID] [int] NULL,
	[NegotiatedDiscountRefNbr] [varchar](50) NOT NULL,
	[StopCnt] [tinyint] NULL,
	[RefundableBool] [bit] NULL,
	[CurrencyCodeExchangeFee] [char](3) NULL,
	[ExchangeFeeAmt] [money] NULL,
 CONSTRAINT [XPKBookingItemAirInventory] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC,
	[BookingItemInventorySeqNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingItemBookingTraveler]    Script Date: 9/17/2015 3:39:56 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
/****** Object:  Table [dbo].[BookingItemBookingTravelerLog]    Script Date: 9/17/2015 3:39:56 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
/****** Object:  Table [dbo].[BookingItemCar]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingItemCar](
	[BookingItemID] [int] NOT NULL,
	[CarVendorCode] [char](2) NOT NULL,
	[AirportCodePickUp] [char](3) NOT NULL,
	[AirportCodeDropOff] [char](3) NULL,
	[CarVendorLocationCodePickUp] [char](4) NOT NULL,
	[CarVendorLocationCodeDropOff] [char](4) NULL,
	[CarCategoryID] [tinyint] NOT NULL,
	[CarTypeID] [tinyint] NOT NULL,
	[CarTransmissionDriveID] [tinyint] NOT NULL,
	[CarFuelAirConditionID] [tinyint] NOT NULL,
	[SearchTypeIDPickup] [tinyint] NULL,
	[ResultTypeIDPickUp] [tinyint] NULL,
	[FlightNumberArrival] [smallint] NULL,
	[AirlineCodeArrival] [char](3) NULL,
	[CarBusinessModelID] [int] NOT NULL,
	[CarItemID] [int] NOT NULL,
	[SupplySubsetID] [int] NOT NULL,
	[CarCorpDiscountCodeCRSReq] [varchar](19) NULL,
	[CarCorpDiscountCodeCRSResp] [varchar](19) NULL,
	[CarRateCodeCRSReq] [varchar](6) NULL,
	[CarRateCodeCRSResp] [varchar](6) NULL,
	[CarClubNbrCRSReq] [varchar](16) NULL,
	[CarClubNbrCRSResp] [varchar](16) NULL,
	[CarCouponCodeCRSReq] [varchar](20) NULL,
	[CarCouponCodeCRSResp] [varchar](20) NULL,
	[CarSupplementalCodeCRSReq] [varchar](90) NULL,
	[CarSupplementalCodeCRSResp] [varchar](90) NULL,
	[ExchangeRateCurrencyCode] [char](3) NULL,
	[ExchangeRate] [decimal](20, 10) NULL,
	[EstimatedTotalTaxAndFeeAmt] [money] NULL,
	[EstimatedTotalTaxAndFeeAmtCurrencyCode] [char](3) NULL,
	[CarSpecialEquipmentMask] [int] NULL,
	[CarInsuranceAndWaiverMask] [int] NULL,
	[FrequentFlyerPlanName] [varchar](60) NULL,
	[FrequentFlyerPlanNumber] [varchar](16) NULL,
	[CarCorpDiscountCodeTraveler] [varchar](19) NULL,
	[CarRateCodeTraveler] [varchar](6) NULL,
	[CarClubNbrTraveler] [varchar](16) NULL,
	[CarCouponCodeTraveler] [varchar](20) NULL,
	[CarSupplementalCodeTraveler] [varchar](90) NULL,
	[CarRateOptionTypeIDTraveler] [tinyint] NULL,
	[ReservationGuaranteeMethodID] [tinyint] NULL,
	[CreditCardTypeID] [tinyint] NULL,
	[CreditCardLastFourDigitNbr] [char](4) NULL,
	[UnlimitedMileageBool] [bit] NULL,
	[MileageChargeAmt] [money] NULL,
	[MileageChargeAmtCurrencyCode] [char](3) NULL,
	[MileageUnitInKMBool] [bit] NULL,
	[CarVoucherNbr] [varchar](32) NULL,
	[CarAgreementID] [int] NULL,
	[CarVendorAgreementNbr] [varchar](30) NULL,
	[CarRentalDaysCnt] [smallint] NULL,
	[PublishedPriceAmt] [money] NULL,
	[CarBasePricePeriodPublishedID] [tinyint] NULL,
	[CurrencyCodePublishedPrice] [char](3) NULL,
	[MarginMaxAmt] [money] NULL,
	[MarginMaxCurrencyCode] [char](3) NULL,
	[MarginMinAmt] [money] NULL,
	[MarginMinCurrencyCode] [char](3) NULL,
	[MarkupPct] [decimal](5, 4) NULL,
 CONSTRAINT [pkBookingItemCar] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingItemCarAgency]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingItemCarAgency](
	[BookingItemID] [int] NOT NULL,
	[CarVendorCode] [char](2) NOT NULL,
	[AirportCodePickUp] [char](3) NOT NULL,
	[CarVendorLocationCodePickUp] [char](4) NOT NULL,
	[CarCategoryID] [tinyint] NOT NULL,
	[CarTypeID] [tinyint] NOT NULL,
	[CarTransmissionDriveID] [tinyint] NOT NULL,
	[CarFuelAirConditionID] [tinyint] NOT NULL,
	[EstimatedTotalTaxAndFeeAmt] [money] NOT NULL,
	[EstimatedTotalTaxAndFeeAmtCurrencyCode] [char](3) NOT NULL,
	[SearchTypeIDPickup] [tinyint] NOT NULL,
	[ResultTypeIDPickUp] [tinyint] NOT NULL,
	[CarSpecialEquipmentMask] [int] NOT NULL,
	[CarInsuranceAndWaiverMask] [int] NOT NULL,
	[FrequentFlyerPlanName] [varchar](60) NOT NULL,
	[FrequentFlyerPlanNumber] [varchar](16) NOT NULL,
	[CarCorpDiscountCodeTraveler] [varchar](19) NOT NULL,
	[CarRateCodeTraveler] [varchar](6) NOT NULL,
	[CarClubNbrTraveler] [varchar](16) NOT NULL,
	[CarCouponCodeTraveler] [varchar](20) NOT NULL,
	[CarSupplementalCodeTraveler] [varchar](90) NOT NULL,
	[CarRateOptionTypeIDTraveler] [tinyint] NOT NULL,
	[CarRateCodeCRSReq] [varchar](6) NOT NULL,
	[CarClubNbrCRSReq] [varchar](16) NOT NULL,
	[CarCorpDiscountCodeCRSReq] [varchar](19) NOT NULL,
	[CarCouponCodeCRSReq] [varchar](20) NOT NULL,
	[CarSupplementalCodeCRSReq] [varchar](90) NOT NULL,
	[CarRateCodeCRSResp] [varchar](6) NOT NULL,
	[CarClubNbrCRSResp] [varchar](16) NOT NULL,
	[CarCorpDiscountCodeCRSResp] [varchar](19) NOT NULL,
	[CarCouponCodeCRSResp] [varchar](20) NOT NULL,
	[CarSupplementalCodeCRSResp] [varchar](90) NOT NULL,
	[ReservationGuaranteeMethodID] [tinyint] NOT NULL,
	[CreditCardTypeID] [tinyint] NULL,
	[CreditCardLastFourDigitNbr] [char](4) NULL,
	[UnlimitedMileageBool] [bit] NOT NULL,
	[MileageChargeAmt] [money] NULL,
	[MileageChargeAmtCurrencyCode] [char](3) NULL,
	[MileageUnitInKMBool] [bit] NULL,
	[FlightNumberArrival] [smallint] NULL,
	[AirlineCodeArrival] [char](3) NULL,
	[AirportCodeDropOff] [char](3) NULL,
	[CarVendorLocationCodeDropOff] [char](4) NULL,
	[CarItemID] [int] NULL,
	[SupplySubsetID] [int] NULL,
 CONSTRAINT [XPKBookingItemCarAgency] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingItemCarInventory]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingItemCarInventory](
	[BookingItemID] [int] NOT NULL,
	[BookingItemInventorySeqNbr] [smallint] NOT NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NOT NULL,
	[CarInternalBasePricePeriodID] [tinyint] NOT NULL,
	[BaseAmtCost] [money] NOT NULL,
	[PeakSurchargeAmtCost] [money] NOT NULL,
 CONSTRAINT [pkBookingItemCarInventory] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC,
	[BookingItemInventorySeqNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
/****** Object:  Table [dbo].[BookingItemCarMerchant]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingItemCarMerchant](
	[BookingItemID] [int] NOT NULL,
	[CarVendorCode] [char](2) NOT NULL,
	[AirportCode] [char](3) NOT NULL,
	[CarVendorLocationCode] [char](4) NOT NULL,
	[CarCategoryID] [tinyint] NOT NULL,
	[CarTypeID] [tinyint] NOT NULL,
	[CarTransmissionDriveID] [tinyint] NOT NULL,
	[CarFuelAirConditionID] [tinyint] NOT NULL,
	[CarVoucherNbr] [varchar](32) NOT NULL,
	[CarAgreementID] [int] NOT NULL,
	[CarCorpDiscountCode] [varchar](16) NOT NULL,
	[CarVendorAgreementNbr] [varchar](30) NOT NULL,
	[CarRentalDaysCnt] [smallint] NOT NULL,
	[PublishedPriceAmt] [money] NOT NULL,
	[CarBasePricePeriodPublishedID] [tinyint] NOT NULL,
	[CurrencyCodePublishedPrice] [char](3) NOT NULL,
	[FlightNumberArrival] [smallint] NULL,
	[AirlineCodeArrival] [char](3) NULL,
	[SearchTypeIDPickup] [tinyint] NULL,
	[ResultTypeIDPickUp] [tinyint] NULL,
	[MarginMaxAmt] [money] NULL,
	[MarginMaxCurrencyCode] [char](3) NULL,
	[MarginMinAmt] [money] NULL,
	[MarginMinCurrencyCode] [char](3) NULL,
	[CarItemID] [int] NULL,
	[SupplySubsetID] [int] NULL,
 CONSTRAINT [XPKBookingItemCarMerchant] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingItemCarMerchantCancelPenalty]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingItemCarMerchantCancelPenalty](
	[BookingItemID] [int] NOT NULL,
	[CancelPenaltyHourCnt] [smallint] NOT NULL,
	[CancelPenaltyRuleLogID] [int] NOT NULL,
	[CancelPenaltyAmtCost] [money] NOT NULL,
	[CurrencyCodeCost] [char](3) NOT NULL,
	[CancelPenaltyAmtPrice] [money] NOT NULL,
	[CurrencyCodePrice] [char](3) NOT NULL,
 CONSTRAINT [XPKBookingItemCarMerchantCancelPenalty] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC,
	[CancelPenaltyHourCnt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingItemCarMerchantInventory]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingItemCarMerchantInventory](
	[BookingItemID] [int] NOT NULL,
	[BookingItemInventorySeqNbr] [smallint] NOT NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NOT NULL,
	[CarInternalBasePricePeriodID] [tinyint] NOT NULL,
	[BaseAmtCost] [money] NOT NULL,
	[PeakSurchargeAmtCost] [money] NOT NULL,
 CONSTRAINT [XPKBookingItemCarMerchantInventory] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC,
	[BookingItemInventorySeqNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
/****** Object:  Table [dbo].[BookingItemCorporate]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingItemCorporate](
	[BookingItemID] [int] NOT NULL,
	[PolicyStatusID] [tinyint] NOT NULL,
	[CreateDate] [smalldatetime] NOT NULL,
	[CreateTUID] [int] NOT NULL,
 CONSTRAINT [XPKBookingItemCorporate] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
/****** Object:  Table [dbo].[BookingItemCruise]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingItemCruise](
	[BookingItemID] [int] NOT NULL,
	[CruiseLineID] [int] NOT NULL,
	[CruiseAPIID] [tinyint] NOT NULL,
	[CruiseConnectionID] [tinyint] NOT NULL,
	[ImportCruiseAPIID] [tinyint] NULL,
	[ImportCruiseConnectionID] [tinyint] NULL,
	[ShipID] [int] NOT NULL,
	[SailingID] [int] NOT NULL,
	[SailingLogID] [int] NOT NULL,
	[SailingStartDate] [smalldatetime] NOT NULL,
	[SailingEndDate] [smalldatetime] NOT NULL,
	[ShipCabinCategoryID] [int] NOT NULL,
	[ShipCabinCategoryIDUpgrade] [int] NOT NULL,
	[SailingInventoryBool] [bit] NOT NULL,
	[CruiseLineCancelPolicyLogID] [int] NOT NULL,
	[CruiseLineRateOptionCityCode] [char](3) NOT NULL,
	[CruiseLineRateOptionCode] [varchar](32) NOT NULL,
	[CruiseLineRateOptionID] [int] NOT NULL,
	[ShipCabinUnitNbr] [varchar](32) NOT NULL,
	[ShipCabinID] [int] NOT NULL,
	[SmokingPreferenceID] [tinyint] NOT NULL,
	[SmokingPreferenceCode] [varchar](32) NOT NULL,
	[DiningSeatingTypeID] [tinyint] NOT NULL,
	[DiningSeatingCode] [varchar](32) NOT NULL,
	[DiningTableSizeID] [tinyint] NOT NULL,
	[DiningTableSizeCode] [varchar](32) NOT NULL,
	[CruiseGroupID] [int] NOT NULL,
	[CruiseInventoryContractID] [int] NOT NULL,
	[CruiseAffinityGroupID] [int] NOT NULL,
	[CruiseLineRateOptionCodeTxtLogID] [int] NOT NULL,
	[ResidencyRegionID] [int] NOT NULL,
	[CruiseLineRateOptionLogID] [int] NOT NULL,
 CONSTRAINT [pkBookingItemCruise] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingItemCruiseExternalCatalog]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingItemCruiseExternalCatalog](
	[BookingItemID] [int] NOT NULL,
	[ShipCabinCategoryCode] [varchar](32) NULL,
	[ShipCabinCategoryDesc] [varchar](255) NULL,
	[ShipCabinCategoryTypeID] [tinyint] NULL,
	[ShipCabinCategoryCodeUpgrade] [varchar](32) NULL,
	[ShipCabinCategoryUpgradeDesc] [varchar](255) NULL,
	[ShipCabinCategoryTypeIDUpgrade] [tinyint] NULL,
	[PortRegionIDEmbark] [int] NULL,
	[PortRegionIDDisembark] [int] NULL,
	[CruiseItineraryTypeID] [tinyint] NULL,
	[CruiseItineraryRegionID] [int] NULL,
 CONSTRAINT [pkBookingItemCruiseExternalCatalog] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingItemCruiseTraveler]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingItemCruiseTraveler](
	[BookingID] [int] NOT NULL,
	[BookingTravelerSeqNbr] [tinyint] NOT NULL,
	[BookingItemID] [int] NOT NULL,
	[TransportationCityCode] [char](3) NOT NULL,
	[TransportationEquipmentTypeID] [tinyint] NOT NULL,
	[CruiseLinePreviousTravelerCodeTypeID] [tinyint] NOT NULL,
	[CruiseLinePreviousTravelerCode] [varchar](32) NOT NULL,
	[TravelProtectionPlanID] [int] NULL,
	[TravelProtectionPlanCode] [varchar](32) NOT NULL,
	[ProtectionPlanPriceLogID] [int] NULL,
 CONSTRAINT [XPKBookingItemCruiseTraveler] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC,
	[BookingID] ASC,
	[BookingTravelerSeqNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingItemCruiseTravelerCruiseLineSKU]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingItemCruiseTravelerCruiseLineSKU](
	[BookingID] [int] NOT NULL,
	[BookingTravelerSeqNbr] [tinyint] NOT NULL,
	[BookingItemID] [int] NOT NULL,
	[CruiseLineSKUSeqNbr] [tinyint] NOT NULL,
	[CruiseLineSKUID] [int] NOT NULL,
	[CruiseLineSKUCode] [varchar](32) NOT NULL,
	[CruiseLineSKUDetailCode] [varchar](32) NOT NULL,
	[CruiseLineSKUCnt] [tinyint] NULL,
	[CruiseLineSKUDate] [smalldatetime] NULL,
	[CruiseLineSKULogID] [int] NOT NULL,
	[CruiseLineSKUDesc] [varchar](100) NOT NULL,
 CONSTRAINT [XPKBookingItemCruiseTravelerCruiseLineSKU] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC,
	[BookingTravelerSeqNbr] ASC,
	[BookingItemID] ASC,
	[CruiseLineSKUSeqNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingItemDocument]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingItemDocument](
	[BookingItemID] [int] NOT NULL,
	[BookingItemDocumentSeqNbr] [tinyint] NOT NULL,
	[BookingItemDocumentSeqNbrNext] [tinyint] NULL,
	[PartyRoleTypeIDDocumentSource] [tinyint] NOT NULL,
	[DocumentProcessingStateID] [tinyint] NOT NULL,
	[DocumentReceivedDate] [smalldatetime] NULL,
	[DocumentReferenceNbr] [varchar](50) NOT NULL,
	[DocumentDesc] [varchar](255) NOT NULL,
	[DocumentProcessingTxt] [varchar](255) NOT NULL,
	[CreateDate] [smalldatetime] NOT NULL,
	[CreateTUID] [int] NOT NULL,
	[UpdateDate] [smalldatetime] NULL,
	[UpdateTUID] [int] NOT NULL,
 CONSTRAINT [XPKBookingItemDocument] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC,
	[BookingItemDocumentSeqNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingItemHold]    Script Date: 9/17/2015 3:39:56 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
/****** Object:  Table [dbo].[BookingItemHoldLog]    Script Date: 9/17/2015 3:39:56 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
/****** Object:  Table [dbo].[BookingItemInsurance]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingItemInsurance](
	[BookingItemID] [int] NOT NULL,
	[InsuranceTypeID] [tinyint] NOT NULL,
	[AirportCodeFrom] [char](3) NOT NULL,
	[AirportCodeTo] [char](3) NOT NULL,
	[InsurancePolicyNbr] [varchar](30) NOT NULL,
	[StartOfTripDate] [smalldatetime] NOT NULL,
	[EndOfTripDate] [smalldatetime] NOT NULL,
	[OriginRegionID] [int] NOT NULL,
	[DestinationRegionID] [int] NOT NULL,
	[InsuranceID] [int] NULL,
	[StartOfTripDateGMTOffset] [smallint] NULL DEFAULT (datepart(tzoffset,sysdatetimeoffset())),
	[EndOfTripDateGMTOffset] [smallint] NULL DEFAULT (datepart(tzoffset,sysdatetimeoffset())),
	[CancelTypeID] [tinyint] NULL,
	[CancelReasonID] [tinyint] NULL,
	[CancelInsurancePolicyNbr] [varchar](30) NULL,
	[CancelExpressionName] [varchar](255) NULL,
 CONSTRAINT [XPKBookingItemInsurance] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingItemLodging]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingItemLodging](
	[BookingItemID] [int] NOT NULL,
	[SKUGroupID] [int] NOT NULL,
	[InfantCnt] [tinyint] NULL,
	[ChildCnt] [tinyint] NULL,
	[AdultCnt] [tinyint] NULL,
	[SeniorCnt] [tinyint] NULL,
	[PersonAgeYearCntLst] [varbinary](20) NOT NULL,
	[BedTypeID] [tinyint] NOT NULL,
	[SmokingPreferenceID] [tinyint] NOT NULL,
	[HotelRatePlanMask] [int] NOT NULL,
	[HotelProductTypeID] [int] NOT NULL,
	[OfferingSKUGroupID] [int] NULL,
	[TimeZoneID] [tinyint] NOT NULL,
	[CancelPenaltyMinuteCnt] [int] NOT NULL,
	[BookingItemIDOriginalLodging] [int] NULL,
	[R14Bool] [bit] NOT NULL,
	[StandaloneCostAmt] [money] NULL,
	[StandalonePriceAmt] [money] NULL,
	[StandaloneCurrencyCodeCost] [char](3) NULL,
	[StandaloneCurrencyCodePrice] [char](3) NULL,
	[PartnerPricingTypeID] [tinyint] NOT NULL,
	[BrandID] [int] NULL,
	[RatingSystemID] [tinyint] NULL,
	[RatingSystemNbr] [tinyint] NULL,
 CONSTRAINT [XPKBookingItemLodging] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingItemLodgingCancelPenalty]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingItemLodgingCancelPenalty](
	[BookingItemID] [int] NOT NULL,
	[CancelPenaltyHourCnt] [int] NOT NULL,
	[CancelPenaltyLogID] [int] NOT NULL,
	[CurrencyCodeCost] [char](3) NULL,
	[CancelPenaltyCostRate] [decimal](5, 4) NULL,
	[CancelPenaltyCostDurationCnt] [int] NULL,
	[CancelPenaltyCostAmt] [money] NULL,
	[CurrencyCodePrice] [char](3) NULL,
	[CancelPenaltyPriceRate] [decimal](5, 4) NULL,
	[CancelPenaltyPriceDurationCnt] [int] NULL,
	[CancelPenaltyPriceAmt] [money] NULL,
 CONSTRAINT [XPKBookingItemLodgingCancelPenalty] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC,
	[CancelPenaltyHourCnt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingItemLodgingComparison]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingItemLodgingComparison](
	[BookingItemID] [int] NOT NULL,
	[HotelRateComparisonTypeID] [tinyint] NOT NULL,
	[CurrencyCode] [char](3) NOT NULL,
	[TotalBaseAmtPrice] [money] NOT NULL,
	[TotalTaxAmtPrice] [money] NOT NULL,
	[DescriptionTxt] [varchar](255) NOT NULL,
	[PackageComparisonPrice] [money] NULL,
 CONSTRAINT [pkBookingItemLodgingComparison] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC,
	[HotelRateComparisonTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingItemLodgingInventory]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingItemLodgingInventory](
	[BookingItemID] [int] NOT NULL,
	[BookingItemInventorySeqNbr] [smallint] NOT NULL,
	[RoomTypeID] [int] NOT NULL,
	[RoomTypeInventoryDate] [smalldatetime] NOT NULL,
	[RoomTypeCodeSupplier] [varchar](50) NOT NULL,
	[RefundableBool] [bit] NULL,
	[RatePlanID] [int] NOT NULL,
	[RatePlanCodeSupplier] [varchar](50) NOT NULL,
	[RoomTypeInventoryOverrideTypeID] [tinyint] NOT NULL,
	[RoomTypeInventorySellStateID] [tinyint] NULL,
	[RatePlanLevel] [int] NULL,
	[RatePlanAmenityMask] [int] NULL,
	[RatePlanAmenitySectionTypeID] [int] NULL,
	[RatePlanCostPriceTypeID] [tinyint] NULL,
	[DOACostPriceBool] [bit] NULL,
	[LOSCostPriceBool] [bit] NULL,
 CONSTRAINT [XPKBookingItemLodgingInventory] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC,
	[BookingItemInventorySeqNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingItemLodgingRateRule]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingItemLodgingRateRule](
	[BookingItemID] [int] NOT NULL,
	[RateRuleID] [int] NOT NULL,
	[RateRuleLogID] [int] NOT NULL,
 CONSTRAINT [XPKBookingItemLodgingRateRule] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC,
	[RateRuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
/****** Object:  Table [dbo].[BookingItemMerchandising]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingItemMerchandising](
	[BookingItemID] [int] NOT NULL,
	[MerchandisingFlagID] [int] NOT NULL,
	[MerchandisingSeqNbr] [tinyint] NOT NULL,
	[MerchandisingFlagLogID] [int] NOT NULL,
	[PartyRoleTypeIDFulfillment] [tinyint] NOT NULL,
	[BookingFulfillmentStateID] [tinyint] NOT NULL,
	[UpdateTUID] [int] NOT NULL,
	[UpdateDate] [smalldatetime] NOT NULL,
 CONSTRAINT [XPKBookingItemMerchandising] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC,
	[MerchandisingFlagID] ASC,
	[MerchandisingSeqNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
/****** Object:  Table [dbo].[BookingItemNotification]    Script Date: 9/17/2015 3:39:56 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
/****** Object:  Table [dbo].[BookingItemSUCC]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingItemSUCC](
	[BookingItemID] [int] NOT NULL,
	[SUCCStateID] [tinyint] NOT NULL,
	[ConversationID] [uniqueidentifier] NULL,
	[SharedCreditCardBool] [bit] NULL,
	[CreditCardDBID] [tinyint] NULL,
	[CreditCardID] [int] NULL,
	[UpdateDate] [smalldatetime] NOT NULL,
	[UpdateTUID] [int] NOT NULL,
	[CreateDate] [smalldatetime] NOT NULL,
	[SUCCActionID] [tinyint] NOT NULL,
 CONSTRAINT [pkBookingItemSUCC] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
/****** Object:  Table [dbo].[BookingItemSUCCErrorLog]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingItemSUCCErrorLog](
	[BookingItemID] [int] NOT NULL,
	[BookingItemSUCCErrorLogSeqNbr] [int] NOT NULL,
	[SUCCActionID] [tinyint] NOT NULL,
	[ErrorCode] [int] NOT NULL,
	[CreateDate] [smalldatetime] NOT NULL,
	[CreateTUID] [int] NOT NULL,
 CONSTRAINT [pkBookingItemSUCCErrorLog] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC,
	[BookingItemSUCCErrorLogSeqNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
/****** Object:  Table [dbo].[BookingItemSUCCLog]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingItemSUCCLog](
	[BookingItemID] [int] NOT NULL,
	[BookingItemSUCCLogSeqNbr] [int] IDENTITY(1,1) NOT NULL,
	[SUCCStateID] [tinyint] NOT NULL,
	[ConversationID] [uniqueidentifier] NULL,
	[SharedCreditCardBool] [bit] NULL,
	[CreditCardDBID] [tinyint] NULL,
	[CreditCardID] [int] NULL,
	[SUCCActionID] [tinyint] NOT NULL,
	[CreateDate] [smalldatetime] NOT NULL,
	[CreateTUID] [int] NOT NULL,
 CONSTRAINT [pkBookingItemSUCCLog] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC,
	[BookingItemSUCCLogSeqNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
/****** Object:  Table [dbo].[BookingItemTravelShops]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingItemTravelShops](
	[BookingItemID] [int] NOT NULL,
	[SKUID] [int] NOT NULL,
	[VoucherSecurityCode] [varchar](30) NULL,
	[VendorBranchID] [int] NOT NULL,
	[PlaceID] [int] NOT NULL,
	[VoucherTicketTypeID1] [tinyint] NOT NULL,
	[VoucherTicketTypeCnt1] [tinyint] NOT NULL,
	[VoucherTicketTypeID2] [tinyint] NULL,
	[VoucherTicketTypeCnt2] [tinyint] NULL,
	[VoucherTicketTypeID3] [tinyint] NULL,
	[VoucherTicketTypeCnt3] [tinyint] NULL,
 CONSTRAINT [XPKBookingItemTravelShops] PRIMARY KEY CLUSTERED 
(
	[BookingItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingItemWaiver]    Script Date: 9/17/2015 3:39:56 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingItineraryAir]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingItineraryAir](
	[BookingItineraryAirID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NOT NULL,
	[InternationalBool] [bit] NOT NULL,
	[TripGeometryID] [tinyint] NOT NULL,
	[CurrencyCode] [char](3) NOT NULL,
	[FareAmtPublished] [money] NULL,
	[FareAmtLowestLogical] [money] NULL,
	[FareAmtLowestInPolicy] [money] NULL,
	[CreateDate] [smalldatetime] NOT NULL,
	[CreateTUID] [int] NOT NULL,
	[UpdateDate] [smalldatetime] NULL,
	[UpdateTUID] [int] NOT NULL,
	[FareAmtLowestLogicalComparison] [money] NULL,
	[FareAmtLowestComparison] [money] NULL,
	[AirportCodeComparisonFrom] [char](3) NULL,
	[AirportCodeComparisonTo] [char](3) NULL,
	[GDSHemisphereID] [tinyint] NULL,
	[GDSJourneyID] [tinyint] NULL,
	[PackageComparisonPrice] [money] NULL,
	[GDSPNRRemark] [varchar](500) NULL,
	[FeeSegmentationRuleID] [int] NULL,
	[FeeAbacusTreatmentGroupValue] [int] NULL,
 CONSTRAINT [XPKBookingItineraryAir] PRIMARY KEY NONCLUSTERED 
(
	[BookingItineraryAirID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingLock]    Script Date: 9/17/2015 3:39:56 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingLodgingOpaque]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingLodgingOpaque](
	[BookingID] [int] NOT NULL,
	[HWRefNumber] [nvarchar](32) NOT NULL,
	[HWResultID] [nvarchar](56) NULL,
	[CreateDate] [smalldatetime] NOT NULL,
	[HotelConfirmationNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [XPKBookingLodgingOpaque] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC,
	[HWRefNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
/****** Object:  Table [dbo].[BookingText]    Script Date: 9/17/2015 3:39:56 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingTraveler]    Script Date: 9/17/2015 3:39:56 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingTravelerLoyaltyPlan]    Script Date: 9/17/2015 3:39:56 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingTravelerUnicode]    Script Date: 9/17/2015 3:39:56 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
/****** Object:  Table [dbo].[CancelReason]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CancelReason](
	[CancelReasonID] [tinyint] NOT NULL,
	[CancelReasonName] [varchar](60) NOT NULL,
	[CancelReasonDescription] [varchar](255) NULL,
	[UpdateDate] [datetime] NOT NULL,
	[UpdatedBy] [varchar](32) NOT NULL,
 CONSTRAINT [pkCancelReason] PRIMARY KEY CLUSTERED 
(
	[CancelReasonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CancelType]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CancelType](
	[CancelTypeID] [tinyint] NOT NULL,
	[CancelTypeName] [varchar](60) NOT NULL,
	[CancelTypeDescription] [varchar](255) NULL,
	[UpdateDate] [datetime] NOT NULL,
	[UpdatedBy] [varchar](32) NOT NULL,
 CONSTRAINT [pkCancelType] PRIMARY KEY CLUSTERED 
(
	[CancelTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DBBuildObject]    Script Date: 9/17/2015 3:39:56 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dbo.BookingItemInsurance_BAK]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dbo.BookingItemInsurance_BAK](
	[BookingItemID] [int] NOT NULL,
	[InsuranceTypeID] [tinyint] NOT NULL,
	[AirportCodeFrom] [char](3) NOT NULL,
	[AirportCodeTo] [char](3) NOT NULL,
	[InsurancePolicyNbr] [varchar](30) NOT NULL,
	[StartOfTripDate] [smalldatetime] NOT NULL,
	[EndOfTripDate] [smalldatetime] NOT NULL,
	[OriginRegionID] [int] NOT NULL,
	[DestinationRegionID] [int] NOT NULL,
	[InsuranceID] [int] NULL,
	[StartOfTripDateGMTOffset] [smallint] NULL DEFAULT (datepart(tzoffset,sysdatetimeoffset())),
	[EndOfTripDateGMTOffset] [smallint] NULL DEFAULT (datepart(tzoffset,sysdatetimeoffset())),
	[CancelTypeID] [int] NULL,
	[CancelReasonID] [int] NULL
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DSSExportObject]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DSSExportObject](
	[ObjectName] [sysname] NOT NULL,
	[BCPObjectName] [sysname] NOT NULL,
	[IsActive] [char](1) NOT NULL,
	[CollisionRemovalFlag] [char](1) NOT NULL,
	[BCPOptions] [varchar](300) NOT NULL,
	[CriteriaStart] [datetime] NULL,
	[CriteriaEnd] [datetime] NULL,
	[ProcessStart] [datetime] NULL,
	[ProcessEnd] [datetime] NULL,
	[RowsProcessed] [int] NULL,
	[LastCriteriaStart] [datetime] NULL,
	[LastExecuteStatus] [varchar](10) NULL,
 CONSTRAINT [XPKDSSExportObject] PRIMARY KEY CLUSTERED 
(
	[ObjectName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InsuranceBooking]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsuranceBooking](
	[InsuranceBookingID] [bigint] IDENTITY(1,1) NOT NULL,
	[InsuranceRecordLocatorID] [bigint] NOT NULL,
	[BookingID] [int] NOT NULL,
	[TravelProductID] [int] NOT NULL,
	[OrderID] [bigint] NULL,
	[OrderOperationCorrelationID] [bigint] NULL,
	[InsuranceOfferingGUID] [uniqueidentifier] NULL,
	[InsuranceBookingData] [xml] NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PKInsuranceBookingID] PRIMARY KEY CLUSTERED 
(
	[InsuranceBookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data] TEXTIMAGE_ON [GeneralBookingUS_fg_data]

GO
/****** Object:  Table [dbo].[InsuranceRecordLocator]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InsuranceRecordLocator](
	[InsuranceRecordLocator] [bigint] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PKInsuranceRecordLocator] PRIMARY KEY CLUSTERED 
(
	[InsuranceRecordLocator] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
/****** Object:  Table [dbo].[OMSFeeStaging]    Script Date: 9/17/2015 3:39:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OMSFeeStaging](
	[BookingID] [int] NOT NULL,
	[TransactionGUID] [uniqueidentifier] NOT NULL,
	[BookingFeeChangeData] [xml] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [pk_OMSFeeStaging] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data] TEXTIMAGE_ON [GeneralBookingUS_fg_data]

GO
/****** Object:  Table [dbo].[ReplicationPingTest]    Script Date: 9/17/2015 3:39:56 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SystemSQLAgentJob]    Script Date: 9/17/2015 3:39:56 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SystemValue]    Script Date: 9/17/2015 3:39:56 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [GeneralBookingUS_fg_data]
) ON [GeneralBookingUS_fg_data]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[BookingAttributeExtensionCustomDataElement]    Script Date: 9/17/2015 3:39:56 PM ******/
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
/****** Object:  View [dbo].[BookingAttributeExtensionPolicyException]    Script Date: 9/17/2015 3:39:56 PM ******/
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
/****** Object:  View [dbo].[BookingAttributeExtensionPolicyReasonCode]    Script Date: 9/17/2015 3:39:56 PM ******/
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
ALTER TABLE [dbo].[ReplicationPingTest] ADD  CONSTRAINT [dfReplicationPingTest_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[BookingAffiliateSource]  WITH NOCHECK ADD  CONSTRAINT [fkBookingAffiliateSource_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BookingAffiliateSource] CHECK CONSTRAINT [fkBookingAffiliateSource_Booking]
GO
ALTER TABLE [dbo].[BookingAmount]  WITH NOCHECK ADD  CONSTRAINT [fkBookingAmount_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[BookingAmount] CHECK CONSTRAINT [fkBookingAmount_Booking]
GO
ALTER TABLE [dbo].[BookingAmount]  WITH NOCHECK ADD  CONSTRAINT [fkBookingAmount_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingAmount] CHECK CONSTRAINT [fkBookingAmount_BookingItem]
GO
ALTER TABLE [dbo].[BookingAttributeExtension]  WITH NOCHECK ADD  CONSTRAINT [fkBookingAttributeExtension_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[BookingAttributeExtension] CHECK CONSTRAINT [fkBookingAttributeExtension_Booking]
GO
ALTER TABLE [dbo].[BookingAttributeExtension]  WITH NOCHECK ADD  CONSTRAINT [fkBookingAttributeExtension_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingAttributeExtension] CHECK CONSTRAINT [fkBookingAttributeExtension_BookingItem]
GO
ALTER TABLE [dbo].[BookingAttributeExtension]  WITH NOCHECK ADD  CONSTRAINT [fkBookingAttributeExtension_BookingTraveler] FOREIGN KEY([BookingID], [BookingTravelerSeqNbr])
REFERENCES [dbo].[BookingTraveler] ([BookingID], [BookingTravelerSeqNbr])
GO
ALTER TABLE [dbo].[BookingAttributeExtension] CHECK CONSTRAINT [fkBookingAttributeExtension_BookingTraveler]
GO
ALTER TABLE [dbo].[BookingItem]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItem_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[BookingItem] CHECK CONSTRAINT [fkBookingItem_Booking]
GO
ALTER TABLE [dbo].[BookingItem]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItem_BookingItem_Original] FOREIGN KEY([BookingItemIDOriginal])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItem] CHECK CONSTRAINT [fkBookingItem_BookingItem_Original]
GO
ALTER TABLE [dbo].[BookingItem]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItem_BookingItem_Prior] FOREIGN KEY([BookingItemIDPrior])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItem] CHECK CONSTRAINT [fkBookingItem_BookingItem_Prior]
GO
ALTER TABLE [dbo].[BookingItemAir]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemAir_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BookingItemAir] CHECK CONSTRAINT [fkBookingItemAir_BookingItem]
GO
ALTER TABLE [dbo].[BookingItemAir]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemAir_BookingItemAirInventory] FOREIGN KEY([BookingItineraryAirID])
REFERENCES [dbo].[BookingItineraryAir] ([BookingItineraryAirID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BookingItemAir] CHECK CONSTRAINT [fkBookingItemAir_BookingItemAirInventory]
GO
ALTER TABLE [dbo].[BookingItemAirInventory]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemAirInventory_BookingItemAir] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItemAir] ([BookingItemID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BookingItemAirInventory] CHECK CONSTRAINT [fkBookingItemAirInventory_BookingItemAir]
GO
ALTER TABLE [dbo].[BookingItemAirInventory]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemAirInventory_BookingItemAirInventory_Pricing] FOREIGN KEY([BookingItemID], [BookingItemInventorySeqNbrPricing])
REFERENCES [dbo].[BookingItemAirInventory] ([BookingItemID], [BookingItemInventorySeqNbr])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BookingItemAirInventory] CHECK CONSTRAINT [fkBookingItemAirInventory_BookingItemAirInventory_Pricing]
GO
ALTER TABLE [dbo].[BookingItemBookingTraveler]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemBookingTraveler_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItemBookingTraveler] CHECK CONSTRAINT [fkBookingItemBookingTraveler_BookingItem]
GO
ALTER TABLE [dbo].[BookingItemBookingTraveler]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemBookingTraveler_BookingItemBookingTravelerLog] FOREIGN KEY([BookingItemBookingTravelerLogID])
REFERENCES [dbo].[BookingItemBookingTravelerLog] ([BookingItemBookingTravelerLogID])
GO
ALTER TABLE [dbo].[BookingItemBookingTraveler] CHECK CONSTRAINT [fkBookingItemBookingTraveler_BookingItemBookingTravelerLog]
GO
ALTER TABLE [dbo].[BookingItemBookingTraveler]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemBookingTraveler_BookingTraveler] FOREIGN KEY([BookingID], [BookingTravelerSeqNbr])
REFERENCES [dbo].[BookingTraveler] ([BookingID], [BookingTravelerSeqNbr])
GO
ALTER TABLE [dbo].[BookingItemBookingTraveler] CHECK CONSTRAINT [fkBookingItemBookingTraveler_BookingTraveler]
GO
ALTER TABLE [dbo].[BookingItemBookingTravelerLog]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemBookingTravelerLog_BookingItemBookingTravelerLog_Prior] FOREIGN KEY([BookingItemBookingTravelerLogIDPrior])
REFERENCES [dbo].[BookingItemBookingTravelerLog] ([BookingItemBookingTravelerLogID])
GO
ALTER TABLE [dbo].[BookingItemBookingTravelerLog] CHECK CONSTRAINT [fkBookingItemBookingTravelerLog_BookingItemBookingTravelerLog_Prior]
GO
ALTER TABLE [dbo].[BookingItemCar]  WITH CHECK ADD  CONSTRAINT [fkBookingItemCar_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItemCar] CHECK CONSTRAINT [fkBookingItemCar_BookingItem]
GO
ALTER TABLE [dbo].[BookingItemCarAgency]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemCarAgency_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItemCarAgency] CHECK CONSTRAINT [fkBookingItemCarAgency_BookingItem]
GO
ALTER TABLE [dbo].[BookingItemCarInventory]  WITH CHECK ADD  CONSTRAINT [fkBookingItemCarInventory_BookingItemCar] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItemCar] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItemCarInventory] CHECK CONSTRAINT [fkBookingItemCarInventory_BookingItemCar]
GO
ALTER TABLE [dbo].[BookingItemCarMerchant]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemCarMerchant_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItemCarMerchant] CHECK CONSTRAINT [fkBookingItemCarMerchant_BookingItem]
GO
ALTER TABLE [dbo].[BookingItemCarMerchantCancelPenalty]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemCarMerchantCancelPenalty_BookingItemCarMerchant] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItemCarMerchant] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItemCarMerchantCancelPenalty] CHECK CONSTRAINT [fkBookingItemCarMerchantCancelPenalty_BookingItemCarMerchant]
GO
ALTER TABLE [dbo].[BookingItemCarMerchantInventory]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemCarMerchantInventory_BookingItemCarMerchant] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItemCarMerchant] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItemCarMerchantInventory] CHECK CONSTRAINT [fkBookingItemCarMerchantInventory_BookingItemCarMerchant]
GO
ALTER TABLE [dbo].[BookingItemCruise]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemCruise_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItemCruise] CHECK CONSTRAINT [fkBookingItemCruise_BookingItem]
GO
ALTER TABLE [dbo].[BookingItemCruiseExternalCatalog]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemCruiseExternalCatalog_BookingItemCruise] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItemCruise] ([BookingItemID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BookingItemCruiseExternalCatalog] CHECK CONSTRAINT [fkBookingItemCruiseExternalCatalog_BookingItemCruise]
GO
ALTER TABLE [dbo].[BookingItemCruiseTraveler]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemCruiseTraveler_BookingItemBookingTraveler] FOREIGN KEY([BookingID], [BookingTravelerSeqNbr], [BookingItemID])
REFERENCES [dbo].[BookingItemBookingTraveler] ([BookingID], [BookingTravelerSeqNbr], [BookingItemID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BookingItemCruiseTraveler] CHECK CONSTRAINT [fkBookingItemCruiseTraveler_BookingItemBookingTraveler]
GO
ALTER TABLE [dbo].[BookingItemCruiseTraveler]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemCruiseTraveler_BookingItemCruise] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItemCruise] ([BookingItemID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BookingItemCruiseTraveler] CHECK CONSTRAINT [fkBookingItemCruiseTraveler_BookingItemCruise]
GO
ALTER TABLE [dbo].[BookingItemCruiseTravelerCruiseLineSKU]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemCruiseTravelerCruiseLineSKU_BookingItemCruiseTraveler] FOREIGN KEY([BookingItemID], [BookingID], [BookingTravelerSeqNbr])
REFERENCES [dbo].[BookingItemCruiseTraveler] ([BookingItemID], [BookingID], [BookingTravelerSeqNbr])
GO
ALTER TABLE [dbo].[BookingItemCruiseTravelerCruiseLineSKU] CHECK CONSTRAINT [fkBookingItemCruiseTravelerCruiseLineSKU_BookingItemCruiseTraveler]
GO
ALTER TABLE [dbo].[BookingItemDocument]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemDocument_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BookingItemDocument] CHECK CONSTRAINT [fkBookingItemDocument_BookingItem]
GO
ALTER TABLE [dbo].[BookingItemDocument]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemDocument_BookingItemDocument_Next] FOREIGN KEY([BookingItemID], [BookingItemDocumentSeqNbrNext])
REFERENCES [dbo].[BookingItemDocument] ([BookingItemID], [BookingItemDocumentSeqNbr])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BookingItemDocument] CHECK CONSTRAINT [fkBookingItemDocument_BookingItemDocument_Next]
GO
ALTER TABLE [dbo].[BookingItemHold]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemHold_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItemHold] CHECK CONSTRAINT [fkBookingItemHold_BookingItem]
GO
ALTER TABLE [dbo].[BookingItemHoldLog]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemHoldLog_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItemHoldLog] CHECK CONSTRAINT [fkBookingItemHoldLog_BookingItem]
GO
ALTER TABLE [dbo].[BookingItemInsurance]  WITH CHECK ADD  CONSTRAINT [fkBookingItemInsurance_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItemInsurance] CHECK CONSTRAINT [fkBookingItemInsurance_BookingItem]
GO
ALTER TABLE [dbo].[BookingItemInsurance]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemInsurance_CancelReason] FOREIGN KEY([CancelReasonID])
REFERENCES [dbo].[CancelReason] ([CancelReasonID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BookingItemInsurance] CHECK CONSTRAINT [fkBookingItemInsurance_CancelReason]
GO
ALTER TABLE [dbo].[BookingItemInsurance]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemInsurance_CancelType] FOREIGN KEY([CancelTypeID])
REFERENCES [dbo].[CancelType] ([CancelTypeID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BookingItemInsurance] CHECK CONSTRAINT [fkBookingItemInsurance_CancelType]
GO
ALTER TABLE [dbo].[BookingItemLodging]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemLodging_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItemLodging] CHECK CONSTRAINT [fkBookingItemLodging_BookingItem]
GO
ALTER TABLE [dbo].[BookingItemLodgingCancelPenalty]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemLodgingCancelPenalty_BookingItemLodging] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItemLodging] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItemLodgingCancelPenalty] CHECK CONSTRAINT [fkBookingItemLodgingCancelPenalty_BookingItemLodging]
GO
ALTER TABLE [dbo].[BookingItemLodgingComparison]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemLodgingComparison_BookingItemLodging] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItemLodging] ([BookingItemID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BookingItemLodgingComparison] CHECK CONSTRAINT [fkBookingItemLodgingComparison_BookingItemLodging]
GO
ALTER TABLE [dbo].[BookingItemLodgingInventory]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemLodgingInventory_BookingItemLodging] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItemLodging] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItemLodgingInventory] CHECK CONSTRAINT [fkBookingItemLodgingInventory_BookingItemLodging]
GO
ALTER TABLE [dbo].[BookingItemLodgingRateRule]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemLodgingRateRule_BookingItemLodging] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItemLodging] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItemLodgingRateRule] CHECK CONSTRAINT [fkBookingItemLodgingRateRule_BookingItemLodging]
GO
ALTER TABLE [dbo].[BookingItemMerchandising]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemMerchandising_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BookingItemMerchandising] CHECK CONSTRAINT [fkBookingItemMerchandising_BookingItem]
GO
ALTER TABLE [dbo].[BookingItemNotification]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemNotification_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItemNotification] CHECK CONSTRAINT [fkBookingItemNotification_BookingItem]
GO
ALTER TABLE [dbo].[BookingItemSUCC]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemSUCC_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BookingItemSUCC] CHECK CONSTRAINT [fkBookingItemSUCC_BookingItem]
GO
ALTER TABLE [dbo].[BookingItemTravelShops]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemTravelShops_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingItemTravelShops] CHECK CONSTRAINT [fkBookingItemTravelShops_BookingItem]
GO
ALTER TABLE [dbo].[BookingItemWaiver]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItemWaiver_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BookingItemWaiver] CHECK CONSTRAINT [fkBookingItemWaiver_BookingItem]
GO
ALTER TABLE [dbo].[BookingItineraryAir]  WITH NOCHECK ADD  CONSTRAINT [fkBookingItineraryAir_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BookingItineraryAir] CHECK CONSTRAINT [fkBookingItineraryAir_Booking]
GO
ALTER TABLE [dbo].[BookingLock]  WITH NOCHECK ADD  CONSTRAINT [fkBookingLock_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[BookingLock] CHECK CONSTRAINT [fkBookingLock_Booking]
GO
ALTER TABLE [dbo].[BookingLodgingOpaque]  WITH NOCHECK ADD  CONSTRAINT [fkBookingLodgingOpaque_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[BookingLodgingOpaque] CHECK CONSTRAINT [fkBookingLodgingOpaque_Booking]
GO
ALTER TABLE [dbo].[BookingText]  WITH NOCHECK ADD  CONSTRAINT [fkBookingText_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[BookingText] CHECK CONSTRAINT [fkBookingText_Booking]
GO
ALTER TABLE [dbo].[BookingText]  WITH NOCHECK ADD  CONSTRAINT [fkBookingText_BookingItem] FOREIGN KEY([BookingItemID])
REFERENCES [dbo].[BookingItem] ([BookingItemID])
GO
ALTER TABLE [dbo].[BookingText] CHECK CONSTRAINT [fkBookingText_BookingItem]
GO
ALTER TABLE [dbo].[BookingTraveler]  WITH NOCHECK ADD  CONSTRAINT [fkBookingTraveler_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[BookingTraveler] CHECK CONSTRAINT [fkBookingTraveler_Booking]
GO
ALTER TABLE [dbo].[BookingTravelerLoyaltyPlan]  WITH NOCHECK ADD  CONSTRAINT [fkBookingTravelerLoyaltyPlan_BookingTraveler] FOREIGN KEY([BookingID], [BookingTravelerSeqNbr])
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
ALTER TABLE [dbo].[OMSFeeStaging]  WITH CHECK ADD  CONSTRAINT [fk_OMSFeeStaging_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[OMSFeeStaging] CHECK CONSTRAINT [fk_OMSFeeStaging_Booking]
GO
ALTER TABLE [dbo].[BookingItemBookingTraveler]  WITH NOCHECK ADD CHECK  (([PrimaryTravelerBool] = 1 or [PrimaryTravelerBool] = 0))
GO
EXEC sys.sp_addextendedproperty @name=N'dbo.BookingItemInsurance.CancelInsurancePolicyNbr Description', @value=N'Refers to the orignal InsurancePolicyNbr.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BookingItemInsurance', @level2type=N'COLUMN',@level2name=N'CancelInsurancePolicyNbr'
GO
EXEC sys.sp_addextendedproperty @name=N'dbo.BookingItemInsurance.CancelExpressionName Description', @value=N'Sourced from the Insurance database, ins.Expression.InternalExpressionName.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BookingItemInsurance', @level2type=N'COLUMN',@level2name=N'CancelExpressionName'
GO
