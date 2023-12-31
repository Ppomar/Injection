USE [Practices]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 11/09/2023 02:01:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](100) NOT NULL,
	[ApellidoPaterno] [varchar](50) NOT NULL,
	[ApellidoMaterno] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Creado] [datetime] NOT NULL,
	[Modificado] [datetime] NOT NULL,
	[CreadoPor] [varchar](50) NOT NULL,
	[ModificadoPor] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 

INSERT [dbo].[Persona] ([Id], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [FechaNacimiento], [Creado], [Modificado], [CreadoPor], [ModificadoPor], [Activo]) VALUES (1, N'Juan', N'Perez', N'Lopez', CAST(N'1990-07-01' AS Date), CAST(N'2023-06-05T00:00:00.000' AS DateTime), CAST(N'2023-06-05T00:00:00.000' AS DateTime), N'SYSTEM', N'SYSTEM', 1)
INSERT [dbo].[Persona] ([Id], [Nombres], [ApellidoPaterno], [ApellidoMaterno], [FechaNacimiento], [Creado], [Modificado], [CreadoPor], [ModificadoPor], [Activo]) VALUES (2, N'Luis', N'Garcia', N'Hernandez', CAST(N'1990-07-15' AS Date), CAST(N'2023-06-05T00:00:00.000' AS DateTime), CAST(N'2023-06-05T00:00:00.000' AS DateTime), N'SYSTEM', N'SYSTEM', 1)
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
ALTER TABLE [dbo].[Persona] ADD  DEFAULT ((1)) FOR [Activo]
GO
/****** Object:  StoredProcedure [dbo].[SP_PERSONA_CREATE]    Script Date: 11/09/2023 02:01:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_PERSONA_CREATE] 	
    @Nombres VARCHAR(100),
    @ApellidoPaterno VARCHAR(50),
    @ApellidoMaterno VARCHAR(50),
    @FechaNacimiento DATE,
    @Creado DATETIME,
	@Modificado DATETIME,
	@CreadoPor VARCHAR(50),
	@ModificadoPor VARCHAR(50)
AS
BEGIN	
	SET NOCOUNT ON;

    INSERT INTO [dbo].[Persona]
    ([Nombres]
    ,[ApellidoPaterno]
    ,[ApellidoMaterno]
    ,[FechaNacimiento]
    ,[Creado]
    ,[Modificado]
    ,[CreadoPor]
    ,[ModificadoPor])
     VALUES
    (@Nombres
    ,@ApellidoPaterno
    ,@ApellidoMaterno
    ,@FechaNacimiento
    ,@Creado
    ,@Modificado
    ,@CreadoPor
    ,@ModificadoPor)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PERSONA_DELETE]    Script Date: 11/09/2023 02:01:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_PERSONA_DELETE]
	@Id INT	
AS
BEGIN	
	SET NOCOUNT ON;

    DELETE FROM [dbo].[Persona]   
	WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PERSONA_READ]    Script Date: 11/09/2023 02:01:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Omar Quijano
-- Create date: 2023/06/06
-- Description:	Obtine una lista completa de la table Persona
-- =============================================
CREATE PROCEDURE [dbo].[SP_PERSONA_READ]
AS
BEGIN	
	SET NOCOUNT ON;
    
	SELECT 
	   [Id]
      ,[Nombres]
      ,[ApellidoPaterno]
      ,[ApellidoMaterno]
      ,[FechaNacimiento]
      ,[Creado]
      ,[Modificado]
      ,[CreadoPor]
      ,[ModificadoPor]
      ,[Activo]
   FROM [Persona]
END
GO
/****** Object:  StoredProcedure [dbo].[SP_PERSONA_UPDATE]    Script Date: 11/09/2023 02:01:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_PERSONA_UPDATE]
	@Id INT,
	@Nombres VARCHAR(100),
    @ApellidoPaterno VARCHAR(50),
    @ApellidoMaterno VARCHAR(50),
    @FechaNacimiento DATE,
    @Creado DATETIME,
	@Modificado DATETIME,
	@CreadoPor VARCHAR(50),
	@ModificadoPor VARCHAR(50),
	@Activo BIT
AS
BEGIN	
	SET NOCOUNT ON;

    UPDATE [dbo].[Persona]
    SET [Nombres]        = @Nombres
      ,[ApellidoPaterno] = @ApellidoPaterno
      ,[ApellidoMaterno] = @ApellidoMaterno
      ,[FechaNacimiento] = @FechaNacimiento
      ,[Creado]          = @Creado
      ,[Modificado]      = @Modificado
      ,[CreadoPor]       = @CreadoPor
      ,[ModificadoPor]   = @ModificadoPor
      ,[Activo]          = @Activo
	WHERE Id = @Id
END
GO
