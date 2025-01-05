USE [master]
GO
/****** Object:  Database [SocialMedia]    Script Date: 1/5/2025 9:05:48 PM ******/
CREATE DATABASE [SocialMedia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SocialMedia', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SocialMedia.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SocialMedia_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SocialMedia_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SocialMedia] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SocialMedia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SocialMedia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SocialMedia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SocialMedia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SocialMedia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SocialMedia] SET ARITHABORT OFF 
GO
ALTER DATABASE [SocialMedia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SocialMedia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SocialMedia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SocialMedia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SocialMedia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SocialMedia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SocialMedia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SocialMedia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SocialMedia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SocialMedia] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SocialMedia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SocialMedia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SocialMedia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SocialMedia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SocialMedia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SocialMedia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SocialMedia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SocialMedia] SET RECOVERY FULL 
GO
ALTER DATABASE [SocialMedia] SET  MULTI_USER 
GO
ALTER DATABASE [SocialMedia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SocialMedia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SocialMedia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SocialMedia] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SocialMedia] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SocialMedia] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SocialMedia', N'ON'
GO
ALTER DATABASE [SocialMedia] SET QUERY_STORE = ON
GO
ALTER DATABASE [SocialMedia] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SocialMedia]
GO
/****** Object:  Schema [Advertising]    Script Date: 1/5/2025 9:05:49 PM ******/
CREATE SCHEMA [Advertising]
GO
/****** Object:  Schema [Analytics]    Script Date: 1/5/2025 9:05:49 PM ******/
CREATE SCHEMA [Analytics]
GO
/****** Object:  Schema [Content]    Script Date: 1/5/2025 9:05:49 PM ******/
CREATE SCHEMA [Content]
GO
/****** Object:  Schema [Events]    Script Date: 1/5/2025 9:05:49 PM ******/
CREATE SCHEMA [Events]
GO
/****** Object:  Schema [Interaction]    Script Date: 1/5/2025 9:05:49 PM ******/
CREATE SCHEMA [Interaction]
GO
/****** Object:  Schema [Messaging]    Script Date: 1/5/2025 9:05:49 PM ******/
CREATE SCHEMA [Messaging]
GO
/****** Object:  Schema [Security]    Script Date: 1/5/2025 9:05:49 PM ******/
CREATE SCHEMA [Security]
GO
/****** Object:  Schema [Settings]    Script Date: 1/5/2025 9:05:49 PM ******/
CREATE SCHEMA [Settings]
GO
/****** Object:  Schema [Support]    Script Date: 1/5/2025 9:05:49 PM ******/
CREATE SCHEMA [Support]
GO
/****** Object:  Schema [UserManagement]    Script Date: 1/5/2025 9:05:49 PM ******/
CREATE SCHEMA [UserManagement]
GO
/****** Object:  Table [Advertising].[AdCampaigns]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Advertising].[AdCampaigns](
	[CampaignID] [int] IDENTITY(1,1) NOT NULL,
	[CampaignName] [nvarchar](100) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Budget] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CampaignID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Advertising].[AdImpressions]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Advertising].[AdImpressions](
	[ImpressionID] [int] IDENTITY(1,1) NOT NULL,
	[AdID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[ImpressionTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ImpressionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Advertising].[Ads]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Advertising].[Ads](
	[AdID] [int] IDENTITY(1,1) NOT NULL,
	[CampaignID] [int] NOT NULL,
	[AdTitle] [nvarchar](100) NOT NULL,
	[AdContent] [nvarchar](max) NOT NULL,
	[AdURL] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Analytics].[PostAnalytics]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Analytics].[PostAnalytics](
	[AnalyticsID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NOT NULL,
	[Views] [int] NULL,
	[Likes] [int] NULL,
	[Shares] [int] NULL,
	[Comments] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AnalyticsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Analytics].[UserActivity]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Analytics].[UserActivity](
	[ActivityID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ActivityType] [nvarchar](50) NOT NULL,
	[ActivityTimestamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ActivityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Analytics].[UserEngagement]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Analytics].[UserEngagement](
	[EngagementID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[EngagementScore] [decimal](5, 2) NULL,
	[LastCalculatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[EngagementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Content].[Comments]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Content].[Comments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[CommentText] [nvarchar](500) NOT NULL,
	[CommentedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Content].[Hashtags]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Content].[Hashtags](
	[HashtagID] [int] IDENTITY(1,1) NOT NULL,
	[Hashtag] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HashtagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Hashtag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Content].[PostHashtags]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Content].[PostHashtags](
	[PostHashtagID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NOT NULL,
	[HashtagID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PostHashtagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_PostHashtag] UNIQUE NONCLUSTERED 
(
	[PostID] ASC,
	[HashtagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Content].[PostMedia]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Content].[PostMedia](
	[MediaID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NOT NULL,
	[MediaURL] [nvarchar](255) NOT NULL,
	[MediaType] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MediaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Content].[Posts]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Content].[Posts](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[PostedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Events].[EventAttendees]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Events].[EventAttendees](
	[AttendeeID] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[RSVPStatus] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AttendeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Events].[Events]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Events].[Events](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[EventName] [nvarchar](100) NOT NULL,
	[EventDescription] [nvarchar](max) NULL,
	[EventDate] [datetime] NOT NULL,
	[Location] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Interaction].[Bookmarks]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Interaction].[Bookmarks](
	[BookmarkID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[BookmarkedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookmarkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_BookmarkPostUser] UNIQUE NONCLUSTERED 
(
	[PostID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Interaction].[Likes]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Interaction].[Likes](
	[LikeID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[LikedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LikeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_LikePostUser] UNIQUE NONCLUSTERED 
(
	[PostID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Interaction].[Reactions]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Interaction].[Reactions](
	[ReactionID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[ReactionType] [nvarchar](50) NOT NULL,
	[ReactedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_ReactionPostUser] UNIQUE NONCLUSTERED 
(
	[PostID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Interaction].[Shares]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Interaction].[Shares](
	[ShareID] [int] IDENTITY(1,1) NOT NULL,
	[PostID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[SharedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ShareID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Messaging].[MessageAttachments]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Messaging].[MessageAttachments](
	[AttachmentID] [int] IDENTITY(1,1) NOT NULL,
	[MessageID] [int] NOT NULL,
	[FileURL] [nvarchar](255) NOT NULL,
	[FileType] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AttachmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Messaging].[Messages]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Messaging].[Messages](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[SenderUserID] [int] NOT NULL,
	[ReceiverUserID] [int] NOT NULL,
	[MessageText] [nvarchar](max) NOT NULL,
	[SentAt] [datetime] NULL,
	[IsRead] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Messaging].[Notifications]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Messaging].[Notifications](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[NotificationText] [nvarchar](500) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[IsRead] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Security].[BlockedUsers]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Security].[BlockedUsers](
	[BlockID] [int] IDENTITY(1,1) NOT NULL,
	[BlockerUserID] [int] NOT NULL,
	[BlockedUserID] [int] NOT NULL,
	[BlockedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BlockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_BlockerBlocked] UNIQUE NONCLUSTERED 
(
	[BlockerUserID] ASC,
	[BlockedUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Security].[LoginAttempts]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Security].[LoginAttempts](
	[AttemptID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[AttemptTime] [datetime] NULL,
	[IsSuccessful] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[AttemptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Security].[PasswordHistory]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Security].[PasswordHistory](
	[PasswordHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[OldPasswordHash] [nvarchar](256) NOT NULL,
	[ChangedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PasswordHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Settings].[NotificationSettings]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Settings].[NotificationSettings](
	[NotificationSettingID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[EmailNotifications] [bit] NULL,
	[PushNotifications] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationSettingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Settings].[PrivacySettings]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Settings].[PrivacySettings](
	[PrivacySettingID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ProfileVisibility] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PrivacySettingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Support].[SupportTickets]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Support].[SupportTickets](
	[TicketID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Subject] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Support].[TicketReplies]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Support].[TicketReplies](
	[ReplyID] [int] IDENTITY(1,1) NOT NULL,
	[TicketID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[ReplyText] [nvarchar](max) NOT NULL,
	[RepliedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReplyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [UserManagement].[UserFollows]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [UserManagement].[UserFollows](
	[FollowID] [int] IDENTITY(1,1) NOT NULL,
	[FollowerUserID] [int] NOT NULL,
	[FollowedUserID] [int] NOT NULL,
	[FollowedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[FollowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_FollowerFollowed] UNIQUE NONCLUSTERED 
(
	[FollowerUserID] ASC,
	[FollowedUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [UserManagement].[UserRoleAssignments]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [UserManagement].[UserRoleAssignments](
	[AssignmentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	[AssignedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AssignmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [UserManagement].[UserRoles]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [UserManagement].[UserRoles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [UserManagement].[Users]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [UserManagement].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[PasswordHash] [nvarchar](256) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Bio] [nvarchar](500) NULL,
	[ProfilePictureURL] [nvarchar](255) NULL,
	[CreatedAt] [datetime] NULL,
	[LastLogin] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [UserManagement].[UserSettings]    Script Date: 1/5/2025 9:05:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [UserManagement].[UserSettings](
	[SettingID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Theme] [nvarchar](50) NULL,
	[NotificationPreferences] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[SettingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Advertising].[AdImpressions] ADD  DEFAULT (getdate()) FOR [ImpressionTime]
GO
ALTER TABLE [Analytics].[PostAnalytics] ADD  DEFAULT ((0)) FOR [Views]
GO
ALTER TABLE [Analytics].[PostAnalytics] ADD  DEFAULT ((0)) FOR [Likes]
GO
ALTER TABLE [Analytics].[PostAnalytics] ADD  DEFAULT ((0)) FOR [Shares]
GO
ALTER TABLE [Analytics].[PostAnalytics] ADD  DEFAULT ((0)) FOR [Comments]
GO
ALTER TABLE [Analytics].[UserActivity] ADD  DEFAULT (getdate()) FOR [ActivityTimestamp]
GO
ALTER TABLE [Analytics].[UserEngagement] ADD  DEFAULT ((0.0)) FOR [EngagementScore]
GO
ALTER TABLE [Analytics].[UserEngagement] ADD  DEFAULT (getdate()) FOR [LastCalculatedAt]
GO
ALTER TABLE [Content].[Comments] ADD  DEFAULT (getdate()) FOR [CommentedAt]
GO
ALTER TABLE [Content].[Posts] ADD  DEFAULT (getdate()) FOR [PostedAt]
GO
ALTER TABLE [Events].[EventAttendees] ADD  DEFAULT ('Pending') FOR [RSVPStatus]
GO
ALTER TABLE [Interaction].[Bookmarks] ADD  DEFAULT (getdate()) FOR [BookmarkedAt]
GO
ALTER TABLE [Interaction].[Likes] ADD  DEFAULT (getdate()) FOR [LikedAt]
GO
ALTER TABLE [Interaction].[Reactions] ADD  DEFAULT (getdate()) FOR [ReactedAt]
GO
ALTER TABLE [Interaction].[Shares] ADD  DEFAULT (getdate()) FOR [SharedAt]
GO
ALTER TABLE [Messaging].[Messages] ADD  DEFAULT (getdate()) FOR [SentAt]
GO
ALTER TABLE [Messaging].[Messages] ADD  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [Messaging].[Notifications] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Messaging].[Notifications] ADD  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [Security].[BlockedUsers] ADD  DEFAULT (getdate()) FOR [BlockedAt]
GO
ALTER TABLE [Security].[LoginAttempts] ADD  DEFAULT (getdate()) FOR [AttemptTime]
GO
ALTER TABLE [Security].[LoginAttempts] ADD  DEFAULT ((0)) FOR [IsSuccessful]
GO
ALTER TABLE [Security].[PasswordHistory] ADD  DEFAULT (getdate()) FOR [ChangedAt]
GO
ALTER TABLE [Settings].[NotificationSettings] ADD  DEFAULT ((1)) FOR [EmailNotifications]
GO
ALTER TABLE [Settings].[NotificationSettings] ADD  DEFAULT ((1)) FOR [PushNotifications]
GO
ALTER TABLE [Settings].[PrivacySettings] ADD  DEFAULT ('Public') FOR [ProfileVisibility]
GO
ALTER TABLE [Support].[SupportTickets] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [Support].[SupportTickets] ADD  DEFAULT ('Open') FOR [Status]
GO
ALTER TABLE [Support].[TicketReplies] ADD  DEFAULT (getdate()) FOR [RepliedAt]
GO
ALTER TABLE [UserManagement].[UserFollows] ADD  DEFAULT (getdate()) FOR [FollowedAt]
GO
ALTER TABLE [UserManagement].[UserRoleAssignments] ADD  DEFAULT (getdate()) FOR [AssignedAt]
GO
ALTER TABLE [UserManagement].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [UserManagement].[UserSettings] ADD  DEFAULT ('Light') FOR [Theme]
GO
ALTER TABLE [Advertising].[AdImpressions]  WITH CHECK ADD  CONSTRAINT [FK_AdImpressionAd] FOREIGN KEY([AdID])
REFERENCES [Advertising].[Ads] ([AdID])
GO
ALTER TABLE [Advertising].[AdImpressions] CHECK CONSTRAINT [FK_AdImpressionAd]
GO
ALTER TABLE [Advertising].[AdImpressions]  WITH CHECK ADD  CONSTRAINT [FK_AdImpressionUser] FOREIGN KEY([UserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [Advertising].[AdImpressions] CHECK CONSTRAINT [FK_AdImpressionUser]
GO
ALTER TABLE [Advertising].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_AdCampaign] FOREIGN KEY([CampaignID])
REFERENCES [Advertising].[AdCampaigns] ([CampaignID])
GO
ALTER TABLE [Advertising].[Ads] CHECK CONSTRAINT [FK_AdCampaign]
GO
ALTER TABLE [Analytics].[PostAnalytics]  WITH CHECK ADD  CONSTRAINT [FK_AnalyticsPost] FOREIGN KEY([PostID])
REFERENCES [Content].[Posts] ([PostID])
GO
ALTER TABLE [Analytics].[PostAnalytics] CHECK CONSTRAINT [FK_AnalyticsPost]
GO
ALTER TABLE [Analytics].[UserActivity]  WITH CHECK ADD  CONSTRAINT [FK_ActivityUser] FOREIGN KEY([UserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [Analytics].[UserActivity] CHECK CONSTRAINT [FK_ActivityUser]
GO
ALTER TABLE [Analytics].[UserEngagement]  WITH CHECK ADD  CONSTRAINT [FK_UserEngagementUser] FOREIGN KEY([UserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [Analytics].[UserEngagement] CHECK CONSTRAINT [FK_UserEngagementUser]
GO
ALTER TABLE [Content].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_CommentPost] FOREIGN KEY([PostID])
REFERENCES [Content].[Posts] ([PostID])
GO
ALTER TABLE [Content].[Comments] CHECK CONSTRAINT [FK_CommentPost]
GO
ALTER TABLE [Content].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_CommentUser] FOREIGN KEY([UserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [Content].[Comments] CHECK CONSTRAINT [FK_CommentUser]
GO
ALTER TABLE [Content].[PostHashtags]  WITH CHECK ADD  CONSTRAINT [FK_PostHashtagHashtag] FOREIGN KEY([HashtagID])
REFERENCES [Content].[Hashtags] ([HashtagID])
GO
ALTER TABLE [Content].[PostHashtags] CHECK CONSTRAINT [FK_PostHashtagHashtag]
GO
ALTER TABLE [Content].[PostHashtags]  WITH CHECK ADD  CONSTRAINT [FK_PostHashtagPost] FOREIGN KEY([PostID])
REFERENCES [Content].[Posts] ([PostID])
GO
ALTER TABLE [Content].[PostHashtags] CHECK CONSTRAINT [FK_PostHashtagPost]
GO
ALTER TABLE [Content].[PostMedia]  WITH CHECK ADD  CONSTRAINT [FK_PostMediaPost] FOREIGN KEY([PostID])
REFERENCES [Content].[Posts] ([PostID])
GO
ALTER TABLE [Content].[PostMedia] CHECK CONSTRAINT [FK_PostMediaPost]
GO
ALTER TABLE [Content].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_PostUser] FOREIGN KEY([UserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [Content].[Posts] CHECK CONSTRAINT [FK_PostUser]
GO
ALTER TABLE [Events].[EventAttendees]  WITH CHECK ADD  CONSTRAINT [FK_EventAttendeeEvent] FOREIGN KEY([EventID])
REFERENCES [Events].[Events] ([EventID])
GO
ALTER TABLE [Events].[EventAttendees] CHECK CONSTRAINT [FK_EventAttendeeEvent]
GO
ALTER TABLE [Events].[EventAttendees]  WITH CHECK ADD  CONSTRAINT [FK_EventAttendeeUser] FOREIGN KEY([UserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [Events].[EventAttendees] CHECK CONSTRAINT [FK_EventAttendeeUser]
GO
ALTER TABLE [Interaction].[Bookmarks]  WITH CHECK ADD  CONSTRAINT [FK_BookmarkPost] FOREIGN KEY([PostID])
REFERENCES [Content].[Posts] ([PostID])
GO
ALTER TABLE [Interaction].[Bookmarks] CHECK CONSTRAINT [FK_BookmarkPost]
GO
ALTER TABLE [Interaction].[Bookmarks]  WITH CHECK ADD  CONSTRAINT [FK_BookmarkUser] FOREIGN KEY([UserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [Interaction].[Bookmarks] CHECK CONSTRAINT [FK_BookmarkUser]
GO
ALTER TABLE [Interaction].[Likes]  WITH CHECK ADD  CONSTRAINT [FK_LikePost] FOREIGN KEY([PostID])
REFERENCES [Content].[Posts] ([PostID])
GO
ALTER TABLE [Interaction].[Likes] CHECK CONSTRAINT [FK_LikePost]
GO
ALTER TABLE [Interaction].[Likes]  WITH CHECK ADD  CONSTRAINT [FK_LikeUser] FOREIGN KEY([UserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [Interaction].[Likes] CHECK CONSTRAINT [FK_LikeUser]
GO
ALTER TABLE [Interaction].[Reactions]  WITH CHECK ADD  CONSTRAINT [FK_ReactionPost] FOREIGN KEY([PostID])
REFERENCES [Content].[Posts] ([PostID])
GO
ALTER TABLE [Interaction].[Reactions] CHECK CONSTRAINT [FK_ReactionPost]
GO
ALTER TABLE [Interaction].[Reactions]  WITH CHECK ADD  CONSTRAINT [FK_ReactionUser] FOREIGN KEY([UserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [Interaction].[Reactions] CHECK CONSTRAINT [FK_ReactionUser]
GO
ALTER TABLE [Interaction].[Shares]  WITH CHECK ADD  CONSTRAINT [FK_SharePost] FOREIGN KEY([PostID])
REFERENCES [Content].[Posts] ([PostID])
GO
ALTER TABLE [Interaction].[Shares] CHECK CONSTRAINT [FK_SharePost]
GO
ALTER TABLE [Interaction].[Shares]  WITH CHECK ADD  CONSTRAINT [FK_ShareUser] FOREIGN KEY([UserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [Interaction].[Shares] CHECK CONSTRAINT [FK_ShareUser]
GO
ALTER TABLE [Messaging].[MessageAttachments]  WITH CHECK ADD  CONSTRAINT [FK_MessageAttachmentMessage] FOREIGN KEY([MessageID])
REFERENCES [Messaging].[Messages] ([MessageID])
GO
ALTER TABLE [Messaging].[MessageAttachments] CHECK CONSTRAINT [FK_MessageAttachmentMessage]
GO
ALTER TABLE [Messaging].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_MessageReceiver] FOREIGN KEY([ReceiverUserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [Messaging].[Messages] CHECK CONSTRAINT [FK_MessageReceiver]
GO
ALTER TABLE [Messaging].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_MessageSender] FOREIGN KEY([SenderUserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [Messaging].[Messages] CHECK CONSTRAINT [FK_MessageSender]
GO
ALTER TABLE [Messaging].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_NotificationUser] FOREIGN KEY([UserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [Messaging].[Notifications] CHECK CONSTRAINT [FK_NotificationUser]
GO
ALTER TABLE [Security].[BlockedUsers]  WITH CHECK ADD  CONSTRAINT [FK_BlockedUser] FOREIGN KEY([BlockedUserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [Security].[BlockedUsers] CHECK CONSTRAINT [FK_BlockedUser]
GO
ALTER TABLE [Security].[BlockedUsers]  WITH CHECK ADD  CONSTRAINT [FK_BlockerUser] FOREIGN KEY([BlockerUserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [Security].[BlockedUsers] CHECK CONSTRAINT [FK_BlockerUser]
GO
ALTER TABLE [Security].[LoginAttempts]  WITH CHECK ADD  CONSTRAINT [FK_LoginAttemptUser] FOREIGN KEY([UserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [Security].[LoginAttempts] CHECK CONSTRAINT [FK_LoginAttemptUser]
GO
ALTER TABLE [Security].[PasswordHistory]  WITH CHECK ADD  CONSTRAINT [FK_PasswordHistoryUser] FOREIGN KEY([UserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [Security].[PasswordHistory] CHECK CONSTRAINT [FK_PasswordHistoryUser]
GO
ALTER TABLE [Settings].[NotificationSettings]  WITH CHECK ADD  CONSTRAINT [FK_NotificationSettingUser] FOREIGN KEY([UserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [Settings].[NotificationSettings] CHECK CONSTRAINT [FK_NotificationSettingUser]
GO
ALTER TABLE [Settings].[PrivacySettings]  WITH CHECK ADD  CONSTRAINT [FK_PrivacySettingUser] FOREIGN KEY([UserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [Settings].[PrivacySettings] CHECK CONSTRAINT [FK_PrivacySettingUser]
GO
ALTER TABLE [Support].[SupportTickets]  WITH CHECK ADD  CONSTRAINT [FK_SupportTicketUser] FOREIGN KEY([UserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [Support].[SupportTickets] CHECK CONSTRAINT [FK_SupportTicketUser]
GO
ALTER TABLE [Support].[TicketReplies]  WITH CHECK ADD  CONSTRAINT [FK_TicketReplyTicket] FOREIGN KEY([TicketID])
REFERENCES [Support].[SupportTickets] ([TicketID])
GO
ALTER TABLE [Support].[TicketReplies] CHECK CONSTRAINT [FK_TicketReplyTicket]
GO
ALTER TABLE [Support].[TicketReplies]  WITH CHECK ADD  CONSTRAINT [FK_TicketReplyUser] FOREIGN KEY([UserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [Support].[TicketReplies] CHECK CONSTRAINT [FK_TicketReplyUser]
GO
ALTER TABLE [UserManagement].[UserFollows]  WITH CHECK ADD  CONSTRAINT [FK_FollowedUser] FOREIGN KEY([FollowedUserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [UserManagement].[UserFollows] CHECK CONSTRAINT [FK_FollowedUser]
GO
ALTER TABLE [UserManagement].[UserFollows]  WITH CHECK ADD  CONSTRAINT [FK_FollowerUser] FOREIGN KEY([FollowerUserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [UserManagement].[UserFollows] CHECK CONSTRAINT [FK_FollowerUser]
GO
ALTER TABLE [UserManagement].[UserRoleAssignments]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleAssignmentRole] FOREIGN KEY([RoleID])
REFERENCES [UserManagement].[UserRoles] ([RoleID])
GO
ALTER TABLE [UserManagement].[UserRoleAssignments] CHECK CONSTRAINT [FK_UserRoleAssignmentRole]
GO
ALTER TABLE [UserManagement].[UserRoleAssignments]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleAssignmentUser] FOREIGN KEY([UserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [UserManagement].[UserRoleAssignments] CHECK CONSTRAINT [FK_UserRoleAssignmentUser]
GO
ALTER TABLE [UserManagement].[UserSettings]  WITH CHECK ADD  CONSTRAINT [FK_UserSettingUser] FOREIGN KEY([UserID])
REFERENCES [UserManagement].[Users] ([UserID])
GO
ALTER TABLE [UserManagement].[UserSettings] CHECK CONSTRAINT [FK_UserSettingUser]
GO
USE [master]
GO
ALTER DATABASE [SocialMedia] SET  READ_WRITE 
GO
