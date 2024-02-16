USE [LibriApplication]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 16/02/2024 17:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[nome] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[nome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriaLibro]    Script Date: 16/02/2024 17:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriaLibro](
	[idLibro] [nchar](15) NOT NULL,
	[categoria] [nchar](100) NOT NULL,
 CONSTRAINT [PK_CategoriaLibro] PRIMARY KEY CLUSTERED 
(
	[idLibro] ASC,
	[categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 16/02/2024 17:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[id] [nchar](15) NOT NULL,
	[titolo] [nchar](100) NULL,
	[editore] [nchar](50) NULL,
	[anno] [nchar](6) NULL,
	[descrizione] [nvarchar](max) NULL,
	[img] [nvarchar](400) NULL,
	[autori] [nvarchar](max) NULL,
 CONSTRAINT [PK_Libro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recensione]    Script Date: 16/02/2024 17:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recensione](
	[idLibro] [nchar](15) NOT NULL,
	[idUtente] [int] NOT NULL,
	[recensione] [nvarchar](max) NULL,
	[voto] [int] NULL,
	[stato] [int] NOT NULL,
 CONSTRAINT [PK_Recensione] PRIMARY KEY CLUSTERED 
(
	[idLibro] ASC,
	[idUtente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Utente]    Script Date: 16/02/2024 17:53:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](50) NOT NULL,
	[password] [varchar](256) NULL,
	[salt] [varchar](256) NULL,
	[email] [varchar](100) NULL,
 CONSTRAINT [PK_Utente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CategoriaLibro]  WITH CHECK ADD  CONSTRAINT [FK_CategoriaLibro_Categoria] FOREIGN KEY([categoria])
REFERENCES [dbo].[Categoria] ([nome])
GO
ALTER TABLE [dbo].[CategoriaLibro] CHECK CONSTRAINT [FK_CategoriaLibro_Categoria]
GO
ALTER TABLE [dbo].[CategoriaLibro]  WITH CHECK ADD  CONSTRAINT [FK_CategoriaLibro_Libro] FOREIGN KEY([idLibro])
REFERENCES [dbo].[Libro] ([id])
GO
ALTER TABLE [dbo].[CategoriaLibro] CHECK CONSTRAINT [FK_CategoriaLibro_Libro]
GO
ALTER TABLE [dbo].[Recensione]  WITH CHECK ADD  CONSTRAINT [FK_Recensione_Libro] FOREIGN KEY([idLibro])
REFERENCES [dbo].[Libro] ([id])
GO
ALTER TABLE [dbo].[Recensione] CHECK CONSTRAINT [FK_Recensione_Libro]
GO
ALTER TABLE [dbo].[Recensione]  WITH CHECK ADD  CONSTRAINT [FK_Recensione_Utente] FOREIGN KEY([idUtente])
REFERENCES [dbo].[Utente] ([id])
GO
ALTER TABLE [dbo].[Recensione] CHECK CONSTRAINT [FK_Recensione_Utente]
GO
