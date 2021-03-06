USE [Welp]
GO
/****** Object:  Table [dbo].[AllUsers]    Script Date: 7/27/2016 7:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllUsers](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Location] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_AllUsers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Businesses]    Script Date: 7/27/2016 7:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Businesses](
	[BusinessID] [int] NOT NULL,
	[BusinessName] [nvarchar](50) NOT NULL,
	[OwnerID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[Menu] [nvarchar](max) NULL,
 CONSTRAINT [PK_Businesses] PRIMARY KEY CLUSTERED 
(
	[BusinessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BusinessOwners]    Script Date: 7/27/2016 7:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessOwners](
	[OwnerID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_BusinessOwners] PRIMARY KEY CLUSTERED 
(
	[OwnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 7/27/2016 7:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[BusinessID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[RatingID] [int] NOT NULL,
	[ReveiwComments] [nvarchar](max) NULL,
 CONSTRAINT [PK_Reviews_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StarRating]    Script Date: 7/27/2016 7:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StarRating](
	[RatingID] [int] NOT NULL,
	[StarRating] [smallint] NOT NULL,
 CONSTRAINT [PK_StarRating] PRIMARY KEY CLUSTERED 
(
	[RatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Type]    Script Date: 7/27/2016 7:11:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[TypeID] [int] NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Businesses]  WITH CHECK ADD  CONSTRAINT [FK_Businesses_Businesses] FOREIGN KEY([BusinessID])
REFERENCES [dbo].[Businesses] ([BusinessID])
GO
ALTER TABLE [dbo].[Businesses] CHECK CONSTRAINT [FK_Businesses_Businesses]
GO
ALTER TABLE [dbo].[Businesses]  WITH CHECK ADD  CONSTRAINT [FK_Businesses_BusinessOwners] FOREIGN KEY([BusinessID])
REFERENCES [dbo].[BusinessOwners] ([OwnerID])
GO
ALTER TABLE [dbo].[Businesses] CHECK CONSTRAINT [FK_Businesses_BusinessOwners]
GO
ALTER TABLE [dbo].[Businesses]  WITH CHECK ADD  CONSTRAINT [FK_Businesses_Type] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Type] ([TypeID])
GO
ALTER TABLE [dbo].[Businesses] CHECK CONSTRAINT [FK_Businesses_Type]
GO
ALTER TABLE [dbo].[BusinessOwners]  WITH CHECK ADD  CONSTRAINT [FK_BusinessOwners_AllUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AllUsers] ([UserID])
GO
ALTER TABLE [dbo].[BusinessOwners] CHECK CONSTRAINT [FK_BusinessOwners_AllUsers]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_AllUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AllUsers] ([UserID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_AllUsers]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Businesses] FOREIGN KEY([BusinessID])
REFERENCES [dbo].[Businesses] ([BusinessID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Businesses]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_StarRating] FOREIGN KEY([UserID])
REFERENCES [dbo].[StarRating] ([RatingID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_StarRating]
GO
