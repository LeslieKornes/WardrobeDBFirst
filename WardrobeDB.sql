USE [master]
GO
/****** Object:  Database [Wardrobe]    Script Date: 5/16/2017 2:33:24 AM ******/
CREATE DATABASE [Wardrobe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Wardrobe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Wardrobe.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Wardrobe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Wardrobe_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Wardrobe] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Wardrobe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Wardrobe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Wardrobe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Wardrobe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Wardrobe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Wardrobe] SET ARITHABORT OFF 
GO
ALTER DATABASE [Wardrobe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Wardrobe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Wardrobe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Wardrobe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Wardrobe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Wardrobe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Wardrobe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Wardrobe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Wardrobe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Wardrobe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Wardrobe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Wardrobe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Wardrobe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Wardrobe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Wardrobe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Wardrobe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Wardrobe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Wardrobe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Wardrobe] SET  MULTI_USER 
GO
ALTER DATABASE [Wardrobe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Wardrobe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Wardrobe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Wardrobe] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Wardrobe] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Wardrobe]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 5/16/2017 2:33:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[ColorID] [int] IDENTITY(1,1) NOT NULL,
	[Color] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Itemtypes]    Script Date: 5/16/2017 2:33:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Itemtypes](
	[ItemTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ItemType] [nvarchar](12) NOT NULL,
 CONSTRAINT [PK_Itemtypes] PRIMARY KEY CLUSTERED 
(
	[ItemTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Occasions]    Script Date: 5/16/2017 2:33:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Occasions](
	[OccasionID] [int] IDENTITY(1,1) NOT NULL,
	[Occasion] [nchar](12) NOT NULL,
 CONSTRAINT [PK_Occasions] PRIMARY KEY CLUSTERED 
(
	[OccasionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Seasons]    Script Date: 5/16/2017 2:33:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seasons](
	[SeasonID] [int] IDENTITY(1,1) NOT NULL,
	[Season] [nvarchar](12) NOT NULL,
 CONSTRAINT [PK_Seasons] PRIMARY KEY CLUSTERED 
(
	[SeasonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WardrobeItems]    Script Date: 5/16/2017 2:33:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WardrobeItems](
	[WardrobeItemID] [int] IDENTITY(1,1) NOT NULL,
	[ItemTypeID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](100) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[ColorID] [int] NOT NULL,
	[SeasonID] [int] NOT NULL,
	[OccasionID] [int] NOT NULL,
 CONSTRAINT [PK_WardrobeItems] PRIMARY KEY CLUSTERED 
(
	[WardrobeItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([ColorID], [Color]) VALUES (1, N'Black')
INSERT [dbo].[Colors] ([ColorID], [Color]) VALUES (2, N'Brown')
INSERT [dbo].[Colors] ([ColorID], [Color]) VALUES (3, N'Blue')
INSERT [dbo].[Colors] ([ColorID], [Color]) VALUES (4, N'Red')
INSERT [dbo].[Colors] ([ColorID], [Color]) VALUES (5, N'Green')
INSERT [dbo].[Colors] ([ColorID], [Color]) VALUES (6, N'Grey')
INSERT [dbo].[Colors] ([ColorID], [Color]) VALUES (7, N'White')
INSERT [dbo].[Colors] ([ColorID], [Color]) VALUES (8, N'Orange')
INSERT [dbo].[Colors] ([ColorID], [Color]) VALUES (9, N'Yellow')
INSERT [dbo].[Colors] ([ColorID], [Color]) VALUES (10, N'Purple')
INSERT [dbo].[Colors] ([ColorID], [Color]) VALUES (11, N'Tan')
INSERT [dbo].[Colors] ([ColorID], [Color]) VALUES (12, N'Pink')
INSERT [dbo].[Colors] ([ColorID], [Color]) VALUES (13, N'Teal')
INSERT [dbo].[Colors] ([ColorID], [Color]) VALUES (14, N'Pattern')
SET IDENTITY_INSERT [dbo].[Colors] OFF
SET IDENTITY_INSERT [dbo].[Itemtypes] ON 

INSERT [dbo].[Itemtypes] ([ItemTypeID], [ItemType]) VALUES (1, N'Tops')
INSERT [dbo].[Itemtypes] ([ItemTypeID], [ItemType]) VALUES (2, N'Bottoms')
INSERT [dbo].[Itemtypes] ([ItemTypeID], [ItemType]) VALUES (3, N'Shoes')
INSERT [dbo].[Itemtypes] ([ItemTypeID], [ItemType]) VALUES (4, N'Accessories')
SET IDENTITY_INSERT [dbo].[Itemtypes] OFF
SET IDENTITY_INSERT [dbo].[Occasions] ON 

INSERT [dbo].[Occasions] ([OccasionID], [Occasion]) VALUES (1, N'Formal      ')
INSERT [dbo].[Occasions] ([OccasionID], [Occasion]) VALUES (2, N'Casual      ')
INSERT [dbo].[Occasions] ([OccasionID], [Occasion]) VALUES (3, N'Sport       ')
INSERT [dbo].[Occasions] ([OccasionID], [Occasion]) VALUES (4, N'Business    ')
SET IDENTITY_INSERT [dbo].[Occasions] OFF
SET IDENTITY_INSERT [dbo].[Seasons] ON 

INSERT [dbo].[Seasons] ([SeasonID], [Season]) VALUES (1, N'Spring')
INSERT [dbo].[Seasons] ([SeasonID], [Season]) VALUES (2, N'Summer')
INSERT [dbo].[Seasons] ([SeasonID], [Season]) VALUES (3, N'Fall')
INSERT [dbo].[Seasons] ([SeasonID], [Season]) VALUES (4, N'Winter')
INSERT [dbo].[Seasons] ([SeasonID], [Season]) VALUES (5, N'Year-Round')
SET IDENTITY_INSERT [dbo].[Seasons] OFF
SET IDENTITY_INSERT [dbo].[WardrobeItems] ON 

INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [ItemTypeID], [Name], [Image], [Type], [ColorID], [SeasonID], [OccasionID]) VALUES (2, 3, N'Converse', N'https://media.kohlsimg.com/is/image/kohls/235921_Black_Ox?wid=240&hei=240&op_sharpen=1', N'Sneakers', 1, 5, 2)
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [ItemTypeID], [Name], [Image], [Type], [ColorID], [SeasonID], [OccasionID]) VALUES (6, 3, N'Nice Pumps!', N'https://c1.staticflickr.com/9/8119/8659294133_07a855463a_b.jpg', N'High Heels', 3, 5, 1)
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [ItemTypeID], [Name], [Image], [Type], [ColorID], [SeasonID], [OccasionID]) VALUES (7, 3, N'Puddle Splashers ', N'http://www.publicdomainpictures.net/pictures/70000/velka/wellington-boots.jpg', N'Rubber Rain Boots', 14, 1, 2)
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [ItemTypeID], [Name], [Image], [Type], [ColorID], [SeasonID], [OccasionID]) VALUES (8, 3, N'My Old Reliables', N'https://thumbs.dreamstime.com/t/women-s-shoes-winter-boots-white-background-isolated-86191609.jpg', N'Winter Boots', 2, 4, 2)
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [ItemTypeID], [Name], [Image], [Type], [ColorID], [SeasonID], [OccasionID]) VALUES (9, 3, N'Funky and Fun!', N'https://upload.wikimedia.org/wikipedia/commons/7/78/Geta.JPG', N'Sandals', 14, 2, 2)
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [ItemTypeID], [Name], [Image], [Type], [ColorID], [SeasonID], [OccasionID]) VALUES (10, 3, N'Cool Kicks', N'https://thumbs.dreamstime.com/t/close-up-women-s-sport-shoes-white-background-71640051.jpg', N'Tennis Shoes', 7, 5, 3)
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [ItemTypeID], [Name], [Image], [Type], [ColorID], [SeasonID], [OccasionID]) VALUES (11, 1, N'Fave Tee', N'http://www.joebuy.com/images/ali_goods_pic/26/15776_p_g48378.jpg', N'Tee Shirt', 9, 5, 2)
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [ItemTypeID], [Name], [Image], [Type], [ColorID], [SeasonID], [OccasionID]) VALUES (12, 1, N'Oatmeal All Day', N'http://www.rhsknitsourcing.com/images/slide/20.jpg', N'Sweater', 11, 4, 2)
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [ItemTypeID], [Name], [Image], [Type], [ColorID], [SeasonID], [OccasionID]) VALUES (13, 1, N'Go To Button Down', N'http://www.polyvore.com/cgi/img-thing?.out=jpg&size=l&tid=64321838', N'Button Down Flannel Shirt', 14, 3, 2)
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [ItemTypeID], [Name], [Image], [Type], [ColorID], [SeasonID], [OccasionID]) VALUES (14, 1, N'Funny Muscle Shirt', N'https://img1.etsystatic.com/160/0/12799468/il_340x270.1139751879_4vpj.jpg', N'Tank Top', 6, 2, 3)
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [ItemTypeID], [Name], [Image], [Type], [ColorID], [SeasonID], [OccasionID]) VALUES (15, 1, N'Essential', N'https://s-media-cache-ak0.pinimg.com/564x/a3/10/1e/a3101e86a4551b73eba9a324bddc89ef.jpg', N'Button Down Business Shirt', 7, 3, 4)
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [ItemTypeID], [Name], [Image], [Type], [ColorID], [SeasonID], [OccasionID]) VALUES (16, 1, N'Spring Sprung', N'http://www.rustyzipper.com/full/315637.jpg', N'Light Blouse', 14, 1, 4)
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [ItemTypeID], [Name], [Image], [Type], [ColorID], [SeasonID], [OccasionID]) VALUES (17, 1, N'Comfy Dressed Up', N'https://s-media-cache-ak0.pinimg.com/736x/27/3e/f4/273ef460d850bfc05f1d76c914c1a1a3.jpg', N'Tuxedo Shirt', 7, 5, 1)
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [ItemTypeID], [Name], [Image], [Type], [ColorID], [SeasonID], [OccasionID]) VALUES (18, 2, N'Tried and True', N'http://s7d5.scene7.com/is/image/ColumbiaSportswear2/1708611_010_f?$MHW_grid$&align=0,1', N'Versatile Pants', 1, 5, 2)
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [ItemTypeID], [Name], [Image], [Type], [ColorID], [SeasonID], [OccasionID]) VALUES (19, 2, N'Dumpy Bottoms', N'http://www.rustyzipper.com/full/260355-M54435.jpg', N'Jeans', 1, 5, 2)
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [ItemTypeID], [Name], [Image], [Type], [ColorID], [SeasonID], [OccasionID]) VALUES (20, 2, N'Banana! Yeah!', N'http://www.rustyzipper.com/pics/320825-A20525.jpg', N'Harem', 9, 2, 2)
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [ItemTypeID], [Name], [Image], [Type], [ColorID], [SeasonID], [OccasionID]) VALUES (21, 2, N'Pretty in Pink?', N'https://cdn.lookastic.com/hot-pink-dress-pants-original-4511422.jpg', N'Slacks', 12, 1, 1)
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [ItemTypeID], [Name], [Image], [Type], [ColorID], [SeasonID], [OccasionID]) VALUES (22, 4, N'Balls Galore', N'http://nord.imgix.net/Zoom/13/_100340093.jpg', N'Bracelet', 14, 5, 1)
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [ItemTypeID], [Name], [Image], [Type], [ColorID], [SeasonID], [OccasionID]) VALUES (23, 4, N'Futuristic Timepiece', N'http://www.ashford.com/images/catalog/rado/sintra/R13767172_FXA.jpg', N'Watch', 1, 5, 1)
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [ItemTypeID], [Name], [Image], [Type], [ColorID], [SeasonID], [OccasionID]) VALUES (24, 4, N'Black Lennons', N'https://images-na.ssl-images-amazon.com/images/I/71p9EvIIwQL._UX679_.jpg', N'Sunglasses', 1, 2, 2)
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [ItemTypeID], [Name], [Image], [Type], [ColorID], [SeasonID], [OccasionID]) VALUES (25, 4, N'Rastafar-I', N'https://images-na.ssl-images-amazon.com/images/I/710QA6dzfnL._UX395_.jpg', N'Necklace', 14, 5, 2)
SET IDENTITY_INSERT [dbo].[WardrobeItems] OFF
ALTER TABLE [dbo].[WardrobeItems]  WITH CHECK ADD  CONSTRAINT [FK_WardrobeItems_Colors] FOREIGN KEY([ColorID])
REFERENCES [dbo].[Colors] ([ColorID])
GO
ALTER TABLE [dbo].[WardrobeItems] CHECK CONSTRAINT [FK_WardrobeItems_Colors]
GO
ALTER TABLE [dbo].[WardrobeItems]  WITH CHECK ADD  CONSTRAINT [FK_WardrobeItems_Itemtypes] FOREIGN KEY([ItemTypeID])
REFERENCES [dbo].[Itemtypes] ([ItemTypeID])
GO
ALTER TABLE [dbo].[WardrobeItems] CHECK CONSTRAINT [FK_WardrobeItems_Itemtypes]
GO
ALTER TABLE [dbo].[WardrobeItems]  WITH CHECK ADD  CONSTRAINT [FK_WardrobeItems_Occasions] FOREIGN KEY([OccasionID])
REFERENCES [dbo].[Occasions] ([OccasionID])
GO
ALTER TABLE [dbo].[WardrobeItems] CHECK CONSTRAINT [FK_WardrobeItems_Occasions]
GO
ALTER TABLE [dbo].[WardrobeItems]  WITH CHECK ADD  CONSTRAINT [FK_WardrobeItems_Seasons] FOREIGN KEY([SeasonID])
REFERENCES [dbo].[Seasons] ([SeasonID])
GO
ALTER TABLE [dbo].[WardrobeItems] CHECK CONSTRAINT [FK_WardrobeItems_Seasons]
GO
USE [master]
GO
ALTER DATABASE [Wardrobe] SET  READ_WRITE 
GO
