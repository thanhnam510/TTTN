USE [master]
GO
/****** Object:  Database [books]    Script Date: 09/08/2018 2:02:52 SA ******/
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
/****** Object:  Table [dbo].[ADMIN]    Script Date: 09/08/2018 2:02:52 SA ******/
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
/****** Object:  Table [dbo].[NHA_XUAT_BAN]    Script Date: 09/08/2018 2:02:52 SA ******/
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
/****** Object:  Table [dbo].[SACH]    Script Date: 09/08/2018 2:02:52 SA ******/
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
/****** Object:  Table [dbo].[SACH_NXB]    Script Date: 09/08/2018 2:02:52 SA ******/
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
/****** Object:  Table [dbo].[SACH_TAC_GIA]    Script Date: 09/08/2018 2:02:52 SA ******/
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
/****** Object:  Table [dbo].[SACH_THE_LOAI]    Script Date: 09/08/2018 2:02:52 SA ******/
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
/****** Object:  Table [dbo].[TAC_GIA]    Script Date: 09/08/2018 2:02:52 SA ******/
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
/****** Object:  Table [dbo].[THE_LOAI]    Script Date: 09/08/2018 2:02:52 SA ******/
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
/****** Object:  Table [dbo].[Y_KIEN]    Script Date: 09/08/2018 2:02:52 SA ******/
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

An extraordinary creative achievement by an extraordinary talent, Jim Kay''s inspired reimagining of J.K. Rowling''s classic series has captured a devoted following worldwide. This stunning new fully illustrated edition of Harry Potter and the Prisoner of Azkaban brings more breathtaking scenes and unforgettable characters – including Sirius Black, Remus Lupin and Professor Trelawney. With paint, pencil and pixels, Kay conjures the wizarding world as we have never seen it before. Fizzing with magic and brimming with humour, this full-colour edition will captivate fans and new readers alike as Harry, now in his third year at Hogwarts School of Witchcraft and Wizardry, faces Dementors, death omens and – of course – danger.', N'/img/Books/ha.jpg', N'890.000             ', CAST(N'2018-07-21 21:44:06.627' AS DateTime), 3, 4)
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
This gorgeous new edition in celebration of the 20th anniversary of the publication of Harry Potter and the Sorcerer''s Stone features a newly designed cover illustrated by Caldecott Medalist Brian Selznick, as well as the beloved original interior decorations by Mary GrandPré.', N'/img/Books/d289d04bb3ea3676b0643768eff6292b.jpg', N'149.500             ', CAST(N'2018-08-01 21:03:00.583' AS DateTime), 4, 7)
INSERT [dbo].[SACH] ([MA_SACH], [TEN_SACH], [NOI_DUNG], [ANH], [GIA], [NGAY_BAN], [DANH_GIA_TOT], [TONG_DANH_GIA]) VALUES (100023, N'Thám Tử Lừng Danh Conan Tập 61 (Tái Bản 2014)', N'Thám Tử Lừng Danh Conan Tập 61 (Tái Bản 2014)

Thám Tử Lừng Danh Conan là một bộ truyện tranh trinh thám Nhật Bản của tác giả Aoyama Gõshõ.

Nhân vật chính của truyện là một thám tử học sinh trung học có tên là Kudo Shinichi - thám tử học đường xuất sắc - một lần bị bọn tội phạm ép uống thuốc độc và bị teo nhỏ thành học sinh tiểu học lấy tên là Conan Edogawa và luôn cố gắng truy tìm tung tích tổ chức Áo Đen nhằm lấy lại hình dáng cũ.

Conan - Tập 61

Các fan đang chăm chú xem Magic Kaito thì siêu đạo chích Kid xuất hiện!

Màn biểu diễn lần này là "di chuyển tức thời"!!

Các bạn có thể thưởng thức cả "Chiếc xe cổ bốc cháy" và "Vụ án máy bay giấy kì lạ"!', N'/img/Books/conan61_1.jpg', N'16.200              ', CAST(N'2018-08-02 18:35:46.673' AS DateTime), 1, 4)
INSERT [dbo].[SACH] ([MA_SACH], [TEN_SACH], [NOI_DUNG], [ANH], [GIA], [NGAY_BAN], [DANH_GIA_TOT], [TONG_DANH_GIA]) VALUES (100024, N'Harry Potter and the Sorcerer''s Stone (Book 1)', N'This special edition of Harry Potter and the Sorcerer’s Stone has a gorgeous new cover illustration by Kazu Kibuishi. Inside is the full text of the original novel, with decorations by Mary GrandPré.

Harry Potter has never been the star of a Quidditch team, scoring points while riding a broom far above the ground. He knows no spells, has never helped to hatch a dragon, and has never worn a cloak of invisibility.

All he knows is a miserable life with the Dursleys, his horrible aunt and uncle, and their abominable son, Dudley — a great big swollen spoiled bully. Harry’s room is a tiny closet at the foot of the stairs, and he hasn’t had a birthday party in eleven years.

But all that is about to change when a mysterious letter arrives by owl messenger: a letter with an invitation to an incredible place that Harry — and anyone who reads about him — will find unforgettable.

For it’s there that he finds not only friends, aerial sports, and magic in everything from classes to meals, but a great destiny that’s been waiting for him... if Harry can survive the encounter.', N'/img/Books/dc0d536ee621904cef6774925ee74394.jpg', N'210.000             ', CAST(N'2018-08-02 18:44:33.633' AS DateTime), 2, 7)
INSERT [dbo].[SACH] ([MA_SACH], [TEN_SACH], [NOI_DUNG], [ANH], [GIA], [NGAY_BAN], [DANH_GIA_TOT], [TONG_DANH_GIA]) VALUES (100025, N'Harry Potter And The Goblet Of Fire (Book 4)', N'This special edition of Harry Potter and the Sorcerer’s Stone has a gorgeous new cover illustration by Kazu Kibuishi. Inside is the full text of the original novel, with decorations by Mary GrandPré.

Harry Potter has never been the star of a Quidditch team, scoring points while riding a broom far above the ground. He knows no spells, has never helped to hatch a dragon, and has never worn a cloak of invisibility.

All he knows is a miserable life with the Dursleys, his horrible aunt and uncle, and their abominable son, Dudley — a great big swollen spoiled bully. Harry’s room is a tiny closet at the foot of the stairs, and he hasn’t had a birthday party in eleven years.

But all that is about to change when a mysterious letter arrives by owl messenger: a letter with an invitation to an incredible place that Harry — and anyone who reads about him — will find unforgettable.

For it’s there that he finds not only friends, aerial sports, and magic in everything from classes to meals, but a great destiny that’s been waiting for him... if Harry can survive the encounter.', N'/img/Books/harry_potter_and_the_goblet_of_fire_book_4_.jpg', N'210.000             ', CAST(N'2018-08-02 18:45:35.430' AS DateTime), 0, 0)
INSERT [dbo].[SACH] ([MA_SACH], [TEN_SACH], [NOI_DUNG], [ANH], [GIA], [NGAY_BAN], [DANH_GIA_TOT], [TONG_DANH_GIA]) VALUES (100026, N'Harry Potter And The Deathly Hallows (Book 7)', N'Harry Potter And The Deathly Hallows (Book 7)

As he climbs into the sidecar of Hagrid''s motorbike and takes to the skies, leaving Privet Drive for the last time, Harry Potter knows that Lord Voldemort and the Death Eaters are not far behind. The protective charm that has kept Harry safe until now is now broken, but he cannot keep hiding. The Dark Lord is breathing fear into everything Harry loves, and to stop him Harry will have to find and destroy the remaining Horcruxes.

The final battle must begin - Harry must stand and face his enemy. These new editions of the classic and internationally bestselling, multi-award-winning series feature instantly pick-up-able new jackets by Jonny Duddle, with huge child appeal, to bring Harry Potter to the next generation of readers. It''s time to PASS THE MAGIC ON', N'/img/Books/harry_potter_and_the_deathly_hallows.jpg', N'198.000             ', CAST(N'2018-08-02 18:46:38.720' AS DateTime), 2, 4)
INSERT [dbo].[SACH] ([MA_SACH], [TEN_SACH], [NOI_DUNG], [ANH], [GIA], [NGAY_BAN], [DANH_GIA_TOT], [TONG_DANH_GIA]) VALUES (100027, N'Harry Potter And The Half-Blood Prince', N'Harry Potter And The Half-Blood Prince
When Dumbledore arrives at Privet Drive one summer night to collect Harry Potter, his wand hand is blackened and shrivelled, but he does not reveal why. Secrets and suspicion are spreading through the wizarding world, and Hogwarts itself is not safe. Harry is convinced that Malfoy bears the Dark Mark: there is a Death Eater amongst them. Harry will need powerful magic and true friends as he explores Voldemort''s darkest secrets, and Dumbledore prepares him to face his destiny. These new editions of the classic and internationally bestselling, multi-award-winning series feature instantly pick-up-able new jackets by Jonny Duddle, with huge child appeal, to bring Harry Potter to the next generation of readers. It''s time to PASS THE MAGIC ON.', N'/img/Books/harry-potter-6.jpg', N'210.000             ', CAST(N'2018-08-02 18:47:57.343' AS DateTime), 43, 50)
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
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100013, 10079, N'Các hình minh họa trong sách rất đẹp, bắt mắt + với nội dung câu truyện thì hấp dẫn miễn bàn càng làm cho con gái mình thích đọc hơn. Vì là sách tiếng Anh nên rất dễ tạo cơ hội để mình đọc cùng với bé. Một quyển sách mà các bé nên đọc.', N'tích cực', CAST(N'2018-08-06 21:54:50.247' AS DateTime))
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
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100022, 10093, N'Người ta bảo cuộc đời là một trang sách mà chưa có viết kết luận, vậy mà cuốn sách này vừa đọc mở đầu đã đoán được kết luận ra làm sao rồi. tình tiết dễ đoán không đa dạng không hấp dẫn người đọc. đã thế bìa còn bị rách mất một góc. ', N'tiêu cực', CAST(N'2018-08-07 23:39:03.627' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100022, 10094, N'Sách này cũng được thôi. Tổng thể thì khá đơn giản, không kích thích. ', N'trung lập', CAST(N'2018-08-07 23:39:16.230' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100022, 10098, N'Tác giả này nổi tiếng lắm đây, chắc là sách cũng hay. Mong đợi lắm luôn', N'tích cực', CAST(N'2018-08-07 23:40:22.973' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100022, 10099, N'Không hay lắm. Văn phong cũng tạm được. ', N'trung lập', CAST(N'2018-08-07 23:40:38.203' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100022, 10100, N'Lối viết của tác giả lạ quá. Chắc có lẽ sẽ hay', N'tích cực', CAST(N'2018-08-07 23:40:50.617' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100022, 10101, N'Tác giả viết hay đấy. từ nội dung đến cách triển khai tình huống thật sự xuất sắc', N'tích cực', CAST(N'2018-08-07 23:41:13.947' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100022, 10102, N'Sách này đúng là tuyệt phẩm mà. Không đọc là hối hận cả đời. chất lượng tốt khỏi bàn.', N'tích cực', CAST(N'2018-08-07 23:42:18.513' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100023, 10103, N'Đọc xong bị ám ảnh luôn với cuốn sách này. Chủ đề trinh thám khá hấp dẫn mà tình tiết thì rùng rợn quá. Màu sắc thì u tối không lối thoát cho nhân vật.', N'trung lập', CAST(N'2018-08-07 23:42:59.413' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100023, 10104, N'Tình tiết quá tệ, thiếu logic, không gắn kết với nhau. Không nên đọc quá nhảm.', N'tiêu cực', CAST(N'2018-08-07 23:43:14.363' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100023, 10105, N'sách hay,những trang gần cuối sách bị lỗi,nên kiểm tra lại làm giảm chất lượng của sách. ', N'trung lập', CAST(N'2018-08-07 23:43:34.097' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100023, 10106, N'Hiếm lắm mới kiếm được cuốn sách nới về tâm lý tội phạm như này.thích thể loại này lắm luôn mà kiếm khó quá mừng hớn khi kiếm được cuốn này hí hí.', N'tích cực', CAST(N'2018-08-07 23:44:19.480' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100024, 10086, N'Cuối cùng thì tập mới của Harry Potter cũng ra lò rồi. tập lần này nội dung là về cuộc chiến tam phép thuật, hình ảnh lôi cuốn sắc nét chân thật, tình tiết hồi hộp đến nghẹt thở làm cho độc giả lo lắng từng giây phút. Quá xuất sắc cho một kiệt tác của thế giới phép thuật', N'tích cực', CAST(N'2018-08-07 23:37:26.347' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100024, 10087, N'Lần này bỏ tiền gấp 3 lần ra để mua tập cuối của Harry Potter cũng đáng. Cảnh đấu tay đôi vs Voldermort thật là gay cấn và đỉnh quá. Chợt nhận ra đến lúc tạm biệt Harry và những người bạn rồi, những nhân vật cốt lõi không thể thiếu. Cuốn sách thật sự là một phần không thể thiếu trong cuộc sống, thật đặc sắc và bổ ích', N'tích cực', CAST(N'2018-08-07 23:37:35.933' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100024, 10088, N'Sách này cũng được. nhân vật có hơi xấu, nội dung hơi phi lý.  ', N'tiêu cực', CAST(N'2018-08-07 23:37:46.767' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100024, 10089, N'Chỉ một câu thôi, quá tệ cho một cuốn sách hơn 500 trang. Nội dung lang man, nhân vật thì chưa dứt khoát cho từng tình huống', N'tiêu cực', CAST(N'2018-08-07 23:37:55.957' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100024, 10090, N'Đọc xong cảm thấy sách này dở ghê gớm, tác giả còn không phải là người nổi tiếng nữa chứ. Không bao giờ đọc lần thứ hai', N'tiêu cực', CAST(N'2018-08-07 23:38:07.217' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100024, 10091, N'Sách này không hay, không quan tâm. ', N'trung lập', CAST(N'2018-08-07 23:38:21.177' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100024, 10092, N'Nội dung cũng bình thường, na ná với mấy truyện ngôn tình trên mạng, không có điểm nhấn gì cả. tóm lại không hay lắm. ', N'trung lập', CAST(N'2018-08-07 23:38:32.943' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100026, 10078, N'Đọc xong cuốn sách này mình cảm thấy nội dung đặc biệt sâu sắc, tình tiết thì lôi cuốn khỏi bàn, giá cả phải chăng, chất lượng bìa hay giấy đều ổn. Tóm lại là nên mua vì sách rất hay nhé. Đáng đồng tiền bát gạo lắm luôn nhé mọi người. ', N'tích cực', CAST(N'2018-08-06 20:59:42.107' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100026, 10095, N'Mình là fan cuồng của series Harry Potter và khi cầm trên tay cuốn tải bản lần thứ 5 thì thật sự thất vọng lắm luôn. Trang bìa vẽ cẩu thả, không đẹp tí nào, màu sắc quá lòe loẹt không mang tính thần bí của thế giới phép thuật như các bản trước đã làm. Tóm lại không nên mua sách lần này. ', N'tiêu cực', CAST(N'2018-08-07 23:39:34.713' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100026, 10096, N'Tình tiết không hay, nội dung không hấp dẫn lắm, cuốn sách này không biết có ai mua không nữa', N'trung lập', CAST(N'2018-08-07 23:39:52.617' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100026, 10097, N'Sách hay quá, dùng để tham khảo tài liệu là quá chuẩn luôn. Nội dung lại đa dạng tha hồ đọc nhé', N'tích cực', CAST(N'2018-08-07 23:40:03.720' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 10070, N'Bìa đẹp, giấy cũng đẹp. Nội dung rất hay, tình tiết rất lôi cuốn. Rất ngưỡng mộ  J.K. Rowling, văn phong hay khỏi phải bàn. Nói chung là rất hay.', N'tích cực', CAST(N'2018-08-02 19:00:02.087' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 10080, N'Đọc xong cuốn sách này mình cảm thấy nội dung đặc biệt sâu sắc, tình tiết thì lôi cuốn khỏi bàn, giá cả phải chăng, chất lượng bìa hay giấy đều ổn. Tóm lại là nên mua vì sách rất hay nhé. Đáng đồng tiền bát gạo lắm luôn nhé mọi người', N'tích cực', CAST(N'2018-08-07 23:35:55.260' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 10081, N'Lời nhắn cho những ai còn đang băn khoăn có nên mua cuốn sách này hay không nhé. Bạn thật sự phải mua và đọc 1 lần mới thấu được những tinh túy trong cuốn sách này. Bản thân tác giả đã không còn xa lạ gì với hội sách. Nội dung kết cấu thật sự chặt chẽ không kẽ hở, tình tiết ly kỳ lôi cuốn đến những chữ cuối cùng. Quá tuyệt vời cho một cuốn sách.', N'tích cực', CAST(N'2018-08-07 23:36:09.640' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 10082, N'Kể từ lần đầu tiên được cầm trên tay series Harry Potter và hòn đá phù thủy mình đã đọc một mạch từ đầu đến cuối trong vòng 1 ngày 1 đêm không ngừng nghỉ. Cuốn sách mở ra một trang mới trong tư duy của mình, giúp mình học tiếng anh tốt hơn. Nhân vật nào cũng xuất sắc, tính cách từng nhân vật đều đa dạng không giống nhau. Bìa sách thì chuẩn khỏi bàn đẹp từng milimet', N'tích cực', CAST(N'2018-08-07 23:36:23.087' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 10083, N'Kể từ lần đầu tiên được cầm trên tay series Harry Potter và hòn đá phù thủy mình đã đọc một mạch từ đầu đến cuối trong vòng 1 ngày 1 đêm không ngừng nghỉ. Cuốn sách mở ra một trang mới trong tư duy của mình, giúp mình học tiếng anh tốt hơn. Nhân vật nào cũng xuất sắc, tính cách từng nhân vật đều đa dạng không giống nhau. Bìa sách thì chuẩn khỏi bàn đẹp từng milimet', N'tích cực', CAST(N'2018-08-07 23:36:37.837' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 10084, N'Chất lượng giấy tốt lắm luôn, cầm trên tay mà sướng cả người, bìa sách thì được bao bọc in ấn nét căng nhìn thích lắm luôn. Bên trong bố cục rất tuyệt nhé, chưa đọc mà đã auto thích rồi.', N'tích cực', CAST(N'2018-08-07 23:36:50.310' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 10085, N'Sách hay quá đi. Cảm giác sau khi đọc là cực kỳ chất lượng luôn nhé. Thật là đáng đồng tiền bát gạo mà.', N'tích cực', CAST(N'2018-08-07 23:37:05.077' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20070, N'Cuối cùng thì tập mới của Harry Potter cũng ra lò rồi. tập lần này nội dung là về cuộc chiến tam phép thuật, hình ảnh lôi cuốn sắc nét chân thật, tình tiết hồi hộp đến nghẹt thở làm cho độc giả lo lắng từng giây phút. Quá xuất sắc cho một kiệt tác của thế giới phép thuật. ', N'tích cực', CAST(N'2018-08-08 21:03:07.737' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20071, N'Lần này bỏ tiền gấp 3 lần ra để mua tập cuối của Harry Potter cũng đáng. Cảnh đấu tay đôi vs Voldermort thật là gay cấn và đỉnh quá. Chợt nhận ra đến lúc tạm biệt Harry và những người bạn rồi, những nhân vật cốt lõi không thể thiếu. Cuốn sách thật sự là một phần không thể thiếu trong cuộc sống, thật đặc sắc và bổ ích. ', N'tích cực', CAST(N'2018-08-08 21:03:35.847' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20072, N'Sách hay quá, dùng để tham khảo tài liệu là quá chuẩn luôn. Nội dung lại đa dạng tha hồ đọc nhé. ', N'tích cực', CAST(N'2018-08-08 21:04:23.077' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20073, N'Tác giả này nổi tiếng lắm đây, chắc là sách cũng hay. Mong đợi lắm luôn.', N'tích cực', CAST(N'2018-08-08 21:04:39.393' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20074, N'Tác giả viết hay đấy. từ nội dung đến cách triển khai tình huống thật sự xuất sắc.', N'tích cực', CAST(N'2018-08-08 21:05:03.377' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20075, N'Sách này đúng là tuyệt phẩm mà. Không đọc là hối hận cả đời. chất lượng tốt khỏi bàn', N'tích cực', CAST(N'2018-08-08 21:05:24.753' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20076, N'Sách đẹp bọc sạch gửi nhanh truyện tuyệt thì khỏi bàn mỗi tội là giấy hơi xấu thooi', N'tích cực', CAST(N'2018-08-08 21:58:17.560' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20077, N'sách rất mới
giao nhanh, đúng hẹn
đóng gói đẹp, cẩn thận', N'tích cực', CAST(N'2018-08-08 22:31:52.723' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20078, N'Đọc bản lậu lâu rồi, giờ mua sách bản giấy đọc lại. Bìa và chất lượng giấy đẹp, tốt.', N'tích cực', CAST(N'2018-08-08 22:37:52.037' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20079, N'Sách có bìa đẹp và khá hợp gu của mình.Tuy nhiên, chất lượng giấy theo mình thì dễ bị ố vàng và khá mỏng. Ngoài ra lần tái bản này vẫn còn một số lỗi chính tả mà chưa được khắc phục.', N'trung lập', CAST(N'2018-08-08 23:17:00.017' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20080, N'Sách có bìa đẹp và khá hợp gu của mình.Tuy nhiên, chất lượng giấy theo mình thì dễ bị ố vàng và khá mỏng. Ngoài ra lần tái bản này vẫn còn một số lỗi chính tả mà chưa được khắc phục.', N'trung lập', CAST(N'2018-08-08 23:17:03.157' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20081, N'Quá hay cho một kiệt tác văn học đương đại. nội dung của nó có sức lan tỏa tới hàng triệu người.', N'tích cực', CAST(N'2018-08-08 23:17:45.220' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20082, N'Sách này mình đọc lâu rồi,lâu lâu vẫn đọc lại .Cảm thấy nội dung rất hay nói về tình cảm gia đình rất cảm động .Nếu các bạn đang muốn tìm đọc về thể loại tình cảm gia đình thì không nên bỏ qua sách này.', N'tích cực', CAST(N'2018-08-08 23:18:15.683' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20083, N'Sách này mình đọc lâu rồi,lâu lâu vẫn đọc lại .Cảm thấy nội dung rất hay nói về tình cảm gia đình rất cảm động .Nếu các bạn đang muốn tìm đọc về thể loại tình cảm gia đình thì không nên bỏ qua sách này.', N'tích cực', CAST(N'2018-08-08 23:18:17.797' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20084, N'Sách này mình đọc lâu rồi,lâu lâu vẫn đọc lại .Cảm thấy nội dung rất hay nói về tình cảm gia đình rất cảm động .Nếu các bạn đang muốn tìm đọc về thể loại tình cảm gia đình thì không nên bỏ qua sách này.', N'tích cực', CAST(N'2018-08-08 23:18:17.300' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20085, N'Sách này mình đọc lâu rồi,lâu lâu vẫn đọc lại .Cảm thấy nội dung rất hay nói về tình cảm gia đình rất cảm động .Nếu các bạn đang muốn tìm đọc về thể loại tình cảm gia đình thì không nên bỏ qua sách này.', N'tích cực', CAST(N'2018-08-08 23:18:20.630' AS DateTime))
GO
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20086, N'Đọc thôi đã cảm nhận phần nào được nỗi đau của những lời tác giả muốn gửi gắm rồi.thật sự tác giả viết quá hay về được đời mình từ câu từng chữ khắc họa sống động những chuyện tác giả đã trải qua.thật sự cảm phục ngòi bút của tác giả rất đặc sắc và sâu lắng,thổi hồn vào từng câu chữ.Mê quấn này quá biết làm sao giờ xác định mình còn đọc lại nhiều lần nữa.', N'tích cực', CAST(N'2018-08-08 23:19:17.913' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20087, N'nội dung hay. bìa, giấy ổn. hi vọng mua trọn được nguyên bộ', N'tích cực', CAST(N'2018-08-08 23:20:33.177' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20088, N'sản phẩm quá tuyệt vời
sạch được bọc rất kĩ, đóng gói tốt
nội dung thì khỏi bàn cãi rồi. quá xuất sắc
giấy tốt, màu hơi vàng để tránh mỏi mắt', N'tích cực', CAST(N'2018-08-08 23:20:56.273' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20089, N'Đóng gói rất kỹ. Sách được bọc cẩn thận, bìa in rất đẹp, mình ko nỡ lòng bóc ra luôn.', N'tích cực', CAST(N'2018-08-08 23:21:21.217' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20090, N'Về nội dung thì không phải chê. Chất lượng sách rất tốt', N'tích cực', CAST(N'2018-08-08 23:22:06.927' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20091, N'Sách của mình rất đẹp, có thể nói là hoàn hảo luôn.
Giấy của sách không được dày cho lắm nhưng chỉ bị mỗi cái đó thôi :)
Mình kết nhất là cái bìa, bao đẹp luôn', N'tích cực', CAST(N'2018-08-08 23:23:44.173' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20092, N'Có 3 quấn sách của tác giả mình đã đọc hết ,cực kỳ thích sách của tác giả này luôn mang lại cảm giác thoải mãi khi đọc chúng vì khi đọc sách tưởng tượng như những gì tác giả ghi thật sự một thiên nhiên rất đẹp.', N'tích cực', CAST(N'2018-08-08 23:26:36.983' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20093, N'Sách rất dí dỏm ,hài hước mang lại niềm vui cho mọi người.rất thích hợp cho những ai đang buồn', N'tích cực', CAST(N'2018-08-08 23:27:16.830' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20094, N'thật hoàn hảo, bạn sẽ không hối hận khi mua đâu! :3 :3', N'trung lập', CAST(N'2018-08-08 23:28:49.590' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20095, N'Mặc dù rất thích bìa cũ khoảng chục năm về trước nhưng mà vẫn thích bìa mới này', N'tích cực', CAST(N'2018-08-08 23:29:15.870' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20096, N'hiết kế bìa rất đẹp ko chê vào đâu đc , tôi muốn mua full bộ này ', N'tích cực', CAST(N'2018-08-08 23:30:29.383' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20097, N'Bộ này mình cực kỳ hài lòng, sách nhẹ, in đẹp, rất đang sưu tầm.', N'tích cực', CAST(N'2018-08-08 23:30:46.877' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20099, N'Một cuốn sách quá đậm chất nhân văn và chan chứa tình người. quá tuyệt vời cho một kiệt tác', N'trung lập', CAST(N'2018-08-08 23:31:59.197' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20100, N'Sách nhẹ, bìa đẹp miễn chê, có một vài trang bị in mờ nhưng không phải vấn đề gì lớn ^^
Nội dung quyển này thì khỏi phải bàn rồi.
', N'tiêu cực', CAST(N'2018-08-08 23:33:23.377' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20101, N'Sách bìa cực đẹp nhé, nội dung khỏi bàn cãi. Gây cấn từng trang...ai chưa đọc harry potter mình khuyên nên đọc kẻo phí cuộc đời. Chất giấy đẹp khá nhẹ', N'tích cực', CAST(N'2018-08-08 23:34:31.837' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20102, N'lần trc xem phim k hiểu j lên bây h mua sách đọc thấy rất hay ', N'tích cực', CAST(N'2018-08-08 23:36:34.430' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20103, N'ản phẩm có chất lượng rất tốt còn rất mới tôi rất hài lòng', N'tích cực', CAST(N'2018-08-08 23:36:52.133' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20104, N'Mình đã từng xem phim nhưng phải nói truyện chi tiết hơn nhiều. Tuy vậy, đọc một vài chỗ câu văn lủng củng làm cho mình đọc k trôi thành mạch , ngoài ra còn một số từ như khính, dộng.. (tr.42) what? ...
Ngoài phần dịch hơi làm mình buồn ra thì chất lượng tr k có gì để chê cả.
Cảm ơn người dịch đã bỏ công ngồi dịch, cảm ơn Trẻ đã xuất bản bộ tr này, bọc sản phẩm đẹp hehe.', N'tích cực', CAST(N'2018-08-08 23:38:14.087' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20105, N'Chả có gì để bàn về nội dung mà ai cũng biết . Bìa max đẹp. Mong ra nhanh các phần còn lại :D và mong HP và đứa trẻ bị nguyền rủa có 1 bản như này', N'tích cực', CAST(N'2018-08-08 23:38:29.360' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20106, N'Đầu tiên phải nói đến điểm nổi bật của bản 2017 là bìa sách rất đẹp, bắt mắt. Giấy in tốt, chất lượng in chữ tốt. Tuy nhiên nếu sách có vài tranh minh họa cho từng chương thì sẽ hoàn hảo và tuyệt vời hơn. Nội dung truyện đầy đủ và từ ngữ sử dụng dễ hiểu, khá hay, phù hợp với người Việt. Là fan Harry Potter, nhất định sẽ để dành tiền mua những tập sau ^^', N'tích cực', CAST(N'2018-08-08 23:39:42.127' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20107, N'Hồi nhỏ mình thích HP lắm, nhưng không có tiền mua , toàn đọc ké. Nhưng vẫn khao khát có 1 bộ HP cho riêng mình.
Bây giờ thì lớn & mặc dù đọc hết rồi nhưng vẫn muốn mua để thỏa mãn khao khát thuở nhỏ.
Về sách thì đóng gói cẩn thận, tuy sách cũng dày nhưng lại rất nhẹ.', N'tích cực', CAST(N'2018-08-08 23:40:02.803' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20108, N'Chất lượng sách khá tốt, không có lỗi nhiều. ', N'tiêu cực', CAST(N'2018-08-08 23:40:47.090' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20109, N'Mới mua về rất hài lòng bìa đẹp miễn chê nhưng chỉ cần bỏ màng co để sau 1 đêm chất lượng giấy thay đổi rõ rệt tự quăn lại . Chất lượng thì mức ổn nhưng cần cải thiện chất lượng giấy mua về sưu tập mà dễ quăn và ố nhanh như vậy thì khó bảo quản lắm.', N'tích cực', CAST(N'2018-08-08 23:41:59.027' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20110, N'Truyện hay lắm, nhưng tập này J,K, Rowling kể vẫn còn khá vắn tắt, thiếu các chi tiết nhỏ để làm cho truyện sinh động hơn. Cốt truyện rất tốt. Có điều bìa sách mình vẫn chưa hài lòng lắm: chữ Harry Potter có rất nhiều vết xước và vài vết mạnh đến nỗi tróc luôn', N'tích cực', CAST(N'2018-08-08 23:43:06.730' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20111, N'Harry Potter thì khỏi nói rồi, đọc từng tập mà mình như sống trong thế giới phép thuật huyền ảo ấy, cứ như muốn bỏ tất cả nếu được phép đến với ngôi trường Howart. Mọi thứ huyền điệu, đầy tình cảm con người. Từng nhân vật, hoàn cảnh, gia đình đều được tác giả miêu tả sắc nét như đang đứng trước mặt mình. Truyện được dựng thành phim nhưng phim chưa miêu tả được chính xác sự tráng lệ, cao siêu như những gì người đọc có thể tưởng tượng được. Đây là bộ truyện quý giá nhất của cuộc đời mình', N'trung lập', CAST(N'2018-08-08 23:44:14.803' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20112, N'Yêu từ cái nhìn đầu tiên. Là 1 Potterhead mình hốt ngay lần đầu tiên gặp ', N'tích cực', CAST(N'2018-08-08 23:45:16.653' AS DateTime))
INSERT [dbo].[Y_KIEN] ([MA_SACH], [MA_Y_KIEN], [NOI_DUNG], [DANH_GIA], [NGAY]) VALUES (100027, 20113, N'Mình đã được tận tay sở hữu hai bé tập 1 và tập 2 rồi. Đẹp lắm lắm luôn ý. Gáy thì xếp thành hình lâu đài. Bìa thì in rõ nét, màu rất đẹp. Đến cái font chữ cũng giữ nguyên từ bản gốc nên ôi thôi mẹ ơi sao nó lại tuyệt như thế này. ', N'tích cực', CAST(N'2018-08-08 23:45:53.617' AS DateTime))
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
/****** Object:  StoredProcedure [dbo].[SP_GetBookDetail]    Script Date: 09/08/2018 2:02:52 SA ******/
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
/****** Object:  StoredProcedure [dbo].[SP_Search]    Script Date: 09/08/2018 2:02:52 SA ******/
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
