USE [master]
GO
/****** Object:  Database [books]    Script Date: 26/07/2018 12:47:45 SA ******/
CREATE DATABASE [books]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'books', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.NAM\MSSQL\DATA\books.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'books_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.NAM\MSSQL\DATA\books_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [books] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [books].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [books] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [books] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [books] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [books] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [books] SET ARITHABORT OFF 
GO
ALTER DATABASE [books] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [books] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [books] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [books] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [books] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [books] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [books] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [books] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [books] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [books] SET  ENABLE_BROKER 
GO
ALTER DATABASE [books] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [books] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [books] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [books] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [books] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [books] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [books] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [books] SET RECOVERY FULL 
GO
ALTER DATABASE [books] SET  MULTI_USER 
GO
ALTER DATABASE [books] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [books] SET DB_CHAINING OFF 
GO
ALTER DATABASE [books] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [books] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [books] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'books', N'ON'
GO
USE [books]
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 26/07/2018 12:47:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADMIN](
	[UID] [char](10) NOT NULL,
	[TK] [char](20) NOT NULL,
	[PASSWORD] [char](20) NOT NULL,
 CONSTRAINT [PK_ADMIN] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NHA_XUAT_BAN]    Script Date: 26/07/2018 12:47:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHA_XUAT_BAN](
	[MA_NXB] [char](10) NOT NULL,
	[TEN_NXB] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_NHA_XUAT_BAN] PRIMARY KEY CLUSTERED 
(
	[MA_NXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SACH]    Script Date: 26/07/2018 12:47:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SACH](
	[MA_SACH] [int] IDENTITY(100000,1) NOT NULL,
	[TEN_SACH] [ntext] NOT NULL,
	[NOI_DUNG] [ntext] NULL,
	[ANH] [ntext] NULL,
	[GIA] [char](20) NOT NULL,
	[NGAY_BAN] [datetime] NOT NULL CONSTRAINT [DF__SACH__NGAY_BAN__145C0A3F]  DEFAULT (getdate()),
 CONSTRAINT [PK_SACH] PRIMARY KEY CLUSTERED 
(
	[MA_SACH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SACH_NXB]    Script Date: 26/07/2018 12:47:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SACH_NXB](
	[MA_SACH] [int] NOT NULL,
	[MA_NXB] [char](10) NOT NULL,
 CONSTRAINT [PK_SACH_NXB] PRIMARY KEY CLUSTERED 
(
	[MA_SACH] ASC,
	[MA_NXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SACH_TAC_GIA]    Script Date: 26/07/2018 12:47:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SACH_TAC_GIA](
	[MA_SACH] [int] NOT NULL,
	[MA_TAC_GIA] [int] NOT NULL,
 CONSTRAINT [PK_SACH_TAC_GIA] PRIMARY KEY CLUSTERED 
(
	[MA_SACH] ASC,
	[MA_TAC_GIA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SACH_THE_LOAI]    Script Date: 26/07/2018 12:47:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SACH_THE_LOAI](
	[MA_THE_LOAI] [char](10) NOT NULL,
	[MA_SACH] [int] NOT NULL,
 CONSTRAINT [PK_SACH_THE_LOAI] PRIMARY KEY CLUSTERED 
(
	[MA_THE_LOAI] ASC,
	[MA_SACH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TAC_GIA]    Script Date: 26/07/2018 12:47:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAC_GIA](
	[MA_TAC_GIA] [int] IDENTITY(100,1) NOT NULL,
	[TEN_TAC_GIA] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_TAC_GIA] PRIMARY KEY CLUSTERED 
(
	[MA_TAC_GIA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[THE_LOAI]    Script Date: 26/07/2018 12:47:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[THE_LOAI](
	[MA_THE_LOAI] [char](10) NOT NULL,
	[TEN_THE_LOAI] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_THE_LOAI] PRIMARY KEY CLUSTERED 
(
	[MA_THE_LOAI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Y_KIEN]    Script Date: 26/07/2018 12:47:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Y_KIEN](
	[MA_SACH] [int] NOT NULL,
	[MA_Y_KIEN] [bigint] IDENTITY(1,1) NOT NULL,
	[NOI_DUNG] [ntext] NOT NULL,
	[DANH_GIA] [nvarchar](10) NOT NULL,
	[NGAY] [datetime] NOT NULL,
 CONSTRAINT [PK_Y_KIEN] PRIMARY KEY CLUSTERED 
(
	[MA_SACH] ASC,
	[MA_Y_KIEN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[NHA_XUAT_BAN] ([MA_NXB], [TEN_NXB]) VALUES (N'AB        ', N'ArtBook')
INSERT [dbo].[NHA_XUAT_BAN] ([MA_NXB], [TEN_NXB]) VALUES (N'LD        ', N'NXB Lao động')
INSERT [dbo].[NHA_XUAT_BAN] ([MA_NXB], [TEN_NXB]) VALUES (N'NXBT      ', N'NXB Trẻ')
INSERT [dbo].[NHA_XUAT_BAN] ([MA_NXB], [TEN_NXB]) VALUES (N'NXBTH     ', N' Nxb Tổng hợp TP.HCM')
INSERT [dbo].[NHA_XUAT_BAN] ([MA_NXB], [TEN_NXB]) VALUES (N'TH        ', N'Thái Hà')
INSERT [dbo].[NHA_XUAT_BAN] ([MA_NXB], [TEN_NXB]) VALUES (N'VL        ', N'Văn Lang')
SET IDENTITY_INSERT [dbo].[SACH] ON 

INSERT [dbo].[SACH] ([MA_SACH], [TEN_SACH], [NOI_DUNG], [ANH], [GIA], [NGAY_BAN]) VALUES (100001, N'Đắc Nhân Tâm Trong Thời Đại Số', N'Cách thức chúng ta giao tiếp và gây ảnh hưởng đến người khác đã thay đổi mạnh mẽ trong thời đại số hiện nay. Các cổng giao tiếp không ngừng tăng lên — Facebook, Twitter, Skype, email, điện thoại di động — nhưng xét về nhiều phương diện, những cách thức giao tiếp này đang trở nên máy móc hơn. Chính vì vậy mà nghệ thuật làm chủ giao tiếp của Dale Carnegie lại trở nên cần thiết hơn bao giờ hết. Với ĐẮC NHÂN TÂM TRONG THỜI ĐẠI SỐ, công ty Dale Carnegie và cộng sự đã biên soạn lại và bổ sung nội dung cho cuốn sách kinh điển này để hướng đến thế kỷ 21, đồng thời giữ lại các giá trị nền tảng của nó—những giá trị giúp chúng ta đạt đến sự thành công.

  “Chúng ta sống trong một thời đại chưa từng thấy trước đây: thời đại tự lực và tự đề cao”, cuốn sách viết. “Chúng ta xem những phim video trên YouTube, như Double Rainbow, lan truyền rất nhanh trong vài tuần và thu hút sự chú ý của cả thế giới — điều mà trước đây người ta phải lao động cật lực trong nhiều năm, thậm chí nhiều thập niên, mới có được… Hàng ngày, chúng ta bị cám dỗ phải tin rằng chiến thuật quảng bá hiệu quả nhất là sự kết hợp giữa chiêu lừa và trò nhại qua phương tiện truyền thông có khả năng truyền tin nhanh nhất. Cám dỗ này quá lớn đối với nhiều người. Nhưng với những ai hiểu được điều cơ bản trong quan hệ giữa con người thì có một cách quảng bá hiệu quả hơn, uy tín hơn, lâu bền hơn”.

    ĐẮC NHÂN TÂM TRONG THỜI ĐẠI SỐ mang đến cho độc giả những yếu tố quan trọng nhất để được quý mến : sự khích lệ, sự cộng tác và sự giao tiếp thật sự. Khả năng nhìn thấy ưu điểm của người khác và kết nối được với những ước muốn cơ bản của họ thông qua đối thoại chứ không phải độc thoại là yếu tố quan trọng nhất — điều này vẫn còn nguyên giá trị như khi Carnegie đã viết vào năm 1936. Có khác chăng chỉ là công cụ được sử dụng. Email và mạng xã hội chỉ có thể được tận dụng hiệu quả nếu chúng được xem như công cụ giúp kết nối chứ không phải dành cho mục đích tán dương bản thân một cách mù quáng. Cuốn sách bàn về cách sử dụng kênh giao tiếp của bạn sao cho hiệu quả nhất thông qua các trang mạng xã hội, nhấn mạnh việc xây dựng các mối quan hệ với bạn bè, khách hàng và đồng nghiệp.

    Thông qua cuốn sách, độc giả sẽ khám phá sáu cách tạo ấn tượng lâu dài: quan tâm đến điều người khác quan tâm, mỉm cười, thống lĩnh bằng tên gọi, lắng nghe nhiều hơn, thảo luận những điều quan trọng đối với người khác, làm cho người khác cảm thấy dễ chịu hơn một chút. Đây là các quy tắc truyền thống giúp đem lại thành công mang đậm dấu ấn của Dale Carnegie—chỉ khác một điều là phương pháp được chỉnh sửa cho phù hợp với thời đại số. Chẳng hạn, chúng ta khó mà chuyển tải một nụ cười qua email hay dòng trạng thái trên Facebook (không kể việc sử dụng một biểu tượng cảm xúc rất kém chuyên nghiệp), nhưng chắc chắn là không thiếu cách để chuyển tải thông điệp của bạn một cách tích cực mà hiệu quả của nó có thể sánh ngang với nụ cười thật sự. Cũng theo cách như vậy, chúng ta không nên biến email thành mệnh lệnh một chiều mà phải sử dụng nó như lời mời để thảo luận.   

    Những nguyên tắc mà Carnegie đưa ra để có sự thành công trong công việc cũng như trong giao tiếp vẫn luôn tồn tại với thời gian. Được minh họa bằng các câu chuyện dễ hiểu, lời khuyên của ông chứa đựng một thông điệp thậm chí còn rõ ràng hơn nữa trong thời đại ngày nay: “Quả đúng là thế giới ngày nay đang rộng mở cho các cơ hội giao thương, nhưng nhiệm vụ mà bạn phải làm trước tiên vẫn là những việc liên quan đến con người. Nỗ lực cao nhất vẫn luôn là nỗ lực cộng tác và tương tác. Cuối cùng thì nghệ thuật đắc nhân tâm trong thời đại số chính là sự kết nối và duy trì các mối quan hệ dựa trên lợi ích chung của các bên”.', N'https://www.vinabook.com/images/thumbnails/product/240x/138142_xx429.jpg', N'258.000             ', CAST(N'2018-07-21 14:00:12.283' AS DateTime))
INSERT [dbo].[SACH] ([MA_SACH], [TEN_SACH], [NOI_DUNG], [ANH], [GIA], [NGAY_BAN]) VALUES (100013, N'Harry Potter And The Prisoner of Azkaban: Illustrated Edition', N'Celebrate 20 years of Harry Potter magic! 

An extraordinary creative achievement by an extraordinary talent, Jim Kay''s inspired reimagining of J.K. Rowling''s classic series has captured a devoted following worldwide. This stunning new fully illustrated edition of Harry Potter and the Prisoner of Azkaban brings more breathtaking scenes and unforgettable characters – including Sirius Black, Remus Lupin and Professor Trelawney. With paint, pencil and pixels, Kay conjures the wizarding world as we have never seen it before. Fizzing with magic and brimming with humour, this full-colour edition will captivate fans and new readers alike as Harry, now in his third year at Hogwarts School of Witchcraft and Wizardry, faces Dementors, death omens and – of course – danger.', N'/img/Books/Untitled.png', N'890.000             ', CAST(N'2018-07-21 21:44:06.627' AS DateTime))
SET IDENTITY_INSERT [dbo].[SACH] OFF
INSERT [dbo].[SACH_NXB] ([MA_SACH], [MA_NXB]) VALUES (100001, N'NXBTH     ')
INSERT [dbo].[SACH_NXB] ([MA_SACH], [MA_NXB]) VALUES (100013, N'AB        ')
INSERT [dbo].[SACH_TAC_GIA] ([MA_SACH], [MA_TAC_GIA]) VALUES (100001, 100)
INSERT [dbo].[SACH_TAC_GIA] ([MA_SACH], [MA_TAC_GIA]) VALUES (100001, 101)
INSERT [dbo].[SACH_TAC_GIA] ([MA_SACH], [MA_TAC_GIA]) VALUES (100013, 102)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'GT        ', 100013)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'KN        ', 100001)
SET IDENTITY_INSERT [dbo].[TAC_GIA] ON 

INSERT [dbo].[TAC_GIA] ([MA_TAC_GIA], [TEN_TAC_GIA]) VALUES (100, N'Dale Carnegie')
INSERT [dbo].[TAC_GIA] ([MA_TAC_GIA], [TEN_TAC_GIA]) VALUES (101, N'Lê Huy Lâm ')
INSERT [dbo].[TAC_GIA] ([MA_TAC_GIA], [TEN_TAC_GIA]) VALUES (102, N'J. K. Rowling ')
SET IDENTITY_INSERT [dbo].[TAC_GIA] OFF
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'CNTT      ', N'Công nghê thông tin')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'DL        ', N'Du lịch')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'GT        ', N'Giả tưởng')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'KN        ', N'Kĩ năng')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'KT        ', N'Kinh tế')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'KHTN      ', N'Khoa học tự nhiên')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'LS        ', N'Lịch sử')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'TG        ', N'Tôn giáo')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'TK        ', N'Tham khảo')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'TN        ', N'Thiếu nhi')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'TT        ', N'Truyện tranh')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'VH        ', N'Văn học')
SET IDENTITY_INSERT [dbo].[Y_KIEN] ON 

INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100001, 3, N'Nội dung rất hay', N'tích cực', CAST(N'2018-07-24 17:04:47.357' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100001, 7, N'Tình tiết thú vị', N'tích cực', CAST(N'2018-07-25 11:21:59.140' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100001, 8, N'Nội dung rất hay và thú vị', N'tích cực', CAST(N'2018-07-25 12:27:01.267' AS DateTime))
SET IDENTITY_INSERT [dbo].[Y_KIEN] OFF
ALTER TABLE [dbo].[SACH_NXB]  WITH CHECK ADD  CONSTRAINT [FK_SACH_NXB_SACH_NXB_SACH] FOREIGN KEY([MA_SACH])
REFERENCES [dbo].[SACH] ([MA_SACH])
GO
ALTER TABLE [dbo].[SACH_NXB] CHECK CONSTRAINT [FK_SACH_NXB_SACH_NXB_SACH]
GO
ALTER TABLE [dbo].[SACH_NXB]  WITH CHECK ADD  CONSTRAINT [FK_SACH_NXB_SACH_NXB2_NHA_XUAT] FOREIGN KEY([MA_NXB])
REFERENCES [dbo].[NHA_XUAT_BAN] ([MA_NXB])
GO
ALTER TABLE [dbo].[SACH_NXB] CHECK CONSTRAINT [FK_SACH_NXB_SACH_NXB2_NHA_XUAT]
GO
ALTER TABLE [dbo].[SACH_TAC_GIA]  WITH CHECK ADD  CONSTRAINT [FK_SACH_TAC_SACH_TAC__SACH] FOREIGN KEY([MA_SACH])
REFERENCES [dbo].[SACH] ([MA_SACH])
GO
ALTER TABLE [dbo].[SACH_TAC_GIA] CHECK CONSTRAINT [FK_SACH_TAC_SACH_TAC__SACH]
GO
ALTER TABLE [dbo].[SACH_TAC_GIA]  WITH CHECK ADD  CONSTRAINT [FK_SACH_TAC_SACH_TAC__TAC_GIA] FOREIGN KEY([MA_TAC_GIA])
REFERENCES [dbo].[TAC_GIA] ([MA_TAC_GIA])
GO
ALTER TABLE [dbo].[SACH_TAC_GIA] CHECK CONSTRAINT [FK_SACH_TAC_SACH_TAC__TAC_GIA]
GO
ALTER TABLE [dbo].[SACH_THE_LOAI]  WITH CHECK ADD  CONSTRAINT [FK_SACH_THE_SACH_THE__SACH] FOREIGN KEY([MA_SACH])
REFERENCES [dbo].[SACH] ([MA_SACH])
GO
ALTER TABLE [dbo].[SACH_THE_LOAI] CHECK CONSTRAINT [FK_SACH_THE_SACH_THE__SACH]
GO
ALTER TABLE [dbo].[SACH_THE_LOAI]  WITH CHECK ADD  CONSTRAINT [FK_SACH_THE_SACH_THE__THE_LOAI] FOREIGN KEY([MA_THE_LOAI])
REFERENCES [dbo].[THE_LOAI] ([MA_THE_LOAI])
GO
ALTER TABLE [dbo].[SACH_THE_LOAI] CHECK CONSTRAINT [FK_SACH_THE_SACH_THE__THE_LOAI]
GO
ALTER TABLE [dbo].[Y_KIEN]  WITH CHECK ADD  CONSTRAINT [FK_Y_KIEN__ANH_GIA_SACH] FOREIGN KEY([MA_SACH])
REFERENCES [dbo].[SACH] ([MA_SACH])
GO
ALTER TABLE [dbo].[Y_KIEN] CHECK CONSTRAINT [FK_Y_KIEN__ANH_GIA_SACH]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetBookDetail]    Script Date: 26/07/2018 12:47:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetBookDetail] 
@MASACH int
AS
BEGIN
DECLARE @TACGIA nvarchar(30)
select @TACGIA from TAC_GIA where MA_TAC_GIA = (select MA_TAC_GIA from SACH_TAC_GIA where MA_SACH = @MASACH)
select *,@TACGIA as TAC_GIA from SACH where MA_SACH= @MASACH
END


GO
USE [master]
GO
ALTER DATABASE [books] SET  READ_WRITE 
GO
