USE [master]
GO
/****** Object:  Database [multishopdb]    Script Date: 2020-12-10 19:55:29 ******/
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
/****** Object:  Table [dbo].[billing_address]    Script Date: 2020-12-10 19:55:29 ******/
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
/****** Object:  Table [dbo].[cities]    Script Date: 2020-12-10 19:55:29 ******/
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
/****** Object:  Table [dbo].[customers]    Script Date: 2020-12-10 19:55:29 ******/
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
/****** Object:  Table [dbo].[newsletter_campaigns]    Script Date: 2020-12-10 19:55:29 ******/
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
/****** Object:  Table [dbo].[newsletter_products]    Script Date: 2020-12-10 19:55:29 ******/
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
/****** Object:  Table [dbo].[newsletter_recipients]    Script Date: 2020-12-10 19:55:29 ******/
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
/****** Object:  Table [dbo].[notification_history]    Script Date: 2020-12-10 19:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification_history](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[bookingId] [bigint] NULL,
	[gdsPnr] [varchar](6) NULL,
	[gdsNotifiedAt] [datetime] NULL,
	[route] [varchar](6) NOT NULL,
	[departs_at] [datetime] NULL,
	[status] [varchar](2) NULL,
 CONSTRAINT [PK_notification_history] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_items]    Script Date: 2020-12-10 19:55:29 ******/
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
	[piece_net_price] [decimal](10, 2) NULL,
	[total_net_price] [decimal](10, 2) NULL,
	[taxes] [decimal](10, 2) NULL,
	[is_void] [tinyint] NULL,
	[is_refund] [tinyint] NULL,
 CONSTRAINT [PK_order_items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_items_status_history]    Script Date: 2020-12-10 19:55:29 ******/
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
/****** Object:  Table [dbo].[order_status]    Script Date: 2020-12-10 19:55:29 ******/
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
/****** Object:  Table [dbo].[orders]    Script Date: 2020-12-10 19:55:29 ******/
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
/****** Object:  Table [dbo].[other_shop_selling_categories]    Script Date: 2020-12-10 19:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[other_shop_selling_categories](
	[id] [bigint] NOT NULL,
	[shop_id] [bigint] NULL,
	[product_category_id] [bigint] NULL,
 CONSTRAINT [other_shop_selling_categories_pk] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[other_shops]    Script Date: 2020-12-10 19:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[other_shops](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](80) NULL,
 CONSTRAINT [other_shops_pk] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payment_methods]    Script Date: 2020-12-10 19:55:29 ******/
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
/****** Object:  Table [dbo].[product_attribute_values_bool]    Script Date: 2020-12-10 19:55:29 ******/
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
/****** Object:  Table [dbo].[product_attribute_values_int]    Script Date: 2020-12-10 19:55:29 ******/
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
/****** Object:  Table [dbo].[product_attribute_values_str]    Script Date: 2020-12-10 19:55:29 ******/
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
/****** Object:  Table [dbo].[product_attributes]    Script Date: 2020-12-10 19:55:29 ******/
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
/****** Object:  Table [dbo].[product_categories]    Script Date: 2020-12-10 19:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_categories](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
 CONSTRAINT [product_categories_pk] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_images]    Script Date: 2020-12-10 19:55:29 ******/
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
/****** Object:  Table [dbo].[product_pricing_history]    Script Date: 2020-12-10 19:55:29 ******/
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
/****** Object:  Table [dbo].[products]    Script Date: 2020-12-10 19:55:29 ******/
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
	[normal_price] [decimal](10, 2) NOT NULL,
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
	[updated_at] [datetime] NULL,
 CONSTRAINT [products_pk] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shipping_address]    Script Date: 2020-12-10 19:55:29 ******/
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
/****** Object:  Table [dbo].[suburbs]    Script Date: 2020-12-10 19:55:29 ******/
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
/****** Object:  Table [dbo].[user_reviews]    Script Date: 2020-12-10 19:55:29 ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_newsletter_campains]    Script Date: 2020-12-10 19:55:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_newsletter_campains] ON [dbo].[newsletter_campaigns]
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [other_shops_title_uindex]    Script Date: 2020-12-10 19:55:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [other_shops_title_uindex] ON [dbo].[other_shops]
(
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [product_categories_title_uindex]    Script Date: 2020-12-10 19:55:29 ******/
CREATE UNIQUE NONCLUSTERED INDEX [product_categories_title_uindex] ON [dbo].[product_categories]
(
	[title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[notification_history] ADD  CONSTRAINT [DF_notification_history_bookingId]  DEFAULT ((452875)) FOR [bookingId]
GO
ALTER TABLE [dbo].[notification_history] ADD  CONSTRAINT [DF_notification_history_gdsPnr]  DEFAULT ('PUSHKI') FOR [gdsPnr]
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
/****** Object:  StoredProcedure [dbo].[BlackFridayCampaignPercetangeBuy]    Script Date: 2020-12-10 19:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BlackFridayCampaignPercetangeBuy]
@CampaignCode varchar(50)
AS
	DECLARE @totalRecipients BIGINT;
	DECLARE @totalUniqueBuyers BIGINT;

	SET @totalRecipients = (SELECT COUNT(DISTINCT(O.user_id))
	FROM newsletter_campaigns C
	JOIN newsletter_recipients R ON R.campaign_id = C.id
	JOIN orders O ON O.user_id = R.user_id
	JOIN order_items OI ON OI.order_id = O.id
	JOIN (
	  SELECT P.product_id FROM newsletter_campaigns C
	  JOIN newsletter_products P ON P.campaign_id = C.id
	  WHERE C.code = 'BLACK_FRIDAY_2020'
	) AS promo_products ON promo_products.product_id  = OI.product_id
	WHERE C.code = 'BLACK_FRIDAY_2020'
	AND O.is_success= 1
	AND O.created_at >= C.started_at
	AND O.created_at <= C.ended_at)


	SET @totalUniqueBuyers = (SELECT COUNT(R.user_id)  FROM newsletter_campaigns C
	  JOIN newsletter_recipients R ON R.campaign_id = C.id
	  WHERE C.code = 'BLACK_FRIDAY_2020')
 
	SELECT ROUND(CONVERT(float,@totalRecipients)/CONVERT(float,@totalUniqueBuyers)*100,2) AS percentage
GO
/****** Object:  StoredProcedure [dbo].[FetchTopCategory]    Script Date: 2020-12-10 19:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchTopCategory]   
 
AS   

  SELECT TOP 1 * FROM dbo.product_categories
GO
/****** Object:  StoredProcedure [dbo].[GetTopProductsFromCampaign]    Script Date: 2020-12-10 19:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTopProductsFromCampaign] @CampaignCode varchar(50)
AS
DECLARE @totalCampaignSales decimal

SET @totalCampaignSales = (SELECT SUM(OI.total_net_price) 
							FROM order_items OI 
							JOIN orders O ON O.id = OI.order_id
							JOIN newsletter_products NP ON NP.product_id = OI.product_id
							JOIN newsletter_campaigns NC ON NC.id = NP.campaign_id
							WHERE O.is_success =1 AND O.created_at >= NC.started_at 
							AND O.created_at <= NC.ended_at
							AND NC.code = @CampaignCode)

SELECT NP.product_id, P.title,
SUM(CASE WHEN OI.quantity IS NULL THEN 0 ELSE OI.quantity END)  AS totalQuantity,
COUNT(CASE WHEN O.id IS NULL THEN 0 ELSE O.id END)  AS totalOrders,
SUM(CASE WHEN OI.quantity IS NULL THEN 0 ELSE OI.total_net_price END)  AS totalNet,
ROUND(SUM(CASE WHEN OI.quantity IS NULL THEN 0 ELSE OI.total_net_price END) * 100/@totalCampaignSales,2) AS salesPercent
FROM newsletter_products NP
JOIN newsletter_campaigns NC ON NC.id = NP.campaign_id
JOIN products P ON P.id = NP.product_id
LEFT JOIN  order_items OI ON OI.product_id = NP.product_id
LEFT JOIN orders O ON O.id = OI.order_id
WHERE O.is_success =1 OR O.is_success IS NULL
AND NC.code = @CampaignCode
AND 
(
	(O.created_at >= NC.started_at AND O.created_at <= NC.ended_at)
	OR O.created_at IS NULL
)	
GROUP BY NP.product_id, P.title
ORDER BY totalNet DESC
GO
/****** Object:  StoredProcedure [dbo].[LastTKSegments]    Script Date: 2020-12-10 19:55:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LastTKSegments]
@inputGdsPnr varchar(6),
@inputBookingId bigint
AS

DECLARE @routeIter varchar(6)
DECLARE @statusIter varchar(2)

DECLARE @unID bigint
DECLARE @tkID bigint
DECLARE @unTid datetime /* tid Danish for time */
DECLARE @tkTid datetime

DECLARE @finalTkSegments TABLE (segRoute varchar(6),departsAt datetime)


DECLARE routeCursor CURSOR FOR SELECT DISTINCT(route) FROM notification_history WHERE gdsPnr = @inputGdsPnr AND bookingId = @inputBookingId
OPEN routeCursor;

FETCH NEXT FROM routeCursor INTO @routeIter;  
WHILE @@FETCH_STATUS = 0  
BEGIN
	PRINT @routeIter
	SET @tkID = (SELECT TOP 1 id FROM notification_history WHERE route=@routeIter AND status = 'TK' ORDER BY gdsNotifiedAt DESC)
	SET @tkTid = (SELECT TOP 1 gdsNotifiedAt FROM notification_history WHERE route=@routeIter AND status = 'TK' ORDER BY gdsNotifiedAt DESC)

	SET @unID = (SELECT TOP 1 id FROM notification_history WHERE route=@routeIter AND status = 'UN' ORDER BY gdsNotifiedAt DESC)
	SET @unTid = (SELECT TOP 1 gdsNotifiedAt FROM notification_history WHERE route=@routeIter AND status = 'UN' ORDER BY gdsNotifiedAt DESC)
			
	IF DATEDIFF(day, @unTid,@tkTid) >=0 AND @tkID IS NOT NULL AND @unID IS NOT NULL
	BEGIN
		INSERT INTO @finalTkSegments 
		SELECT route,departs_at FROM notification_history WHERE id = @tkID
	END
	FETCH NEXT FROM routeCursor INTO @routeIter; 
END;

CLOSE routeCursor;
DEALLOCATE routeCursor;
SELECT * FROM @finalTkSegments ORDER BY departsAt ASC
GO
USE [master]
GO
ALTER DATABASE [multishopdb] SET  READ_WRITE 
GO
