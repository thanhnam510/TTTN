USE [master]
GO
/****** Object:  Database [books]    Script Date: 03/08/2018 2:28:23 CH ******/
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
/****** Object:  Table [dbo].[ADMIN]    Script Date: 03/08/2018 2:28:24 CH ******/
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
/****** Object:  Table [dbo].[NHA_XUAT_BAN]    Script Date: 03/08/2018 2:28:24 CH ******/
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
/****** Object:  Table [dbo].[SACH]    Script Date: 03/08/2018 2:28:24 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SACH](
	[MA_SACH] [int] IDENTITY(100000,1) NOT NULL,
	[TEN_SACH] [nvarchar](200) NOT NULL,
	[NOI_DUNG] [ntext] NULL,
	[ANH] [ntext] NULL,
	[GIA] [char](20) NOT NULL,
	[NGAY_BAN] [datetime] NOT NULL CONSTRAINT [DF__SACH__NGAY_BAN__145C0A3F]  DEFAULT (getdate()),
	[DANH_GIA_TOT] [int] NULL CONSTRAINT [DF_NUM1]  DEFAULT ((0)),
	[TONG_DANH_GIA] [int] NULL CONSTRAINT [DF_NUM]  DEFAULT ((0)),
 CONSTRAINT [PK_SACH] PRIMARY KEY CLUSTERED 
(
	[MA_SACH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SACH_NXB]    Script Date: 03/08/2018 2:28:24 CH ******/
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
/****** Object:  Table [dbo].[SACH_TAC_GIA]    Script Date: 03/08/2018 2:28:24 CH ******/
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
/****** Object:  Table [dbo].[SACH_THE_LOAI]    Script Date: 03/08/2018 2:28:24 CH ******/
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
/****** Object:  Table [dbo].[TAC_GIA]    Script Date: 03/08/2018 2:28:24 CH ******/
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
/****** Object:  Table [dbo].[THE_LOAI]    Script Date: 03/08/2018 2:28:24 CH ******/
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
/****** Object:  Table [dbo].[Y_KIEN]    Script Date: 03/08/2018 2:28:24 CH ******/
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

INSERT [dbo].[SACH] ([MA_SACH], [TEN_SACH], [NOI_DUNG], [ANH], [GIA], [NGAY_BAN], [DANH_GIA_TOT], [TONG_DANH_GIA]) VALUES (100001, N'Đắc Nhân Tâm Trong Thời Đại Số', N'Cách thức chúng ta giao tiếp và gây ảnh hưởng đến người khác đã thay đổi mạnh mẽ trong thời đại số hiện nay. Các cổng giao tiếp không ngừng tăng lên — Facebook, Twitter, Skype, email, điện thoại di động — nhưng xét về nhiều phương diện, những cách thức giao tiếp này đang trở nên máy móc hơn. Chính vì vậy mà nghệ thuật làm chủ giao tiếp của Dale Carnegie lại trở nên cần thiết hơn bao giờ hết. Với ĐẮC NHÂN TÂM TRONG THỜI ĐẠI SỐ, công ty Dale Carnegie và cộng sự đã biên soạn lại và bổ sung nội dung cho cuốn sách kinh điển này để hướng đến thế kỷ 21, đồng thời giữ lại các giá trị nền tảng của nó—những giá trị giúp chúng ta đạt đến sự thành công.

  “Chúng ta sống trong một thời đại chưa từng thấy trước đây: thời đại tự lực và tự đề cao”, cuốn sách viết. “Chúng ta xem những phim video trên YouTube, như Double Rainbow, lan truyền rất nhanh trong vài tuần và thu hút sự chú ý của cả thế giới — điều mà trước đây người ta phải lao động cật lực trong nhiều năm, thậm chí nhiều thập niên, mới có được… Hàng ngày, chúng ta bị cám dỗ phải tin rằng chiến thuật quảng bá hiệu quả nhất là sự kết hợp giữa chiêu lừa và trò nhại qua phương tiện truyền thông có khả năng truyền tin nhanh nhất. Cám dỗ này quá lớn đối với nhiều người. Nhưng với những ai hiểu được điều cơ bản trong quan hệ giữa con người thì có một cách quảng bá hiệu quả hơn, uy tín hơn, lâu bền hơn”.

    ĐẮC NHÂN TÂM TRONG THỜI ĐẠI SỐ mang đến cho độc giả những yếu tố quan trọng nhất để được quý mến : sự khích lệ, sự cộng tác và sự giao tiếp thật sự. Khả năng nhìn thấy ưu điểm của người khác và kết nối được với những ước muốn cơ bản của họ thông qua đối thoại chứ không phải độc thoại là yếu tố quan trọng nhất — điều này vẫn còn nguyên giá trị như khi Carnegie đã viết vào năm 1936. Có khác chăng chỉ là công cụ được sử dụng. Email và mạng xã hội chỉ có thể được tận dụng hiệu quả nếu chúng được xem như công cụ giúp kết nối chứ không phải dành cho mục đích tán dương bản thân một cách mù quáng. Cuốn sách bàn về cách sử dụng kênh giao tiếp của bạn sao cho hiệu quả nhất thông qua các trang mạng xã hội, nhấn mạnh việc xây dựng các mối quan hệ với bạn bè, khách hàng và đồng nghiệp.

    Thông qua cuốn sách, độc giả sẽ khám phá sáu cách tạo ấn tượng lâu dài: quan tâm đến điều người khác quan tâm, mỉm cười, thống lĩnh bằng tên gọi, lắng nghe nhiều hơn, thảo luận những điều quan trọng đối với người khác, làm cho người khác cảm thấy dễ chịu hơn một chút. Đây là các quy tắc truyền thống giúp đem lại thành công mang đậm dấu ấn của Dale Carnegie—chỉ khác một điều là phương pháp được chỉnh sửa cho phù hợp với thời đại số. Chẳng hạn, chúng ta khó mà chuyển tải một nụ cười qua email hay dòng trạng thái trên Facebook (không kể việc sử dụng một biểu tượng cảm xúc rất kém chuyên nghiệp), nhưng chắc chắn là không thiếu cách để chuyển tải thông điệp của bạn một cách tích cực mà hiệu quả của nó có thể sánh ngang với nụ cười thật sự. Cũng theo cách như vậy, chúng ta không nên biến email thành mệnh lệnh một chiều mà phải sử dụng nó như lời mời để thảo luận.   

    Những nguyên tắc mà Carnegie đưa ra để có sự thành công trong công việc cũng như trong giao tiếp vẫn luôn tồn tại với thời gian. Được minh họa bằng các câu chuyện dễ hiểu, lời khuyên của ông chứa đựng một thông điệp thậm chí còn rõ ràng hơn nữa trong thời đại ngày nay: “Quả đúng là thế giới ngày nay đang rộng mở cho các cơ hội giao thương, nhưng nhiệm vụ mà bạn phải làm trước tiên vẫn là những việc liên quan đến con người. Nỗ lực cao nhất vẫn luôn là nỗ lực cộng tác và tương tác. Cuối cùng thì nghệ thuật đắc nhân tâm trong thời đại số chính là sự kết nối và duy trì các mối quan hệ dựa trên lợi ích chung của các bên”.', N'/img/Books/138142_xx429.jpg', N'258.000             ', CAST(N'2018-07-21 14:00:12.283' AS DateTime), 5, 7)
INSERT [dbo].[SACH] ([MA_SACH], [TEN_SACH], [NOI_DUNG], [ANH], [GIA], [NGAY_BAN], [DANH_GIA_TOT], [TONG_DANH_GIA]) VALUES (100013, N'Harry Potter And The Prisoner of Azkaban: Illustrated Edition', N'Celebrate 20 years of Harry Potter magic! 

An extraordinary creative achievement by an extraordinary talent, Jim Kay''s inspired reimagining of J.K. Rowling''s classic series has captured a devoted following worldwide. This stunning new fully illustrated edition of Harry Potter and the Prisoner of Azkaban brings more breathtaking scenes and unforgettable characters – including Sirius Black, Remus Lupin and Professor Trelawney. With paint, pencil and pixels, Kay conjures the wizarding world as we have never seen it before. Fizzing with magic and brimming with humour, this full-colour edition will captivate fans and new readers alike as Harry, now in his third year at Hogwarts School of Witchcraft and Wizardry, faces Dementors, death omens and – of course – danger.', N'/img/Books/ha.jpg', N'890.000             ', CAST(N'2018-07-21 21:44:06.627' AS DateTime), 2, 3)
INSERT [dbo].[SACH] ([MA_SACH], [TEN_SACH], [NOI_DUNG], [ANH], [GIA], [NGAY_BAN], [DANH_GIA_TOT], [TONG_DANH_GIA]) VALUES (100014, N'Tuổi Trẻ Đáng Giá Bao Nhiêu', N'"Bạn hối tiếc vì không nắm bắt lấy một cơ hội nào đó, chẳng có ai phải mất ngủ.

Bạn trải qua những ngày tháng nhạt nhẽo với công việc bạn căm ghét, người ta chẳng hề bận lòng.

Bạn có chết mòn nơi xó tường với những ước mơ dang dở, đó không phải là việc của họ.

Suy cho cùng, quyết định là ở bạn. Muốn có điều gì hay không là tùy bạn.

Nên hãy làm những điều bạn thích. Hãy đi theo tiếng nói trái tim. Hãy sống theo cách bạn cho là mình nên sống.

Vì sau tất cả, chẳng ai quan tâm."

Nhận định

"Tôi đã đọc quyển sách này một cách thích thú. Có nhiều kiến thức và kinh nghiệm hữu ích, những điều mới mẻ ngay cả với người gần trung niên như tôi.

Tuổi trẻ đáng giá bao nhiêu? được tác giả chia làm 3 phần: HỌC, LÀM, ĐI.

Nhưng tôi thấy cuốn sách còn thể hiện một phần thứ tư nữa, đó là ĐỌC.

Hãy đọc sách, nếu bạn đọc sách một cách bền bỉ, sẽ đến lúc bạn bị thôi thúc không ngừng bởi ý muốn viết nên cuốn sách của riêng mình.

Nếu tôi còn ở tuổi đôi mươi, hẳn là tôi sẽ đọc Tuổi trẻ đáng giá bao nhiêu? nhiều hơn một lần."

(Đặng Nguyễn Đông Vy, tác giả, nhà báo)', N'/img/Books/1.gif', N'45.000              ', CAST(N'2018-07-26 12:03:02.363' AS DateTime), 16, 26)
INSERT [dbo].[SACH] ([MA_SACH], [TEN_SACH], [NOI_DUNG], [ANH], [GIA], [NGAY_BAN], [DANH_GIA_TOT], [TONG_DANH_GIA]) VALUES (100015, N'Tối Ưu Hóa Trí Thông Minh', N'Trong cuốn sách mang tính đột phá này, bạn sẽ được tìm hiểu về bộ não của mình cùng với cấu trúc va khả năng đáng ngạc nhiên của nó. Bạn sẽ khám phá về trí nhớ của mình và bộ nhớ khổng lồ của nó cũng như khả năng sáng tao, thiên hướng bẩm sinh với hình ảnh và con số của mình. Cuốn sách sẽ cung cấp cho bạn những phương pháp "hình ảnh" d8e63 phát triển tư duy ngôn ngữ và khả năng ngôn từ của bạn. Trong này còn có một chương nói về tầm quan trọng của mối liên hệ giữa trí não và cơ thể, ở đó bạn sẽ hiểu được câu châm ngôn của người xưa đúng đắn thế nào:"Cơ thể khoẻ mạnh thì trí tuệ mạnh khoẻ, trí tuệ mạnh khoẻ thì cơ thể khoẻ mạnh". Thông qua việc thực hiện những bài tập trong "Tối Ưu Hoá Trí Thông Minh", bạn sẽ cải thiện khả năng chú ý và sự tập trung, trí nhớ, cách học tập và khả năng sáng tạo. Những khả năng này sẽ tăng cường đáng kể sự tự tin và lạc quan trong cuộc sống của bạn.', N'/img/Books/2.gif', N'81.000              ', CAST(N'2018-07-26 12:07:27.940' AS DateTime), 1, 2)
INSERT [dbo].[SACH] ([MA_SACH], [TEN_SACH], [NOI_DUNG], [ANH], [GIA], [NGAY_BAN], [DANH_GIA_TOT], [TONG_DANH_GIA]) VALUES (100016, N'Nơi Ánh Đèn Rực Rỡ', N'Cô gái Nhâm Nhiễm không đón nhận tình cảm của thanh mai trúc mã Kỳ Gia Tuấn, mà lại yêu Kỳ Gia Thông – anh cùng cha khác mẹ với Gia Tuấn.
Kỳ Gia Thông là con riêng nên trưởng thành một cách độc lập, tính cách lãnh đạm, nhưng dần dần đã rung động trước sự dũng cảm, ngây thơ của Nhâm Nhiễm. Hai người cùng sống một cuộc sống xa rời mọi người, nương tựa vào nhau, nhưng cuối cùng Nhâm Nhiễm vẫn theo Kỳ Gia Tuấn đi du học ở Úc.
Kỳ Gia Thông nhận ra anh không quên được Nhâm Nhiễm nên hai năm sau đã đến Úc thăm cô, nhưng vì hiểu lầm mà thất vọng trở về.
Khi gặp lại nhau, Nhâm Nhiễm đã không còn là thiếu nữ ngây thơ ngày nào.
Tình cảm từ đơn giản, rõ ràng trở nên phức tạp, người mà cô yêu sâu đậm năm xưa đã trở nên xa lạ, đột nhiên quay đầu lại, ánh đèn đã rực rỡ, ai là người mà bạn nguyện đợi chờ mãi mãi?', N'/img/Books/img278.gif', N'72.000              ', CAST(N'2018-07-26 12:09:48.347' AS DateTime), 2, 3)
INSERT [dbo].[SACH] ([MA_SACH], [TEN_SACH], [NOI_DUNG], [ANH], [GIA], [NGAY_BAN], [DANH_GIA_TOT], [TONG_DANH_GIA]) VALUES (100017, N'P.Kotler Tiếp thị 4.0 - Dịch Chuyển Từ Truyền Thống Sang Công Nghệ Số', N'P.Kotler Tiếp thị 4.0 - Dịch Chuyển Từ Truyền Thống Sang Công Nghệ Số là quyển sách sẽ giúp bạn lèo lái thế giới không ngừng kết nối và khách hàng không ngừng thay đổi để có được nhiều khách hàng hơn, xây dựng thương hiệu hiệu quả hơn, và cuối cùng kinh doanh thành công hơn.
Ngày nay khách hàng không có nhiều thời gian và sự chú ý dành cho thương hiệu của bạn – và họ còn bị bao quanh bởi vô số các chọn lựa. Bạn phải tách khỏi đám đông, phải nổi trội, để gây sự chú ý và truyền đạt thông điệp mà khách hàng muốn nghe. “Tiếp thị 4.0” tận dụng tâm lý thay đổi của khách hàng để tiếp cận nhiều khách hàng hơn và khiến họ gắn bó với thương hiệu hơn bao giờ hết.  Quyển sách cho bạn kiến thức sâu rộng để bạn thành công trong thế giới tiếp thị ngày nay: Khám phá những nguyên tắc mới trong tiếp thị; Nổi bật và tạo ra những khoảnh khắc WOW; Xây dựng nền tảng khách hàng trung thành và có tiếng nói; và Biết ai sẽ là người định hình tương lai của các chọn lựa của khách hàng…
Quyển sách gồm ba phần, với các nội dung:
“Phần đầu tiên của cuốn sách là kết quả quan sát của chúng tôi về thế giới chúng ta đang sinh sống. Chúng tôi bắt đầu bằng cách bám sát ba thay đổi lớn đang định hình thế giới chúng ta. Chúng tôi đi vào chi tiết hơn để khám phá xem khả năng kết nối đã thay đổi cơ bản cuộc sống của con người như thế nào. Không chỉ dừng lại ở đó, chúng tôi đi sâu hơn vào một số nhóm tiểu văn hóa chính trong kỷ nguyên số - đó là giới trẻ, phụ nữ và công dân mạng, hứa hẹn sẽ là nền tảng cho một thế hệ khách hàng mới.
Phần thứ hai cũng là phần trọng tâm của cuốn sách, sẽ thảo luận về cách người làm tiếp thị có thể gia tăng hiệu suất bằng cách tìm hiểu về hành trình khách hàng trong kỷ nguyên số. Phần này sẽ giới thiệu một hệ thống mới các chỉ số tiếp thị và cách nhìn hoàn toàn mới về  cách đánh giá hoạt động tiếp thị của chúng ta. Chúng tôi cũng đào sâu hơn vào một số ngành quan trọng và cách áp dụng những ý tưởng từ “Tiếp thị 4.0” vào các ngành này.
Cuối cùng, phần thứ ba miêu tả chi tiết về các chiến thuật chủ đạo của “Tiếp thị 4.0”. Chúng tôi bắt đầu với hoạt động tiếp thị lấy con người làm trung tâm với mục tiêu nhân cách hóa thương hiệu với các giá trị của con người. Sau đó, chúng tôi tiếp tục thảo luận chuyên sâu về tiếp thị nội dung nhằm tạo ra thảo luận giữa các khách hàng. Ngoài ra, chúng tôi còn mô tả những cách giúp người làm tiếp thị có thể áp dụng phương thức tiếp thị tích hợp đa kênh nhằm tăng doanh thu cao hơn. Sau cùng, chúng tôi đào sâu vào các khái niệm về sự gắn kết với khách hàng ở kỷ nguyên số.”', N'/img/Books/img842.gif', N'78.000              ', CAST(N'2018-07-26 12:12:19.133' AS DateTime), 2, 4)
INSERT [dbo].[SACH] ([MA_SACH], [TEN_SACH], [NOI_DUNG], [ANH], [GIA], [NGAY_BAN], [DANH_GIA_TOT], [TONG_DANH_GIA]) VALUES (100018, N'Thế Giới Phẳng', N'Trong xu thế toàn cầu hóa, việc tiếp cận và tham khảo những tri thức đương đại từ những nước đã phát triển về sự chuyển động của thế giới (đang ở bước ngoặt từ “tròn” sang “phẳng”, như cách nói của tác giả) có lẽ sẽ giúp chúng ta có thêm những thông tin bổ ích để có sự chủ động trong quá trình hội nhập. Tác phẩm được xếp vào danh mục sách bán chạy nhất ở Mỹ (kể từ lần xuất bản đầu tiên tháng 4/ 2005 cho đến nay). Đây là bản dịch từ bản sách gốc mới nhất được sửa chữa, cập nhật và bổ sung hai chương mới nhất bởi chính tác giả.', N'/img/Books/img400.gif', N'203.000             ', CAST(N'2018-07-26 12:18:45.253' AS DateTime), 0, 0)
INSERT [dbo].[SACH] ([MA_SACH], [TEN_SACH], [NOI_DUNG], [ANH], [GIA], [NGAY_BAN], [DANH_GIA_TOT], [TONG_DANH_GIA]) VALUES (100019, N'Đi Tìm Lẽ Sống (Tái Bản)', N'Đi tìm lẽ sống của Viktor Frankl là một trong những quyển sách kinh điển của thời đại. Thông thường, nếu một quyển sách chỉ có một đoạn văn, một ý tưởng có sức mạnh thay đổi cuộc sống của một người, thì chỉ riêng điều đó cũng đã đủ để chúng ta đọc đi đọc lại và dành cho nó một chỗ trên kệ sách của mình. Quyển sách này có nhiều đoạn văn như thế.', N'/img/Books/ditimlesong20161.u84.d20161125.t134037.152104.jpg', N'54.000              ', CAST(N'2018-07-26 12:21:33.667' AS DateTime), 1, 2)
INSERT [dbo].[SACH] ([MA_SACH], [TEN_SACH], [NOI_DUNG], [ANH], [GIA], [NGAY_BAN], [DANH_GIA_TOT], [TONG_DANH_GIA]) VALUES (100020, N'Bước Chậm Lại Giữa Thế Gian Vội Vã', N'Chen vai thích cánh để có một chỗ bám trên xe buýt giờ đi làm, nhích từng xentimét bánh xe trên đường lúc tan sở, quay cuồng với thi cử và tiến độ công việc, lu bù vướng mắc trong những mối quan hệ cả thân lẫn sơ… bạn có luôn cảm thấy thế gian xung quanh mình đang xoay chuyển quá vội vàng?
Nếu có thể, hãy tạm dừng một bước.
Để tự hỏi, là do thế gian này vội vàng hay do chính tâm trí bạn đang quá bận rộn? Để cầm cuốn sách nhỏ dung dị mà lắng đọng này lên, chậm rãi lật giở từng trang, thong thả khám phá những điều mà chỉ khi bước chậm lại mới có thể thấu rõ: về các mối quan hệ, về chính bản thân mình, về những trăn trở trước cuộc đời và nhân thế, về bao điều lý trí rất hiểu nhưng trái tim chưa cách nào nghe theo…
Ra mắt lần đầu năm 2012, Bước chậm lại giữa thế gian vội vã của Đại đức Hae Min đã liên tục đứng đầu danh sách best-seller của nhiều trang sách trực tuyến uy tín của Hàn Quốc, trở thành cuốn sách chữa lành cho hàng triệu người trẻ luôn tất bật với nhịp sống hiện đại hối hả.', N'/img/Books/img186.gif', N'58.200              ', CAST(N'2018-07-26 12:23:06.687' AS DateTime), 4, 6)
INSERT [dbo].[SACH] ([MA_SACH], [TEN_SACH], [NOI_DUNG], [ANH], [GIA], [NGAY_BAN], [DANH_GIA_TOT], [TONG_DANH_GIA]) VALUES (100021, N'Doraemon - Chú Mèo Máy Đến Từ Tương Lai - Tập 16 (2014)', N'Một chú mèo máy sinh ngày 3 tháng 9 năm 2112. Đôrêmon đã cưỡi cỗ máy thời gian đi ngược từ thế kỷ 22 về thế kỷ 20 để làm bạn với Nôbita. Chiếc túi 4 chiều trước bụng Đôrêmon chứa đủ loại bảo bối thần kỳ, có thể cứu nguy cho Nôbita mỗi khi cậu bạn hậu đậu này gặp rắc rối.', N'/img/Books/img145.gif', N'14.200              ', CAST(N'2018-07-26 12:29:10.760' AS DateTime), 0, 0)
INSERT [dbo].[SACH] ([MA_SACH], [TEN_SACH], [NOI_DUNG], [ANH], [GIA], [NGAY_BAN], [DANH_GIA_TOT], [TONG_DANH_GIA]) VALUES (100022, N'Harry Potter And The Chamber Of Secrets', N'Harry Potter And The Chamber Of Secrets
The Dursleys were so mean and hideous that summer that all Harry Potter wanted was to get back to the Hogwarts School for Witchcraft and Wizardry. But just as he''s packing his bags, Harry receives a warning from a strange, impish creature named Dobby who says that if Harry Potter returns to Hogwarts, disaster will strike.
And strike it does. For in Harry''s second year at Hogwarts, fresh torments and horrors arise, including an outrageously stuck-up new professor, Gilderoy Lockhart, a spirit named Moaning Myrtle who haunts the girls'' bathroom, and the unwanted attentions of Ron Weasley''s younger sister, Ginny.
But each of these seem minor annoyances when the real trouble begins, and someone - or something - starts turning Hogwarts students to stone. Could it be Draco Malfoy, a more poisonous rival than ever? Could it possibly be Hagrid, whose mysterious past is finally told? Or could it be the one everyone at Hogwarts most suspects... Harry Potter himself!
This gorgeous new edition in celebration of the 20th anniversary of the publication of Harry Potter and the Sorcerer''s Stone features a newly designed cover illustrated by Caldecott Medalist Brian Selznick, as well as the beloved original interior decorations by Mary GrandPré.', N'/img/Books/d289d04bb3ea3676b0643768eff6292b.jpg', N'149.500             ', CAST(N'2018-08-01 21:03:00.583' AS DateTime), 0, 0)
INSERT [dbo].[SACH] ([MA_SACH], [TEN_SACH], [NOI_DUNG], [ANH], [GIA], [NGAY_BAN], [DANH_GIA_TOT], [TONG_DANH_GIA]) VALUES (100023, N'Thám Tử Lừng Danh Conan Tập 61 (Tái Bản 2014)', N'Thám Tử Lừng Danh Conan Tập 61 (Tái Bản 2014)

Thám Tử Lừng Danh Conan là một bộ truyện tranh trinh thám Nhật Bản của tác giả Aoyama Gõshõ.

Nhân vật chính của truyện là một thám tử học sinh trung học có tên là Kudo Shinichi - thám tử học đường xuất sắc - một lần bị bọn tội phạm ép uống thuốc độc và bị teo nhỏ thành học sinh tiểu học lấy tên là Conan Edogawa và luôn cố gắng truy tìm tung tích tổ chức Áo Đen nhằm lấy lại hình dáng cũ.

Conan - Tập 61

Các fan đang chăm chú xem Magic Kaito thì siêu đạo chích Kid xuất hiện!

Màn biểu diễn lần này là "di chuyển tức thời"!!

Các bạn có thể thưởng thức cả "Chiếc xe cổ bốc cháy" và "Vụ án máy bay giấy kì lạ"!', N'/img/Books/conan61_1.jpg', N'16.200              ', CAST(N'2018-08-02 18:35:46.673' AS DateTime), 0, 0)
INSERT [dbo].[SACH] ([MA_SACH], [TEN_SACH], [NOI_DUNG], [ANH], [GIA], [NGAY_BAN], [DANH_GIA_TOT], [TONG_DANH_GIA]) VALUES (100024, N'Harry Potter and the Sorcerer''s Stone (Book 1)', N'This special edition of Harry Potter and the Sorcerer’s Stone has a gorgeous new cover illustration by Kazu Kibuishi. Inside is the full text of the original novel, with decorations by Mary GrandPré.

Harry Potter has never been the star of a Quidditch team, scoring points while riding a broom far above the ground. He knows no spells, has never helped to hatch a dragon, and has never worn a cloak of invisibility.

All he knows is a miserable life with the Dursleys, his horrible aunt and uncle, and their abominable son, Dudley — a great big swollen spoiled bully. Harry’s room is a tiny closet at the foot of the stairs, and he hasn’t had a birthday party in eleven years.

But all that is about to change when a mysterious letter arrives by owl messenger: a letter with an invitation to an incredible place that Harry — and anyone who reads about him — will find unforgettable.

For it’s there that he finds not only friends, aerial sports, and magic in everything from classes to meals, but a great destiny that’s been waiting for him... if Harry can survive the encounter.', N'/img/Books/dc0d536ee621904cef6774925ee74394.jpg', N'210.000             ', CAST(N'2018-08-02 18:44:33.633' AS DateTime), 0, 0)
INSERT [dbo].[SACH] ([MA_SACH], [TEN_SACH], [NOI_DUNG], [ANH], [GIA], [NGAY_BAN], [DANH_GIA_TOT], [TONG_DANH_GIA]) VALUES (100025, N'Harry Potter And The Goblet Of Fire (Book 4)', N'This special edition of Harry Potter and the Sorcerer’s Stone has a gorgeous new cover illustration by Kazu Kibuishi. Inside is the full text of the original novel, with decorations by Mary GrandPré.

Harry Potter has never been the star of a Quidditch team, scoring points while riding a broom far above the ground. He knows no spells, has never helped to hatch a dragon, and has never worn a cloak of invisibility.

All he knows is a miserable life with the Dursleys, his horrible aunt and uncle, and their abominable son, Dudley — a great big swollen spoiled bully. Harry’s room is a tiny closet at the foot of the stairs, and he hasn’t had a birthday party in eleven years.

But all that is about to change when a mysterious letter arrives by owl messenger: a letter with an invitation to an incredible place that Harry — and anyone who reads about him — will find unforgettable.

For it’s there that he finds not only friends, aerial sports, and magic in everything from classes to meals, but a great destiny that’s been waiting for him... if Harry can survive the encounter.', N'/img/Books/harry_potter_and_the_goblet_of_fire_book_4_.jpg', N'210.000             ', CAST(N'2018-08-02 18:45:35.430' AS DateTime), 0, 0)
INSERT [dbo].[SACH] ([MA_SACH], [TEN_SACH], [NOI_DUNG], [ANH], [GIA], [NGAY_BAN], [DANH_GIA_TOT], [TONG_DANH_GIA]) VALUES (100026, N'Harry Potter And The Deathly Hallows (Book 7)', N'Harry Potter And The Deathly Hallows (Book 7)

As he climbs into the sidecar of Hagrid''s motorbike and takes to the skies, leaving Privet Drive for the last time, Harry Potter knows that Lord Voldemort and the Death Eaters are not far behind. The protective charm that has kept Harry safe until now is now broken, but he cannot keep hiding. The Dark Lord is breathing fear into everything Harry loves, and to stop him Harry will have to find and destroy the remaining Horcruxes.

The final battle must begin - Harry must stand and face his enemy. These new editions of the classic and internationally bestselling, multi-award-winning series feature instantly pick-up-able new jackets by Jonny Duddle, with huge child appeal, to bring Harry Potter to the next generation of readers. It''s time to PASS THE MAGIC ON', N'/img/Books/harry_potter_and_the_deathly_hallows.jpg', N'198.000             ', CAST(N'2018-08-02 18:46:38.720' AS DateTime), 0, 0)
INSERT [dbo].[SACH] ([MA_SACH], [TEN_SACH], [NOI_DUNG], [ANH], [GIA], [NGAY_BAN], [DANH_GIA_TOT], [TONG_DANH_GIA]) VALUES (100027, N'Harry Potter And The Half-Blood Prince', N'Harry Potter And The Half-Blood Prince
When Dumbledore arrives at Privet Drive one summer night to collect Harry Potter, his wand hand is blackened and shrivelled, but he does not reveal why. Secrets and suspicion are spreading through the wizarding world, and Hogwarts itself is not safe. Harry is convinced that Malfoy bears the Dark Mark: there is a Death Eater amongst them. Harry will need powerful magic and true friends as he explores Voldemort''s darkest secrets, and Dumbledore prepares him to face his destiny. These new editions of the classic and internationally bestselling, multi-award-winning series feature instantly pick-up-able new jackets by Jonny Duddle, with huge child appeal, to bring Harry Potter to the next generation of readers. It''s time to PASS THE MAGIC ON.', N'/img/Books/harry-potter-6.jpg', N'210.000             ', CAST(N'2018-08-02 18:47:57.343' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[SACH] OFF
INSERT [dbo].[SACH_NXB] ([MA_SACH], [MA_NXB]) VALUES (100001, N'NXBTH     ')
INSERT [dbo].[SACH_NXB] ([MA_SACH], [MA_NXB]) VALUES (100013, N'AB        ')
INSERT [dbo].[SACH_NXB] ([MA_SACH], [MA_NXB]) VALUES (100014, N'NXBTH     ')
INSERT [dbo].[SACH_NXB] ([MA_SACH], [MA_NXB]) VALUES (100015, N'LD        ')
INSERT [dbo].[SACH_NXB] ([MA_SACH], [MA_NXB]) VALUES (100016, N'NXBT      ')
INSERT [dbo].[SACH_NXB] ([MA_SACH], [MA_NXB]) VALUES (100017, N'NXBTH     ')
INSERT [dbo].[SACH_NXB] ([MA_SACH], [MA_NXB]) VALUES (100018, N'TH        ')
INSERT [dbo].[SACH_NXB] ([MA_SACH], [MA_NXB]) VALUES (100019, N'VL        ')
INSERT [dbo].[SACH_NXB] ([MA_SACH], [MA_NXB]) VALUES (100020, N'AB        ')
INSERT [dbo].[SACH_NXB] ([MA_SACH], [MA_NXB]) VALUES (100021, N'NXBTH     ')
INSERT [dbo].[SACH_NXB] ([MA_SACH], [MA_NXB]) VALUES (100022, N'AB        ')
INSERT [dbo].[SACH_NXB] ([MA_SACH], [MA_NXB]) VALUES (100023, N'AB        ')
INSERT [dbo].[SACH_NXB] ([MA_SACH], [MA_NXB]) VALUES (100024, N'AB        ')
INSERT [dbo].[SACH_NXB] ([MA_SACH], [MA_NXB]) VALUES (100025, N'AB        ')
INSERT [dbo].[SACH_NXB] ([MA_SACH], [MA_NXB]) VALUES (100026, N'AB        ')
INSERT [dbo].[SACH_NXB] ([MA_SACH], [MA_NXB]) VALUES (100027, N'AB        ')
INSERT [dbo].[SACH_TAC_GIA] ([MA_SACH], [MA_TAC_GIA]) VALUES (100001, 100)
INSERT [dbo].[SACH_TAC_GIA] ([MA_SACH], [MA_TAC_GIA]) VALUES (100001, 101)
INSERT [dbo].[SACH_TAC_GIA] ([MA_SACH], [MA_TAC_GIA]) VALUES (100013, 119)
INSERT [dbo].[SACH_TAC_GIA] ([MA_SACH], [MA_TAC_GIA]) VALUES (100014, 109)
INSERT [dbo].[SACH_TAC_GIA] ([MA_SACH], [MA_TAC_GIA]) VALUES (100015, 110)
INSERT [dbo].[SACH_TAC_GIA] ([MA_SACH], [MA_TAC_GIA]) VALUES (100016, 111)
INSERT [dbo].[SACH_TAC_GIA] ([MA_SACH], [MA_TAC_GIA]) VALUES (100017, 112)
INSERT [dbo].[SACH_TAC_GIA] ([MA_SACH], [MA_TAC_GIA]) VALUES (100018, 113)
INSERT [dbo].[SACH_TAC_GIA] ([MA_SACH], [MA_TAC_GIA]) VALUES (100019, 114)
INSERT [dbo].[SACH_TAC_GIA] ([MA_SACH], [MA_TAC_GIA]) VALUES (100020, 115)
INSERT [dbo].[SACH_TAC_GIA] ([MA_SACH], [MA_TAC_GIA]) VALUES (100021, 117)
INSERT [dbo].[SACH_TAC_GIA] ([MA_SACH], [MA_TAC_GIA]) VALUES (100022, 119)
INSERT [dbo].[SACH_TAC_GIA] ([MA_SACH], [MA_TAC_GIA]) VALUES (100023, 118)
INSERT [dbo].[SACH_TAC_GIA] ([MA_SACH], [MA_TAC_GIA]) VALUES (100024, 119)
INSERT [dbo].[SACH_TAC_GIA] ([MA_SACH], [MA_TAC_GIA]) VALUES (100025, 119)
INSERT [dbo].[SACH_TAC_GIA] ([MA_SACH], [MA_TAC_GIA]) VALUES (100026, 119)
INSERT [dbo].[SACH_TAC_GIA] ([MA_SACH], [MA_TAC_GIA]) VALUES (100027, 119)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'GT        ', 100013)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'GT        ', 100022)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'GT        ', 100024)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'GT        ', 100025)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'GT        ', 100026)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'GT        ', 100027)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'KN        ', 100001)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'KN        ', 100019)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'KN        ', 100020)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'KT        ', 100017)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'KT        ', 100018)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'PL        ', 100022)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'PL        ', 100024)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'PL        ', 100025)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'PL        ', 100026)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'PL        ', 100027)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'TK        ', 100001)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'TK        ', 100015)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'TN        ', 100021)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'TN        ', 100023)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'TT        ', 100021)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'TT        ', 100023)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'TTH       ', 100023)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'VH        ', 100014)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'VH        ', 100016)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'VH        ', 100022)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'VH        ', 100024)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'VH        ', 100025)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'VH        ', 100026)
INSERT [dbo].[SACH_THE_LOAI] ([MA_THE_LOAI], [MA_SACH]) VALUES (N'VH        ', 100027)
SET IDENTITY_INSERT [dbo].[TAC_GIA] ON 

INSERT [dbo].[TAC_GIA] ([MA_TAC_GIA], [TEN_TAC_GIA]) VALUES (100, N'Dale Carnegie')
INSERT [dbo].[TAC_GIA] ([MA_TAC_GIA], [TEN_TAC_GIA]) VALUES (101, N'Lê Huy Lâm')
INSERT [dbo].[TAC_GIA] ([MA_TAC_GIA], [TEN_TAC_GIA]) VALUES (102, N'J. K. Rowling')
INSERT [dbo].[TAC_GIA] ([MA_TAC_GIA], [TEN_TAC_GIA]) VALUES (109, N'Rosie Nguyễn')
INSERT [dbo].[TAC_GIA] ([MA_TAC_GIA], [TEN_TAC_GIA]) VALUES (110, N'Jame Harrison')
INSERT [dbo].[TAC_GIA] ([MA_TAC_GIA], [TEN_TAC_GIA]) VALUES (111, N'Thanh Sam Lạc Thác')
INSERT [dbo].[TAC_GIA] ([MA_TAC_GIA], [TEN_TAC_GIA]) VALUES (112, N'Nguyễn Khoa Hồng Thành')
INSERT [dbo].[TAC_GIA] ([MA_TAC_GIA], [TEN_TAC_GIA]) VALUES (113, N'Thomas L. Friedman')
INSERT [dbo].[TAC_GIA] ([MA_TAC_GIA], [TEN_TAC_GIA]) VALUES (114, N'Viktor Emil Frankl')
INSERT [dbo].[TAC_GIA] ([MA_TAC_GIA], [TEN_TAC_GIA]) VALUES (115, N'Hae Min')
INSERT [dbo].[TAC_GIA] ([MA_TAC_GIA], [TEN_TAC_GIA]) VALUES (116, N'Dương Hương')
INSERT [dbo].[TAC_GIA] ([MA_TAC_GIA], [TEN_TAC_GIA]) VALUES (117, N'Fujiko-F-Fujio')
INSERT [dbo].[TAC_GIA] ([MA_TAC_GIA], [TEN_TAC_GIA]) VALUES (118, N'Aoyama Gosho')
INSERT [dbo].[TAC_GIA] ([MA_TAC_GIA], [TEN_TAC_GIA]) VALUES (119, N'J.K. Rowling')
SET IDENTITY_INSERT [dbo].[TAC_GIA] OFF
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'AV        ', N'Anh văn')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'CNTT      ', N'Công nghê thông tin')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'DL        ', N'Du lịch')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'GT        ', N'Giả tưởng')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'KN        ', N'Kĩ năng')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'KT        ', N'Kinh tế')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'KH        ', N'Khoa học')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'KHTN      ', N'Khoa học tự nhiên')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'LS        ', N'Lịch sử')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'PL        ', N'Phiêu lưu')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'TG        ', N'Tôn giáo')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'TK        ', N'Tham khảo')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'TN        ', N'Thiếu nhi')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'TT        ', N'Truyện tranh')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'TTH       ', N'Trinh thám')
INSERT [dbo].[THE_LOAI] ([MA_THE_LOAI], [TEN_THE_LOAI]) VALUES (N'VH        ', N'Văn học')
SET IDENTITY_INSERT [dbo].[Y_KIEN] ON 

INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100001, 3, N'Nội dung rất hay', N'tích cực', CAST(N'2018-07-24 17:04:47.357' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100001, 7, N'Tình tiết thú vị', N'tích cực', CAST(N'2018-07-25 11:21:59.140' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100001, 8, N'Nội dung rất hay và thú vị', N'tích cực', CAST(N'2018-07-25 12:27:01.267' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100001, 9, N'cuốn sách này thật sự rất hay. Nội dung cực kì bổ ích cho những ai đang không tìm được điểm dừng.', N'tích cực', CAST(N'2018-07-26 11:12:31.677' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100001, 10, N'sách gì mà dở ẹc.', N'tiêu cực', CAST(N'2018-07-26 11:13:44.497' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100001, 12, N'tình tiết không hay.', N'trung lập', CAST(N'2018-07-26 11:17:10.717' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100001, 10023, N'cuốn sách thật sự bổ ích và rất phù hợp cho giới trẻ', N'tích cực', CAST(N'2018-07-30 18:27:07.147' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100013, 13, N'sách quá hay. Không có gì để chê cả. Nội dung cực kì lôi cuốn.', N'tích cực', CAST(N'2018-07-26 12:43:12.213' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100013, 14, N'Truyện này quá ảo tưởng, không thiết thực. Nội dung nhàm chán.', N'tiêu cực', CAST(N'2018-07-26 12:44:49.833' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100013, 15, N'truyện hay quá. Đọc mãi không chán. Harry Potter quá đẹp.', N'tích cực', CAST(N'2018-07-26 12:45:54.380' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 16, N'hay cực kỳ.
rất có ý nghĩa cho tuổi 17.
nếu bạn đang phân vân ko biết làm gì thì nên đọc cuốn sách này', N'tích cực', CAST(N'2018-07-26 12:54:51.810' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 20, N'cuốn sách này cũng được.', N'trung lập', CAST(N'2018-07-26 12:56:54.690' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 22, N'sách hay. đáng để đọc. sẽ ủng hộ bạn nhiều hơn nữa', N'tích cực', CAST(N'2018-07-26 12:59:57.303' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 10028, N'hay cực kỳ
rất có ý nghĩa cho tuổi 17
nếu bạn đang phân vân ko pk làm j thì nên đọc cuốn sách này', N'tích cực', CAST(N'2018-07-31 12:49:56.007' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 10035, N'Không hổ danh là cuốn best sale khắp các nhà sách. Cuốn này thực sự quá hay, chị Rosie Nguyễn đã hầu như đề cập đến mọi vấn đề của tuổi trẻ bây giờ. Mình đọc xong mà thấy cuộc đời này quả thực đẹp và rất đáng sống.', N'tích cực', CAST(N'2018-07-31 13:10:38.390' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 10036, N'Một quyển sách hay và chứa đựng nhiều điều thú vị.', N'tích cực', CAST(N'2018-07-31 13:15:06.163' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 10037, N'Quả thật quyển sách vào best seller là có lý do. Một quyển sách được viết phong cách nhẹ nhàng, dễ tiếp thu, ngắn gọn dễ đi vào lòng người. Cảm thấy refesh cuộc sống', N'tích cực', CAST(N'2018-07-31 13:15:51.943' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 10038, N'CÓ HÌNH CHỤP ĐI DU LỊCH CỦA TÁC GIẢ NỮA
SÁNG MÀU
CHỮ IN ĐỀU ĐẸP', N'tích cực', CAST(N'2018-07-31 13:16:14.147' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 10039, N'sách hay và ý nghĩa, đối với những bạn trẻ những bạn sinh viên đang còn chập chững bước vào đời', N'tích cực', CAST(N'2018-07-31 13:18:05.390' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 10040, N'hài lòng về sản phẩm', N'tích cực', CAST(N'2018-07-31 13:19:52.540' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 10041, N'sách hay nhưng mình cảm thấy không hợp với mình lắm.', N'tích cực', CAST(N'2018-07-31 13:20:46.640' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 10042, N'nội dung ý nghĩa, các bạn nên đọc , đáng đồng tiền bát gạo lắm ạ.', N'tích cực', CAST(N'2018-07-31 13:21:58.263' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 10043, N'sách cực hay và ý nghĩa em rất thích em cảm ơn ạ :3333', N'tích cực', CAST(N'2018-07-31 13:24:08.690' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 10044, N'sách phù hợp đáng dùng tuổi trẻ để đọc, đọc để biết mình làm gì và khởi đầu ra sao ?', N'tích cực', CAST(N'2018-07-31 13:24:43.393' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 10045, N'Nếu bạn là một sinh viên, hoặc là một bạn trẻ mới ra trường chưa định hướng được tương lai thì đây thực sự là cuốn sách sẽ giúp bạn sống có ước mơ, có hoài bão, và công cụ không thể thiếu để bạn trưởng thành và sống thực sự có ý nghĩa', N'tích cực', CAST(N'2018-07-31 13:32:50.490' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 10046, N'Mình thấy sách có hơi lang mang, nhưng cũng rất hữu ích cho bạn trẻ.', N'tích cực', CAST(N'2018-07-31 14:02:25.237' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 10047, N'Cuốn sách này nếu mình còn trẻ mà đọc thì mình sẽ cho nó 5 sao. Nhưng mình cũng nhiều tuổi rồi, nên nó cung cấp cho mình lượng kiến thức chỉ đánh giá khoảng 3 sao thôi :D. Nói chung là trẻ hay già, đọc cuốn này cũng được.', N'tích cực', CAST(N'2018-07-31 14:03:30.407' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 10048, N'Chất liệu giấy không tốt, để trên bàn học trong điều kiện khô ráo, không một chút ẩm mà giấy vẫn nhăn hết vào, còn cái bìa bị xước giấy ở góc tầm 2cm', N'trung lập', CAST(N'2018-07-31 14:04:36.597' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 10049, N'không thích lắm. cách viết cụ thể. nhưng hơi dài dòng.', N'trung lập', CAST(N'2018-07-31 14:11:09.097' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 10050, N'Sách không được bọc giấy bóng bên ngoài
Bụi bẩn bám vào bìa sách', N'tiêu cực', CAST(N'2018-07-31 14:41:39.613' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 10051, N'bìa trước và sau cũ vãi', N'tiêu cực', CAST(N'2018-07-31 14:42:03.647' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 10053, N'sách bị bẩn, bìa sách bị méo, mình mua làm quà vậy nên không chấp nhận được', N'tiêu cực', CAST(N'2018-07-31 14:48:01.127' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 10054, N'Chẹp. lúc đầu mình tâm đắc với sách ghê lắm, nhưng đọc xong 2 cái review của 2 bạn trên blog và hội sách. Tự nhiên thấy mình cũng hơi thất vọng và ngỡ ngàng ', N'tiêu cực', CAST(N'2018-07-31 14:51:13.740' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 10055, N'Mình hiếm khi đọc sách tác giả người Việt lắm. mình đọc thấy quyển sách này có rất rất nhiều chỗ mâu thuẫn. có những lúc khiến cho mình cảm thây phấn chấn thật sức sống thật, nhưng mình cảm thấy kiểu nó không có chiều sâu. cứ cụt sao sao ấy. mình khá là thất vọng. Lúc thì nói này lúc thì lại nói khác, ừ có thể là hợp lý trong trường hợp này nhưng trong trường hợp khác thì không, chắc có lẽ viết đến đó lại hết cảm xúc lại chuyển chủ đề. Mình chỉ đọc được nửa quyên và không thể tiếp tục', N'tiêu cực', CAST(N'2018-07-31 15:01:07.097' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 10060, N'Vài dẫn chứng của tác giả trong tác phẩm khó thuyết phục người đọc, cảm giác hơi áp đặt chủ quan của bản thân vào việc nhận định thế nào là sống có ích', N'tiêu cực', CAST(N'2018-07-31 15:37:27.463' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100014, 10062, N'Ngoài bìa đẹp với tiêu đề hay ra thì sách đọc cực kì chán.', N'tiêu cực', CAST(N'2018-07-31 16:37:56.027' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100015, 24, N'sách hay.', N'tích cực', CAST(N'2018-07-26 13:01:16.567' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100015, 25, N'sách dở quá.
', N'tiêu cực', CAST(N'2018-07-26 13:01:29.460' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100016, 26, N'nội dung hay quá đi.', N'tích cực', CAST(N'2018-07-26 13:01:50.387' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100016, 27, N'tình tiết quá dở.', N'tiêu cực', CAST(N'2018-07-26 13:02:01.603' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100016, 28, N'sách quá hay.', N'tích cực', CAST(N'2018-07-26 13:02:20.657' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100017, 29, N'tình tiết quá dở đi , quá tệ đi.', N'tiêu cực', CAST(N'2018-07-26 13:02:45.537' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100017, 30, N'nội dung quá hay.', N'tích cực', CAST(N'2018-07-26 13:02:58.113' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100017, 31, N'sách này rất hay.', N'tích cực', CAST(N'2018-07-26 13:03:40.113' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100017, 10022, N'dở quá dở', N'tiêu cực', CAST(N'2018-07-30 17:59:24.647' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100019, 32, N'sách hay quá.', N'tích cực', CAST(N'2018-07-26 13:07:06.920' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100019, 33, N'nội dung quá dở.', N'tiêu cực', CAST(N'2018-07-26 13:07:19.720' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100020, 10063, N'sách hay . nội dung nhẹ đi vào lòng ng , nhưng đến nửa sau cuốn sách m k theo tôn giáo nào lên mông lung . nói chung sách tốt . giấy đẹp.', N'tích cực', CAST(N'2018-07-31 16:51:48.940' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100020, 10064, N'sách hay, chất lượng sách rất tốt', N'tích cực', CAST(N'2018-07-31 16:52:10.207' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100020, 10065, N'Sách yêu thích của mình, mình đọc mỗi ngày để cảm thấy cuộc sống thêm bình yên và ý nghĩa', N'tích cực', CAST(N'2018-07-31 16:52:37.190' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100020, 10066, N'cuốn sách thật sự rất hay, đọc đi đọc lại suy ngẫm từng câu chữ, hay và ý nghĩa lắm.', N'tích cực', CAST(N'2018-07-31 16:52:57.817' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100020, 10068, N'Nội dung không có gì đắc sắc, gồm những mẫu truyện nhỏ nên cảm giác đọc rất nhanh, không gây nản, chủ yếu về thiền.', N'trung lập', CAST(N'2018-07-31 16:57:54.933' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100020, 10069, N'K hiểu mn thấy sao chứ cá nhân mình thấy cuốn sách này viết toàn triết lý zời bể gì mình đọc không có hiểu, thơ viết rất chán không ra thơ, 
Lúc đầu bị ấn tượng bởi cái tiêu đề, thấy nhẹ nhàng, dễ chịu, yên bình thế nên ms quyết mua bằng được. Nhưng đọc được vài trang đã cảm thấy không có hứng thú, cố đọc cho đến cuối sách rồi cuối cùng bỏ ngang vì quá chán. Lại phí tiền rồi', N'tiêu cực', CAST(N'2018-07-31 17:03:28.467' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 10070, N'Bìa đẹp, giấy cũng đẹp. Nội dung rất hay, tình tiết rất lôi cuốn. Rất ngưỡng mộ  J.K. Rowling, văn phong hay khỏi phải bàn. Nói chung là rất hay.', N'tích cực', CAST(N'2018-08-02 19:00:02.087' AS DateTime))
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
/****** Object:  StoredProcedure [dbo].[SP_GetBookDetail]    Script Date: 03/08/2018 2:28:25 CH ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Search]    Script Date: 03/08/2018 2:28:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Search]
@TheLoai nvarchar(20)
AS
BEGIN
DECLARE @MATL char(10)
select @MATL=MA_THE_LOAI from THE_LOAI where TEN_THE_LOAI =@TheLoai
select MA_SACH from SACH where MA_SACH in (select MA_SACH from SACH_THE_LOAI where MA_THE_LOAI =@MATL) 
END

GO
USE [master]
GO
ALTER DATABASE [books] SET  READ_WRITE 
GO
