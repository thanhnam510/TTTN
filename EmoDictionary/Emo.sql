CREATE DATABASE Emo_Dictionary

USE [Emo_Dictionary]
GO
/****** Object:  Table [dbo].[Dac_Ta]    Script Date: 5/17/2018 3:06:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dac_Ta](
	[Tu_Dac_Trung] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TuDienCamXuc]    Script Date: 5/17/2018 3:06:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TuDienCamXuc](
	[TU_CAM_XUC] [nvarchar](50) NOT NULL,
	[TRONG_SO] [smallint] NOT NULL,
	[hat_giong] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_TuDienCamXuc] PRIMARY KEY CLUSTERED 
(
	[TU_CAM_XUC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Dac_Ta] ([Tu_Dac_Trung]) VALUES (N'Nội dung')
INSERT [dbo].[Dac_Ta] ([Tu_Dac_Trung]) VALUES (N'Văn phong')
INSERT [dbo].[Dac_Ta] ([Tu_Dac_Trung]) VALUES (N'Trình bày')
INSERT [dbo].[Dac_Ta] ([Tu_Dac_Trung]) VALUES (N'Viết')
INSERT [dbo].[Dac_Ta] ([Tu_Dac_Trung]) VALUES (N'Tình tiết')
INSERT [dbo].[Dac_Ta] ([Tu_Dac_Trung]) VALUES (N'Tác giả')
INSERT [dbo].[Dac_Ta] ([Tu_Dac_Trung]) VALUES (N'Sách')
INSERT [dbo].[Dac_Ta] ([Tu_Dac_Trung]) VALUES (N'tình huống')
INSERT [dbo].[Dac_Ta] ([Tu_Dac_Trung]) VALUES (N'lời văn')
INSERT [dbo].[Dac_Ta] ([Tu_Dac_Trung]) VALUES (N'cải thiện')
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'bổ ích', 1, 1)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'chán', 1, 1)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'chán cực kỳ', 3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'chau chuốt', 1, 1)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'có ích', 1, 1)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'có ích cực kỳ', 3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'cực dở', -2, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'cực hay', 2, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'cực hữu ích', 3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'cực kì dễ hiểu', 3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'cực kì hay', 3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'cực kì hữu ích', 3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'cực kì khó hiểu', -3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'cực kì sâu sắc', 3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'cực kì thú vị', 3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'cực kỳ bổ ích', 3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'cực kỳ có ích', 3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'cực kỳ dễ hiểu', 3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'cực kỳ dở', -3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'cực kỳ hay', 3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'cực kỳ hữu ích', 3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'cực kỳ khó hiểu', -3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'cực kỳ sâu sắc', 3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'cực kỳ thú vị', 3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'dễ hiểu', 1, 1)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'dễ hiểu cực', 2, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'dễ hiểu cực kì', 3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'dễ hiểu cực kỳ', 3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'dở', -1, 1)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'dở cực', -2, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'dở cực kì', -3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'dở cực kỳ', -3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'hài hước', 1, 1)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'hấp dẫn', 1, 1)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'hay', 1, 1)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'hay cực', 2, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'hay cực kì', 3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'hay cực kỳ', 3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'hữu ích', 1, 1)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'hữu ích cực kì', 3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'hữu ích cực kỳ', 3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'khó hiểu', -1, 1)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'khó hiểu cực kì', -3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'khó hiểu cực kỳ', -3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'ly kỳ', 1, 1)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'mạch lạc', 1, 1)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'rất bổ ích', 2, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'rất chán', 2, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'rất có ích', 2, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'rất dễ hiểu', 2, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'rất hay', 2, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'rất hữu ích', 2, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'rất khó hiểu', -2, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'rất là dở', 2, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'rất là hay', 2, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'rất sâu sắc', 2, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'rất thú vị', 2, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'rõ ràng', 1, 1)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'sâu sắc', 1, 1)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'sâu sắc cực kì', 3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'sâu sắc cực kỳ', 3, 0)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'thú vị', 1, 1)
INSERT [dbo].[TuDienCamXuc] ([TU_CAM_XUC], [TRONG_SO], [hat_giong]) VALUES (N'thú vị cực kỳ', 3, 0)
