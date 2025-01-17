USE [master]
GO
/****** Object:  Database [try]    Script Date: 1/16/2025 7:48:32 PM ******/
CREATE DATABASE [try]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'try', FILENAME = N'D:\Downloads\MSSQL16.MSSQLSERVER\MSSQL\DATA\try.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'try_log', FILENAME = N'D:\Downloads\MSSQL16.MSSQLSERVER\MSSQL\DATA\try_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [try] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [try].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [try] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [try] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [try] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [try] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [try] SET ARITHABORT OFF 
GO
ALTER DATABASE [try] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [try] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [try] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [try] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [try] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [try] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [try] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [try] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [try] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [try] SET  ENABLE_BROKER 
GO
ALTER DATABASE [try] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [try] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [try] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [try] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [try] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [try] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [try] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [try] SET RECOVERY FULL 
GO
ALTER DATABASE [try] SET  MULTI_USER 
GO
ALTER DATABASE [try] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [try] SET DB_CHAINING OFF 
GO
ALTER DATABASE [try] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [try] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [try] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [try] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'try', N'ON'
GO
ALTER DATABASE [try] SET QUERY_STORE = ON
GO
ALTER DATABASE [try] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [try]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1/16/2025 7:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actions]    Script Date: 1/16/2025 7:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actions](
	[ActionId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Actions] PRIMARY KEY CLUSTERED 
(
	[ActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Activities]    Script Date: 1/16/2025 7:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activities](
	[ActivityId] [uniqueidentifier] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[BookId] [uniqueidentifier] NOT NULL,
	[ActionId] [uniqueidentifier] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UserProfileProfileId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Activities] PRIMARY KEY CLUSTERED 
(
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 1/16/2025 7:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 1/16/2025 7:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 1/16/2025 7:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 1/16/2025 7:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 1/16/2025 7:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 1/16/2025 7:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 1/16/2025 7:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookGenres]    Script Date: 1/16/2025 7:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookGenres](
	[BookId] [uniqueidentifier] NOT NULL,
	[GenreId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_BookGenres] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC,
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 1/16/2025 7:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Author] [nvarchar](200) NOT NULL,
	[PublishedDate] [datetime2](7) NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[Rating] [decimal](3, 2) NULL,
	[Price] [int] NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[GenreId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FriendRequests]    Script Date: 1/16/2025 7:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FriendRequests](
	[FriendRequestId] [uniqueidentifier] NOT NULL,
	[RequesterId] [nvarchar](450) NOT NULL,
	[RecipientId] [nvarchar](450) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsAccepted] [bit] NOT NULL,
 CONSTRAINT [PK_FriendRequests] PRIMARY KEY CLUSTERED 
(
	[FriendRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friends]    Script Date: 1/16/2025 7:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friends](
	[FriendId] [uniqueidentifier] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[FriendUserId] [nvarchar](450) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UserProfileProfileId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Friends] PRIMARY KEY CLUSTERED 
(
	[FriendId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 1/16/2025 7:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[GenreId] [uniqueidentifier] NOT NULL,
	[GenreName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recommendations]    Script Date: 1/16/2025 7:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recommendations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[BookId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Recommendations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 1/16/2025 7:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewId] [uniqueidentifier] NOT NULL,
	[Comment] [nvarchar](2000) NOT NULL,
	[Rating] [int] NOT NULL,
	[ReviewDate] [datetime2](7) NOT NULL,
	[BookId] [uniqueidentifier] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfilePhotos]    Script Date: 1/16/2025 7:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfilePhotos](
	[PhotoId] [uniqueidentifier] NOT NULL,
	[PhotoUrl] [nvarchar](500) NOT NULL,
	[ProfileId] [uniqueidentifier] NOT NULL,
	[IsMainPhoto] [bit] NOT NULL,
	[UploadedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_UserProfilePhotos] PRIMARY KEY CLUSTERED 
(
	[PhotoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfiles]    Script Date: 1/16/2025 7:48:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfiles](
	[ProfileId] [uniqueidentifier] NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Bio] [nvarchar](500) NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_UserProfiles] PRIMARY KEY CLUSTERED 
(
	[ProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241023071218_AddMigrationsToDb', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241023135235_GenreToBookCycleManagement', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241023135949_AddingJsonIgnoreToGenre', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241024035253_AddingJsonIgnoreToProfile', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241025044118_AddUserIdToLoginResponseDb', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241025094016_AddingManyToManyRelationBetweenBookGenreToDb', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241031084903_AddedPaginationToBooks', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241031085742_AddedPaginationToBooks2', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241031085805_AddedPaginationToBooks3', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241031090651_AddedPaginationToBooks4', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241101110540_AddAllReviewApiToDb', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241102052526_SendingUserIDAsWellInReviews', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241102061705_SendingBookNamesOnly', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241102073206_AddingBooksByGenreAPI', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241102074422_HAndlingNullValueToProfileId', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241102101427_AddNameForFriendRequestAndPRofileByUSerId', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241102121420_AddFriendActivitiesVM', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241104080254_AddRecommendationTableToDb', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241105041037_AddedBooksByAcctivityAPI', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241105060419_AddedBooksByActivityReadDto', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241105063231_EditedAllReviewDto', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241124103430_AddBookGenreDto', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250113144334_AddedAPItoSendReviewsForRec', N'8.0.8')
GO
INSERT [dbo].[Actions] ([ActionId], [Name]) VALUES (N'8c8f1ed5-1dbd-400f-9f99-2a1e7a38db8b', N'Want to Read')
INSERT [dbo].[Actions] ([ActionId], [Name]) VALUES (N'b11ac0d4-ff79-4024-bcd5-32bf2e6d252d', N'Read')
INSERT [dbo].[Actions] ([ActionId], [Name]) VALUES (N'e2ccf236-783f-42bc-bbb5-f72dd850d614', N'Started')
GO
INSERT [dbo].[Activities] ([ActivityId], [UserId], [BookId], [ActionId], [CreatedAt], [UserProfileProfileId]) VALUES (N'da86983e-b21d-42ee-19b1-08dd354328b2', N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'1bc2b9f5-560d-4ae9-4e7b-08dcf4ddd1e6', N'8c8f1ed5-1dbd-400f-9f99-2a1e7a38db8b', CAST(N'2025-01-15T09:01:11.7850657' AS DateTime2), NULL)
INSERT [dbo].[Activities] ([ActivityId], [UserId], [BookId], [ActionId], [CreatedAt], [UserProfileProfileId]) VALUES (N'81d1e6c3-fb6c-4822-19b2-08dd354328b2', N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'1bc2b9f5-560d-4ae9-4e7b-08dcf4ddd1e6', N'b11ac0d4-ff79-4024-bcd5-32bf2e6d252d', CAST(N'2025-01-15T11:21:23.3849891' AS DateTime2), NULL)
INSERT [dbo].[Activities] ([ActivityId], [UserId], [BookId], [ActionId], [CreatedAt], [UserProfileProfileId]) VALUES (N'909f8e62-aa20-45a5-19b3-08dd354328b2', N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'60dfe00f-a54c-44d7-4e7e-08dcf4ddd1e6', N'8c8f1ed5-1dbd-400f-9f99-2a1e7a38db8b', CAST(N'2025-01-15T11:21:49.0982859' AS DateTime2), NULL)
INSERT [dbo].[Activities] ([ActivityId], [UserId], [BookId], [ActionId], [CreatedAt], [UserProfileProfileId]) VALUES (N'321b0809-2307-44d9-19b4-08dd354328b2', N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'c8be4ec4-bbaa-4d3f-4e81-08dcf4ddd1e6', N'8c8f1ed5-1dbd-400f-9f99-2a1e7a38db8b', CAST(N'2025-01-15T11:21:59.7100490' AS DateTime2), NULL)
INSERT [dbo].[Activities] ([ActivityId], [UserId], [BookId], [ActionId], [CreatedAt], [UserProfileProfileId]) VALUES (N'a1bed413-1348-4c84-19b5-08dd354328b2', N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'dca7cb9c-dca9-401f-4e84-08dcf4ddd1e6', N'8c8f1ed5-1dbd-400f-9f99-2a1e7a38db8b', CAST(N'2025-01-15T11:22:11.0829317' AS DateTime2), NULL)
INSERT [dbo].[Activities] ([ActivityId], [UserId], [BookId], [ActionId], [CreatedAt], [UserProfileProfileId]) VALUES (N'e7309372-4884-41e8-1d0f-08dd362071f2', N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'765dfbc8-fabd-487c-4ec9-08dcf4ddd1e6', N'b11ac0d4-ff79-4024-bcd5-32bf2e6d252d', CAST(N'2025-01-16T11:25:13.4839202' AS DateTime2), NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'ADMIN_ROLE_ID', N'Admin', N'ADMIN', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'USER_ROLE_ID', N'User', N'USER', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', N'ADMIN_ROLE_ID')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'092fea74-7836-4ad2-9b1d-2a8e0f336357', N'USER_ROLE_ID')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'USER_ROLE_ID')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'27960811-0180-42cc-9a10-7377c679e58a', N'USER_ROLE_ID')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8299ac07-d23c-4176-a8b2-fab4f9fb9a6e', N'USER_ROLE_ID')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9b4823c6-a09d-473d-b58c-83431c3c4020', N'USER_ROLE_ID')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'aeb06aff-c94a-469e-8305-29b14efdb445', N'USER_ROLE_ID')
GO
INSERT [dbo].[AspNetUsers] ([Id], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'092fea74-7836-4ad2-9b1d-2a8e0f336357', CAST(N'2024-10-24T03:31:14.4901150' AS DateTime2), N'user2', N'USER2', N'user2@example.com', N'USER2@EXAMPLE.COM', 0, N'AQAAAAIAAYagAAAAEF4EvS0u3LmgdOgKDKP5j4aD7MUivJiJgo1ju0s0tvi42V2U0a8UbjHLYvpWB9Y37Q==', N'MI3V5VPLE62FP5TYDKYS5V2IJNOV25DX', N'5e3af9be-2a2e-49eb-bb29-849c57bd1f4c', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1eb7e869-6647-4ead-b6b1-1ed471484c71', CAST(N'2024-10-23T08:19:28.7599226' AS DateTime2), N'RayanPokharel', N'RAYANPOKHAREL', N'user@example.com', N'USER@EXAMPLE.COM', 0, N'AQAAAAIAAYagAAAAEITaxMaBIphBitNBUj0NVPkOr/ZBeyQnEYiGdA+hmNKfylF0DrlGQXolVxy7vZGKdg==', N'JU6CCSQBEQ6M7HVBOFGVJ43QYBZWYP33', N'4e94fe8d-2408-4b74-b6ba-d09ee383acb9', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'27960811-0180-42cc-9a10-7377c679e58a', CAST(N'2024-10-31T08:13:08.2540987' AS DateTime2), N'string9', N'STRING9', N'user10@example.com', N'USER10@EXAMPLE.COM', 0, N'AQAAAAIAAYagAAAAEM/ssup5giIAjWI6pe5rm++mEMUlrhzXmf5ZYjGhKuzfR7WhU7500+oIWPge+fHPJQ==', N'5AER3ALBOGKKU5EXVB2KABU3U4TU3HOQ', N'539b96e8-8b28-4dfd-a104-59a4d6799e54', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'416fc2de-7fcb-4148-880b-8db942f881eb', CAST(N'2024-10-31T08:12:36.1181231' AS DateTime2), N'string5', N'STRING5', N'user6@example.com', N'USER6@EXAMPLE.COM', 0, N'AQAAAAIAAYagAAAAECrNJjhdP7s4wzL/uizaw9SIfVcHvmflJ4JqwBZ55ae03DHWjvKeU0XU6ba+sfZafw==', N'J3UCZG3VUJVYS3GDVEPWRGV6SUJEHILW', N'8c60e140-b71f-49c3-9f57-02ddba9f05d1', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'56c1a61d-8389-477b-81e8-75464a45ed2e', CAST(N'2024-10-24T04:23:16.8125995' AS DateTime2), N'string2', N'STRING2', N'user3@example.com', N'USER3@EXAMPLE.COM', 0, N'AQAAAAIAAYagAAAAEDN6sykcVO+lK3yY+4sn0de2cQ8+9Te2cHKDL8YrB0/bNE3YglWjXBEdoLZTL+jvlA==', N'DHUXWMX7HSGQ6ZPEXWNYHMPAVMXN2DMW', N'e2095ea9-ebef-4664-9ca2-b96371f8bbce', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'admin@example.com', N'ADMIN@EXAMPLE.COM', N'admin@example.com', N'ADMIN@EXAMPLE.COM', 1, N'AQAAAAIAAYagAAAAEFsOvzdswxOoPg9BR71VNm5hq669aM5N7e8tMtbD8VWbvP18gTHlPd0UOeWdWC4XxA==', N'DGNKL64C54Z5ECUPH4EMJR3Y43I4VYFS', N'79db7bf3-e472-42bd-b1f5-cfdc407c317a', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8299ac07-d23c-4176-a8b2-fab4f9fb9a6e', CAST(N'2024-10-31T08:09:01.8497974' AS DateTime2), N'usertest4', N'USERTEST4', N'usertest4@email.com', N'USERTEST4@EMAIL.COM', 0, N'AQAAAAIAAYagAAAAEJFUXxmAMcvIRR+JxmKz5doWzVIJAgCiqaTAWtTyCWElb7WtNwwHjsSrejOT2Y5GuA==', N'O2GETU65U6RJ7N3IMHDIGFJXFAC2IFXK', N'690e41fb-be40-4d6d-bcd5-760a0276ca1e', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'9b4823c6-a09d-473d-b58c-83431c3c4020', CAST(N'2024-10-31T08:11:08.0712544' AS DateTime2), N'usertest', N'USERTEST', N'usertest4@example.com', N'USERTEST4@EXAMPLE.COM', 0, N'AQAAAAIAAYagAAAAEDJkV/4AORp3J8Bp39kW28qc8kojfjzaIGwpscXogrB6OPAvYtw5P7zMMMPCgnNjVQ==', N'A5O4HKYE75UHNYC5RNRMRLVCLILLSFUZ', N'3f78db79-03b4-4395-91dc-3a28bd49e6bf', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [CreatedAt], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'aeb06aff-c94a-469e-8305-29b14efdb445', CAST(N'2024-10-24T04:23:51.9505973' AS DateTime2), N'string6', N'STRING6', N'user5@example.com', N'USER5@EXAMPLE.COM', 0, N'AQAAAAIAAYagAAAAEJpEt6AZm9nXfpQAsDI57eT1BintYFEy1JLET66WaLQfgJkLKQo24Rf2gaqQjtmDbw==', N'YAVI56UYO62N5VEA4HRGFCBNY2H5C62I', N'60686e31-44eb-4fee-8009-ae15ea33673d', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e93d191e-1f2e-43be-4e70-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e93d191e-1f2e-43be-4e70-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e93d191e-1f2e-43be-4e70-08dcf4ddd1e6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5ef2444f-3eac-4231-4e71-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5ef2444f-3eac-4231-4e71-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'94666746-de8b-404f-4e72-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'94666746-de8b-404f-4e72-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1aa6ae28-6148-4b57-4e73-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1aa6ae28-6148-4b57-4e73-08dcf4ddd1e6', N'643f9871-c21f-4095-a2e7-648f71fb3ed5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5cbab341-d8d0-4f42-4e74-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5cbab341-d8d0-4f42-4e74-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'40dad93c-63f1-474d-4e76-08dcf4ddd1e6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'40dad93c-63f1-474d-4e76-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'40dad93c-63f1-474d-4e76-08dcf4ddd1e6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5af2bb02-84b6-4f58-4e78-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5af2bb02-84b6-4f58-4e78-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5af2bb02-84b6-4f58-4e78-08dcf4ddd1e6', N'643f9871-c21f-4095-a2e7-648f71fb3ed5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'32941e49-8dcf-4a74-4e79-08dcf4ddd1e6', N'bcb94fe1-d4b0-4a7e-a88d-4320a31d8dd5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'32941e49-8dcf-4a74-4e79-08dcf4ddd1e6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'32941e49-8dcf-4a74-4e79-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'663727b2-1bdc-4f30-4e7a-08dcf4ddd1e6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'663727b2-1bdc-4f30-4e7a-08dcf4ddd1e6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'663727b2-1bdc-4f30-4e7a-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1bc2b9f5-560d-4ae9-4e7b-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1bc2b9f5-560d-4ae9-4e7b-08dcf4ddd1e6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1bc2b9f5-560d-4ae9-4e7b-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'10fd564f-18f9-4dcc-4e7c-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'10fd564f-18f9-4dcc-4e7c-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'b87866e5-5988-4ac7-4e7d-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'60dfe00f-a54c-44d7-4e7e-08dcf4ddd1e6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'60dfe00f-a54c-44d7-4e7e-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'46830de8-bcdb-4b5f-4e7f-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'987cc9b4-b6fb-4740-4e80-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'987cc9b4-b6fb-4740-4e80-08dcf4ddd1e6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'987cc9b4-b6fb-4740-4e80-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c8be4ec4-bbaa-4d3f-4e81-08dcf4ddd1e6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c8be4ec4-bbaa-4d3f-4e81-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'890704b0-f7a5-4e00-4e82-08dcf4ddd1e6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'890704b0-f7a5-4e00-4e82-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5aa6c15c-ad83-47ca-4e83-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'dca7cb9c-dca9-401f-4e84-08dcf4ddd1e6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'dca7cb9c-dca9-401f-4e84-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'7f096662-a5e9-4855-4e85-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'7f096662-a5e9-4855-4e85-08dcf4ddd1e6', N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'beffea2e-5f82-4315-4e86-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'47bebca5-2488-48f9-4e87-08dcf4ddd1e6', N'bcb94fe1-d4b0-4a7e-a88d-4320a31d8dd5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e5947b27-8c86-4fb3-4e88-08dcf4ddd1e6', N'643f9871-c21f-4095-a2e7-648f71fb3ed5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'b59f5097-a55f-4646-4e89-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'9fdf0976-ba3b-4f32-4e8a-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'9fdf0976-ba3b-4f32-4e8a-08dcf4ddd1e6', N'643f9871-c21f-4095-a2e7-648f71fb3ed5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'da6f7405-22ba-4bce-4e8b-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'9de49fae-00b0-41ea-4e8c-08dcf4ddd1e6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'9de49fae-00b0-41ea-4e8c-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'9de49fae-00b0-41ea-4e8c-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c16aa30d-44a0-4552-4e8d-08dcf4ddd1e6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'3ebd3df0-9e8a-4175-4e8e-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'3ebd3df0-9e8a-4175-4e8e-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'3ebd3df0-9e8a-4175-4e8e-08dcf4ddd1e6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'3ebd3df0-9e8a-4175-4e8e-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'2c2a78ef-d154-4e06-4e8f-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5350f33c-5017-440b-4e90-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c3820f25-6884-4abc-4e91-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5475cc3f-8baf-4c22-4e92-08dcf4ddd1e6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5475cc3f-8baf-4c22-4e92-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5475cc3f-8baf-4c22-4e92-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'caf4f6fb-abf0-4d12-4e93-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'caf4f6fb-abf0-4d12-4e93-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'dede3ff9-021b-4741-4e94-08dcf4ddd1e6', N'643f9871-c21f-4095-a2e7-648f71fb3ed5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'963fb7eb-be5c-4a05-4e95-08dcf4ddd1e6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'357da772-1471-4076-4e96-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'bb41aac1-2c47-439b-4e97-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c0d96f6c-b067-40db-4e98-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a6480ad9-9ed4-4d8d-4e99-08dcf4ddd1e6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'64e55d4a-064f-4f4b-4e9a-08dcf4ddd1e6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5fb3777d-3106-4536-4e9b-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'85e6f76b-6264-456a-4e9c-08dcf4ddd1e6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'85e6f76b-6264-456a-4e9c-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'85e6f76b-6264-456a-4e9c-08dcf4ddd1e6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'3918837d-cb9f-40bb-4e9d-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'3918837d-cb9f-40bb-4e9d-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'2da9955b-5a7d-431f-4e9e-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'd57c8e28-816a-42b0-4e9f-08dcf4ddd1e6', N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a4cf2d78-3faf-4cc8-4ea0-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'250aec51-23ba-4537-4ea1-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'0b674353-63b1-4940-4ea2-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1a57ce17-4ae5-4851-4ea3-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e0e48490-f60c-4784-4ea4-08dcf4ddd1e6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e0e48490-f60c-4784-4ea4-08dcf4ddd1e6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e0e48490-f60c-4784-4ea4-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'75f8c7df-5e02-4b44-4ea5-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'75f8c7df-5e02-4b44-4ea5-08dcf4ddd1e6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'9d0f1f04-ee69-492e-4ea6-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'9d0f1f04-ee69-492e-4ea6-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'9d0f1f04-ee69-492e-4ea6-08dcf4ddd1e6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'cabfbd57-ca56-4619-4ea7-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'cabfbd57-ca56-4619-4ea7-08dcf4ddd1e6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'3896208d-310c-4dca-4ea8-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'3896208d-310c-4dca-4ea8-08dcf4ddd1e6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1ecfc5f6-8299-4ff5-4ea9-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'fadd6ab2-0dc5-49e9-4eaa-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
GO
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'fadd6ab2-0dc5-49e9-4eaa-08dcf4ddd1e6', N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e7a658fd-99e4-44e3-4eab-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'dc226c81-751b-4b0b-4eac-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'40966119-7bd8-4b57-4ead-08dcf4ddd1e6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'80a5203d-be08-4ec6-4eae-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'80a5203d-be08-4ec6-4eae-08dcf4ddd1e6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'0b564b13-8c81-4533-4eaf-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'0b564b13-8c81-4533-4eaf-08dcf4ddd1e6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'0b564b13-8c81-4533-4eaf-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'7dd5a769-26c5-4222-4eb0-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'4f4f3f6a-a4a0-4a51-4eb1-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'4f4f3f6a-a4a0-4a51-4eb1-08dcf4ddd1e6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c6a7d6f2-a500-40d4-4eb2-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c6a7d6f2-a500-40d4-4eb2-08dcf4ddd1e6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c6a7d6f2-a500-40d4-4eb2-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a15e08ce-0edb-458b-4eb3-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'8857e269-f810-4f1b-4eb4-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'd9d7da3f-16cc-4930-4eb5-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'd9d7da3f-16cc-4930-4eb5-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'b7a5e1d7-5b14-434b-4eb6-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'2dc97fa6-905a-4e82-4eb7-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'faf989a5-b3b3-49ba-4eb8-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'035324db-52c9-4a09-4eb9-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'dedac694-3db3-488e-4eba-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'dedac694-3db3-488e-4eba-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a5491fe0-774e-4b3f-4ebb-08dcf4ddd1e6', N'643f9871-c21f-4095-a2e7-648f71fb3ed5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'28bbe04a-bfa9-49e7-4ebc-08dcf4ddd1e6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'8ec71b8d-166e-4b0c-4ebd-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1316dab9-fe0b-457b-4ebe-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1326ddd4-5e53-440e-4ebf-08dcf4ddd1e6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e20e232d-effe-4d51-4ec0-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'6a8bc8bf-4161-48c8-4ec1-08dcf4ddd1e6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'6a8bc8bf-4161-48c8-4ec1-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1fe159e6-ea37-4d75-4ec2-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'b71a043e-53e3-47c6-4ec3-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'b71a043e-53e3-47c6-4ec3-08dcf4ddd1e6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'95cb2b2c-4e69-4540-4ec4-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'95cb2b2c-4e69-4540-4ec4-08dcf4ddd1e6', N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'd3c52bbe-94d9-49e0-4ec5-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'd3c52bbe-94d9-49e0-4ec5-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'3d564e83-7d0e-4945-4ec6-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'3d564e83-7d0e-4945-4ec6-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'3d564e83-7d0e-4945-4ec6-08dcf4ddd1e6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'd7e79161-8196-43e3-4ec7-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'd7e79161-8196-43e3-4ec7-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'd7e79161-8196-43e3-4ec7-08dcf4ddd1e6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'8f4843cb-b5bf-4358-4ec8-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'765dfbc8-fabd-487c-4ec9-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'765dfbc8-fabd-487c-4ec9-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'44cf5edb-040a-4820-4eca-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'016cdcb2-f3dc-40b1-4ecb-08dcf4ddd1e6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'016cdcb2-f3dc-40b1-4ecb-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'016cdcb2-f3dc-40b1-4ecb-08dcf4ddd1e6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'67e36462-0671-4f61-4ecc-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c295dd30-1f1b-4c44-4ece-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a052485c-625d-433e-4ecf-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a052485c-625d-433e-4ecf-08dcf4ddd1e6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a052485c-625d-433e-4ecf-08dcf4ddd1e6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'fc0dbec1-7cd8-4f30-4ed0-08dcf4ddd1e6', N'643f9871-c21f-4095-a2e7-648f71fb3ed5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ef0a3036-18c0-42d3-4ed1-08dcf4ddd1e6', N'643f9871-c21f-4095-a2e7-648f71fb3ed5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'009c8b4f-b157-49b7-4ed2-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'0914fafe-943a-434a-4ed3-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'b5b2a5f9-7f82-4cd8-4ed4-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c94fd4b0-d518-403c-4ed5-08dcf4ddd1e6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c94fd4b0-d518-403c-4ed5-08dcf4ddd1e6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'81e92faf-e89a-40bd-4ed6-08dcf4ddd1e6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'4f182074-de42-43b7-4ed7-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a481311f-271e-4644-4ed8-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a481311f-271e-4644-4ed8-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'8521a818-2b4f-4b53-4ed9-08dcf4ddd1e6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'82518c07-3b42-4b74-4eda-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'82518c07-3b42-4b74-4eda-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'61e7f86d-2a43-420d-4edb-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'61e7f86d-2a43-420d-4edb-08dcf4ddd1e6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'61e7f86d-2a43-420d-4edb-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'0f8442e9-2e92-4396-4edc-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ebd1c755-5bf3-4548-4edd-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'17fafc65-8aa1-4bdb-4ede-08dcf4ddd1e6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e6422b03-bc3b-464f-4edf-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'f7cdb538-da84-4f80-4ee0-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'f7cdb538-da84-4f80-4ee0-08dcf4ddd1e6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ac798211-c70a-4dd3-4ee1-08dcf4ddd1e6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'82dc78c0-10f9-42d9-4ee2-08dcf4ddd1e6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'82dc78c0-10f9-42d9-4ee2-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'392b5f7e-f2d7-4e08-4ee3-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'69b92f52-eff1-4fc5-4ee4-08dcf4ddd1e6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ad989eab-c347-4fe5-4ee5-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'2b0c86f3-80ec-453a-4ee6-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'7c8d8942-9f0c-43d8-4ee7-08dcf4ddd1e6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'd6d43ae1-b4e3-4859-4ee8-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'50b806e4-1d44-4d7f-4ee9-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'93a5b9d0-558c-4851-4eea-08dcf4ddd1e6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'93a5b9d0-558c-4851-4eea-08dcf4ddd1e6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'93a5b9d0-558c-4851-4eea-08dcf4ddd1e6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'990cb817-7f46-424f-4eeb-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e4a0b975-80ed-48bb-4eec-08dcf4ddd1e6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'7dd90fcb-1271-42bc-4eed-08dcf4ddd1e6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'0b49cc3d-ae3d-4d10-4eee-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'46bf0d0b-ac88-4563-4eef-08dcf4ddd1e6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'3d568fdc-88f4-45b2-4ef0-08dcf4ddd1e6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
GO
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'd4606bc0-89b5-4287-4ef1-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a623101d-5470-4cac-4ef2-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'48635182-6075-4d85-4ef3-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a2a6777e-ea4a-420e-4ef4-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'95c915e2-d8bb-4b2b-4ef5-08dcf4ddd1e6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e853e055-a56f-41ec-4ef6-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e853e055-a56f-41ec-4ef6-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e853e055-a56f-41ec-4ef6-08dcf4ddd1e6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'6962a06f-bcfd-420a-4ef7-08dcf4ddd1e6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'6962a06f-bcfd-420a-4ef7-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e00df3fe-4a58-4ede-4ef8-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'50927c5e-53b7-42ca-4ef9-08dcf4ddd1e6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'96c56463-8dc6-4162-4efa-08dcf4ddd1e6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'96c56463-8dc6-4162-4efa-08dcf4ddd1e6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'fe2bc0d6-14dd-4416-4efb-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'79897831-1849-433a-4efc-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'56cf6fb9-1005-4da5-4efd-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'91a88821-84d7-45c8-4efe-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'7732740b-5dae-43f4-4eff-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'405a64e1-92b4-4751-4f00-08dcf4ddd1e6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'405a64e1-92b4-4751-4f00-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'405a64e1-92b4-4751-4f00-08dcf4ddd1e6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'43bc65e2-d47f-4086-4f01-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c328281d-beca-4e20-4f02-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'46ddeb47-ba25-472d-4f03-08dcf4ddd1e6', N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'b3d160a1-cfd4-4bf0-4f04-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'd3bad0a2-1bbb-488f-4f05-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'd3bad0a2-1bbb-488f-4f05-08dcf4ddd1e6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'3558be6a-200b-45bd-4f06-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'65ccf722-658a-415f-4f07-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'65ccf722-658a-415f-4f07-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ac7e0394-f612-4c1c-4f08-08dcf4ddd1e6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e372960b-5da7-4a35-4f09-08dcf4ddd1e6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'658bdf02-5c21-4d59-4f0a-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'9c705bbc-4f8f-4d30-4f0b-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1e8b2dac-946c-4605-4f0c-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'8651000b-1c92-4d01-4f0d-08dcf4ddd1e6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'0c19c8fb-94f2-431a-4f0e-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'bef510d8-3b0c-4f32-4f0f-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'13af999f-b651-43fd-4f10-08dcf4ddd1e6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'13af999f-b651-43fd-4f10-08dcf4ddd1e6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'201bf123-8090-4b4e-4f13-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e339e028-f6c6-41a9-4f14-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'8d5f8e89-cd4e-4b1b-4f15-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'4111ebfb-3a18-4374-4f16-08dcf4ddd1e6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1f8fc8fc-f134-4d94-4f17-08dcf4ddd1e6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a0099527-2dbc-45d3-4f18-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'7f9f99b9-5bbd-4a80-4f19-08dcf4ddd1e6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'30128762-8192-4201-4f1a-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e5edd252-fbf0-4e43-4f1b-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ae24be7b-877b-4995-4f1c-08dcf4ddd1e6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'0fcf6bde-4e3b-487f-4f1d-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'71237263-b1f8-4e7a-4f1e-08dcf4ddd1e6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'46a5d3f3-63bc-48bd-4f1f-08dcf4ddd1e6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'46a5d3f3-63bc-48bd-4f1f-08dcf4ddd1e6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'581822ff-5605-453d-4f20-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'86e76f89-c44c-438a-4f23-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'bae36ef0-db45-4cc6-4f25-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'bae36ef0-db45-4cc6-4f25-08dcf4ddd1e6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1187a60e-735b-4fb3-4f26-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'cba2dbf1-5f29-4788-4f27-08dcf4ddd1e6', N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'cba2dbf1-5f29-4788-4f27-08dcf4ddd1e6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'2afd2043-a9f8-4896-4f28-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'74799dc2-c430-4de9-4f29-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'f65acf6f-e7f8-4db5-4f2a-08dcf4ddd1e6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ce05313a-901f-4ccd-4f2b-08dcf4ddd1e6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'8181602c-ca0f-4cec-4f2c-08dcf4ddd1e6', N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'7d19d8b8-010c-4a22-4f2d-08dcf4ddd1e6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'614d444a-f940-46c9-4f2e-08dcf4ddd1e6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'614d444a-f940-46c9-4f2e-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'614d444a-f940-46c9-4f2e-08dcf4ddd1e6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1b1a3085-f377-44b6-4f2f-08dcf4ddd1e6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ca238575-2b40-46c7-4f30-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'0eeb6085-3562-4985-4f31-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e71acd7e-205f-430f-4f32-08dcf4ddd1e6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a5d174bf-2475-40ae-4f33-08dcf4ddd1e6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ff443153-83e1-481e-4f34-08dcf4ddd1e6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'07a4e254-d877-47ed-4f35-08dcf4ddd1e6', N'bcb94fe1-d4b0-4a7e-a88d-4320a31d8dd5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e5e991b4-694b-46d0-4f36-08dcf4ddd1e6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'0a73dfec-37c3-4fa0-4f37-08dcf4ddd1e6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'6adc9f8e-1298-4e56-a620-08dcf583c9b6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'6adc9f8e-1298-4e56-a620-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'b3391a46-62a7-48d9-a621-08dcf583c9b6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'4d8d83bd-f365-4a74-a622-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'78cae929-7c90-487f-a623-08dcf583c9b6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'78cae929-7c90-487f-a623-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'd889e1d5-fa74-400d-a624-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'd889e1d5-fa74-400d-a624-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'64668f58-1d51-4ae4-a625-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c40db19a-965b-4ea0-a626-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'd99dd97f-f0a3-40d5-a627-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'10070c36-f169-4960-a628-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'10070c36-f169-4960-a628-08dcf583c9b6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'46dd67ef-df2f-422f-a629-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'435e87e3-30f3-4a9e-a62a-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ae060e41-bbe6-4528-a62b-08dcf583c9b6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'02772094-0337-42e8-a62c-08dcf583c9b6', N'bcb94fe1-d4b0-4a7e-a88d-4320a31d8dd5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c331aead-004b-42bd-a62d-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ee1c7472-d110-40b3-a62e-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'be390d4b-b5f1-4926-a62f-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
GO
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'9bf66d27-c6bf-4236-a630-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'3739ba37-bcea-40a1-a631-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ffaafd98-c04d-4723-a632-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'be3b9dde-158c-43ef-a633-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1e4c6e3f-bae2-4470-a634-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'9166ad52-3439-4fe3-a635-08dcf583c9b6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'9166ad52-3439-4fe3-a635-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'f74c1f48-da40-4e39-a636-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'f74c1f48-da40-4e39-a636-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e1707c2d-fba8-414c-a637-08dcf583c9b6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'81b2c8e3-3603-4ea6-a638-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'0d84ea08-a4fb-46e4-a639-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'6733c5e6-acf0-4d60-a63a-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a7b2e5fc-6b64-4ea0-a63b-08dcf583c9b6', N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'fa7b4ecc-5451-4939-a63c-08dcf583c9b6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'fa7b4ecc-5451-4939-a63c-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'76133152-acc8-4990-a63d-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'76133152-acc8-4990-a63d-08dcf583c9b6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'8cc9c70a-401a-4066-a63e-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'028f122d-8ae5-41c5-a63f-08dcf583c9b6', N'bcb94fe1-d4b0-4a7e-a88d-4320a31d8dd5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'73fbce47-d24f-4d84-a640-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'85363635-9626-486c-a641-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'85363635-9626-486c-a641-08dcf583c9b6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'7de5a584-8fb1-4c7e-a642-08dcf583c9b6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'116416a6-53d1-44ce-a643-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'b915eca0-9238-4bf2-a644-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'630c6a00-3739-4acc-a645-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'714cd33e-12ed-441b-a646-08dcf583c9b6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ed3e6828-680a-4c47-a647-08dcf583c9b6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'eec39e34-4a5b-49fc-a648-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'62419e69-05c9-416b-a649-08dcf583c9b6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'7bd3b174-4bd3-42f0-a64a-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'87265711-1850-49d3-a64b-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c71d7a40-aa3f-4824-a64c-08dcf583c9b6', N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'bbbcf38f-d1fb-4661-a64d-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'806823a8-167a-44ba-a64e-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'caa63300-21b1-4722-a64f-08dcf583c9b6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'8b33a9ff-72ac-4ae6-a650-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'07a9a2f9-6abf-4e4c-a651-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'323a8e7d-0432-4f5e-a652-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'4c152df9-4751-4888-a653-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a47dd25b-a909-4124-a654-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'17cf13b8-0614-4f26-a655-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'64336b86-2000-43e2-a656-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'31299371-e2a9-4fda-a657-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'817afae9-0b65-4335-a658-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'817afae9-0b65-4335-a658-08dcf583c9b6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e632606e-2f2c-4bf6-a659-08dcf583c9b6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'17d2b7a7-7ffa-4bac-a65a-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'b9e928c9-bc11-4b22-a65b-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'0a1e4e2a-aa76-4f49-a65c-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'44c306f2-9980-4b6d-a65d-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'82186dd2-bf23-4299-a65e-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'376250d1-94d4-43b2-a660-08dcf583c9b6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'53408955-0306-4007-a661-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'd7563683-e543-44cf-a662-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'b77ea4db-b99c-46c9-a663-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'66233f2d-eba2-466f-a664-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'9eee16c0-1490-4324-a665-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'464e15ee-b842-4a7d-a666-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'92233c7c-2f08-403c-a667-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5d3e570c-82b4-47be-a668-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'79dce6de-7cd8-49c6-a669-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'2891437a-9d49-4c7c-a66a-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'02afaf59-5d15-40ac-a66b-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'831a51b5-b47e-43bd-a66c-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'7423a1bd-ca5b-4841-a66d-08dcf583c9b6', N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5c4b0733-9b89-4cc9-a66e-08dcf583c9b6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'fc62dac3-2fd2-4df7-a66f-08dcf583c9b6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'3813c390-aeba-4935-a670-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'01969c76-b828-41fb-a671-08dcf583c9b6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'01969c76-b828-41fb-a671-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e7db234c-0ecc-48ea-a672-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'36f9d634-caf9-4dd0-a673-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'36f9d634-caf9-4dd0-a673-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'875940a8-2817-42be-a674-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'382a2821-2ce2-4e47-a675-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'31ef1baf-8ce6-41a5-a676-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'31ef1baf-8ce6-41a5-a676-08dcf583c9b6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5ec82680-aff0-4cba-a677-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'db23501b-6eea-4656-a678-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'3f4478ab-4250-4f86-a679-08dcf583c9b6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'9d2354f1-12e1-4d41-a67a-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'8ade0b0f-581f-4391-a67b-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ffe86a1a-5b0f-4834-a67c-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'6f04348b-65f2-4953-a67d-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e9f1f2d5-424d-44b8-a67e-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'17111ccd-358d-43a6-a67f-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'f0b98eb7-bead-49b7-a680-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'17acd8e6-e564-4142-a681-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'dceb63c4-aeb1-495c-a682-08dcf583c9b6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'2d05660a-b129-4896-a683-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a06f3297-aca1-4df5-a684-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c5ae1f2e-666a-4a5c-a685-08dcf583c9b6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'929cc0dd-ba33-4575-a686-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'929cc0dd-ba33-4575-a686-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'48ea8234-efb6-4348-a687-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'87046f88-b65f-4b65-a688-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ce969ea8-e7df-4803-a689-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ce969ea8-e7df-4803-a689-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
GO
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'32123a80-b11e-47fe-a68a-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'62acbaa6-3866-4d37-a68b-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'6519e25a-7460-4d04-a68c-08dcf583c9b6', N'bcb94fe1-d4b0-4a7e-a88d-4320a31d8dd5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'6da65e5f-491b-4348-a68d-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a5e4bcd6-7828-45ec-a68e-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1291f9aa-7945-4a36-a68f-08dcf583c9b6', N'd23564cc-1bbd-451f-bdc6-3474413f865b')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'2b183f6f-a20d-42c2-a690-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'72af6f66-4a43-4a95-a691-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'317ea1cb-b163-46ad-a692-08dcf583c9b6', N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'39d464ae-21e9-4a52-a693-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'deeba544-1388-4096-a694-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'17c48a1b-6dda-462e-a695-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'719ad278-0115-470c-a696-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'aaa81d5a-02e2-4167-a697-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'aaa81d5a-02e2-4167-a697-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'9e2bb7d5-c613-4b25-a698-08dcf583c9b6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e6d70d84-ba87-485e-a699-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'd20f8be0-4441-4a3f-a69a-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1a01c8f2-8072-498b-a69b-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a53a0a2a-e22d-4770-a69c-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a53a0a2a-e22d-4770-a69c-08dcf583c9b6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'0fdd7a15-a862-4992-a69d-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5e36302f-6fa6-4827-a69e-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'29fcd33b-b181-4efb-a69f-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'94ea7ac1-43ab-4c95-a6a0-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5dfc9b97-ad2f-4d5c-a6a1-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'06a16756-f58f-4e31-a6a2-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'2fd2ffc8-f954-4f65-a6a3-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'89baaa16-a1e8-4ed1-a6a4-08dcf583c9b6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e85ef5d4-e599-43cf-a6a5-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'402cf04f-babe-4bad-a6a6-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'35d2d1b3-4661-4a7c-a6a7-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'0a2fe425-66d1-4cff-a6a8-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'cb843018-7336-468a-a6a9-08dcf583c9b6', N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c29262d5-41e9-477f-a6aa-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'6f971bb8-17fa-4d97-a6ab-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e9386b9f-e03c-4119-a6ac-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e9386b9f-e03c-4119-a6ac-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ae6e72e3-95fa-4a6f-a6ad-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'4b42c69c-48bd-4770-a6ae-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a0c7cf49-ee98-47c4-a6af-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a2f939dd-15b8-478d-a6b0-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'8442fc1e-7e9f-4ede-a6b1-08dcf583c9b6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'7cfb9b26-7ff3-4eae-a6b2-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'df5741b3-a8fd-402c-a6b3-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'f3265d22-c114-4b8d-a6b4-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'd2992f0a-1e78-4899-a6b5-08dcf583c9b6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'dd90795d-f86f-4f4d-a6b6-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'fe70acec-7cc3-4f60-a6b7-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'828d16eb-fa84-486a-a6b8-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'35e880ef-94ee-4ac3-a6b9-08dcf583c9b6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1b839685-5d6b-442e-a6ba-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'42416b28-f05d-4f9c-a6bb-08dcf583c9b6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'dbd63c55-3cd6-4d12-a6bc-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'cf3b8b3e-0060-4c6f-a6bd-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'2ec71667-3da1-44b3-a6be-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'12613ade-901b-454f-a6bf-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'12613ade-901b-454f-a6bf-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'6fcee73d-aaef-414d-a6c0-08dcf583c9b6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c5329a0f-cdb8-4c23-a6c1-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'fd1ca344-abf4-4a64-a6c2-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'4c471e98-6044-48b3-a6c3-08dcf583c9b6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'bfaa42bb-c767-4022-a6c4-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a50ac001-dace-41b3-a6c5-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'575a581d-e722-4d82-a6c6-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'9136dcc5-031e-43c2-a6c7-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'6d8b260b-f331-4be7-a6c8-08dcf583c9b6', N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'37837daa-6b9d-4201-a6c9-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1933ed78-a24a-4270-a6ca-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a94e724f-bfce-44a2-a6cb-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'd83566dd-c10a-4f86-a6cc-08dcf583c9b6', N'bcb94fe1-d4b0-4a7e-a88d-4320a31d8dd5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c3c6fd5b-2eda-4096-a6cd-08dcf583c9b6', N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a811d4cc-565d-4ac8-a6ce-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a493ffe8-0a0a-4436-a6cf-08dcf583c9b6', N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'67aec0bd-1c24-4722-a6d0-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'f8ee2b86-4310-4918-a6d1-08dcf583c9b6', N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a546a2f2-6655-4e00-a6d2-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'bec49637-24c6-476c-a6d3-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'cd2e9db3-9edf-41e6-a6d4-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'89e55198-f124-44c8-a6d5-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'be8babe9-a14c-42b9-a6d6-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'744442b4-d3f0-4f12-a6d7-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'0c6b7d47-62e0-4ea9-a6d8-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'd51fe91e-2edb-4ce6-a6d9-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'17ff5132-6af3-44a6-a6da-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'f164601f-38a4-4292-a6db-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'881028e9-a94f-4253-a6dc-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'38683830-cedd-4fa6-a6dd-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'294a8fb3-f8de-4ae9-a6de-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'3f50a994-84c5-40e1-a6df-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'62c49110-1b42-404e-a6e0-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'f2d3369b-b767-4ef7-a6e1-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'8f519c3f-571a-49f6-a6e2-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'33d01de9-df3e-41c6-a6e3-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'0f5ac57e-e955-4712-a6e4-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'eb751d0b-343f-4b13-a6e5-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'87e78e25-06b5-4ade-a6e6-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'aa45df16-2742-4219-a6e7-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'2644dc20-393b-4924-a6e8-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e0a239b3-6e64-4e3a-a6e9-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
GO
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'456ca525-eb37-465f-a6ea-08dcf583c9b6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'912bb12f-bfc0-4b54-a6ec-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'dd6b14b3-655d-4eac-a6ed-08dcf583c9b6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'8bc453f8-2224-4dd5-a6ee-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'8bc453f8-2224-4dd5-a6ee-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ac762833-d1e8-468f-a6ef-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ac762833-d1e8-468f-a6ef-08dcf583c9b6', N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'091a360e-ded9-4e95-a6f0-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ad291430-57f9-4052-a6f1-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'bb7bd5a1-aa9f-45bc-a6f2-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'fcbcd6b5-35ac-4380-a6f3-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'bd772c0d-8237-487a-a6f4-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'dfde2a16-7c3c-4975-a6f5-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'72f28849-c5ee-45d2-a6f6-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'b13a3f3e-7cdf-445c-a6f7-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'3c88aa07-19fa-4eeb-a6f8-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'efb85a02-f21b-4980-a6f9-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'f0e0c76b-5747-4b8b-a6fa-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'87321272-2597-49ea-a6fc-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'71401609-2e1c-466e-a6fd-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'41f407fe-c317-4045-a6fe-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'cdfa2b4c-3416-47e3-a6ff-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c0117cba-6c5b-4980-a700-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'fa3d25d2-e380-4208-a701-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'3f6bea82-d705-4f25-a702-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'125f647e-0b41-4773-a703-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c7751b95-d004-41ff-a704-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'6ce13f84-221e-49ef-a705-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'f51b8046-1d38-4667-a706-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'7cb1c3cd-51d1-4247-a707-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'6714d7a9-a6a3-45b8-a708-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'089053ca-4f74-43b0-a709-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'f29ccdaa-db30-4f32-a70a-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'34d18590-254d-42d2-a70b-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'8b33dbcd-1337-4ab2-a70c-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c8f930b9-8572-413c-a70d-08dcf583c9b6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'7f9d6533-bd5f-41f0-a70e-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ddb859d2-8433-4383-a70f-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'3088e25a-ced0-4e11-a710-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'38d6b1f6-e7d1-4bf7-a711-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'299ad7f6-2433-41dc-a712-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'2242d9e9-a06d-4141-a713-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'48d0c2e5-a593-478c-a714-08dcf583c9b6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'6eed2154-f4d6-4bf1-a715-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'52dce316-66c9-40da-a716-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'b2f725eb-1a55-44c4-a717-08dcf583c9b6', N'bcb94fe1-d4b0-4a7e-a88d-4320a31d8dd5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'000463d4-e517-4222-a718-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'8f7839ba-1582-4e09-a719-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'fdce9dc8-7b8a-464d-a71a-08dcf583c9b6', N'643f9871-c21f-4095-a2e7-648f71fb3ed5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'8cec69da-a861-4ce4-a71b-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'989c250c-10d1-4ad6-a71c-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'25c38a84-a3ec-4d85-a71d-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'b4de7d58-9168-42aa-a71e-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ba8fe4f7-44c9-476c-a71f-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'31045a9a-667b-4fd9-a720-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'f7a4e7d2-5953-48ef-a721-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'f691e829-781b-4151-a722-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'da190a53-98d1-4ba3-a723-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'da190a53-98d1-4ba3-a723-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'16268661-a6cc-406f-a724-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'31ef595f-be66-4318-a725-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'd18bd9c3-5a58-49b9-a726-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a7beb8d7-6c23-4d78-a727-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'2ee525ae-c556-424c-a728-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'14941474-f0b5-4dc3-a729-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'b3ca6dcb-9335-45bf-a72a-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'3dcaf733-a942-47bc-a72b-08dcf583c9b6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'2bf99e02-cf96-4549-a72c-08dcf583c9b6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'20fd1572-dcb1-4305-a72d-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'075dca17-660f-4ea2-a72e-08dcf583c9b6', N'643f9871-c21f-4095-a2e7-648f71fb3ed5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5f093a92-46db-4485-a72f-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'427adff2-88a8-4425-a730-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'3a6c7fe6-fd44-43eb-a731-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'35460435-7f91-4a31-a732-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'55f2bd93-5660-4697-a733-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'35f89fad-aa00-42b0-a734-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'9710fd7f-945a-4f1c-a735-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'bd67ed05-4883-462f-a736-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'125b2bb5-2c80-48a8-a737-08dcf583c9b6', N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'55cef01d-92e6-428e-a738-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'17061042-e5f9-4979-a739-08dcf583c9b6', N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1b8a314e-25b9-472f-a73a-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'cad2c026-ded3-4972-a73b-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'4df2b90b-7e51-4fbf-a73c-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'8f651a97-61f5-44a3-a73d-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'282f76cd-43d2-4bc4-a73e-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'8538dda6-d2a5-4393-a73f-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5f0fe4d3-4cb7-4fc0-a740-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'22cd775f-4c2b-4b4e-a741-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'706120ce-cee7-44c5-a742-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1baff885-df3e-413c-a743-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'38dbd179-c6c0-4600-a744-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1679221d-45b2-46cd-a745-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'b3f9a495-0bd2-4bfb-a746-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'aa643f21-512b-47ab-a748-08dcf583c9b6', N'bcb94fe1-d4b0-4a7e-a88d-4320a31d8dd5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'b64aff8a-54ff-41d1-a749-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'bcbd0a96-141d-4447-a74a-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ca0f7dd6-e52f-462f-a74b-08dcf583c9b6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'830cf622-d58b-4cf9-a74c-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'0e20ee7d-0a53-4ee4-a74d-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
GO
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'4d63c0e2-7df8-4a3b-a74e-08dcf583c9b6', N'bcb94fe1-d4b0-4a7e-a88d-4320a31d8dd5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'13eeeaa2-8b64-414e-a74f-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'dd2b19ce-cbbe-4536-a750-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'71f4c2d6-42ad-42bc-a751-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'2e09f330-220e-408c-a752-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'8ce4089f-ecba-4eeb-a753-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'91646013-eef3-48d7-a754-08dcf583c9b6', N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'030baa0d-aa14-40b0-a755-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'3631d0cd-709a-4567-a756-08dcf583c9b6', N'643f9871-c21f-4095-a2e7-648f71fb3ed5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'f642a653-1bc8-4af8-a757-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'd471ae9e-3f8a-4927-a758-08dcf583c9b6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'bfc192cb-992e-4bfa-a759-08dcf583c9b6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'6eb6fd2e-781b-4b06-a75a-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'f869770e-9bc7-4b34-a75b-08dcf583c9b6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c5618914-b7b9-48d8-a75c-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'775d3b2d-5490-4303-a75d-08dcf583c9b6', N'643f9871-c21f-4095-a2e7-648f71fb3ed5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'b0a095b3-f8d6-426e-a75e-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'77849455-e3be-4467-a75f-08dcf583c9b6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ddb06f22-12be-4f09-a760-08dcf583c9b6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e496a66b-1651-462d-a761-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'bbe03a01-1a70-4628-a762-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'8cece556-1ddb-47dc-a763-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'598f243a-a87d-4b92-a764-08dcf583c9b6', N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'976d3acc-daf9-48b1-a765-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'636e8754-b55d-4d30-a766-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'7c68ddb0-c7b9-4702-a768-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5336da36-caf8-448e-a769-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a34db8fc-81fc-4d64-a76a-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e49d322e-837a-4d49-a76b-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'89444f1e-05ea-4472-a76c-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'f6b19002-cdb9-4c48-a76d-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'cdbfb114-0013-4e60-a76e-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'9270cd13-1416-48b7-a76f-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'6d9f50d0-8967-4730-a770-08dcf583c9b6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'4af8fba0-635e-423d-a771-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5aa43ac6-d669-4060-a772-08dcf583c9b6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'2eb00989-96eb-471b-a773-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'beba05b1-a26d-499a-a774-08dcf583c9b6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a5154e85-cd36-4e6e-a775-08dcf583c9b6', N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'32ef7910-84d4-4e54-a777-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'd36db8a5-0d17-4ba3-a778-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c2746362-640d-4633-a779-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'867bde3e-4e96-4f61-a77a-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'24673aba-c4fa-4932-a77b-08dcf583c9b6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'4d2ecb17-a52b-4842-a77c-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'8331b24e-1ab8-4547-a77d-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'446881b5-ea9c-4689-a77e-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'b8f850ca-42d3-405f-a77f-08dcf583c9b6', N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'b8f850ca-42d3-405f-a77f-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'0a441f93-97be-4639-a780-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5add24f1-3bae-4542-a781-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'974e8ea9-2508-4255-a782-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'80cda3b7-d3fc-4eee-a783-08dcf583c9b6', N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'13fdfc87-b03b-4853-a784-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5f08a8c8-a23d-45a5-a785-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'd9cd2b95-25f0-47f3-a786-08dcf583c9b6', N'bcb94fe1-d4b0-4a7e-a88d-4320a31d8dd5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'5518fb3e-2ca5-4237-a787-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'0680cca4-be4c-4304-a788-08dcf583c9b6', N'643f9871-c21f-4095-a2e7-648f71fb3ed5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1702b911-dfa0-4416-a789-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1259cecd-aca8-4838-a78a-08dcf583c9b6', N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'4d9ee253-1161-4c65-a78b-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'cbc2fa5d-c2c4-43dc-a78c-08dcf583c9b6', N'643f9871-c21f-4095-a2e7-648f71fb3ed5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'0a699697-72d0-42e5-a78d-08dcf583c9b6', N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'52002126-8b90-4411-a78e-08dcf583c9b6', N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'14d2fe0e-f180-4f85-a78f-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'16e6d6ee-268a-434f-a790-08dcf583c9b6', N'643f9871-c21f-4095-a2e7-648f71fb3ed5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'51cae197-f343-48b7-a791-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'64db3030-0919-49af-a792-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'54854a23-57d4-468c-a793-08dcf583c9b6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'f5278f14-cc34-4b95-a794-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'4d556732-8f13-4340-a795-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a15f92c4-5679-4f2c-a796-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'8bd1460f-5b0e-474d-a797-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'c12b22f5-f4b4-442c-a798-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'851553f4-856d-4092-a799-08dcf583c9b6', N'643f9871-c21f-4095-a2e7-648f71fb3ed5')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'82cec7f3-b65f-48d4-a79a-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'f54ebda2-804b-4e05-a79b-08dcf583c9b6', N'798ca2c6-8d53-44ec-95b6-d23f59d3f573')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'4adab5fa-c29d-496e-a79c-08dcf583c9b6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'fb88551f-5303-4e32-a79d-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'12c34a52-3984-41ba-a79f-08dcf583c9b6', N'fdd6275b-20f9-4879-b1c9-b37b502d21ab')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'1539a328-2e8e-4aa0-a7a0-08dcf583c9b6', N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'f15d7342-c3ea-48f7-a7a1-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'ca763826-4a7e-4284-a7a2-08dcf583c9b6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'033fb882-453e-4699-a7a3-08dcf583c9b6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'e7066190-16ce-4780-a7a8-08dcf583c9b6', N'f63b8585-80a1-4186-87a1-d0c0f26fcb47')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'36b07a0f-93b6-4932-a7aa-08dcf583c9b6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'693dfbc8-b45b-4c8c-a7ab-08dcf583c9b6', N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'a1a9ff1a-65c3-4ded-a7ae-08dcf583c9b6', N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818')
INSERT [dbo].[BookGenres] ([BookId], [GenreId]) VALUES (N'871834b0-cad2-4962-a7af-08dcf583c9b6', N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f')
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e93d191e-1f2e-43be-4e70-08dcf4ddd1e6', N'To Kill a Mockingbird', N'Harper Lee', CAST(N'1960-07-11T00:00:00.0000000' AS DateTime2), N'A novel about the serious issues of rape and racial inequality, narrated by a young girl named Scout Finch.', NULL, 25, CAST(N'2024-10-25T10:31:49.4022859' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'5ef2444f-3eac-4231-4e71-08dcf4ddd1e6', N'The Great Gatsby', N'F. Scott Fitzgerald', CAST(N'1925-04-10T00:00:00.0000000' AS DateTime2), N'A critique of the American Dream, following the life and times of Jay Gatsby and his obsession with the beautiful Daisy Buchanan.', NULL, 25, CAST(N'2024-10-25T10:32:22.6930715' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'94666746-de8b-404f-4e72-08dcf4ddd1e6', N'The Catcher in the Rye', N'J.D. Salinger', CAST(N'1951-07-16T00:00:00.0000000' AS DateTime2), N'A story about teenage angst and alienation, following the journey of Holden Caulfield after being expelled from prep school.', NULL, 25, CAST(N'2024-10-25T10:33:13.2845635' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'1aa6ae28-6148-4b57-4e73-08dcf4ddd1e6', N'Pride and Prejudice', N'Jane Austen', CAST(N'1813-01-28T00:00:00.0000000' AS DateTime2), N'A romantic novel that follows the life and struggles of Elizabeth Bennet as she navigates issues of class, marriage, and morality in early 19th century England.', NULL, 25, CAST(N'2024-10-25T10:34:27.4994389' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'5cbab341-d8d0-4f42-4e74-08dcf4ddd1e6', N'The Kite Runner', N'Khaled Hosseini', CAST(N'2003-05-29T00:00:00.0000000' AS DateTime2), N'The Kite Runner tells the story of Amir, a young boy from Kabul, and his complicated relationship with his friend Hassan, set against the backdrop of a changing Afghanistan.', NULL, 25, CAST(N'2024-10-25T10:36:11.6431325' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'40dad93c-63f1-474d-4e76-08dcf4ddd1e6', N'1984', N'George Orwell, Erich Fromm, Celâl Üster', CAST(N'1949-06-08T00:00:00.0000000' AS DateTime2), N'1984 is a dystopian novel that explores the dangers of totalitarianism, mass surveillance, and censorship through the experiences of Winston Smith in a society ruled by the Party.', NULL, 25, CAST(N'2024-10-25T10:37:20.1886418' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'5af2bb02-84b6-4f58-4e78-08dcf4ddd1e6', N'The Diary of a Young Girl', N'Anne Frank, Eleanor Roosevelt, B.M. Mooyaart-Doubleday', CAST(N'1947-06-25T00:00:00.0000000' AS DateTime2), N'The Diary of a Young Girl is the poignant and powerful account of Anne Frank, a Jewish girl in hiding during the Nazi occupation of the Netherlands, reflecting on her experiences and thoughts as she grows up in a confined space.', NULL, 25, CAST(N'2024-10-25T10:42:17.4829174' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'32941e49-8dcf-4a74-4e79-08dcf4ddd1e6', N'The Girl with the Dragon Tattoo (Millennium, #1)', N'Stieg Larsson, Reg Keeland', CAST(N'2005-09-16T00:00:00.0000000' AS DateTime2), N'A journalist and a hacker team up to investigate a decades-old disappearance in this gripping mystery novel.', NULL, 25, CAST(N'2024-10-25T10:43:02.0514871' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'663727b2-1bdc-4f30-4e7a-08dcf4ddd1e6', N'Catching Fire (The Hunger Games, #2)', N'Suzanne Collins', CAST(N'2009-09-01T00:00:00.0000000' AS DateTime2), N'In this second book of the Hunger Games trilogy, Katniss Everdeen must navigate new dangers and political machinations after winning the Games.', NULL, 25, CAST(N'2024-10-25T10:43:46.4195141' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'1bc2b9f5-560d-4ae9-4e7b-08dcf4ddd1e6', N'Harry Potter and the Prisoner of Azkaban (Harry Potter, #3)', N'J.K. Rowling, Mary GrandPré, Rufus Beck', CAST(N'1999-07-08T00:00:00.0000000' AS DateTime2), N'Harry Potter''s third year at Hogwarts School of Witchcraft and Wizardry is marked by the escape of Sirius Black from Azkaban and Harry''s discovery of his past.', NULL, 25, CAST(N'2024-10-25T10:45:33.7345275' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'10fd564f-18f9-4dcc-4e7c-08dcf4ddd1e6', N'The Fellowship of the Ring (The Lord of the Rings, #1)', N'J.R.R. Tolkien', CAST(N'1954-07-29T00:00:00.0000000' AS DateTime2), N'The first volume in J.R.R. Tolkien''s epic trilogy, where a young hobbit named Frodo Baggins embarks on a journey to destroy the One Ring.', NULL, 25, CAST(N'2024-10-25T10:46:13.3654398' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'b87866e5-5988-4ac7-4e7d-08dcf4ddd1e6', N'Mockingjay (The Hunger Games, #3)', N'Suzanne Collins', CAST(N'2010-08-24T00:00:00.0000000' AS DateTime2), N'In the final book of the Hunger Games trilogy, Katniss Everdeen becomes the symbol of a revolution against the oppressive Capitol.', NULL, 25, CAST(N'2024-10-25T10:46:30.9055844' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'60dfe00f-a54c-44d7-4e7e-08dcf4ddd1e6', N'Harry Potter and the Order of the Phoenix (Harry Potter, #5)', N'J.K. Rowling, Mary GrandPré', CAST(N'2003-06-21T00:00:00.0000000' AS DateTime2), N'Harry returns to Hogwarts for his fifth year, facing increased challenges from the Ministry of Magic and a new dark force.', NULL, 25, CAST(N'2024-10-25T10:46:44.4027786' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'46830de8-bcdb-4b5f-4e7f-08dcf4ddd1e6', N'The Lovely Bones', N'Alice Sebold', CAST(N'2002-01-01T00:00:00.0000000' AS DateTime2), N'The story of a young girl who watches from her personal heaven as her family and friends cope with her death.', NULL, 25, CAST(N'2024-10-25T10:47:01.9264757' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'987cc9b4-b6fb-4740-4e80-08dcf4ddd1e6', N'Harry Potter and the Chamber of Secrets (Harry Potter, #2)', N'J.K. Rowling, Mary GrandPré', CAST(N'1998-07-02T00:00:00.0000000' AS DateTime2), N'Harry returns for his second year at Hogwarts, where a series of mysterious attacks occur, leading him to uncover the secrets of the Chamber of Secrets.', NULL, 25, CAST(N'2024-10-25T10:47:25.2973210' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'c8be4ec4-bbaa-4d3f-4e81-08dcf4ddd1e6', N'Harry Potter and the Goblet of Fire (Harry Potter, #4)', N'J.K. Rowling, Mary GrandPré', CAST(N'2000-07-08T00:00:00.0000000' AS DateTime2), N'Harry competes in the Triwizard Tournament, facing formidable challenges and uncovering dark forces at work.', NULL, 25, CAST(N'2024-10-25T10:47:53.5287700' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'890704b0-f7a5-4e00-4e82-08dcf4ddd1e6', N'Harry Potter and the Deathly Hallows (Harry Potter, #7)', N'J.K. Rowling, Mary GrandPré', CAST(N'2007-07-21T00:00:00.0000000' AS DateTime2), N'In the final book of the series, Harry embarks on a quest to defeat Voldemort and find the remaining Horcruxes.', NULL, 25, CAST(N'2024-10-25T10:48:11.1817737' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'5aa6c15c-ad83-47ca-4e83-08dcf4ddd1e6', N'The Da Vinci Code (Robert Langdon, #2)', N'Dan Brown', CAST(N'2003-03-18T00:00:00.0000000' AS DateTime2), N'A gripping modern classic of the thriller genre, where symbologist Robert Langdon uncovers a conspiracy linked to the Catholic Church.', NULL, 25, CAST(N'2024-10-25T10:48:35.0321201' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'dca7cb9c-dca9-401f-4e84-08dcf4ddd1e6', N'Harry Potter and the Half-Blood Prince (Harry Potter, #6)', N'J.K. Rowling, Mary GrandPré', CAST(N'2005-07-16T00:00:00.0000000' AS DateTime2), N'Harry learns about Voldemort''s past and prepares for the impending battle between good and evil.', NULL, 25, CAST(N'2024-10-25T10:48:48.6632072' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'7f096662-a5e9-4855-4e85-08dcf4ddd1e6', N'Lord of the Flies', N'William Golding', CAST(N'1954-09-17T00:00:00.0000000' AS DateTime2), N'A group of boys stranded on a deserted island descends into savagery, exploring the darkness within humanity.', NULL, 25, CAST(N'2024-10-25T10:49:01.3226374' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'beffea2e-5f82-4315-4e86-08dcf4ddd1e6', N'Romeo and Juliet', N'William Shakespeare, Robert Jackson', CAST(N'1595-01-01T00:00:00.0000000' AS DateTime2), N'Shakespeare''s tragic tale of star-crossed lovers caught in the feud between their families.', NULL, 25, CAST(N'2024-10-25T10:49:14.1375589' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'47bebca5-2488-48f9-4e87-08dcf4ddd1e6', N'Gone Girl', N'Gillian Flynn', CAST(N'2012-06-05T00:00:00.0000000' AS DateTime2), N'A psychological thriller that explores the complexities of marriage through the disappearance of Amy Dunne.', NULL, 25, CAST(N'2024-10-25T10:49:31.8894820' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e5947b27-8c86-4fb3-4e88-08dcf4ddd1e6', N'The Help', N'Kathryn Stockett', CAST(N'2009-02-10T00:00:00.0000000' AS DateTime2), N'Set in 1960s Mississippi, this novel tells the story of African American maids who work in white households.', NULL, 25, CAST(N'2024-10-25T10:49:46.6021479' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'b59f5097-a55f-4646-4e89-08dcf4ddd1e6', N'Of Mice and Men', N'John Steinbeck', CAST(N'1937-02-06T00:00:00.0000000' AS DateTime2), N'The story of George and Lennie, two displaced migrant ranch workers who strive to make a living during the Great Depression.', NULL, 25, CAST(N'2024-10-25T10:49:59.5923710' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'9fdf0976-ba3b-4f32-4e8a-08dcf4ddd1e6', N'Memoirs of a Geisha', N'Arthur Golden', CAST(N'1997-09-30T00:00:00.0000000' AS DateTime2), N'A historical novel that follows the life of a geisha in Kyoto before and after World War II.', NULL, 25, CAST(N'2024-10-25T10:50:16.5745731' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'da6f7405-22ba-4bce-4e8b-08dcf4ddd1e6', N'The Alchemist', N'Paulo Coelho, Alan R. Clarke', CAST(N'1988-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T10:57:57.7579687' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'9de49fae-00b0-41ea-4e8c-08dcf4ddd1e6', N'The Giver (The Giver, #1)', N'Lois Lowry', CAST(N'1993-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T10:58:11.6634502' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'c16aa30d-44a0-4552-4e8d-08dcf4ddd1e6', N'The Time Traveler''s Wife', N'Audrey Niffenegger', CAST(N'2003-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T10:58:25.1884096' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'3ebd3df0-9e8a-4175-4e8e-08dcf4ddd1e6', N'A Game of Thrones (A Song of Ice and Fire, #1)', N'George R.R. Martin', CAST(N'1996-08-06T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T10:58:37.6393385' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'2c2a78ef-d154-4e06-4e8f-08dcf4ddd1e6', N'Jane Eyre', N'Charlotte Brontë, Michael Mason', CAST(N'1847-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T10:58:52.6809393' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'5350f33c-5017-440b-4e90-08dcf4ddd1e6', N'Life of Pi', N'Yann Martel', CAST(N'2001-09-11T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T10:59:16.9723329' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'c3820f25-6884-4abc-4e91-08dcf4ddd1e6', N'Water for Elephants', N'Sara Gruen', CAST(N'2006-05-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:00:06.0588122' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'5475cc3f-8baf-4c22-4e92-08dcf4ddd1e6', N'The Book Thief', N'Markus Zusak', CAST(N'2005-09-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:00:19.9247695' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'caf4f6fb-abf0-4d12-4e93-08dcf4ddd1e6', N'Fahrenheit 451', N'Ray Bradbury', CAST(N'1953-10-19T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:00:38.2141223' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'dede3ff9-021b-4741-4e94-08dcf4ddd1e6', N'City of Bones (The Mortal Instruments, #1)', N'Cassandra Clare', CAST(N'2007-03-27T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:00:52.2682531' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'963fb7eb-be5c-4a05-4e95-08dcf4ddd1e6', N'Eragon (The Inheritance Cycle, #1)', N'Christopher Paolini', CAST(N'2002-08-26T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:01:06.8137586' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'357da772-1471-4076-4e96-08dcf4ddd1e6', N'Brave New World', N'Aldous Huxley', CAST(N'1932-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:01:20.5795419' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'bb41aac1-2c47-439b-4e97-08dcf4ddd1e6', N'The Secret Life of Bees', N'Sue Monk Kidd', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:01:38.6987258' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'c0d96f6c-b067-40db-4e98-08dcf4ddd1e6', N'The Adventures of Huckleberry Finn', N'Mark Twain, John Seelye, Guy Cardwell', CAST(N'1884-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:01:49.3996061' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a6480ad9-9ed4-4d8d-4e99-08dcf4ddd1e6', N'The Curious Incident of the Dog in the Night-Time', N'Mark Haddon', CAST(N'2003-04-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:02:02.1817092' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'64e55d4a-064f-4f4b-4e9a-08dcf4ddd1e6', N'The Golden Compass (His Dark Materials, #1)', N'Philip Pullman', CAST(N'1995-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:02:17.8846573' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'5fb3777d-3106-4536-4e9b-08dcf4ddd1e6', N'Wuthering Heights', N'Emily Brontë, Richard J. Dunn', CAST(N'1847-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:03:00.1550119' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'85e6f76b-6264-456a-4e9c-08dcf4ddd1e6', N'Slaughterhouse-Five', N'Kurt Vonnegut Jr.', CAST(N'1969-03-31T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:03:17.7724679' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'3918837d-cb9f-40bb-4e9d-08dcf4ddd1e6', N'Gone with the Wind', N'Margaret Mitchell', CAST(N'1936-06-30T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:03:29.2081924' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'2da9955b-5a7d-431f-4e9e-08dcf4ddd1e6', N'A Thousand Splendid Suns', N'Khaled Hosseini', CAST(N'2007-05-22T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:03:43.5586426' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'd57c8e28-816a-42b0-4e9f-08dcf4ddd1e6', N'Frankenstein', N'Mary Wollstonecraft Shelley, Percy Bysshe Shelley, Maurice Hindle', CAST(N'1818-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:14:40.9729200' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a4cf2d78-3faf-4cc8-4ea0-08dcf4ddd1e6', N'The Host (The Host, #1)', N'Stephenie Meyer', CAST(N'2008-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:14:54.3303394' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'250aec51-23ba-4537-4ea1-08dcf4ddd1e6', N'Sense and Sensibility', N'Jane Austen, Tony Tanner, Ros Ballaster', CAST(N'1811-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:15:08.2707333' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'0b674353-63b1-4940-4ea2-08dcf4ddd1e6', N'The Little Prince', N'Antoine de Saint-Exupéry, Richard Howard, Dom Marcos Barbosa, Melina Karakosta', CAST(N'1946-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:16:09.8166981' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'1a57ce17-4ae5-4851-4ea3-08dcf4ddd1e6', N'A Tale of Two Cities', N'Charles Dickens, Richard Maxwell, Hablot Knight Browne', CAST(N'1859-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:16:26.0818742' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e0e48490-f60c-4784-4ea4-08dcf4ddd1e6', N'Jurassic Park (Jurassic Park, #1)', N'Michael Crichton', CAST(N'1990-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:16:39.8992357' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'75f8c7df-5e02-4b44-4ea5-08dcf4ddd1e6', N'The Giving Tree', N'Shel Silverstein', CAST(N'1964-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:17:02.9521342' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'9d0f1f04-ee69-492e-4ea6-08dcf4ddd1e6', N'The Outsiders', N'S.E. Hinton', CAST(N'1967-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:17:15.9542568' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'cabfbd57-ca56-4619-4ea7-08dcf4ddd1e6', N'The Secret Garden', N'Frances Hodgson Burnett', CAST(N'1911-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:17:30.2112449' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'3896208d-310c-4dca-4ea8-08dcf4ddd1e6', N'One Hundred Years of Solitude', N'Gabriel García Márquez, Gregory Rabassa', CAST(N'1967-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:17:46.2194228' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'1ecfc5f6-8299-4ff5-4ea9-08dcf4ddd1e6', N'The Picture of Dorian Gray', N'Oscar Wilde, Jeffrey Eugenides', CAST(N'1891-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:17:59.7588367' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'fadd6ab2-0dc5-49e9-4eaa-08dcf4ddd1e6', N'Dracula', N'Bram Stoker, Nina Auerbach, David J. Skal', CAST(N'1897-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:18:12.5641619' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e7a658fd-99e4-44e3-4eab-08dcf4ddd1e6', N'The Girl Who Played with Fire (Millennium, #2)', N'Stieg Larsson, Reg Keeland', CAST(N'2006-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:18:25.7648396' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'dc226c81-751b-4b0b-4eac-08dcf4ddd1e6', N'The Poisonwood Bible', N'Barbara Kingsolver', CAST(N'1998-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:18:39.8416095' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'40966119-7bd8-4b57-4ead-08dcf4ddd1e6', N'Me Talk Pretty One Day', N'David Sedaris', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:18:53.0071693' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'80a5203d-be08-4ec6-4eae-08dcf4ddd1e6', N'Where the Wild Things Are', N'Maurice Sendak', CAST(N'1963-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:19:07.3955148' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'0b564b13-8c81-4533-4eaf-08dcf4ddd1e6', N'The Count of Monte Cristo', N'Alexandre Dumas, Robin Buss', CAST(N'1844-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:19:51.6309761' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'7dd5a769-26c5-4222-4eb0-08dcf4ddd1e6', N'Les Misérables', N'Victor Hugo, Lee Fahnestock, Norman MacAfee', CAST(N'1862-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:20:04.6008391' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'4f4f3f6a-a4a0-4a51-4eb1-08dcf4ddd1e6', N'Catch-22', N'Joseph Heller', CAST(N'1961-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:20:15.6709945' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'c6a7d6f2-a500-40d4-4eb2-08dcf4ddd1e6', N'The Odyssey', N'Homer, Robert Fagles, E.V. Rieu, Frédéric Mugler, Bernard Knox', CAST(N'1720-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:21:41.4264325' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a15e08ce-0edb-458b-4eb3-08dcf4ddd1e6', N'Middlesex', N'Jeffrey Eugenides', CAST(N'2002-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:22:41.7691062' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'8857e269-f810-4f1b-4eb4-08dcf4ddd1e6', N'The Joy Luck Club', N'Amy Tan', CAST(N'1989-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:22:56.6015408' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'd9d7da3f-16cc-4930-4eb5-08dcf4ddd1e6', N'Lolita', N'Vladimir Nabokov, Craig Raine', CAST(N'1955-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:23:09.4898841' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'b7a5e1d7-5b14-434b-4eb6-08dcf4ddd1e6', N'Wicked: The Life and Times of the Wicked Witch of the West (The Wicked Years, #1)', N'Gregory Maguire, Douglas Smith', CAST(N'1995-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:23:29.3376572' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'2dc97fa6-905a-4e82-4eb7-08dcf4ddd1e6', N'Hamlet', N'William Shakespeare, Richard Andrews, Rex Gibson', CAST(N'1600-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:23:46.7866978' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'faf989a5-b3b3-49ba-4eb8-08dcf4ddd1e6', N'The Old Man and the Sea', N'Ernest Hemingway', CAST(N'1952-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:23:59.9546003' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'035324db-52c9-4a09-4eb9-08dcf4ddd1e6', N'The Grapes of Wrath', N'John Steinbeck', CAST(N'1939-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:24:14.3965782' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'dedac694-3db3-488e-4eba-08dcf4ddd1e6', N'Anne of Green Gables (Anne of Green Gables, #1)', N'L.M. Montgomery', CAST(N'1908-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:24:28.9517519' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a5491fe0-774e-4b3f-4ebb-08dcf4ddd1e6', N'City of Glass (The Mortal Instruments, #3)', N'Cassandra Clare', CAST(N'2009-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:24:44.8261433' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'28bbe04a-bfa9-49e7-4ebc-08dcf4ddd1e6', N'A Storm of Swords (A Song of Ice and Fire, #3)', N'George R.R. Martin', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:24:57.9240757' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'8ec71b8d-166e-4b0c-4ebd-08dcf4ddd1e6', N'Outlander (Outlander, #1)', N'Diana Gabaldon', CAST(N'1991-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:25:13.0117630' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'1316dab9-fe0b-457b-4ebe-08dcf4ddd1e6', N'The Scarlet Letter', N'Nathaniel Hawthorne, Thomas E. Connolly, Nina Baym', CAST(N'1850-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:25:25.7857915' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'1326ddd4-5e53-440e-4ebf-08dcf4ddd1e6', N'The Martian', N'Andy Weir', CAST(N'2012-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:25:37.5366560' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e20e232d-effe-4d51-4ec0-08dcf4ddd1e6', N'All the Light We Cannot See', N'Anthony Doerr', CAST(N'2014-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:25:52.6327548' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'6a8bc8bf-4161-48c8-4ec1-08dcf4ddd1e6', N'Deception Point', N'Dan Brown', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:26:04.0894247' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'1fe159e6-ea37-4d75-4ec2-08dcf4ddd1e6', N'Girl with a Pearl Earring', N'Tracy Chevalier', CAST(N'1999-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:26:19.2217158' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'b71a043e-53e3-47c6-4ec3-08dcf4ddd1e6', N'The Red Tent', N'Anita Diamant', CAST(N'1997-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:26:32.4231291' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'95cb2b2c-4e69-4540-4ec4-08dcf4ddd1e6', N'Macbeth', N'William Shakespeare', CAST(N'1606-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:26:51.8803759' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'd3c52bbe-94d9-49e0-4ec5-08dcf4ddd1e6', N'The Two Towers (The Lord of the Rings, #2)', N'J.R.R. Tolkien', CAST(N'1954-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:27:06.2067288' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'3d564e83-7d0e-4945-4ec6-08dcf4ddd1e6', N'Green Eggs and Ham', N'Dr. Seuss, לאה נאור', CAST(N'1960-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:27:25.4653383' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'd7e79161-8196-43e3-4ec7-08dcf4ddd1e6', N'Charlie and the Chocolate Factory (Charlie Bucket, #1)', N'Roald Dahl, Quentin Blake', CAST(N'1964-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:27:46.5308482' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'8f4843cb-b5bf-4358-4ec8-08dcf4ddd1e6', N'Great Expectations', N'Charles Dickens', CAST(N'1860-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:27:59.9323534' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'765dfbc8-fabd-487c-4ec9-08dcf4ddd1e6', N'The Return of the King (The Lord of the Rings, #3)', N'J.R.R. Tolkien', CAST(N'1955-01-01T00:00:00.0000000' AS DateTime2), NULL, CAST(0.00 AS Decimal(3, 2)), NULL, CAST(N'2024-10-25T11:28:13.8033568' AS DateTime2), CAST(N'2025-01-16T11:13:35.5758064' AS DateTime2), N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'44cf5edb-040a-4820-4eca-08dcf4ddd1e6', N'The Stranger', N'Albert Camus, Matthew Ward', CAST(N'1942-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:28:26.4550211' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'016cdcb2-f3dc-40b1-4ecb-08dcf4ddd1e6', N'The Stand', N'Stephen King, Bernie Wrightson', CAST(N'1978-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:28:57.9389138' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'67e36462-0671-4f61-4ecc-08dcf4ddd1e6', N'Emma', N'Jane Austen', CAST(N'1815-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:29:15.6488474' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'c295dd30-1f1b-4c44-4ece-08dcf4ddd1e6', N'Siddhartha', N'Hermann Hesse, Hilda Rosner', CAST(N'1922-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:34:03.6126154' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a052485c-625d-433e-4ecf-08dcf4ddd1e6', N'In Cold Blood', N'Truman Capote', CAST(N'1965-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:34:17.2914170' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'fc0dbec1-7cd8-4f30-4ed0-08dcf4ddd1e6', N'Beautiful Creatures (Caster Chronicles, #1)', N'Kami Garcia, Margaret Stohl', CAST(N'2009-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:34:29.5697298' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'ef0a3036-18c0-42d3-4ed1-08dcf4ddd1e6', N'Clockwork Angel (The Infernal Devices, #1)', N'Cassandra Clare', CAST(N'2010-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:34:41.7263617' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'009c8b4f-b157-49b7-4ed2-08dcf4ddd1e6', N'Matilda', N'Roald Dahl, Quentin Blake', CAST(N'1988-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:34:54.1879447' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'0914fafe-943a-434a-4ed3-08dcf4ddd1e6', N'The Night Circus', N'Erin Morgenstern', CAST(N'2011-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:35:07.1530328' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'b5b2a5f9-7f82-4cd8-4ed4-08dcf4ddd1e6', N'The Other Boleyn Girl (The Plantagenet and Tudor Novels, #9)', N'Philippa Gregory', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:35:35.1737771' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'c94fd4b0-d518-403c-4ed5-08dcf4ddd1e6', N'Watchmen', N'Alan Moore, Dave Gibbons, John Higgins', CAST(N'1987-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:35:48.9669487' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'81e92faf-e89a-40bd-4ed6-08dcf4ddd1e6', N'The Name of the Wind (The Kingkiller Chronicle, #1)', N'Patrick Rothfuss', CAST(N'2007-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:36:02.4757015' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'4f182074-de42-43b7-4ed7-08dcf4ddd1e6', N'The Guernsey Literary and Potato Peel Pie Society', N'Mary Ann Shaffer, Annie Barrows', CAST(N'2008-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:36:16.0747287' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a481311f-271e-4644-4ed8-08dcf4ddd1e6', N'Fight Club', N'Chuck Palahniuk', CAST(N'1996-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:36:38.2411450' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'8521a818-2b4f-4b53-4ed9-08dcf4ddd1e6', N'Dead Until Dark (Sookie Stackhouse, #1)', N'Charlaine Harris', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:36:51.8445649' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'82518c07-3b42-4b74-4eda-08dcf4ddd1e6', N'The Color Purple', N'Alice Walker', CAST(N'1982-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:37:01.8152156' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'61e7f86d-2a43-420d-4edb-08dcf4ddd1e6', N'And Then There Were None', N'Agatha Christie', CAST(N'1939-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:37:18.0734609' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'0f8442e9-2e92-4396-4edc-08dcf4ddd1e6', N'A Christmas Carol', N'Charles Dickens', CAST(N'1843-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:37:31.8082735' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'ebd1c755-5bf3-4548-4edd-08dcf4ddd1e6', N'Interview with the Vampire (The Vampire Chronicles, #1)', N'Anne Rice', CAST(N'1976-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:37:52.1639927' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'17fafc65-8aa1-4bdb-4ede-08dcf4ddd1e6', N'One for the Money (Stephanie Plum, #1)', N'Janet Evanovich', CAST(N'1994-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:38:07.2128410' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e6422b03-bc3b-464f-4edf-08dcf4ddd1e6', N'Atonement', N'Ian McEwan', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:38:20.6208407' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'f7cdb538-da84-4f80-4ee0-08dcf4ddd1e6', N'The Metamorphosis', N'Franz Kafka, Stanley Corngold', CAST(N'1915-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:38:37.0889847' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'ac798211-c70a-4dd3-4ee1-08dcf4ddd1e6', N'The Devil in the White City: Murder, Magic, and Madness at the Fair That Changed America', N'Erik Larson, Tony Goldwyn', CAST(N'2003-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:38:53.4558144' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'82dc78c0-10f9-42d9-4ee2-08dcf4ddd1e6', N'The Bourne Identity (Jason Bourne, #1)', N'Robert Ludlum', CAST(N'1980-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:39:07.0199397' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'392b5f7e-f2d7-4e08-4ee3-08dcf4ddd1e6', N'East of Eden', N'John Steinbeck', CAST(N'1952-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:41:13.9508900' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'69b92f52-eff1-4fc5-4ee4-08dcf4ddd1e6', N'Dark Places', N'Gillian Flynn', CAST(N'2009-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:42:10.7068719' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'ad989eab-c347-4fe5-4ee5-08dcf4ddd1e6', N'Persuasion', N'Jane Austen, James Kinsley, Deidre Shauna Lynch', CAST(N'1817-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:42:26.4055136' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'2b0c86f3-80ec-453a-4ee6-08dcf4ddd1e6', N'Sarah''s Key', N'Tatiana de Rosnay', CAST(N'2007-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:42:39.7881471' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'7c8d8942-9f0c-43d8-4ee7-08dcf4ddd1e6', N'The Gunslinger (The Dark Tower, #1)', N'Stephen King', CAST(N'1982-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:42:56.4097800' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'd6d43ae1-b4e3-4859-4ee8-08dcf4ddd1e6', N'Love in the Time of Cholera', N'Gabriel García Márquez, Edith Grossman', CAST(N'1985-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:43:13.7142754' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'50b806e4-1d44-4d7f-4ee9-08dcf4ddd1e6', N'Carrie', N'Stephen King', CAST(N'1974-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:43:28.1367478' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'93a5b9d0-558c-4851-4eea-08dcf4ddd1e6', N'World War Z: An Oral History of the Zombie War', N'Max Brooks', CAST(N'2006-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:43:44.6416612' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'990cb817-7f46-424f-4eeb-08dcf4ddd1e6', N'Inferno (Robert Langdon, #4)', N'Dan Brown', CAST(N'2013-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:44:02.1522294' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e4a0b975-80ed-48bb-4eec-08dcf4ddd1e6', N'Along Came a Spider (Alex Cross, #1)', N'James Patterson', CAST(N'1993-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:44:17.4011245' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'7dd90fcb-1271-42bc-4eed-08dcf4ddd1e6', N'Sharp Objects', N'Gillian Flynn', CAST(N'2006-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:44:38.1567708' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'0b49cc3d-ae3d-4d10-4eee-08dcf4ddd1e6', N'Bridge to Terabithia', N'Katherine Paterson', CAST(N'1977-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:44:53.3511397' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'46bf0d0b-ac88-4563-4eef-08dcf4ddd1e6', N'Cinder (The Lunar Chronicles, #1)', N'Marissa Meyer', CAST(N'2012-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:45:17.5188175' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'3d568fdc-88f4-45b2-4ef0-08dcf4ddd1e6', N'The Cuckoo''s Calling (Cormoran Strike, #1)', N'Robert Galbraith, J.K. Rowling', CAST(N'2013-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:45:34.1778642' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'd4606bc0-89b5-4287-4ef1-08dcf4ddd1e6', N'Atlas Shrugged', N'Ayn Rand, Leonard Peikoff', CAST(N'1957-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:46:04.6078044' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a623101d-5470-4cac-4ef2-08dcf4ddd1e6', N'The Sun Also Rises', N'Ernest Hemingway', CAST(N'1926-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:46:22.9251198' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'48635182-6075-4d85-4ef3-08dcf4ddd1e6', N'A Tree Grows in Brooklyn', N'Betty Smith', CAST(N'1943-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:46:40.9526217' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a2a6777e-ea4a-420e-4ef4-08dcf4ddd1e6', N'The Nightingale', N'Kristin Hannah', CAST(N'2015-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:47:02.9918860' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'95c915e2-d8bb-4b2b-4ef5-08dcf4ddd1e6', N'Never Let Me Go', N'Kazuo Ishiguro', CAST(N'2005-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:47:21.9101143' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e853e055-a56f-41ec-4ef6-08dcf4ddd1e6', N'Rebecca', N'Daphne du Maurier, Sally Beauman', CAST(N'1938-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:47:42.6609765' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'6962a06f-bcfd-420a-4ef7-08dcf4ddd1e6', N'Flowers for Algernon', N'Daniel Keyes', CAST(N'1966-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:47:59.5562282' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e00df3fe-4a58-4ede-4ef8-08dcf4ddd1e6', N'Snow Flower and the Secret Fan', N'Lisa See', CAST(N'2005-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:48:16.7883642' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'50927c5e-53b7-42ca-4ef9-08dcf4ddd1e6', N'The Pelican Brief', N'John Grisham', CAST(N'1992-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:48:38.9180156' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'96c56463-8dc6-4162-4efa-08dcf4ddd1e6', N'Good Omens: The Nice and Accurate Prophecies of Agnes Nutter, Witch', N'Terry Pratchett, Neil Gaiman', CAST(N'1990-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:48:57.0501813' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'fe2bc0d6-14dd-4416-4efb-08dcf4ddd1e6', N'On the Road', N'Jack Kerouac', CAST(N'1955-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:49:10.9091593' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'79897831-1849-433a-4efc-08dcf4ddd1e6', N'The Fountainhead', N'Ayn Rand, Leonard Peikoff', CAST(N'1943-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:49:26.1578118' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'56cf6fb9-1005-4da5-4efd-08dcf4ddd1e6', N'Watership Down (Watership Down, #1)', N'Richard Adams', CAST(N'1972-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:49:55.8342645' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'91a88821-84d7-45c8-4efe-08dcf4ddd1e6', N'Cutting for Stone', N'Abraham Verghese', CAST(N'2009-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:50:30.1455539' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'7732740b-5dae-43f4-4eff-08dcf4ddd1e6', N'Treasure Island', N'Robert Louis Stevenson', CAST(N'1882-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:50:48.2250740' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'405a64e1-92b4-4751-4f00-08dcf4ddd1e6', N'11/22/63', N'Stephen King', CAST(N'1963-11-22T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:56:23.0294955' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'43bc65e2-d47f-4086-4f01-08dcf4ddd1e6', N'The Time Machine', N'H.G. Wells, Greg Bear, Carlo Pagetti', CAST(N'1895-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:56:51.0233186' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'c328281d-beca-4e20-4f02-08dcf4ddd1e6', N'The Boy in the Striped Pajamas', N'John Boyne', CAST(N'2006-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:57:06.6338008' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'46ddeb47-ba25-472d-4f03-08dcf4ddd1e6', N'Heart of Darkness', N'Joseph Conrad', CAST(N'1899-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:57:24.2683975' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'b3d160a1-cfd4-4bf0-4f04-08dcf4ddd1e6', N'Orphan Train', N'Christina Baker Kline', CAST(N'2013-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:57:44.7667888' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'd3bad0a2-1bbb-488f-4f05-08dcf4ddd1e6', N'Where the Red Fern Grows', N'Wilson Rawls', CAST(N'1961-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:58:01.2906234' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'3558be6a-200b-45bd-4f06-08dcf4ddd1e6', N'The Unbearable Lightness of Being', N'Milan Kundera, Michael Henry Heim', CAST(N'1984-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:58:18.3120735' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'65ccf722-658a-415f-4f07-08dcf4ddd1e6', N'A Prayer for Owen Meany', N'John Irving', CAST(N'1989-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:58:45.5689015' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'ac7e0394-f612-4c1c-4f08-08dcf4ddd1e6', N'James and the Giant Peach', N'Roald Dahl, Quentin Blake', CAST(N'1961-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:59:42.4560330' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e372960b-5da7-4a35-4f09-08dcf4ddd1e6', N'1st to Die (Women''s Murder Club, #1)', N'James Patterson', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T11:59:57.6456327' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'658bdf02-5c21-4d59-4f0a-08dcf4ddd1e6', N'The Wonderful Wizard of Oz (Oz, #1)', N'L. Frank Baum, W.W. Denslow', CAST(N'1900-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:00:12.2382571' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'9c705bbc-4f8f-4d30-4f0b-08dcf4ddd1e6', N'Fear and Loathing in Las Vegas', N'Hunter S. Thompson, Ralph Steadman', CAST(N'1971-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:00:31.4334402' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'1e8b2dac-946c-4605-4f0c-08dcf4ddd1e6', N'Beloved', N'Toni Morrison', CAST(N'1987-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:00:46.1221691' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'8651000b-1c92-4d01-4f0d-08dcf4ddd1e6', N'Graceling (Graceling Realm, #1)', N'Kristin Cashore', CAST(N'2008-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:01:16.3822164' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'0c19c8fb-94f2-431a-4f0e-08dcf4ddd1e6', N'All Quiet on the Western Front', N'Erich Maria Remarque, A.W. Wheen', CAST(N'1929-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:01:30.9077621' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'bef510d8-3b0c-4f32-4f0f-08dcf4ddd1e6', N'And the Mountains Echoed', N'Khaled Hosseini', CAST(N'2012-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:01:46.0668068' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'13af999f-b651-43fd-4f10-08dcf4ddd1e6', N'Do Androids Dream of Electric Sheep?', N'Philip K. Dick, Roger Zelazny', CAST(N'1968-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:02:36.7658733' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'201bf123-8090-4b4e-4f13-08dcf4ddd1e6', N'Oliver Twist', N'Charles Dickens, George Cruikshank, Philip Horne', CAST(N'1838-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:03:39.6699288' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e339e028-f6c6-41a9-4f14-08dcf4ddd1e6', N'Odd Thomas (Odd Thomas, #1)', N'Dean Koontz', CAST(N'2003-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:03:56.6614117' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'8d5f8e89-cd4e-4b1b-4f15-08dcf4ddd1e6', N'Stargirl (Stargirl, #1)', N'Jerry Spinelli', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:04:12.1101093' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'4111ebfb-3a18-4374-4f16-08dcf4ddd1e6', N'Stranger in a Strange Land', N'Robert A. Heinlein', CAST(N'1961-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:04:29.3346318' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'1f8fc8fc-f134-4d94-4f17-08dcf4ddd1e6', N'The Final Empire (Mistborn, #1)', N'Brandon Sanderson', CAST(N'2006-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:04:51.7988965' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a0099527-2dbc-45d3-4f18-08dcf4ddd1e6', N'The Lorax', N'Dr. Seuss', CAST(N'1971-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:05:17.1189933' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'7f9f99b9-5bbd-4a80-4f19-08dcf4ddd1e6', N'Throne of Glass (Throne of Glass, #1)', N'Sarah J. Maas', CAST(N'2012-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:05:35.6141395' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'30128762-8192-4201-4f1a-08dcf4ddd1e6', N'For Whom the Bell Tolls', N'Ernest Hemingway', CAST(N'1940-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:06:51.6137347' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e5edd252-fbf0-4e43-4f1b-08dcf4ddd1e6', N'Hotel on the Corner of Bitter and Sweet', N'Jamie Ford', CAST(N'2009-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:07:06.7493699' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'ae24be7b-877b-4995-4f1c-08dcf4ddd1e6', N'Perfume: The Story of a Murderer', N'Patrick Süskind, John E. Woods', CAST(N'1985-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:07:22.0509674' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'0fcf6bde-4e3b-487f-4f1d-08dcf4ddd1e6', N'A Farewell to Arms', N'Ernest Hemingway', CAST(N'1929-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:07:41.3701858' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'71237263-b1f8-4e7a-4f1e-08dcf4ddd1e6', N'The Undomestic Goddess', N'Sophie Kinsella', CAST(N'2005-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:08:12.2596236' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'46a5d3f3-63bc-48bd-4f1f-08dcf4ddd1e6', N'The Three Musketeers', N'Alexandre Dumas', CAST(N'1844-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:08:28.9716994' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'581822ff-5605-453d-4f20-08dcf4ddd1e6', N'The Thirteenth Tale', N'Diane Setterfield', CAST(N'2006-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:08:42.6172185' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'86e76f89-c44c-438a-4f23-08dcf4ddd1e6', N'The Fault in Our Stars', N'John Green', CAST(N'2012-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:09:47.9087056' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'bae36ef0-db45-4cc6-4f25-08dcf4ddd1e6', N'The Name of the Rose', N'Umberto Eco, William Weaver, Seán Barrett', CAST(N'1980-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:12:40.3170713' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'1187a60e-735b-4fb3-4f26-08dcf4ddd1e6', N'A Confederacy of Dunces', N'John Kennedy Toole, Walker Percy', CAST(N'1980-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:12:56.0834467' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'cba2dbf1-5f29-4788-4f27-08dcf4ddd1e6', N'Red Dragon (Hannibal Lecter, #1)', N'Thomas Harris', CAST(N'1981-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:13:17.9752920' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'2afd2043-a9f8-4896-4f28-08dcf4ddd1e6', N'The Invention of Wings', N'Sue Monk Kidd', CAST(N'2014-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:13:42.1291505' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'74799dc2-c430-4de9-4f29-08dcf4ddd1e6', N'Fall of Giants (The Century Trilogy, #1)', N'Ken Follett', CAST(N'2010-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:14:14.2413771' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'f65acf6f-e7f8-4db5-4f2a-08dcf4ddd1e6', N'Snow Crash', N'Neal Stephenson', CAST(N'1992-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:14:30.3128155' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'ce05313a-901f-4ccd-4f2b-08dcf4ddd1e6', N'Storm Front (The Dresden Files, #1)', N'Jim Butcher', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:15:22.6640380' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'8181602c-ca0f-4cec-4f2c-08dcf4ddd1e6', N'Northanger Abbey', N'Jane Austen, Alfred MacAdam', CAST(N'1817-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:15:43.2293675' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'7d19d8b8-010c-4a22-4f2d-08dcf4ddd1e6', N'The 5th Wave (The 5th Wave, #1)', N'Rick Yancey', CAST(N'2013-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:16:11.1225993' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'614d444a-f940-46c9-4f2e-08dcf4ddd1e6', N'The Historian', N'Elizabeth Kostova', CAST(N'2005-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:16:25.2734875' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'1b1a3085-f377-44b6-4f2f-08dcf4ddd1e6', N'Station Eleven', N'Emily St. John Mandel', CAST(N'2014-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:16:53.4839224' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'ca238575-2b40-46c7-4f30-08dcf4ddd1e6', N'The Good Earth (House of Earth, #1)', N'Pearl S. Buck', CAST(N'1931-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:17:45.6722809' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'0eeb6085-3562-4985-4f31-08dcf4ddd1e6', N'Their Eyes Were Watching God', N'Zora Neale Hurston', CAST(N'1937-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:18:32.8906514' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e71acd7e-205f-430f-4f32-08dcf4ddd1e6', N'In the Woods (Dublin Murder Squad, #1)', N'Tana French', CAST(N'2007-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:18:53.6537975' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a5d174bf-2475-40ae-4f33-08dcf4ddd1e6', N'The World According to Garp', N'John Irving', CAST(N'1978-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:19:09.4016858' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'ff443153-83e1-481e-4f34-08dcf4ddd1e6', N'Robinson Crusoe', N'Daniel Defoe, Gerald McCann, Virginia Woolf', CAST(N'1719-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:19:38.0002055' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'07a4e254-d877-47ed-4f35-08dcf4ddd1e6', N'The Prince', N'Niccolò Machiavelli, Adolph Caso, Rufus Goodwin, Benjamin Martinez', CAST(N'1513-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:19:54.9464539' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e5e991b4-694b-46d0-4f36-08dcf4ddd1e6', N'Wizard''s First Rule (Sword of Truth, #1)', N'Terry Goodkind', CAST(N'1994-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:20:11.7814319' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'0a73dfec-37c3-4fa0-4f37-08dcf4ddd1e6', N'The Kitchen House', N'Kathleen Grissom', CAST(N'2010-01-01T00:00:00.0000000' AS DateTime2), NULL, NULL, NULL, CAST(N'2024-10-25T12:20:30.5244600' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'6adc9f8e-1298-4e56-a620-08dcf583c9b6', N'Franny and Zooey', N'J.D. Salinger', CAST(N'1961-01-01T00:00:00.0000000' AS DateTime2), N'A novel that explores themes of spirituality and existential angst.', NULL, 10, CAST(N'2024-10-26T06:02:35.3215109' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'b3391a46-62a7-48d9-a621-08dcf583c9b6', N'Mere Christianity', N'C.S. Lewis', CAST(N'1952-01-01T00:00:00.0000000' AS DateTime2), N'A theological book presenting the essence of Christian belief.', NULL, 15, CAST(N'2024-10-26T06:02:50.2489381' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'4d8d83bd-f365-4a74-a622-08dcf583c9b6', N'The Secret History', N'Donna Tartt', CAST(N'1992-01-01T00:00:00.0000000' AS DateTime2), N'A novel about a group of elite students and a dark secret.', NULL, 12, CAST(N'2024-10-26T06:03:03.4525193' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'78cae929-7c90-487f-a623-08dcf583c9b6', N'American Psycho', N'Bret Easton Ellis', CAST(N'1991-01-01T00:00:00.0000000' AS DateTime2), N'A satirical psychological thriller about a wealthy New York banker and serial killer.', NULL, 13, CAST(N'2024-10-26T06:03:26.3143890' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'd889e1d5-fa74-400d-a624-08dcf583c9b6', N'2001: A Space Odyssey (Space Odyssey, #1)', N'Arthur C. Clarke', CAST(N'1968-01-01T00:00:00.0000000' AS DateTime2), N'A science fiction novel about humanity’s evolution and its encounters with extraterrestrial intelligence.', NULL, 16, CAST(N'2024-10-26T06:03:43.1635250' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'64668f58-1d51-4ae4-a625-08dcf583c9b6', N'Postmortem (Kay Scarpetta, #1)', N'Patricia Cornwell', CAST(N'1990-01-01T00:00:00.0000000' AS DateTime2), N'A crime thriller following a medical examiner as she solves a series of murders.', NULL, 14, CAST(N'2024-10-26T06:04:05.0163816' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'c40db19a-965b-4ea0-a626-08dcf583c9b6', N'The Complete Stories and Poems', N'Edgar Allan Poe', CAST(N'1849-01-01T00:00:00.0000000' AS DateTime2), N'A collection of short stories and poems from the master of gothic fiction.', NULL, 20, CAST(N'2024-10-26T06:04:19.3200746' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'd99dd97f-f0a3-40d5-a627-08dcf583c9b6', N'The Amazing Adventures of Kavalier & Clay', N'Michael Chabon', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), N'A novel about the lives of two Jewish cousins during World War II and the birth of the comic book industry.', NULL, 18, CAST(N'2024-10-26T06:04:33.1487639' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'10070c36-f169-4960-a628-08dcf583c9b6', N'Peter Pan', N'J.M. Barrie, Michael Hague', CAST(N'1904-01-01T00:00:00.0000000' AS DateTime2), N'A classic tale about the boy who wouldn’t grow up and his adventures in Neverland.', NULL, 9, CAST(N'2024-10-26T06:04:45.3702848' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'46dd67ef-df2f-422f-a629-08dcf583c9b6', N'The Wind-Up Bird Chronicle', N'Haruki Murakami, Jay Rubin', CAST(N'1994-01-01T00:00:00.0000000' AS DateTime2), N'A surreal novel about a man searching for his missing wife, set in Japan.', NULL, 15, CAST(N'2024-10-26T06:04:58.7168227' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'435e87e3-30f3-4a9e-a62a-08dcf583c9b6', N'Cloud Atlas', N'David Mitchell', CAST(N'2004-01-01T00:00:00.0000000' AS DateTime2), N'A novel featuring interconnected stories spanning multiple timelines.', NULL, 16, CAST(N'2024-10-26T06:05:08.9632168' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'ae060e41-bbe6-4528-a62b-08dcf583c9b6', N'The Things They Carried', N'Tim O''Brien', CAST(N'1990-01-01T00:00:00.0000000' AS DateTime2), N'A collection of linked short stories about soldiers in the Vietnam War.', NULL, 13, CAST(N'2024-10-26T06:05:25.1847744' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'02772094-0337-42e8-a62c-08dcf583c9b6', N'Beowulf', N'Unknown, Seamus Heaney', CAST(N'0975-01-01T00:00:00.0000000' AS DateTime2), N'An epic poem about the heroic deeds of Beowulf, a warrior of ancient times.', NULL, 11, CAST(N'2024-10-26T06:05:38.6703084' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'c331aead-004b-42bd-a62d-08dcf583c9b6', N'Midnight in the Garden of Good and Evil', N'John Berendt', CAST(N'1994-01-01T00:00:00.0000000' AS DateTime2), N'A non-fiction account of a murder trial in Savannah, Georgia.', NULL, 12, CAST(N'2024-10-26T06:06:02.0813710' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'ee1c7472-d110-40b3-a62e-08dcf583c9b6', N'The Phantom Tollbooth', N'Norton Juster, Jules Feiffer', CAST(N'1961-01-01T00:00:00.0000000' AS DateTime2), N'A children’s fantasy novel about a boy’s adventure through a magical tollbooth.', NULL, 10, CAST(N'2024-10-26T06:06:20.7061858' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'be390d4b-b5f1-4926-a62f-08dcf583c9b6', N'The Way of Kings (The Stormlight Archive, #1)', N'Brandon Sanderson', CAST(N'2010-01-01T00:00:00.0000000' AS DateTime2), N'An epic fantasy novel following several characters in a world ravaged by storms.', NULL, 22, CAST(N'2024-10-26T06:06:39.4770331' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'9bf66d27-c6bf-4236-a630-08dcf583c9b6', N'The Well of Ascension (Mistborn, #2)', N'Brandon Sanderson', CAST(N'2007-01-01T00:00:00.0000000' AS DateTime2), N'The second book in the Mistborn series, continuing the story of a rebellion against a corrupt empire.', NULL, 20, CAST(N'2024-10-26T06:06:51.3424705' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'3739ba37-bcea-40a1-a631-08dcf583c9b6', N'The Angel Experiment (Maximum Ride, #1)', N'James Patterson', CAST(N'2005-01-01T00:00:00.0000000' AS DateTime2), N'A science fiction novel about children with special abilities on the run from a secret government organization.', NULL, 14, CAST(N'2024-10-26T06:07:03.8973587' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'ffaafd98-c04d-4723-a632-08dcf583c9b6', N'Oryx and Crake (MaddAddam, #1)', N'Margaret Atwood', CAST(N'2003-01-01T00:00:00.0000000' AS DateTime2), N'A dystopian novel about a future world devastated by genetic engineering.', NULL, 18, CAST(N'2024-10-26T06:07:20.3169458' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'be3b9dde-158c-43ef-a633-08dcf583c9b6', N'Are You My Mother?', N'P.D. Eastman', CAST(N'1960-01-01T00:00:00.0000000' AS DateTime2), N'A children''s book about a baby bird looking for its mother.', NULL, 8, CAST(N'2024-10-26T06:07:34.9069066' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'1e4c6e3f-bae2-4470-a634-08dcf583c9b6', N'A Great and Terrible Beauty (Gemma Doyle, #1)', N'Libba Bray', CAST(N'2003-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:09:31.4252672' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'9166ad52-3439-4fe3-a635-08dcf583c9b6', N'The Master and Margarita', N'Mikhail Bulgakov, Katherine Tiernan O''Connor, Diana Burgin, Ellendea Proffer', CAST(N'1967-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:09:49.2881253' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'f74c1f48-da40-4e39-a636-08dcf583c9b6', N'A Wizard of Earthsea (Earthsea Cycle, #1)', N'Ursula K. Le Guin', CAST(N'1968-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:10:10.9662125' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e1707c2d-fba8-414c-a637-08dcf583c9b6', N'Don Quixote', N'Miguel de Cervantes Saavedra, Roberto González Echevarría, John Rutherford', CAST(N'1605-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:10:36.3839706' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'81b2c8e3-3603-4ea6-a638-08dcf583c9b6', N'Assassin''s Apprentice (Farseer Trilogy, #1)', N'Robin Hobb', CAST(N'1995-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:10:53.7717142' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'0d84ea08-a4fb-46e4-a639-08dcf583c9b6', N'The Hero of Ages (Mistborn, #3)', N'Brandon Sanderson', CAST(N'2008-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:11:13.4750901' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'6733c5e6-acf0-4d60-a63a-08dcf583c9b6', N'The Forgotten Garden', N'Kate Morton', CAST(N'2008-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:11:34.6345979' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a7b2e5fc-6b64-4ea0-a63b-08dcf583c9b6', N'The Trial', N'Franz Kafka, Edwin Muir, Willa Muir, Max Brod', CAST(N'1925-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:11:55.3473080' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'fa7b4ecc-5451-4939-a63c-08dcf583c9b6', N'The Mists of Avalon (Avalon, #1)', N'Marion Zimmer Bradley', CAST(N'1982-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:12:16.4818277' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'76133152-acc8-4990-a63d-08dcf583c9b6', N'Starship Troopers', N'Robert A. Heinlein', CAST(N'1959-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:12:34.9400575' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'8cc9c70a-401a-4066-a63e-08dcf583c9b6', N'The Martian Chronicles', N'Ray Bradbury', CAST(N'1950-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:13:00.8796154' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'028f122d-8ae5-41c5-a63f-08dcf583c9b6', N'The Canterbury Tales', N'Geoffrey Chaucer, Nevill Coghill', CAST(N'1390-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:13:25.1626467' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'73fbce47-d24f-4d84-a640-08dcf583c9b6', N'The Phantom of the Opera', N'Gaston Leroux, Alexander Teixeira de Mattos', CAST(N'1909-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:13:42.5208778' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'85363635-9626-486c-a641-08dcf583c9b6', N'Blindness', N'José Saramago, Giovanni Pontiero', CAST(N'1995-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:13:58.7244415' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'7de5a584-8fb1-4c7e-a642-08dcf583c9b6', N'Congo', N'Michael Crichton', CAST(N'1980-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:14:13.4435787' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'116416a6-53d1-44ce-a643-08dcf583c9b6', N'The Passage (The Passage, #1)', N'Justin Cronin', CAST(N'2010-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:14:27.2270842' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'b915eca0-9238-4bf2-a644-08dcf583c9b6', N'The Mysterious Affair at Styles (Hercule Poirot, #1)', N'Agatha Christie, Ροζίτα Σώκου', CAST(N'1920-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:14:41.0762781' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'630c6a00-3739-4acc-a645-08dcf583c9b6', N'Murder on the Orient Express (Hercule Poirot, #10)', N'Agatha Christie', CAST(N'1934-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:15:09.7797879' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'714cd33e-12ed-441b-a646-08dcf583c9b6', N'Jonathan Strange & Mr Norrell', N'Susanna Clarke', CAST(N'2004-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:15:25.6999835' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'ed3e6828-680a-4c47-a647-08dcf583c9b6', N'Firefly Lane (Firefly Lane, #1)', N'Kristin Hannah', CAST(N'2008-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:15:40.8535827' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'eec39e34-4a5b-49fc-a648-08dcf583c9b6', N'The Constant Princess (The Plantagenet and Tudor Novels, #6)', N'Philippa Gregory', CAST(N'2005-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:20:58.0841359' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'62419e69-05c9-416b-a649-08dcf583c9b6', N'The Sound and the Fury', N'William Faulkner', CAST(N'1929-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:21:14.3562398' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'7bd3b174-4bd3-42f0-a64a-08dcf583c9b6', N'The Bone Collector (Lincoln Rhyme, #1)', N'Jeffery Deaver', CAST(N'1997-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:21:32.1127891' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'87265711-1850-49d3-a64b-08dcf583c9b6', N'Hyperion (Hyperion Cantos, #1)', N'Dan Simmons', CAST(N'1989-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:21:47.3398010' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'c71d7a40-aa3f-4824-a64c-08dcf583c9b6', N'The Exorcist', N'William Peter Blatty', CAST(N'1971-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:22:07.1297148' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'bbbcf38f-d1fb-4661-a64d-08dcf583c9b6', N'Snow Falling on Cedars', N'David Guterson', CAST(N'1994-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:22:23.4267726' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'806823a8-167a-44ba-a64e-08dcf583c9b6', N'Batman: The Killing Joke', N'Alan Moore, Brian Bolland, Tim Sale', CAST(N'1988-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:22:44.0579963' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'caa63300-21b1-4722-a64f-08dcf583c9b6', N'Invisible Man', N'Ralph Ellison', CAST(N'1952-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:22:59.7622180' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'8b33a9ff-72ac-4ae6-a650-08dcf583c9b6', N'Mrs. Frisby and the Rats of NIMH (Rats of NIMH, #1)', N'Robert C. O''Brien', CAST(N'1971-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:23:17.8114946' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'07a9a2f9-6abf-4e4c-a651-08dcf583c9b6', N'Different Seasons', N'Stephen King', CAST(N'1982-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:23:35.7272092' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'323a8e7d-0432-4f5e-a652-08dcf583c9b6', N'Wool Omnibus (Silo, #1)', N'Hugh Howey', CAST(N'2012-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:23:52.2085637' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'4c152df9-4751-4888-a653-08dcf583c9b6', N'The Lies of Locke Lamora (Gentleman Bastard, #1)', N'Scott Lynch', CAST(N'2006-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:24:07.3709282' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a47dd25b-a909-4124-a654-08dcf583c9b6', N'The Storyteller', N'Jodi Picoult', CAST(N'2013-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:24:27.0012822' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'17cf13b8-0614-4f26-a655-08dcf583c9b6', N'Half Broke Horses', N'Jeannette Walls', CAST(N'2008-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:24:42.5331022' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'64336b86-2000-43e2-a656-08dcf583c9b6', N'The White Queen (The Plantagenet and Tudor Novels, #2)', N'Philippa Gregory', CAST(N'2009-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:24:59.8469244' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'31299371-e2a9-4fda-a657-08dcf583c9b6', N'The Autobiography of Malcolm X', N'Malcolm X, Alex Haley', CAST(N'1965-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:25:15.2683907' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'817afae9-0b65-4335-a658-08dcf583c9b6', N'Shutter Island', N'Dennis Lehane', CAST(N'2003-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:25:35.3113452' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e632606e-2f2c-4bf6-a659-08dcf583c9b6', N'The Complete Sherlock Holmes', N'Arthur Conan Doyle', CAST(N'1894-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:25:51.3974307' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'17d2b7a7-7ffa-4bac-a65a-08dcf583c9b6', N'From the Mixed-Up Files of Mrs. Basil E. Frankweiler', N'E.L. Konigsburg', CAST(N'1967-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:26:11.3748917' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'b9e928c9-bc11-4b22-a65b-08dcf583c9b6', N'One Fish, Two Fish, Red Fish, Blue Fish', N'Dr. Seuss', CAST(N'1960-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:26:27.8470186' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'0a1e4e2a-aa76-4f49-a65c-08dcf583c9b6', N'No Country for Old Men', N'Cormac McCarthy', CAST(N'2005-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:29:46.5385379' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'44c306f2-9980-4b6d-a65d-08dcf583c9b6', N'Wolf Hall (Thomas Cromwell, #1)', N'Hilary Mantel', CAST(N'2009-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:30:06.2672403' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'82186dd2-bf23-4299-a65e-08dcf583c9b6', N'Naked in Death (In Death, #1)', N'J.D. Robb', CAST(N'1995-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:30:27.5866277' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'376250d1-94d4-43b2-a660-08dcf583c9b6', N'Shōgun (Asian Saga, #1)', N'James Clavell', CAST(N'1975-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:30:58.2423665' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'53408955-0306-4007-a661-08dcf583c9b6', N'The Way of Shadows (Night Angel, #1)', N'Brent Weeks', CAST(N'2008-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:31:12.8199979' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'd7563683-e543-44cf-a662-08dcf583c9b6', N'Words of Radiance (The Stormlight Archive, #2)', N'Brandon Sanderson', CAST(N'2014-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:31:30.7196219' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'b77ea4db-b99c-46c9-a663-08dcf583c9b6', N'The Fiery Cross (Outlander, #5)', N'Diana Gabaldon', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:31:48.8530757' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'66233f2d-eba2-466f-a664-08dcf583c9b6', N'The Neverending Story', N'Michael Ende, Ralph Manheim, Roswitha Quadflieg', CAST(N'1979-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:32:08.9969537' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'9eee16c0-1490-4324-a665-08dcf583c9b6', N'Eye of the Needle', N'Ken Follett', CAST(N'1978-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:32:22.3615982' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'464e15ee-b842-4a7d-a666-08dcf583c9b6', N'The Blind Assassin', N'Margaret Atwood', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:32:39.2897264' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'92233c7c-2f08-403c-a667-08dcf583c9b6', N'Rendezvous with Rama (Rama, #1)', N'Arthur C. Clarke', CAST(N'1973-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:32:54.4310157' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'5d3e570c-82b4-47be-a668-08dcf583c9b6', N'Year of Wonders', N'Geraldine Brooks', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:33:11.5687981' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'79dce6de-7cd8-49c6-a669-08dcf583c9b6', N'The Black Echo (Harry Bosch, #1; Harry Bosch Universe, #1)', N'Michael Connelly', CAST(N'1992-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:33:28.3954581' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'2891437a-9d49-4c7c-a66a-08dcf583c9b6', N'Old Man''s War (Old Man''s War, #1)', N'John Scalzi', CAST(N'2005-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:33:43.8151312' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'02afaf59-5d15-40ac-a66b-08dcf583c9b6', N'The Forever War (The Forever War, #1)', N'Joe Haldeman', CAST(N'1974-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:33:58.4981989' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'831a51b5-b47e-43bd-a66c-08dcf583c9b6', N'The Blade Itself (The First Law, #1)', N'Joe Abercrombie', CAST(N'2006-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:34:21.1137457' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'7423a1bd-ca5b-4841-a66d-08dcf583c9b6', N'I Am Legend and Other Stories', N'Richard Matheson', CAST(N'1954-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:34:43.6367284' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'5c4b0733-9b89-4cc9-a66e-08dcf583c9b6', N'Waiting for Godot', N'Samuel Beckett', CAST(N'1952-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:35:00.1158809' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'fc62dac3-2fd2-4df7-a66f-08dcf583c9b6', N'White Fang', N'Jack London', CAST(N'1906-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:35:16.2165546' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'3813c390-aeba-4935-a670-08dcf583c9b6', N'His Dark Materials (His Dark Materials #1-3)', N'Philip Pullman', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:35:35.7522494' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'01969c76-b828-41fb-a671-08dcf583c9b6', N'A Portrait of the Artist as a Young Man', N'James Joyce, Seamus Deane', CAST(N'1916-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:36:27.4353601' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e7db234c-0ecc-48ea-a672-08dcf583c9b6', N'J.R.R. Tolkien 4-Book Boxed Set: The Hobbit and The Lord of the Rings', N'J.R.R. Tolkien', CAST(N'1973-01-01T00:00:00.0000000' AS DateTime2), N'string', CAST(4.00 AS Decimal(3, 2)), 0, CAST(N'2024-10-26T06:36:44.9556292' AS DateTime2), CAST(N'2025-01-15T09:42:23.3795469' AS DateTime2), N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'36f9d634-caf9-4dd0-a673-08dcf583c9b6', N'The Man in the High Castle', N'Philip K. Dick', CAST(N'1962-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:38:21.3758868' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'875940a8-2817-42be-a674-08dcf583c9b6', N'Helter Skelter: The True Story of the Manson Murders', N'Vincent Bugliosi, Curt Gentry', CAST(N'1974-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:38:38.9273285' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'382a2821-2ce2-4e47-a675-08dcf583c9b6', N'The Alienist (Dr. Laszlo Kreizler, #1)', N'Caleb Carr', CAST(N'1994-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:39:06.6460889' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'31ef1baf-8ce6-41a5-a676-08dcf583c9b6', N'The Day of the Jackal', N'Frederick Forsyth', CAST(N'1971-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:39:29.2864122' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'5ec82680-aff0-4cba-a677-08dcf583c9b6', N'Contact', N'Carl Sagan', CAST(N'1985-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:39:54.6976932' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'db23501b-6eea-4656-a678-08dcf583c9b6', N'People of the Book', N'Geraldine Brooks', CAST(N'2008-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:40:11.2596703' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'3f4478ab-4250-4f86-a679-08dcf583c9b6', N'Steppenwolf', N'Hermann Hesse, Basil Creighton', CAST(N'1927-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:40:25.9622819' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'9d2354f1-12e1-4d41-a67a-08dcf583c9b6', N'The Surgeon (Rizzoli & Isles, #1)', N'Tess Gerritsen', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:40:39.7381600' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'8ade0b0f-581f-4391-a67b-08dcf583c9b6', N'The Sweetness at the Bottom of the Pie (Flavia de Luce, #1)', N'Alan Bradley', CAST(N'2009-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:40:57.2056646' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'ffe86a1a-5b0f-4834-a67c-08dcf583c9b6', N'A Breath of Snow and Ashes (Outlander, #6)', N'Diana Gabaldon', CAST(N'2005-01-01T00:00:00.0000000' AS DateTime2), N'string', CAST(5.00 AS Decimal(3, 2)), 0, CAST(N'2024-10-26T06:41:11.9666851' AS DateTime2), CAST(N'2025-01-15T09:41:46.7007394' AS DateTime2), N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'6f04348b-65f2-4953-a67d-08dcf583c9b6', N'A Moveable Feast', N'Ernest Hemingway', CAST(N'1964-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:41:29.8097970' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e9f1f2d5-424d-44b8-a67e-08dcf583c9b6', N'Elantris (Elantris, #1)', N'Brandon Sanderson', CAST(N'2005-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:41:43.0532640' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'17111ccd-358d-43a6-a67f-08dcf583c9b6', N'The Woman in White', N'Wilkie Collins, Matthew Sweet', CAST(N'1859-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:42:02.3562298' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'f0b98eb7-bead-49b7-a680-08dcf583c9b6', N'The Sirens of Titan', N'Kurt Vonnegut Jr.', CAST(N'1959-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:42:18.8992361' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'17acd8e6-e564-4142-a681-08dcf583c9b6', N'Winter of the World (The Century Trilogy #2)', N'Ken Follett', CAST(N'2012-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:42:33.8339176' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'dceb63c4-aeb1-495c-a682-08dcf583c9b6', N'To the Lighthouse', N'Virginia Woolf', CAST(N'1927-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:42:51.6128068' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'2d05660a-b129-4896-a683-08dcf583c9b6', N'My Ántonia', N'Willa Cather', CAST(N'1918-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:43:11.1728799' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a06f3297-aca1-4df5-a684-08dcf583c9b6', N'Anne of the Island (Anne of Green Gables, #3)', N'L.M. Montgomery', CAST(N'1915-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:43:26.6670748' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'c5ae1f2e-666a-4a5c-a685-08dcf583c9b6', N'The Lost World (Jurassic Park, #2)', N'Michael Crichton', CAST(N'1995-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:45:17.3357470' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'929cc0dd-ba33-4575-a686-08dcf583c9b6', N'Dragonflight (Dragonriders of Pern, #1)', N'Anne McCaffrey, Teodor Panasiński', CAST(N'1968-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:45:32.7640243' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'48ea8234-efb6-4348-a687-08dcf583c9b6', N'Dubliners', N'James Joyce, Jeri Johnson', CAST(N'1914-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:45:47.6830985' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'87046f88-b65f-4b65-a688-08dcf583c9b6', N'Tell No One', N'Harlan Coben', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:46:02.3264461' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'ce969ea8-e7df-4803-a689-08dcf583c9b6', N'Cryptonomicon', N'Neal Stephenson', CAST(N'1999-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:46:19.9988917' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'32123a80-b11e-47fe-a68a-08dcf583c9b6', N'The Amulet of Samarkand (Bartimaeus, #1)', N'Jonathan Stroud', CAST(N'2003-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:46:35.5707370' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'62acbaa6-3866-4d37-a68b-08dcf583c9b6', N'The Big Sleep (Philip Marlowe, #1)', N'Raymond Chandler', CAST(N'1939-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:46:50.6757888' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'6519e25a-7460-4d04-a68c-08dcf583c9b6', N'The Divine Comedy', N'Dante Alighieri, Allen Mandelbaum, Eugenio Montale', CAST(N'1308-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:47:03.6276989' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'6da65e5f-491b-4348-a68d-08dcf583c9b6', N'The Birth of Venus', N'Sarah Dunant', CAST(N'2003-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:47:18.3296794' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a5e4bcd6-7828-45ec-a68e-08dcf583c9b6', N'Mystic River', N'Dennis Lehane', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:47:32.6796619' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'1291f9aa-7945-4a36-a68f-08dcf583c9b6', N'Ulysses', N'James Joyce', CAST(N'1922-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:47:48.1427621' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'2b183f6f-a20d-42c2-a690-08dcf583c9b6', N'Loving Frank', N'Nancy Horan', CAST(N'2007-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:48:02.2847092' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'72af6f66-4a43-4a95-a691-08dcf583c9b6', N'The Ruins of Gorlan (Ranger''s Apprentice, #1)', N'John Flanagan', CAST(N'2004-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:48:16.9395344' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'317ea1cb-b163-46ad-a692-08dcf583c9b6', N'Mary Poppins (Mary Poppins, #1)', N'P.L. Travers, Mary Shepard', CAST(N'1934-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:48:38.8059777' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'39d464ae-21e9-4a52-a693-08dcf583c9b6', N'City of Thieves', N'David Benioff', CAST(N'2008-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:48:58.1372615' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'deeba544-1388-4096-a694-08dcf583c9b6', N'The Eyes of the Dragon', N'Stephen King', CAST(N'1987-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:49:12.5075320' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'17c48a1b-6dda-462e-a695-08dcf583c9b6', N'Leviathan Wakes (The Expanse, #1)', N'James S.A. Corey', CAST(N'2011-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:49:26.2782608' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'719ad278-0115-470c-a696-08dcf583c9b6', N'An Echo in the Bone (Outlander, #7)', N'Diana Gabaldon', CAST(N'2009-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:49:48.4222583' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'aaa81d5a-02e2-4167-a697-08dcf583c9b6', N'The Last Unicorn (The Last Unicorn, #1)', N'Peter S. Beagle', CAST(N'1968-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:50:04.5771078' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'9e2bb7d5-c613-4b25-a698-08dcf583c9b6', N'Pretty Girls', N'Karin Slaughter', CAST(N'2015-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:50:21.1662477' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e6d70d84-ba87-485e-a699-08dcf583c9b6', N'The House at Riverton', N'Kate Morton', CAST(N'2006-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:51:11.2300878' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'd20f8be0-4441-4a3f-a69a-08dcf583c9b6', N'The Eyre Affair (Thursday Next, #1)', N'Jasper Fforde', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:51:25.5079383' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'1a01c8f2-8072-498b-a69b-08dcf583c9b6', N'Redwall (Redwall, #1)', N'Brian Jacques', CAST(N'1986-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:51:40.0431993' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a53a0a2a-e22d-4770-a69c-08dcf583c9b6', N'Relic (Pendergast, #1)', N'Douglas Preston, Lincoln Child', CAST(N'1995-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:52:06.6107571' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'0fdd7a15-a862-4992-a69d-08dcf583c9b6', N'Pygmalion', N'George Bernard Shaw', CAST(N'1912-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:52:21.3264310' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'5e36302f-6fa6-4827-a69e-08dcf583c9b6', N'The Agony and the Ecstasy', N'Irving Stone, שמואל שניצר', CAST(N'1958-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:52:36.4228837' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'29fcd33b-b181-4efb-a69f-08dcf583c9b6', N'Furies of Calderon (Codex Alera, #1)', N'Jim Butcher', CAST(N'2004-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:52:53.3442521' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'94ea7ac1-43ab-4c95-a6a0-08dcf583c9b6', N'Alanna: The First Adventure (Song of the Lioness, #1)', N'Tamora Pierce', CAST(N'1983-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:53:12.0146326' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'5dfc9b97-ad2f-4d5c-a6a1-08dcf583c9b6', N'The Black Dahlia (L.A. Quartet, #1)', N'James Ellroy', CAST(N'1987-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:53:31.5411022' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'06a16756-f58f-4e31-a6a2-08dcf583c9b6', N'The Queen''s Fool (The Plantagenet and Tudor Novels, #12)', N'Philippa Gregory', CAST(N'2003-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:53:44.1355251' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'2fd2ffc8-f954-4f65-a6a3-08dcf583c9b6', N'The Darkest Minds (The Darkest Minds, #1)', N'Alexandra Bracken', CAST(N'2012-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:53:57.6894738' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'89baaa16-a1e8-4ed1-a6a4-08dcf583c9b6', N'Infidel', N'Ayaan Hirsi Ali', CAST(N'2006-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:54:11.4801381' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e85ef5d4-e599-43cf-a6a5-08dcf583c9b6', N'One Day in the Life of Ivan Denisovich', N'Aleksandr Solzhenitsyn, H.T. Willetts', CAST(N'1962-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:54:25.7404494' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'402cf04f-babe-4bad-a6a6-08dcf583c9b6', N'The Boleyn Inheritance (The Plantagenet and Tudor Novels, #10)', N'Philippa Gregory', CAST(N'2006-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:54:42.8420812' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'35d2d1b3-4661-4a7c-a6a7-08dcf583c9b6', N'The Underground Railroad', N'Colson Whitehead', CAST(N'2016-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:55:06.0386606' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'0a2fe425-66d1-4cff-a6a8-08dcf583c9b6', N'The Black Prism (Lightbringer, #1)', N'Brent Weeks', CAST(N'2010-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:55:20.1227945' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'cb843018-7336-468a-a6a9-08dcf583c9b6', N'The Island of Dr. Moreau', N'H.G. Wells', CAST(N'1896-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:55:33.9955805' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'c29262d5-41e9-477f-a6aa-08dcf583c9b6', N'Ethan Frome', N'Edith Wharton', CAST(N'1911-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:55:48.7587908' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'6f971bb8-17fa-4d97-a6ab-08dcf583c9b6', N'The Electric Kool-Aid Acid Test', N'Tom Wolfe', CAST(N'1968-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:56:04.0285094' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e9386b9f-e03c-4119-a6ac-08dcf583c9b6', N'The Left Hand of Darkness', N'Ursula K. Le Guin, Lech Jęczmyk', CAST(N'1969-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:56:19.7603050' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'ae6e72e3-95fa-4a6f-a6ad-08dcf583c9b6', N'Revolutionary Road', N'Richard Yates', CAST(N'1961-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:57:13.7544668' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'4b42c69c-48bd-4770-a6ae-08dcf583c9b6', N'Rosencrantz and Guildenstern Are Dead', N'Tom Stoppard, Henry Popkin', CAST(N'1966-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:57:31.8509722' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a0c7cf49-ee98-47c4-a6af-08dcf583c9b6', N'Magician: Apprentice (The Riftwar Saga, #1)', N'Raymond E. Feist', CAST(N'1982-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:57:48.8404371' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a2f939dd-15b8-478d-a6b0-08dcf583c9b6', N'The Maltese Falcon', N'Dashiell Hammett', CAST(N'1930-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:58:03.0603483' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'8442fc1e-7e9f-4ede-a6b1-08dcf583c9b6', N'Ivanhoe', N'Walter Scott', CAST(N'1819-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:58:26.2778006' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'7cfb9b26-7ff3-4eae-a6b2-08dcf583c9b6', N'The Poet (Jack McEvoy, #1; Harry Bosch Universe, #5)', N'Michael Connelly', CAST(N'1996-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:58:41.1861447' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'df5741b3-a8fd-402c-a6b3-08dcf583c9b6', N'A Scanner Darkly', N'Philip K. Dick', CAST(N'1977-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:58:58.7419777' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'f3265d22-c114-4b8d-a6b4-08dcf583c9b6', N'A Connecticut Yankee in King Arthur''s Court', N'Mark Twain', CAST(N'1889-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:59:13.8508184' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'd2992f0a-1e78-4899-a6b5-08dcf583c9b6', N'Red Storm Rising', N'Tom Clancy', CAST(N'1986-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:59:27.7254426' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'dd90795d-f86f-4f4d-a6b6-08dcf583c9b6', N'The Day of the Triffids', N'John Wyndham', CAST(N'1951-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T06:59:45.2601609' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'fe70acec-7cc3-4f60-a6b7-08dcf583c9b6', N'Prince of Thorns (The Broken Empire, #1)', N'Mark Lawrence', CAST(N'2011-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:00:05.1503356' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'828d16eb-fa84-486a-a6b8-08dcf583c9b6', N'The House of the Scorpion (Matteo Alacran, #1)', N'Nancy Farmer', CAST(N'2002-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:00:23.3702040' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'35e880ef-94ee-4ac3-a6b9-08dcf583c9b6', N'I Hope They Serve Beer in Hell (Tucker Max, #1)', N'Tucker Max', CAST(N'2006-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:00:43.0940778' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'1b839685-5d6b-442e-a6ba-08dcf583c9b6', N'Mother Night', N'Kurt Vonnegut Jr.', CAST(N'1961-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:00:58.3546155' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'42416b28-f05d-4f9c-a6bb-08dcf583c9b6', N'Size 12 Is Not Fat (Heather Wells, #1)', N'Meg Cabot', CAST(N'2005-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:01:16.5973264' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'dbd63c55-3cd6-4d12-a6bc-08dcf583c9b6', N'Dark Matter', N'Blake Crouch', CAST(N'2016-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:01:33.0091335' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'cf3b8b3e-0060-4c6f-a6bd-08dcf583c9b6', N'Leviathan (Leviathan, #1)', N'Scott Westerfeld', CAST(N'2009-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:01:54.7313165' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'2ec71667-3da1-44b3-a6be-08dcf583c9b6', N'The Crying of Lot 49', N'Thomas Pynchon', CAST(N'1966-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:02:13.0684450' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'12613ade-901b-454f-a6bf-08dcf583c9b6', N'Ubik', N'Philip K. Dick, David Alabort, Manuel Espín', CAST(N'1969-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:02:28.3292325' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'6fcee73d-aaef-414d-a6c0-08dcf583c9b6', N'Sahara (Dirk Pitt, #11)', N'Clive Cussler', CAST(N'1992-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:02:45.3821219' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'c5329a0f-cdb8-4c23-a6c1-08dcf583c9b6', N'Child 44 (Leo Demidov, #1)', N'Tom Rob Smith', CAST(N'2008-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:03:51.6138115' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'fd1ca344-abf4-4a64-a6c2-08dcf583c9b6', N'Soulless (Parasol Protectorate, #1)', N'Gail Carriger', CAST(N'2009-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:04:11.4354426' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'4c471e98-6044-48b3-a6c3-08dcf583c9b6', N'Just One Day (Just One Day, #1)', N'Gayle Forman', CAST(N'2013-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:04:28.0375826' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'bfaa42bb-c767-4022-a6c4-08dcf583c9b6', N'I Am Legend', N'Richard Matheson', CAST(N'1954-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:04:47.5247545' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a50ac001-dace-41b3-a6c5-08dcf583c9b6', N'Rules of Prey (Lucas Davenport, #1)', N'John Sandford', CAST(N'1989-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:05:05.9896550' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'575a581d-e722-4d82-a6c6-08dcf583c9b6', N'The Yiddish Policemen''s Union', N'Michael Chabon', CAST(N'2007-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:05:21.2324843' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'9136dcc5-031e-43c2-a6c7-08dcf583c9b6', N'The Elements of Style', N'William Strunk Jr., E.B. White', CAST(N'1918-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:05:35.5981940' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'6d8b260b-f331-4be7-a6c8-08dcf583c9b6', N'The Turn of the Screw', N'Henry James', CAST(N'1898-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:05:52.6665776' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'37837daa-6b9d-4201-a6c9-08dcf583c9b6', N'Stoner', N'John Williams, John McGahern', CAST(N'1965-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:06:07.7083934' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'1933ed78-a24a-4270-a6ca-08dcf583c9b6', N'Pollyanna (Pollyanna, #1)', N'Eleanor H. Porter', CAST(N'1912-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:06:21.2750870' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a94e724f-bfce-44a2-a6cb-08dcf583c9b6', N'Blood Song (Raven''s Shadow, #1)', N'Anthony Ryan', CAST(N'2011-01-01T00:00:00.0000000' AS DateTime2), N'string', CAST(4.00 AS Decimal(3, 2)), 0, CAST(N'2024-10-26T07:06:36.8938505' AS DateTime2), CAST(N'2025-01-15T09:40:55.9283051' AS DateTime2), N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'd83566dd-c10a-4f86-a6cc-08dcf583c9b6', N'The Arabian Nights', N'Anonymous, Richard Francis Burton, A.S. Byatt', CAST(N'0800-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:08:34.9788200' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'c3c6fd5b-2eda-4096-a6cd-08dcf583c9b6', N'The Wasp Factory', N'Iain Banks', CAST(N'1984-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:08:54.7437587' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a811d4cc-565d-4ac8-a6ce-08dcf583c9b6', N'Howards End', N'E.M. Forster', CAST(N'1910-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:09:13.4682094' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a493ffe8-0a0a-4436-a6cf-08dcf583c9b6', N'The Haunting of Hill House', N'Shirley Jackson, Laura Miller', CAST(N'1959-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:09:26.9122135' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'67aec0bd-1c24-4722-a6d0-08dcf583c9b6', N'Fool''s Errand (Tawny Man, #1)', N'Robin Hobb', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:09:39.8469408' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'f8ee2b86-4310-4918-a6d1-08dcf583c9b6', N'Ghost Story', N'Peter Straub', CAST(N'1979-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:09:59.3142792' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a546a2f2-6655-4e00-a6d2-08dcf583c9b6', N'The Illustrated Man', N'Ray Bradbury', CAST(N'1951-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:10:14.5725942' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'bec49637-24c6-476c-a6d3-08dcf583c9b6', N'Travels with Charley: In Search of America', N'John Steinbeck', CAST(N'1962-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:10:28.4421762' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'cd2e9db3-9edf-41e6-a6d4-08dcf583c9b6', N'The Dovekeepers', N'Alice Hoffman', CAST(N'2011-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:10:47.9897940' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'89e55198-f124-44c8-a6d5-08dcf583c9b6', N'Bring Up the Bodies (Thomas Cromwell, #2)', N'Hilary Mantel', CAST(N'2012-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:11:37.3943240' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'be8babe9-a14c-42b9-a6d6-08dcf583c9b6', N'The Moonstone', N'Wilkie Collins, Carolyn G. Heilbrun', CAST(N'1868-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:11:58.4098783' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'744442b4-d3f0-4f12-a6d7-08dcf583c9b6', N'Ramona the Pest (Ramona, #2)', N'Beverly Cleary', CAST(N'1968-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:12:11.8541574' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'0c6b7d47-62e0-4ea9-a6d8-08dcf583c9b6', N'The Woods', N'Harlan Coben', CAST(N'2007-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:12:26.1842620' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'd51fe91e-2edb-4ce6-a6d9-08dcf583c9b6', N'Gorky Park (Arkady Renko, #1)', N'Martin Cruz Smith', CAST(N'1981-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:12:38.3567215' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'17ff5132-6af3-44a6-a6da-08dcf583c9b6', N'Anathem', N'Neal Stephenson', CAST(N'2008-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:12:52.3814991' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'f164601f-38a4-4292-a6db-08dcf583c9b6', N'The Sneetches and Other Stories', N'Dr. Seuss', CAST(N'1961-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:13:06.6791110' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'881028e9-a94f-4253-a6dc-08dcf583c9b6', N'Demian. Die Geschichte von Emil Sinclairs Jugend', N'Hermann Hesse', CAST(N'1919-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:13:23.9737387' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'38683830-cedd-4fa6-a6dd-08dcf583c9b6', N'The Magicians'' Guild (Black Magician Trilogy, #1)', N'Trudi Canavan', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:13:38.6397264' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'294a8fb3-f8de-4ae9-a6de-08dcf583c9b6', N'The Book of Three (The Chronicles of Prydain, #1)', N'Lloyd Alexander', CAST(N'1964-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:13:54.2689750' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'3f50a994-84c5-40e1-a6df-08dcf583c9b6', N'Papillon', N'Henri Charrière', CAST(N'1969-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:14:08.4947284' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'62c49110-1b42-404e-a6e0-08dcf583c9b6', N'The 19th Wife', N'David Ebershoff', CAST(N'2008-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:14:27.3902864' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'f2d3369b-b767-4ef7-a6e1-08dcf583c9b6', N'Red Mars (Mars Trilogy, #1)', N'Kim Stanley Robinson', CAST(N'1993-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:14:41.4187904' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'8f519c3f-571a-49f6-a6e2-08dcf583c9b6', N'Faceless Killers (Kurt Wallander, #1)', N'Henning Mankell, Steven T. Murray', CAST(N'1991-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:14:55.3561626' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'33d01de9-df3e-41c6-a6e3-08dcf583c9b6', N'Solaris', N'Stanisław Lem', CAST(N'1961-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:15:08.4851333' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'0f5ac57e-e955-4712-a6e4-08dcf583c9b6', N'Altered Carbon (Takeshi Kovacs, #1)', N'Richard K. Morgan', CAST(N'2002-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:15:24.4737737' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'eb751d0b-343f-4b13-a6e5-08dcf583c9b6', N'Who''s Afraid of Virginia Woolf?', N'Edward Albee', CAST(N'1962-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:15:37.6222098' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'87e78e25-06b5-4ade-a6e6-08dcf583c9b6', N'Kushiel''s Dart (Phèdre''s Trilogy, #1)', N'Jacqueline Carey', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:16:27.7985680' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'aa45df16-2742-4219-a6e7-08dcf583c9b6', N'The Children of Húrin', N'J.R.R. Tolkien, Christopher Tolkien, Alan Lee', CAST(N'2007-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:16:44.2304065' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'2644dc20-393b-4924-a6e8-08dcf583c9b6', N'The Song of Achilles', N'Madeline Miller', CAST(N'2011-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T07:16:58.2730666' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e0a239b3-6e64-4e3a-a6e9-08dcf583c9b6', N'The Dragonbone Chair (Memory, Sorrow, and Thorn, #1)', N'Tad Williams', CAST(N'1988-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:32:57.5915778' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'456ca525-eb37-465f-a6ea-08dcf583c9b6', N'Map of Bones (Sigma Force, #2)', N'James Rollins', CAST(N'2005-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:33:11.8731038' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'912bb12f-bfc0-4b54-a6ec-08dcf583c9b6', N'The Last Kingdom (The Saxon Stories, #1)', N'Bernard Cornwell', CAST(N'2004-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:33:45.9596531' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'dd6b14b3-655d-4eac-a6ed-08dcf583c9b6', N'Persuader (Jack Reacher, #7)', N'Lee Child', CAST(N'2003-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:34:01.8564997' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'8bc453f8-2224-4dd5-a6ee-08dcf583c9b6', N'His Majesty''s Dragon (Temeraire, #1)', N'Naomi Novik', CAST(N'2006-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:34:16.9828610' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'ac762833-d1e8-468f-a6ef-08dcf583c9b6', N'Swan Song', N'Robert McCammon', CAST(N'1987-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:34:32.7722356' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'091a360e-ded9-4e95-a6f0-08dcf583c9b6', N'The Bronze Horseman (The Bronze Horseman, #1)', N'Paullina Simons', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:34:50.6678156' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'ad291430-57f9-4052-a6f1-08dcf583c9b6', N'The Red Queen (The Plantagenet and Tudor Novels, #3)', N'Philippa Gregory', CAST(N'2010-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:35:08.7327561' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'bb7bd5a1-aa9f-45bc-a6f2-08dcf583c9b6', N'Marvel 1602', N'Neil Gaiman, Andy Kubert, Richard Isanove, Peter Sanderson', CAST(N'2003-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:35:28.6924473' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'fcbcd6b5-35ac-4380-a6f3-08dcf583c9b6', N'The Incredible Journey', N'Sheila Burnford', CAST(N'1960-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:35:45.3238889' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'bd772c0d-8237-487a-a6f4-08dcf583c9b6', N'March', N'Geraldine Brooks', CAST(N'2004-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:36:03.0984605' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'dfde2a16-7c3c-4975-a6f5-08dcf583c9b6', N'The Lost World (Professor Challenger, #1)', N'Arthur Conan Doyle', CAST(N'1912-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:36:18.8402402' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'72f28849-c5ee-45d2-a6f6-08dcf583c9b6', N'Kindred', N'Octavia E. Butler', CAST(N'1979-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:36:52.2391073' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'b13a3f3e-7cdf-445c-a6f7-08dcf583c9b6', N'A Princess of Mars (Barsoom, #1)', N'Edgar Rice Burroughs, John Seelye', CAST(N'1912-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:37:06.8853409' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'3c88aa07-19fa-4eeb-a6f8-08dcf583c9b6', N'Wild Magic (Immortals, #1)', N'Tamora Pierce', CAST(N'1992-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:37:24.2184497' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'efb85a02-f21b-4980-a6f9-08dcf583c9b6', N'Prelude to Foundation', N'Isaac Asimov', CAST(N'1988-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:37:39.9155628' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'f0e0c76b-5747-4b8b-a6fa-08dcf583c9b6', N'The Sparrow (The Sparrow, #1)', N'Mary Doria Russell', CAST(N'1996-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:37:56.6891616' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'87321272-2597-49ea-a6fc-08dcf583c9b6', N'We Have Always Lived in the Castle', N'Shirley Jackson, Jonathan Lethem', CAST(N'1962-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:38:16.9557866' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'71401609-2e1c-466e-a6fd-08dcf583c9b6', N'Cane River', N'Lalita Tademy', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:38:33.1492284' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'41f407fe-c317-4045-a6fe-08dcf583c9b6', N'Ship of Magic (Liveship Traders, #1)', N'Robin Hobb', CAST(N'1998-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:39:56.4910810' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'cdfa2b4c-3416-47e3-a6ff-08dcf583c9b6', N'The Three-Body Problem (Remembrance of Earth’s Past, #1)', N'Liu Cixin, Ken Liu', CAST(N'2007-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:40:10.6100671' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'c0117cba-6c5b-4980-a700-08dcf583c9b6', N'Superman: Red Son', N'Mark Millar, Kilian Plunkett, Andrew Robinson, Walden Wong, Dave Johnson', CAST(N'2003-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:40:24.4984510' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'fa3d25d2-e380-4208-a701-08dcf583c9b6', N'King of Thorns (The Broken Empire, #2)', N'Mark Lawrence', CAST(N'2012-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:40:38.8148539' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'3f6bea82-d705-4f25-a702-08dcf583c9b6', N'The Virgin''s Lover (The Plantagenet and Tudor Novels, #13)', N'Philippa Gregory', CAST(N'2004-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:40:53.7916510' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'125f647e-0b41-4773-a703-08dcf583c9b6', N'The Gods Themselves', N'Isaac Asimov', CAST(N'1972-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:41:09.1570122' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'c7751b95-d004-41ff-a704-08dcf583c9b6', N'Wide Sargasso Sea', N'Jean Rhys', CAST(N'1966-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:41:23.5746941' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'6ce13f84-221e-49ef-a705-08dcf583c9b6', N'The Magus', N'John Fowles', CAST(N'1965-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:41:39.9914944' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'f51b8046-1d38-4667-a706-08dcf583c9b6', N'Anne''s House of Dreams (Anne of Green Gables, #5)', N'L.M. Montgomery', CAST(N'1917-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:41:54.2793634' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'7cb1c3cd-51d1-4247-a707-08dcf583c9b6', N'Best Served Cold', N'Joe Abercrombie', CAST(N'2009-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:42:08.6545753' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'6714d7a9-a6a3-45b8-a708-08dcf583c9b6', N'The First Fifteen Lives of Harry August', N'Claire North', CAST(N'2014-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:42:24.3347829' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'089053ca-4f74-43b0-a709-08dcf583c9b6', N'The Guns of August', N'Barbara W. Tuchman, Robert K. Massie', CAST(N'1962-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:42:36.9329980' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'f29ccdaa-db30-4f32-a70a-08dcf583c9b6', N'Crocodile on the Sandbank (Amelia Peabody #1)', N'Elizabeth Peters', CAST(N'1975-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:42:49.5293679' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'34d18590-254d-42d2-a70b-08dcf583c9b6', N'Theft of Swords (The Riyria Revelations, #1-2)', N'Michael J. Sullivan', CAST(N'2011-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:43:04.7145963' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'8b33dbcd-1337-4ab2-a70c-08dcf583c9b6', N'Of Human Bondage', N'W. Somerset Maugham, Benjamin DeMott, Maeve Binchy', CAST(N'1915-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:43:18.6359930' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'c8f930b9-8572-413c-a70d-08dcf583c9b6', N'Undead and Unwed (Undead, #1)', N'MaryJanice Davidson', CAST(N'2004-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:43:34.4126430' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'7f9d6533-bd5f-41f0-a70e-08dcf583c9b6', N'Ariel', N'Sylvia Plath', CAST(N'1965-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:43:49.4225582' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'ddb859d2-8433-4383-a70f-08dcf583c9b6', N'The Blue Sword (Damar, #1)', N'Robin McKinley', CAST(N'1982-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:44:04.6925872' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'3088e25a-ced0-4e11-a710-08dcf583c9b6', N'Sons and Lovers', N'D.H. Lawrence, Geoff Dyer', CAST(N'1913-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:44:20.4575723' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'38d6b1f6-e7d1-4bf7-a711-08dcf583c9b6', N'The Hero and the Crown (Damar, #2)', N'Robin McKinley', CAST(N'1984-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:44:33.5496974' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'299ad7f6-2433-41dc-a712-08dcf583c9b6', N'Fox in Socks', N'Dr. Seuss', CAST(N'1965-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:46:51.5825530' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'2242d9e9-a06d-4141-a713-08dcf583c9b6', N'The Dark Is Rising (The Dark is Rising, #2)', N'Susan Cooper', CAST(N'1973-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:47:10.6033966' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'48d0c2e5-a593-478c-a714-08dcf583c9b6', N'True Colors', N'Kristin Hannah', CAST(N'2009-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:47:24.3712154' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'6eed2154-f4d6-4bf1-a715-08dcf583c9b6', N'Valley of the Dolls', N'Jacqueline Susann', CAST(N'1966-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:47:43.4130861' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'52dce316-66c9-40da-a716-08dcf583c9b6', N'The Collector', N'John Fowles', CAST(N'1963-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:48:03.9439229' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'b2f725eb-1a55-44c4-a717-08dcf583c9b6', N'The Essential Rumi', N'Jalaluddin Rumi, Coleman Barks', CAST(N'1273-01-01T00:00:00.0000000' AS DateTime2), N'string', CAST(4.00 AS Decimal(3, 2)), 0, CAST(N'2024-10-26T08:48:17.6334713' AS DateTime2), CAST(N'2025-01-15T09:40:24.7257701' AS DateTime2), N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'000463d4-e517-4222-a718-08dcf583c9b6', N'Born Free: A Lioness of Two Worlds (Story of Elsa, #1)', N'Joy Adamson', CAST(N'1960-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:48:32.0217251' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'8f7839ba-1582-4e09-a719-08dcf583c9b6', N'The Stars My Destination', N'Alfred Bester, Neil Gaiman', CAST(N'1955-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:48:49.5427609' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'fdce9dc8-7b8a-464d-a71a-08dcf583c9b6', N'UnEnchanted (An Unfortunate Fairy Tale, #1)', N'Chanda Hahn', CAST(N'2011-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:49:04.1431740' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'8cec69da-a861-4ce4-a71b-08dcf583c9b6', N'The Talented Mr. Ripley (Ripley, #1)', N'Patricia Highsmith', CAST(N'1955-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:49:42.3549196' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'989c250c-10d1-4ad6-a71c-08dcf583c9b6', N'Gone for Good', N'Harlan Coben', CAST(N'2002-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:49:55.5290625' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'25c38a84-a3ec-4d85-a71d-08dcf583c9b6', N'Quicksilver (The Baroque Cycle, #1)', N'Neal Stephenson', CAST(N'2003-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:50:09.6949187' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'b4de7d58-9168-42aa-a71e-08dcf583c9b6', N'Pale Fire', N'Vladimir Nabokov', CAST(N'1962-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:50:22.8911885' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'ba8fe4f7-44c9-476c-a71f-08dcf583c9b6', N'The Winter of Our Discontent', N'John Steinbeck, Susan Shillinglaw', CAST(N'1961-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:50:59.7319380' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'31045a9a-667b-4fd9-a720-08dcf583c9b6', N'Hold Tight', N'Harlan Coben', CAST(N'2008-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:51:13.4558910' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'f7a4e7d2-5953-48ef-a721-08dcf583c9b6', N'The Lathe of Heaven', N'Ursula K. Le Guin', CAST(N'1971-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:51:28.3641614' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'f691e829-781b-4151-a722-08dcf583c9b6', N'Alas, Babylon', N'Pat Frank', CAST(N'1959-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:51:44.6609668' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'da190a53-98d1-4ba3-a723-08dcf583c9b6', N'Doomsday Book (Oxford Time Travel, #1)', N'Connie Willis', CAST(N'1992-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:52:00.1479769' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'16268661-a6cc-406f-a724-08dcf583c9b6', N'The End of Eternity', N'Isaac Asimov', CAST(N'1955-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:52:20.4332056' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'31ef595f-be66-4318-a725-08dcf583c9b6', N'Gateway (Heechee Saga, #1)', N'Frederik Pohl', CAST(N'1977-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:52:34.5364846' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'd18bd9c3-5a58-49b9-a726-08dcf583c9b6', N'The Plot Against America', N'Philip Roth', CAST(N'2004-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:56:41.8682768' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a7beb8d7-6c23-4d78-a727-08dcf583c9b6', N'Burning Chrome (Sprawl, #0)', N'William Gibson, Bruce Sterling', CAST(N'1986-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:56:57.1741112' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'2ee525ae-c556-424c-a728-08dcf583c9b6', N'Tigana', N'Guy Gavriel Kay', CAST(N'1990-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:57:13.4381833' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'14941474-f0b5-4dc3-a729-08dcf583c9b6', N'O Pioneers!', N'Willa Cather', CAST(N'1913-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:57:29.6780395' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'b3ca6dcb-9335-45bf-a72a-08dcf583c9b6', N'On Basilisk Station (Honor Harrington, #1)', N'David Weber', CAST(N'1992-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:57:44.3217408' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'3dcaf733-a942-47bc-a72b-08dcf583c9b6', N'Sandstorm (Sigma Force, #1)', N'James Rollins', CAST(N'2004-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:58:24.0558598' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'2bf99e02-cf96-4549-a72c-08dcf583c9b6', N'The Charm School', N'Nelson DeMille', CAST(N'1988-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:58:38.6924497' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'20fd1572-dcb1-4305-a72d-08dcf583c9b6', N'The Real Mother Goose', N'Blanche Fisher Wright', CAST(N'1916-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:58:56.5749503' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'075dca17-660f-4ea2-a72e-08dcf583c9b6', N'The Bane Chronicles', N'Cassandra Clare, Sarah Rees Brennan, Maureen Johnson, Cassandra Jean', CAST(N'2014-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:59:13.9272083' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'5f093a92-46db-4485-a72f-08dcf583c9b6', N'The Other Queen (The Plantagenet and Tudor Novels, #15)', N'Philippa Gregory', CAST(N'2008-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:59:35.0216780' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'427adff2-88a8-4425-a730-08dcf583c9b6', N'The Black Company (The Chronicles of the Black Company, #1)', N'Glen Cook', CAST(N'1984-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T08:59:55.2468323' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'3a6c7fe6-fd44-43eb-a731-08dcf583c9b6', N'The Crimson Petal and the White', N'Michel Faber', CAST(N'2002-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:00:15.8905852' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'35460435-7f91-4a31-a732-08dcf583c9b6', N'The Crystal Cave (Arthurian Saga, #1)', N'Mary Stewart', CAST(N'1970-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:00:31.8652179' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'55f2bd93-5660-4697-a733-08dcf583c9b6', N'Tarzan of the Apes (Tarzan, #1)', N'Edgar Rice Burroughs', CAST(N'1912-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:00:49.8284793' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'35f89fad-aa00-42b0-a734-08dcf583c9b6', N'Smilla''s Sense of Snow', N'Peter Høeg, Tiina Nunnally', CAST(N'1992-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:01:11.2795176' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'9710fd7f-945a-4f1c-a735-08dcf583c9b6', N'Spin (Spin, #1)', N'Robert Charles Wilson', CAST(N'2005-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:01:29.5412101' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'bd67ed05-4883-462f-a736-08dcf583c9b6', N'A Gentleman in Moscow', N'Amor Towles', CAST(N'2016-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:01:43.5335116' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'125b2bb5-2c80-48a8-a737-08dcf583c9b6', N'Johnny Got His Gun', N'Dalton Trumbo', CAST(N'1939-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:01:59.7225768' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'55cef01d-92e6-428e-a738-08dcf583c9b6', N'The Dark Elf Trilogy Collector''s Edition (Forgotten Realms: Dark Elf Trilogy, #1-3; Legend of Drizzt, #1-3)', N'R.A. Salvatore', CAST(N'1998-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:02:16.2597037' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'17061042-e5f9-4979-a739-08dcf583c9b6', N'Grendel', N'John Gardner', CAST(N'1970-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:02:30.0824423' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'1b8a314e-25b9-472f-a73a-08dcf583c9b6', N'Parable of the Sower (Earthseed, #1)', N'Octavia E. Butler', CAST(N'1993-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:07:21.4426923' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'cad2c026-ded3-4972-a73b-08dcf583c9b6', N'Daddy-Long-Legs (Daddy-Long-Legs, #1)', N'Jean Webster', CAST(N'1912-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:08:12.9922652' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'4df2b90b-7e51-4fbf-a73c-08dcf583c9b6', N'The Prime of Miss Jean Brodie', N'Muriel Spark', CAST(N'1961-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:08:36.0545496' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'8f651a97-61f5-44a3-a73d-08dcf583c9b6', N'Encyclopedia Brown, Boy Detective (Encyclopedia Brown, #1)', N'Donald J. Sobol', CAST(N'1963-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:08:55.1469385' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'282f76cd-43d2-4bc4-a73e-08dcf583c9b6', N'Dissolution (Matthew Shardlake, #1)', N'C.J. Sansom', CAST(N'2003-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:09:16.0874471' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'8538dda6-d2a5-4393-a73f-08dcf583c9b6', N'Across the Nightingale Floor (Tales of the Otori, #1)', N'Lian Hearn', CAST(N'2002-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:09:32.3677049' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'5f0fe4d3-4cb7-4fc0-a740-08dcf583c9b6', N'Innocent Traitor', N'Alison Weir', CAST(N'2006-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:09:52.2560219' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'22cd775f-4c2b-4b4e-a741-08dcf583c9b6', N'Seventh Son (Tales of Alvin Maker, #1)', N'Orson Scott Card', CAST(N'1987-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:10:13.7503184' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'706120ce-cee7-44c5-a742-08dcf583c9b6', N'Nefertiti', N'Michelle Moran', CAST(N'2007-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:10:32.7749679' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'1baff885-df3e-413c-a743-08dcf583c9b6', N'Roadside Picnic', N'Arkady Strugatsky, Boris Strugatsky, Antonina W. Bouis, Theodore Sturgeon', CAST(N'1972-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:10:48.0425314' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'38dbd179-c6c0-4600-a744-08dcf583c9b6', N'My Man Jeeves (Jeeves, #1)', N'P.G. Wodehouse', CAST(N'1919-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:13:34.3779321' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'1679221d-45b2-46cd-a745-08dcf583c9b6', N'A Great Deliverance (Inspector Lynley, #1)', N'Elizabeth George', CAST(N'1988-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:13:49.8619207' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'b3f9a495-0bd2-4bfb-a746-08dcf583c9b6', N'Pompeii', N'Robert Harris', CAST(N'2003-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:14:08.4720276' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'aa643f21-512b-47ab-a748-08dcf583c9b6', N'Le Morte d''Arthur: King Arthur and the Legends of the Round Table', N'Thomas Malory, Keith Baines, Robert Graves', CAST(N'1485-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:14:41.2750027' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'b64aff8a-54ff-41d1-a749-08dcf583c9b6', N'The Heretic''s Daughter', N'Kathleen Kent', CAST(N'2008-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:14:57.3920221' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'bcbd0a96-141d-4447-a74a-08dcf583c9b6', N'The Reality Dysfunction (Night''s Dawn, #1)', N'Peter F. Hamilton', CAST(N'1996-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:15:12.2423725' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'ca0f7dd6-e52f-462f-a74b-08dcf583c9b6', N'Black Order (Sigma Force, #3)', N'James Rollins', CAST(N'2006-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:15:26.9547608' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'830cf622-d58b-4cf9-a74c-08dcf583c9b6', N'New York', N'Edward Rutherfurd', CAST(N'2009-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:15:41.9788566' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'0e20ee7d-0a53-4ee4-a74d-08dcf583c9b6', N'Mistress of the Art of Death (Mistress of the Art of Death, #1)', N'Ariana Franklin', CAST(N'2007-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:15:55.2287798' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'4d63c0e2-7df8-4a3b-a74e-08dcf583c9b6', N'The Decameron', N'Giovanni Boccaccio, G.H. McWilliam', CAST(N'1353-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:32:42.8287367' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'13eeeaa2-8b64-414e-a74f-08dcf583c9b6', N'True Grit', N'Charles Portis', CAST(N'1968-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:32:55.6566725' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'dd2b19ce-cbbe-4536-a750-08dcf583c9b6', N'Silent Spring', N'Rachel Carson, Linda Lear, Edward O. Wilson', CAST(N'1962-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:33:09.5211144' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'71f4c2d6-42ad-42bc-a751-08dcf583c9b6', N'Behemoth (Leviathan, #2)', N'Scott Westerfeld, Keith Thompson', CAST(N'2010-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:33:22.6921859' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'2e09f330-220e-408c-a752-08dcf583c9b6', N'Island Beneath the Sea', N'Isabel Allende, Margaret Sayers Peden', CAST(N'2009-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:33:35.6272052' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'8ce4089f-ecba-4eeb-a753-08dcf583c9b6', N'Winesburg, Ohio', N'Sherwood Anderson', CAST(N'1919-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:33:47.5748134' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'91646013-eef3-48d7-a754-08dcf583c9b6', N'The Three Stigmata of Palmer Eldritch', N'Philip K. Dick', CAST(N'1965-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:34:01.0399185' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'030baa0d-aa14-40b0-a755-08dcf583c9b6', N'The Diamond Throne (The Elenium, #1)', N'David Eddings', CAST(N'1989-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:34:13.4620911' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'3631d0cd-709a-4567-a756-08dcf583c9b6', N'Prince of Wolves (The Grey Wolves, #1)', N'Quinn Loftis', CAST(N'2011-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:34:26.1638530' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'f642a653-1bc8-4af8-a757-08dcf583c9b6', N'The Humans', N'Matt Haig', CAST(N'2013-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:34:45.0433494' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'd471ae9e-3f8a-4927-a758-08dcf583c9b6', N'Ice Station (Shane Schofield, #1)', N'Matthew Reilly', CAST(N'1998-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:35:01.3366385' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'bfc192cb-992e-4bfa-a759-08dcf583c9b6', N'The Ruins', N'Scott B. Smith', CAST(N'2006-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:35:14.0172243' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'6eb6fd2e-781b-4b06-a75a-08dcf583c9b6', N'The Night Angel Trilogy (Night Angel, #1-3)', N'Brent Weeks', CAST(N'2009-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:35:28.0934232' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'f869770e-9bc7-4b34-a75b-08dcf583c9b6', N'The Judas Strain (Sigma Force, #4)', N'James Rollins', CAST(N'2007-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:35:40.7169271' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'c5618914-b7b9-48d8-a75c-08dcf583c9b6', N'Fatherland', N'Robert Harris', CAST(N'1992-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:35:53.6996699' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'775d3b2d-5490-4303-a75d-08dcf583c9b6', N'The Fallen Star (Fallen Star, #1)', N'Jessica Sorensen', CAST(N'2011-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:36:05.7941978' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'b0a095b3-f8d6-426e-a75e-08dcf583c9b6', N'The Fifth Season (The Broken Earth, #1)', N'N.K. Jemisin', CAST(N'2015-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:36:20.4747266' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'77849455-e3be-4467-a75f-08dcf583c9b6', N'Amazonia', N'James Rollins', CAST(N'2002-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:36:33.0890942' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'ddb06f22-12be-4f09-a760-08dcf583c9b6', N'Inca Gold (Dirk Pitt, #12)', N'Clive Cussler', CAST(N'1994-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:36:45.5517040' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e496a66b-1651-462d-a761-08dcf583c9b6', N'Daughter of the Empire (The Empire Trilogy, #1)', N'Raymond E. Feist, Janny Wurts', CAST(N'1987-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:37:06.5437565' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'bbe03a01-1a70-4628-a762-08dcf583c9b6', N'The Postman Always Rings Twice', N'James M. Cain', CAST(N'1934-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:38:08.9135087' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'8cece556-1ddb-47dc-a763-08dcf583c9b6', N'The Lady Elizabeth', N'Alison Weir', CAST(N'2008-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:38:34.6093924' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'598f243a-a87d-4b92-a764-08dcf583c9b6', N'The Man Who Was Thursday: A Nightmare', N'G.K. Chesterton, Jonathan Lethem', CAST(N'1908-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:38:46.3470283' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'976d3acc-daf9-48b1-a765-08dcf583c9b6', N'Stories of Your Life and Others', N'Ted Chiang', CAST(N'2002-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:39:02.0213361' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'636e8754-b55d-4d30-a766-08dcf583c9b6', N'Arrows of the Queen (Heralds of Valdemar, #1)', N'Mercedes Lackey', CAST(N'1987-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:39:16.4054320' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'7c68ddb0-c7b9-4702-a768-08dcf583c9b6', N'Throne of Jade (Temeraire, #2)', N'Naomi Novik', CAST(N'2006-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:39:46.7539760' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'5336da36-caf8-448e-a769-08dcf583c9b6', N'The Great Book of Amber (The Chronicles of Amber, #1-10)', N'Roger Zelazny', CAST(N'1999-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:40:02.9644900' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a34db8fc-81fc-4d64-a76a-08dcf583c9b6', N'Dragon Wing (The Death Gate Cycle, #1)', N'Margaret Weis, Tracy Hickman', CAST(N'1990-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:40:16.4849961' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e49d322e-837a-4d49-a76b-08dcf583c9b6', N'The Thin Man', N'Dashiell Hammett', CAST(N'1934-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:40:28.8911974' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'89444f1e-05ea-4472-a76c-08dcf583c9b6', N'Death in Venice', N'Thomas Mann, Michael Henry Heim, Michael Cunningham', CAST(N'1912-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:40:44.1157956' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'f6b19002-cdb9-4c48-a76d-08dcf583c9b6', N'Green Rider (Green Rider, #1)', N'Kristen Britain', CAST(N'1998-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:40:57.2426419' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'cdbfb114-0013-4e60-a76e-08dcf583c9b6', N'The Dragonriders of Pern (Dragonriders of Pern, #1-3)', N'Anne McCaffrey', CAST(N'1968-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:41:13.8633228' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'9270cd13-1416-48b7-a76f-08dcf583c9b6', N'The Curse of Chalion (World of the Five Gods, #1)', N'Lois McMaster Bujold', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:41:34.0095079' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'6d9f50d0-8967-4730-a770-08dcf583c9b6', N'Raise the Titanic! (Dirk Pitt, #4)', N'Clive Cussler', CAST(N'1976-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:41:51.1182166' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'4af8fba0-635e-423d-a771-08dcf583c9b6', N'Rainbow Valley (Anne of Green Gables, #7)', N'L.M. Montgomery', CAST(N'1919-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:42:06.7730652' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'5aa43ac6-d669-4060-a772-08dcf583c9b6', N'Seven Deadly Wonders (Jack West Jr, #1)', N'Matthew Reilly', CAST(N'2005-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:42:21.6084554' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'2eb00989-96eb-471b-a773-08dcf583c9b6', N'Goliath (Leviathan, #3)', N'Scott Westerfeld, Keith Thompson', CAST(N'2011-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:42:35.3952353' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'beba05b1-a26d-499a-a774-08dcf583c9b6', N'Subterranean', N'James Rollins', CAST(N'1999-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:42:49.9686794' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a5154e85-cd36-4e6e-a775-08dcf583c9b6', N'The Long Way to a Small, Angry Planet (Wayfarers, #1)', N'Becky Chambers', CAST(N'2014-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:43:05.8018038' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'32ef7910-84d4-4e54-a777-08dcf583c9b6', N'Sometimes a Great Notion', N'Ken Kesey', CAST(N'1964-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:44:19.8894676' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'd36db8a5-0d17-4ba3-a778-08dcf583c9b6', N'Cleopatra''s Daughter', N'Michelle Moran', CAST(N'2009-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:44:35.6232601' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'c2746362-640d-4633-a779-08dcf583c9b6', N'The Sword of Shannara Trilogy (Shannara, #1-3)', N'Terry Brooks', CAST(N'1979-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:44:46.9691556' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'867bde3e-4e96-4f61-a77a-08dcf583c9b6', N'Get Shorty (Chili Palmer, #1)', N'Elmore Leonard', CAST(N'1990-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:45:00.9185694' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'24673aba-c4fa-4932-a77b-08dcf583c9b6', N'Size 14 Is Not Fat Either (Heather Wells, #2)', N'Meg Cabot', CAST(N'2006-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:45:18.4004728' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'4d2ecb17-a52b-4842-a77c-08dcf583c9b6', N'The 39 Steps (Richard Hannay, #1)', N'John Buchan', CAST(N'1915-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:45:36.9378773' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'8331b24e-1ab8-4547-a77d-08dcf583c9b6', N'Blameless (Parasol Protectorate, #3)', N'Gail Carriger', CAST(N'2010-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:45:50.1369401' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'446881b5-ea9c-4689-a77e-08dcf583c9b6', N'Black Powder War (Temeraire, #3)', N'Naomi Novik', CAST(N'2006-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:46:09.1926330' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'b8f850ca-42d3-405f-a77f-08dcf583c9b6', N'The Painted Bird', N'Jerzy Kosiński', CAST(N'1965-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:46:23.1811760' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'0a441f93-97be-4639-a780-08dcf583c9b6', N'The Mirror Crack''d from Side to Side (Miss Marple, #9)', N'Agatha Christie', CAST(N'1962-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:46:38.9597902' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'5add24f1-3bae-4542-a781-08dcf583c9b6', N'The Heretic Queen', N'Michelle Moran', CAST(N'2008-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:46:51.1776495' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'974e8ea9-2508-4255-a782-08dcf583c9b6', N'The Good Soldier', N'Ford Madox Ford, Kenneth Womack, William Baker', CAST(N'1915-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:47:03.9059641' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'80cda3b7-d3fc-4eee-a783-08dcf583c9b6', N'Iceberg (Dirk Pitt, #3)', N'Clive Cussler', CAST(N'1974-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:47:20.5081211' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'13fdfc87-b03b-4853-a784-08dcf583c9b6', N'The Rainbow', N'D.H. Lawrence, Daphne Merkin', CAST(N'1915-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:47:33.5624819' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'5f08a8c8-a23d-45a5-a785-08dcf583c9b6', N'Herzog', N'Saul Bellow, Philip Roth', CAST(N'1964-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:47:56.6842397' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'd9cd2b95-25f0-47f3-a786-08dcf583c9b6', N'رباعيات خيام', N'Omar Khayyám, محمدعلی فروغی, قاسم غنی', CAST(N'1120-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:48:10.4466011' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'5518fb3e-2ca5-4237-a787-08dcf583c9b6', N'Everything That Rises Must Converge: Stories', N'Flannery O''Connor, Robert Fitzgerald', CAST(N'1965-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:48:26.2281494' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'0680cca4-be4c-4304-a788-08dcf583c9b6', N'The Mind Readers (Mind Readers, #1)', N'Lori Brighton', CAST(N'2010-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:48:40.0817774' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'1702b911-dfa0-4416-a789-08dcf583c9b6', N'The Feminine Mystique', N'Betty Friedan, Anna Quindlen', CAST(N'1963-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:48:57.6577705' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'1259cecd-aca8-4838-a78a-08dcf583c9b6', N'The Damnation Game', N'Clive Barker', CAST(N'1985-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:51:28.1105466' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'4d9ee253-1161-4c65-a78b-08dcf583c9b6', N'The Icewind Dale Trilogy Collector''s Edition (Forgotten Realms: Icewind Dale, #1-3; Legend of Drizzt, #4-6)', N'R.A. Salvatore', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:51:46.7277688' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'cbc2fa5d-c2c4-43dc-a78c-08dcf583c9b6', N'Blood Rites (The Grey Wolves, #2)', N'Quinn Loftis', CAST(N'2011-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:52:03.7408429' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'0a699697-72d0-42e5-a78d-08dcf583c9b6', N'The Keep (Adversary Cycle, #1)', N'F. Paul Wilson', CAST(N'1981-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:52:19.2946830' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'52002126-8b90-4411-a78e-08dcf583c9b6', N'The Monk', N'Matthew Lewis', CAST(N'1796-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:52:31.3925095' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'14d2fe0e-f180-4f85-a78f-08dcf583c9b6', N'Death in Venice and Other Tales', N'Thomas Mann, Joachim Neugroschel', CAST(N'1911-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:52:44.9240769' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'16e6d6ee-268a-434f-a790-08dcf583c9b6', N'The Soulkeepers (The Soulkeepers, #1)', N'G.P. Ching', CAST(N'2011-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:52:57.9561685' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'51cae197-f343-48b7-a791-08dcf583c9b6', N'Rhapsody: Child of Blood (Symphony of Ages, #1)', N'Elizabeth Haydon', CAST(N'1999-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:53:11.4931514' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'64db3030-0919-49af-a792-08dcf583c9b6', N'Relativity: The Special and the General Theory', N'Albert Einstein, Nigel Calder, Robert W. Lawson', CAST(N'1916-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:53:26.4838891' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'54854a23-57d4-468c-a793-08dcf583c9b6', N'Skin Tight (Mick Stranahan, #1)', N'Carl Hiaasen', CAST(N'1989-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:53:40.0026115' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'f5278f14-cc34-4b95-a794-08dcf583c9b6', N'The Golden Notebook', N'Doris Lessing', CAST(N'1962-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:53:51.4666875' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'4d556732-8f13-4340-a795-08dcf583c9b6', N'Empire of Ivory (Temeraire, #4)', N'Naomi Novik', CAST(N'2007-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:54:08.5991317' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a15f92c4-5679-4f2c-a796-08dcf583c9b6', N'Double Indemnity', N'James M. Cain', CAST(N'1936-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:54:20.6605572' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'8bd1460f-5b0e-474d-a797-08dcf583c9b6', N'Devil in a Blue Dress (Easy Rawlins, #1)', N'Walter Mosley', CAST(N'1990-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:54:32.6310524' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'c12b22f5-f4b4-442c-a798-08dcf583c9b6', N'The Killer Inside Me', N'Jim Thompson', CAST(N'1952-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:54:45.4109128' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'851553f4-856d-4092-a799-08dcf583c9b6', N'Hollowland (The Hollows, #1)', N'Amanda Hocking', CAST(N'2010-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:54:58.6940795' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'82cec7f3-b65f-48d4-a79a-08dcf583c9b6', N'The Love Song of J. Alfred Prufrock and Other Poems', N'T.S. Eliot', CAST(N'1915-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:55:12.5379621' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'f54ebda2-804b-4e05-a79b-08dcf583c9b6', N'The Firm', N'John Grisham', CAST(N'1991-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:55:24.2600087' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'4adab5fa-c29d-496e-a79c-08dcf583c9b6', N'Savannah Breeze (Weezie and Bebe Mysteries, #2)', N'Mary Kay Andrews', CAST(N'2006-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:55:35.7288161' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'fb88551f-5303-4e32-a79d-08dcf583c9b6', N'The Belgariad Boxed Set: Pawn of Prophecy / Queen of Sorcery / Magician''s Gambit / Castle of Wizardry / Enchanters'' End Game (The Belgariad, #1-5)', N'David Eddings', CAST(N'1984-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:55:49.9720299' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'12c34a52-3984-41ba-a79f-08dcf583c9b6', N'The Lions of Al-Rassan', N'Guy Gavriel Kay', CAST(N'1995-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:59:16.6122510' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'1539a328-2e8e-4aa0-a7a0-08dcf583c9b6', N'The Moon and Sixpence', N'W. Somerset Maugham', CAST(N'1919-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:59:33.3923015' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'f15d7342-c3ea-48f7-a7a1-08dcf583c9b6', N'The Woman in the Dunes', N'Kōbō Abe, E. Dale Saunders', CAST(N'1962-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T09:59:46.9100611' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'ca763826-4a7e-4284-a7a2-08dcf583c9b6', N'How to Be Popular', N'Meg Cabot', CAST(N'2006-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T10:00:00.6776588' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'033fb882-453e-4699-a7a3-08dcf583c9b6', N'First Love', N'James Patterson, Emily Raymond', CAST(N'2013-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T10:00:15.1959685' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'e7066190-16ce-4780-a7a8-08dcf583c9b6', N'Pastwatch: The Redemption of Christopher Columbus', N'Orson Scott Card', CAST(N'1996-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T10:01:27.5359972' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'36b07a0f-93b6-4932-a7aa-08dcf583c9b6', N'The Other Daughter', N'Lisa Gardner', CAST(N'1999-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T10:02:02.5204754' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'693dfbc8-b45b-4c8c-a7ab-08dcf583c9b6', N'Slammerkin', N'Emma Donoghue', CAST(N'2000-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T10:02:15.2208378' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'a1a9ff1a-65c3-4ded-a7ae-08dcf583c9b6', N'The Last Picture Show', N'Larry McMurtry', CAST(N'1966-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T10:03:03.5694008' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublishedDate], [Description], [Rating], [Price], [CreatedAt], [UpdatedAt], [UserId], [GenreId]) VALUES (N'871834b0-cad2-4962-a7af-08dcf583c9b6', N'The Prize Winner of Defiance, Ohio: How My Mother Raised 10 Kids on 25 Words or Less', N'Terry Ryan', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), N'string', NULL, 0, CAST(N'2024-10-26T10:03:18.7782892' AS DateTime2), NULL, N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', NULL)
GO
INSERT [dbo].[FriendRequests] ([FriendRequestId], [RequesterId], [RecipientId], [CreatedAt], [IsAccepted]) VALUES (N'467dec31-595b-4ef2-709b-08dcf3dcd9ef', N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'092fea74-7836-4ad2-9b1d-2a8e0f336357', CAST(N'2024-10-24T03:35:05.4305331' AS DateTime2), 1)
INSERT [dbo].[FriendRequests] ([FriendRequestId], [RequesterId], [RecipientId], [CreatedAt], [IsAccepted]) VALUES (N'26833d62-2e99-47b4-208a-08dcfafbb2fb', N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', N'aeb06aff-c94a-469e-8305-29b14efdb445', CAST(N'2024-11-02T05:03:32.5939280' AS DateTime2), 0)
INSERT [dbo].[FriendRequests] ([FriendRequestId], [RequesterId], [RecipientId], [CreatedAt], [IsAccepted]) VALUES (N'e17ab707-b9e1-48e2-66a1-08dcfb0333f6', N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', N'8299ac07-d23c-4176-a8b2-fab4f9fb9a6e', CAST(N'2024-11-02T05:57:15.4523618' AS DateTime2), 0)
INSERT [dbo].[FriendRequests] ([FriendRequestId], [RequesterId], [RecipientId], [CreatedAt], [IsAccepted]) VALUES (N'eee541a9-e3a1-416d-0fa9-08dcfb13bbe0', N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', N'1eb7e869-6647-4ead-b6b1-1ed471484c71', CAST(N'2024-11-02T07:55:35.4654344' AS DateTime2), 0)
GO
INSERT [dbo].[Friends] ([FriendId], [UserId], [FriendUserId], [CreatedAt], [UserProfileProfileId]) VALUES (N'a5821ce8-a1f9-49fc-fe7d-08dcf3dd4ce5', N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'092fea74-7836-4ad2-9b1d-2a8e0f336357', CAST(N'2024-10-24T03:38:18.3149510' AS DateTime2), NULL)
INSERT [dbo].[Friends] ([FriendId], [UserId], [FriendUserId], [CreatedAt], [UserProfileProfileId]) VALUES (N'5eb04d07-4a0a-4ade-fe7e-08dcf3dd4ce5', N'092fea74-7836-4ad2-9b1d-2a8e0f336357', N'1eb7e869-6647-4ead-b6b1-1ed471484c71', CAST(N'2024-10-24T03:38:18.3150310' AS DateTime2), NULL)
GO
INSERT [dbo].[Genres] ([GenreId], [GenreName]) VALUES (N'5a0b1c1d-eaaa-4d6d-b042-1cdb2c6dd60a', N'Sci Fiction')
INSERT [dbo].[Genres] ([GenreId], [GenreName]) VALUES (N'd23564cc-1bbd-451f-bdc6-3474413f865b', N'Classics')
INSERT [dbo].[Genres] ([GenreId], [GenreName]) VALUES (N'bcb94fe1-d4b0-4a7e-a88d-4320a31d8dd5', N'Mystery & Thriller')
INSERT [dbo].[Genres] ([GenreId], [GenreName]) VALUES (N'3b9e9a3e-c97f-4b6f-a2d4-46fef46bfa4f', N'2000s')
INSERT [dbo].[Genres] ([GenreId], [GenreName]) VALUES (N'af2a2f45-3cc2-4d28-bfd1-4907df7e5f6c', N'1960s')
INSERT [dbo].[Genres] ([GenreId], [GenreName]) VALUES (N'f4229e1c-6fc1-4d77-9180-5a89f37a5f65', N'1990s')
INSERT [dbo].[Genres] ([GenreId], [GenreName]) VALUES (N'7e3df3a2-0499-4d9a-bd2d-5b1d83c03c8a', N'1970s')
INSERT [dbo].[Genres] ([GenreId], [GenreName]) VALUES (N'643f9871-c21f-4095-a2e7-648f71fb3ed5', N'Historical Fiction')
INSERT [dbo].[Genres] ([GenreId], [GenreName]) VALUES (N'2f774fae-3b8c-4ec2-9b5e-720c7ed9e115', N'Horror')
INSERT [dbo].[Genres] ([GenreId], [GenreName]) VALUES (N'fdd6275b-20f9-4879-b1c9-b37b502d21ab', N'Epic Fantasy')
INSERT [dbo].[Genres] ([GenreId], [GenreName]) VALUES (N'5db27ab4-6a99-47ff-b0f1-b9ba12a16818', N'Best Books Ever')
INSERT [dbo].[Genres] ([GenreId], [GenreName]) VALUES (N'f63b8585-80a1-4186-87a1-d0c0f26fcb47', N'History')
INSERT [dbo].[Genres] ([GenreId], [GenreName]) VALUES (N'798ca2c6-8d53-44ec-95b6-d23f59d3f573', N'19th Century')
INSERT [dbo].[Genres] ([GenreId], [GenreName]) VALUES (N'52c8fa62-bef5-4b3f-b2ea-d6f70b507fe6', N'Adventure')
GO
SET IDENTITY_INSERT [dbo].[Recommendations] ON 

INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (85, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'1bc2b9f5-560d-4ae9-4e7b-08dcf4ddd1e6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (86, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'60dfe00f-a54c-44d7-4e7e-08dcf4ddd1e6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (87, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'c8be4ec4-bbaa-4d3f-4e81-08dcf4ddd1e6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (88, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'890704b0-f7a5-4e00-4e82-08dcf4ddd1e6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (89, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'dca7cb9c-dca9-401f-4e84-08dcf4ddd1e6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (90, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'e5947b27-8c86-4fb3-4e88-08dcf4ddd1e6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (91, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'3ebd3df0-9e8a-4175-4e8e-08dcf4ddd1e6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (92, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'28bbe04a-bfa9-49e7-4ebc-08dcf4ddd1e6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (93, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'765dfbc8-fabd-487c-4ec9-08dcf4ddd1e6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (94, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'81e92faf-e89a-40bd-4ed6-08dcf4ddd1e6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (95, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'a2a6777e-ea4a-420e-4ef4-08dcf4ddd1e6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (96, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'1f8fc8fc-f134-4d94-4f17-08dcf4ddd1e6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (97, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'be390d4b-b5f1-4926-a62f-08dcf583c9b6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (98, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'0d84ea08-a4fb-46e4-a639-08dcf583c9b6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (99, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'e632606e-2f2c-4bf6-a659-08dcf583c9b6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (100, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'd7563683-e543-44cf-a662-08dcf583c9b6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (101, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'e7db234c-0ecc-48ea-a672-08dcf583c9b6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (102, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'ffe86a1a-5b0f-4834-a67c-08dcf583c9b6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (103, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'a94e724f-bfce-44a2-a6cb-08dcf583c9b6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (104, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'b2f725eb-1a55-44c4-a717-08dcf583c9b6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (105, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'e93d191e-1f2e-43be-4e70-08dcf4ddd1e6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (106, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'5ef2444f-3eac-4231-4e71-08dcf4ddd1e6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (107, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'86e76f89-c44c-438a-4f23-08dcf4ddd1e6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (108, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'94666746-de8b-404f-4e72-08dcf4ddd1e6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (109, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'1aa6ae28-6148-4b57-4e73-08dcf4ddd1e6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (110, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'5cbab341-d8d0-4f42-4e74-08dcf4ddd1e6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (111, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'40dad93c-63f1-474d-4e76-08dcf4ddd1e6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (112, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'5af2bb02-84b6-4f58-4e78-08dcf4ddd1e6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (113, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'32941e49-8dcf-4a74-4e79-08dcf4ddd1e6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (114, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'663727b2-1bdc-4f30-4e7a-08dcf4ddd1e6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (115, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'987cc9b4-b6fb-4740-4e80-08dcf4ddd1e6')
INSERT [dbo].[Recommendations] ([Id], [UserId], [BookId]) VALUES (116, N'1eb7e869-6647-4ead-b6b1-1ed471484c71', N'e0e48490-f60c-4784-4ea4-08dcf4ddd1e6')
SET IDENTITY_INSERT [dbo].[Recommendations] OFF
GO
INSERT [dbo].[Reviews] ([ReviewId], [Comment], [Rating], [ReviewDate], [BookId], [UserId]) VALUES (N'44ff1a5a-f178-470e-c421-08dd3548a31a', N'Nice Book', 4, CAST(N'2025-01-15T09:40:24.6722190' AS DateTime2), N'b2f725eb-1a55-44c4-a717-08dcf583c9b6', N'1eb7e869-6647-4ead-b6b1-1ed471484c71')
INSERT [dbo].[Reviews] ([ReviewId], [Comment], [Rating], [ReviewDate], [BookId], [UserId]) VALUES (N'23cf58fd-6f54-43a8-c422-08dd3548a31a', N'Nice Book', 4, CAST(N'2025-01-15T09:40:55.9057907' AS DateTime2), N'a94e724f-bfce-44a2-a6cb-08dcf583c9b6', N'1eb7e869-6647-4ead-b6b1-1ed471484c71')
INSERT [dbo].[Reviews] ([ReviewId], [Comment], [Rating], [ReviewDate], [BookId], [UserId]) VALUES (N'4811db92-ce33-4902-c423-08dd3548a31a', N'Nice Book', 5, CAST(N'2025-01-15T09:41:46.6956855' AS DateTime2), N'ffe86a1a-5b0f-4834-a67c-08dcf583c9b6', N'1eb7e869-6647-4ead-b6b1-1ed471484c71')
INSERT [dbo].[Reviews] ([ReviewId], [Comment], [Rating], [ReviewDate], [BookId], [UserId]) VALUES (N'60a0b084-48d6-476c-c424-08dd3548a31a', N'Nice Book', 4, CAST(N'2025-01-15T09:42:23.3752490' AS DateTime2), N'e7db234c-0ecc-48ea-a672-08dcf583c9b6', N'1eb7e869-6647-4ead-b6b1-1ed471484c71')
INSERT [dbo].[Reviews] ([ReviewId], [Comment], [Rating], [ReviewDate], [BookId], [UserId]) VALUES (N'4e1e9fd2-cfa3-40f9-c245-08dd361ed1ed', N'Nice Book', 0, CAST(N'2025-01-16T11:13:35.5295024' AS DateTime2), N'765dfbc8-fabd-487c-4ec9-08dcf4ddd1e6', N'1eb7e869-6647-4ead-b6b1-1ed471484c71')
GO
INSERT [dbo].[UserProfilePhotos] ([PhotoId], [PhotoUrl], [ProfileId], [IsMainPhoto], [UploadedAt]) VALUES (N'f7f74f79-99b8-4513-f4d0-08dcf3ddcb9a', N'3a630d2b-cb8f-4910-bd25-2696b4609114.jpg', N'6728cdcb-2df9-4541-d995-08dcf3ddcb8f', 1, CAST(N'2024-10-24T03:41:50.8954638' AS DateTime2))
INSERT [dbo].[UserProfilePhotos] ([PhotoId], [PhotoUrl], [ProfileId], [IsMainPhoto], [UploadedAt]) VALUES (N'71773879-334a-4491-cf9f-08dcfbb4936c', N'3ddf81a5-4b83-4aa7-aecf-d2d4c1a60765.jpg', N'022fc143-3ddf-4b0a-5bc5-08dcfbb42dfb', 1, CAST(N'2024-11-03T03:06:56.5797436' AS DateTime2))
GO
INSERT [dbo].[UserProfiles] ([ProfileId], [FullName], [Bio], [UserId], [CreatedAt], [UpdatedAt]) VALUES (N'6728cdcb-2df9-4541-d995-08dcf3ddcb8f', N'User User', N'I like to read Books', N'092fea74-7836-4ad2-9b1d-2a8e0f336357', CAST(N'2024-10-24T03:41:50.8260237' AS DateTime2), NULL)
INSERT [dbo].[UserProfiles] ([ProfileId], [FullName], [Bio], [UserId], [CreatedAt], [UpdatedAt]) VALUES (N'2deb873e-5c69-4dae-9c42-08dcfa5f8891', N'Admin', N'I am Admin', N'81aa0fa5-eb3e-44fa-a606-cad0ae1ed52b', CAST(N'2024-11-01T10:25:39.9609669' AS DateTime2), CAST(N'2024-11-03T02:46:52.7383834' AS DateTime2))
INSERT [dbo].[UserProfiles] ([ProfileId], [FullName], [Bio], [UserId], [CreatedAt], [UpdatedAt]) VALUES (N'022fc143-3ddf-4b0a-5bc5-08dcfbb42dfb', N'Rayan Pokharel', N'I am a reader.', N'1eb7e869-6647-4ead-b6b1-1ed471484c71', CAST(N'2024-11-03T03:04:06.3773401' AS DateTime2), CAST(N'2024-11-09T11:11:51.5909190' AS DateTime2))
GO
/****** Object:  Index [IX_Activities_ActionId]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_Activities_ActionId] ON [dbo].[Activities]
(
	[ActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Activities_BookId]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_Activities_BookId] ON [dbo].[Activities]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Activities_UserId]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_Activities_UserId] ON [dbo].[Activities]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Activities_UserProfileProfileId]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_Activities_UserProfileProfileId] ON [dbo].[Activities]
(
	[UserProfileProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookGenres_GenreId]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_BookGenres_GenreId] ON [dbo].[BookGenres]
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Books_GenreId]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_Books_GenreId] ON [dbo].[Books]
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Books_UserId]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_Books_UserId] ON [dbo].[Books]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FriendRequests_RecipientId]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_FriendRequests_RecipientId] ON [dbo].[FriendRequests]
(
	[RecipientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_FriendRequests_RequesterId]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_FriendRequests_RequesterId] ON [dbo].[FriendRequests]
(
	[RequesterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Friends_FriendUserId]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_Friends_FriendUserId] ON [dbo].[Friends]
(
	[FriendUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Friends_UserId_FriendUserId]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Friends_UserId_FriendUserId] ON [dbo].[Friends]
(
	[UserId] ASC,
	[FriendUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Friends_UserProfileProfileId]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_Friends_UserProfileProfileId] ON [dbo].[Friends]
(
	[UserProfileProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Recommendations_BookId]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_Recommendations_BookId] ON [dbo].[Recommendations]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Recommendations_UserId]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_Recommendations_UserId] ON [dbo].[Recommendations]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Reviews_BookId_UserId]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Reviews_BookId_UserId] ON [dbo].[Reviews]
(
	[BookId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Reviews_UserId]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_Reviews_UserId] ON [dbo].[Reviews]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserProfilePhotos_ProfileId_IsMainPhoto]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserProfilePhotos_ProfileId_IsMainPhoto] ON [dbo].[UserProfilePhotos]
(
	[ProfileId] ASC,
	[IsMainPhoto] ASC
)
WHERE ([IsMainPhoto]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserProfiles_UserId]    Script Date: 1/16/2025 7:48:33 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserProfiles_UserId] ON [dbo].[UserProfiles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Activities] ADD  DEFAULT (getutcdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK_Activities_Actions_ActionId] FOREIGN KEY([ActionId])
REFERENCES [dbo].[Actions] ([ActionId])
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK_Activities_Actions_ActionId]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK_Activities_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK_Activities_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK_Activities_Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK_Activities_Books_BookId]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD  CONSTRAINT [FK_Activities_UserProfiles_UserProfileProfileId] FOREIGN KEY([UserProfileProfileId])
REFERENCES [dbo].[UserProfiles] ([ProfileId])
GO
ALTER TABLE [dbo].[Activities] CHECK CONSTRAINT [FK_Activities_UserProfiles_UserProfileProfileId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[BookGenres]  WITH CHECK ADD  CONSTRAINT [FK_BookGenres_Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookGenres] CHECK CONSTRAINT [FK_BookGenres_Books_BookId]
GO
ALTER TABLE [dbo].[BookGenres]  WITH CHECK ADD  CONSTRAINT [FK_BookGenres_Genres_GenreId] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([GenreId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookGenres] CHECK CONSTRAINT [FK_BookGenres_Genres_GenreId]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Genres_GenreId] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([GenreId])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Genres_GenreId]
GO
ALTER TABLE [dbo].[FriendRequests]  WITH CHECK ADD  CONSTRAINT [FK_FriendRequests_AspNetUsers_RecipientId] FOREIGN KEY([RecipientId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[FriendRequests] CHECK CONSTRAINT [FK_FriendRequests_AspNetUsers_RecipientId]
GO
ALTER TABLE [dbo].[FriendRequests]  WITH CHECK ADD  CONSTRAINT [FK_FriendRequests_AspNetUsers_RequesterId] FOREIGN KEY([RequesterId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[FriendRequests] CHECK CONSTRAINT [FK_FriendRequests_AspNetUsers_RequesterId]
GO
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD  CONSTRAINT [FK_Friends_AspNetUsers_FriendUserId] FOREIGN KEY([FriendUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Friends] CHECK CONSTRAINT [FK_Friends_AspNetUsers_FriendUserId]
GO
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD  CONSTRAINT [FK_Friends_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Friends] CHECK CONSTRAINT [FK_Friends_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD  CONSTRAINT [FK_Friends_UserProfiles_UserProfileProfileId] FOREIGN KEY([UserProfileProfileId])
REFERENCES [dbo].[UserProfiles] ([ProfileId])
GO
ALTER TABLE [dbo].[Friends] CHECK CONSTRAINT [FK_Friends_UserProfiles_UserProfileProfileId]
GO
ALTER TABLE [dbo].[Recommendations]  WITH CHECK ADD  CONSTRAINT [FK_Recommendations_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Recommendations] CHECK CONSTRAINT [FK_Recommendations_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Recommendations]  WITH CHECK ADD  CONSTRAINT [FK_Recommendations_Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Recommendations] CHECK CONSTRAINT [FK_Recommendations_Books_BookId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Books_BookId]
GO
ALTER TABLE [dbo].[UserProfilePhotos]  WITH CHECK ADD  CONSTRAINT [FK_UserProfilePhotos_UserProfiles_ProfileId] FOREIGN KEY([ProfileId])
REFERENCES [dbo].[UserProfiles] ([ProfileId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserProfilePhotos] CHECK CONSTRAINT [FK_UserProfilePhotos_UserProfiles_ProfileId]
GO
ALTER TABLE [dbo].[UserProfiles]  WITH CHECK ADD  CONSTRAINT [FK_UserProfiles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserProfiles] CHECK CONSTRAINT [FK_UserProfiles_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [try] SET  READ_WRITE 
GO
