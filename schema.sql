USE [master]
GO
/****** Object:  Database [multishopdb]    Script Date: 2020-12-03 08:18:58 ******/
CREATE DATABASE [multishopdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'multishopdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\multishopdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'multishopdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\multishopdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [multishopdb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [multishopdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [multishopdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [multishopdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [multishopdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [multishopdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [multishopdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [multishopdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [multishopdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [multishopdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [multishopdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [multishopdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [multishopdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [multishopdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [multishopdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [multishopdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [multishopdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [multishopdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [multishopdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [multishopdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [multishopdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [multishopdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [multishopdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [multishopdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [multishopdb] SET RECOVERY FULL 
GO
ALTER DATABASE [multishopdb] SET  MULTI_USER 
GO
ALTER DATABASE [multishopdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [multishopdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [multishopdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [multishopdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [multishopdb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [multishopdb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'multishopdb', N'ON'
GO
ALTER DATABASE [multishopdb] SET QUERY_STORE = OFF
GO
USE [multishopdb]
GO
/****** Object:  Table [dbo].[billing_address]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[billing_address](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[city_id] [bigint] NOT NULL,
	[suburb_id] [bigint] NOT NULL,
	[name] [varchar](90) NOT NULL,
	[surname] [varchar](90) NOT NULL,
	[street] [varchar](90) NOT NULL,
	[street_no] [varchar](10) NOT NULL,
	[post_code] [varchar](10) NOT NULL,
	[mobile] [varchar](15) NOT NULL,
 CONSTRAINT [PK_billing_address] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cities]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cities](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_cities] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[newsletter_campaigns]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[newsletter_campaigns](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [varchar](250) NULL,
	[started_at] [datetime] NULL,
	[ended_at] [datetime] NULL,
 CONSTRAINT [PK_newsletter_campains] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[newsletter_products]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[newsletter_products](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[campaign_id] [bigint] NULL,
	[product_id] [bigint] NULL,
 CONSTRAINT [PK_newsletter_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[newsletter_recipients]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[newsletter_recipients](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[campaign_id] [bigint] NULL,
	[user_id] [bigint] NULL,
 CONSTRAINT [PK_newsletter_recipients] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_items]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_items](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_id] [bigint] NULL,
	[product_id] [bigint] NULL,
	[status_id] [bigint] NULL,
	[quantity] [int] NULL,
	[net_price] [decimal](10, 2) NULL,
	[taxes] [decimal](10, 2) NULL,
	[is_void] [tinyint] NULL,
	[is_refund] [tinyint] NULL,
 CONSTRAINT [PK_order_items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_items_status_history]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_items_status_history](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_item_id] [bigint] NULL,
	[status_id] [bigint] NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_order_items_status_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_status]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_status](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_order_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
	[shipping_address_id] [bigint] NULL,
	[billing_address_id] [bigint] NULL,
	[payment_method_id] [bigint] NULL,
	[total_price] [decimal](10, 2) NULL,
	[net_price] [decimal](10, 2) NULL,
	[taxes] [decimal](10, 2) NULL,
	[shipping] [decimal](10, 2) NULL,
	[is_success] [tinyint] NULL,
	[is_void] [tinyint] NULL,
	[is_refund] [tinyint] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[other_shop_selling_categories]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[other_shop_selling_categories](
	[id] [bigint] NOT NULL,
	[shop_id] [bigint] NULL,
	[product_category_id] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[other_shops]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[other_shops](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](80) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment_methods]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payment_methods](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_payment_methods] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_attribute_values_bool]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_attribute_values_bool](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_id] [bigint] NULL,
	[attribute_id] [bigint] NULL,
	[value] [tinyint] NULL,
 CONSTRAINT [PK_product_attribute_values_bool] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_attribute_values_int]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_attribute_values_int](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_id] [bigint] NULL,
	[attribute_id] [bigint] NULL,
	[value] [int] NULL,
 CONSTRAINT [PK_product_attribute_values_int] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_attribute_values_str]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_attribute_values_str](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_id] [bigint] NULL,
	[attribute_id] [bigint] NULL,
	[value] [varchar](50) NULL,
 CONSTRAINT [PK_product_attribute_values_str] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_attributes]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_attributes](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_category_id] [bigint] NULL,
	[title] [varchar](80) NULL,
 CONSTRAINT [PK_product_attributes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_categories]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_categories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_images]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_images](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_id] [bigint] NULL,
	[image_url] [varchar](250) NULL,
 CONSTRAINT [PK_product_images] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_pricing_history]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_pricing_history](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[product_id] [bigint] NULL,
	[price] [decimal](10, 2) NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_product_pricing_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [varchar](250) NULL,
	[title] [varchar](250) NULL,
	[description] [text] NULL,
	[thumbnail] [varchar](250) NULL,
	[category_id] [bigint] NULL,
	[current_price] [decimal](10, 2) NOT NULL,
	[normal_price] [decimal](10, 2) NULL,
	[kilos] [decimal](10, 2) NULL,
	[dim_len] [int] NULL,
	[dim_width] [int] NULL,
	[dim_height] [int] NULL,
	[stock] [bigint] NULL,
	[is_active] [tinyint] NULL,
	[is_visible] [tinyint] NULL,
	[stars] [decimal](3, 2) NULL,
	[total_orders] [bigint] NULL,
	[total_clickes] [bigint] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shipping_address]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shipping_address](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[city_id] [bigint] NOT NULL,
	[suburb_id] [bigint] NOT NULL,
	[name] [varchar](90) NOT NULL,
	[surname] [varchar](90) NOT NULL,
	[street] [varchar](90) NOT NULL,
	[street_no] [varchar](10) NOT NULL,
	[post_code] [varchar](10) NOT NULL,
	[mobile] [varchar](15) NOT NULL,
	[name_on_bell] [varchar](90) NULL,
	[floor_no] [varchar](10) NULL,
 CONSTRAINT [PK_shipping_address] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suburbs]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suburbs](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[city_id] [bigint] NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [PK_suburbs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_reviews]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_reviews](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
	[product_id] [bigint] NULL,
	[rating] [decimal](3, 1) NULL,
	[comment] [text] NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_user_reviews] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[newsletter_campaigns] ON 

INSERT [dbo].[newsletter_campaigns] ([id], [code], [started_at], [ended_at]) VALUES (1, N'BLACK_FRIDAY', CAST(N'2020-11-12T00:00:00.000' AS DateTime), CAST(N'2020-11-29T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[newsletter_campaigns] OFF
GO
SET IDENTITY_INSERT [dbo].[newsletter_products] ON 

INSERT [dbo].[newsletter_products] ([id], [campaign_id], [product_id]) VALUES (1, 1, 2)
INSERT [dbo].[newsletter_products] ([id], [campaign_id], [product_id]) VALUES (2, 1, 3)
INSERT [dbo].[newsletter_products] ([id], [campaign_id], [product_id]) VALUES (3, 1, 4)
SET IDENTITY_INSERT [dbo].[newsletter_products] OFF
GO
SET IDENTITY_INSERT [dbo].[newsletter_recipients] ON 

INSERT [dbo].[newsletter_recipients] ([id], [campaign_id], [user_id]) VALUES (1, 1, 1)
INSERT [dbo].[newsletter_recipients] ([id], [campaign_id], [user_id]) VALUES (2, 1, 2)
INSERT [dbo].[newsletter_recipients] ([id], [campaign_id], [user_id]) VALUES (3, 1, 3)
INSERT [dbo].[newsletter_recipients] ([id], [campaign_id], [user_id]) VALUES (4, 1, 4)
INSERT [dbo].[newsletter_recipients] ([id], [campaign_id], [user_id]) VALUES (5, 1, 5)
INSERT [dbo].[newsletter_recipients] ([id], [campaign_id], [user_id]) VALUES (6, 1, 6)
INSERT [dbo].[newsletter_recipients] ([id], [campaign_id], [user_id]) VALUES (7, 1, 7)
INSERT [dbo].[newsletter_recipients] ([id], [campaign_id], [user_id]) VALUES (8, 1, 8)
INSERT [dbo].[newsletter_recipients] ([id], [campaign_id], [user_id]) VALUES (9, 1, 9)
INSERT [dbo].[newsletter_recipients] ([id], [campaign_id], [user_id]) VALUES (10, 1, 10)
INSERT [dbo].[newsletter_recipients] ([id], [campaign_id], [user_id]) VALUES (11, 1, 11)
SET IDENTITY_INSERT [dbo].[newsletter_recipients] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [user_id], [shipping_address_id], [billing_address_id], [payment_method_id], [total_price], [net_price], [taxes], [shipping], [is_success], [is_void], [is_refund], [created_at], [updated_at]) VALUES (1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, CAST(N'2020-11-23T15:45:03.000' AS DateTime), CAST(N'2020-11-23T15:45:03.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[product_categories] ON 

INSERT [dbo].[product_categories] ([id], [title]) VALUES (1, N'Screens')
INSERT [dbo].[product_categories] ([id], [title]) VALUES (2, N'CPUs')
INSERT [dbo].[product_categories] ([id], [title]) VALUES (3, N'Smartphone')
SET IDENTITY_INSERT [dbo].[product_categories] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [code], [title], [description], [thumbnail], [category_id], [current_price], [normal_price], [kilos], [dim_len], [dim_width], [dim_height], [stock], [is_active], [is_visible], [stars], [total_orders], [total_clickes], [created_at], [updated_at]) VALUES (1, N'TOSBHIBA_', N'1TB Toshiba disk', NULL, NULL, 1, CAST(45.00 AS Decimal(10, 2)), CAST(55.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[products] ([id], [code], [title], [description], [thumbnail], [category_id], [current_price], [normal_price], [kilos], [dim_len], [dim_width], [dim_height], [stock], [is_active], [is_visible], [stars], [total_orders], [total_clickes], [created_at], [updated_at]) VALUES (2, N'XIAOMI', N'Xiamoi', NULL, NULL, 2, CAST(280.00 AS Decimal(10, 2)), CAST(350.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[products] ([id], [code], [title], [description], [thumbnail], [category_id], [current_price], [normal_price], [kilos], [dim_len], [dim_width], [dim_height], [stock], [is_active], [is_visible], [stars], [total_orders], [total_clickes], [created_at], [updated_at]) VALUES (3, N'iPhoe', N'iPhone', NULL, NULL, 3, CAST(560.00 AS Decimal(10, 2)), CAST(980.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[products] ([id], [code], [title], [description], [thumbnail], [category_id], [current_price], [normal_price], [kilos], [dim_len], [dim_width], [dim_height], [stock], [is_active], [is_visible], [stars], [total_orders], [total_clickes], [created_at], [updated_at]) VALUES (4, N'Apple M1 Mini', N'Apple Mi1 ', NULL, NULL, 1, CAST(670.00 AS Decimal(10, 2)), CAST(780.00 AS Decimal(10, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_newsletter_campains]    Script Date: 2020-12-03 08:18:59 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_newsletter_campains] ON [dbo].[newsletter_campaigns]
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [other_shop_selling_categories_pk]    Script Date: 2020-12-03 08:18:59 ******/
ALTER TABLE [dbo].[other_shop_selling_categories] ADD  CONSTRAINT [other_shop_selling_categories_pk] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [other_shops_pk]    Script Date: 2020-12-03 08:18:59 ******/
ALTER TABLE [dbo].[other_shops] ADD  CONSTRAINT [other_shops_pk] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [other_shops_title_uindex]    Script Date: 2020-12-03 08:18:59 ******/
CREATE UNIQUE NONCLUSTERED INDEX [other_shops_title_uindex] ON [dbo].[other_shops]
(
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [product_categories_pk]    Script Date: 2020-12-03 08:18:59 ******/
ALTER TABLE [dbo].[product_categories] ADD  CONSTRAINT [product_categories_pk] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [product_categories_title_uindex]    Script Date: 2020-12-03 08:18:59 ******/
CREATE UNIQUE NONCLUSTERED INDEX [product_categories_title_uindex] ON [dbo].[product_categories]
(
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [products_pk]    Script Date: 2020-12-03 08:18:59 ******/
ALTER TABLE [dbo].[products] ADD  CONSTRAINT [products_pk] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[other_shop_selling_categories]  WITH CHECK ADD  CONSTRAINT [other_shop_selling_categories_other_shops_id_fk] FOREIGN KEY([shop_id])
REFERENCES [dbo].[other_shops] ([id])
GO
ALTER TABLE [dbo].[other_shop_selling_categories] CHECK CONSTRAINT [other_shop_selling_categories_other_shops_id_fk]
GO
ALTER TABLE [dbo].[other_shop_selling_categories]  WITH CHECK ADD  CONSTRAINT [other_shop_selling_categories_product_categories_id_fk] FOREIGN KEY([product_category_id])
REFERENCES [dbo].[product_categories] ([id])
GO
ALTER TABLE [dbo].[other_shop_selling_categories] CHECK CONSTRAINT [other_shop_selling_categories_product_categories_id_fk]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [products_product_categories_id_fk] FOREIGN KEY([category_id])
REFERENCES [dbo].[product_categories] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [products_product_categories_id_fk]
GO
/****** Object:  StoredProcedure [dbo].[FetchTopCategory]    Script Date: 2020-12-03 08:18:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchTopCategory]   
 
AS   

  SELECT TOP 1 * FROM dbo.product_categories
GO
USE [master]
GO
ALTER DATABASE [multishopdb] SET  READ_WRITE 
GO
