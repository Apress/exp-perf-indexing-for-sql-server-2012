--Listing 4-6.  Creating a Database to Hold Geometry-related Data
CREATE TABLE [dbo].[AREAZIP](
    [ident] [int] IDENTITY(1,1) NOT NULL,
    [AREA] [real] NULL,
    [PERIMETER] [real] NULL,
    [ZT55_D00_] [bigint] NULL,
    [ZT55_D00_I] [bigint] NULL,
    [ZCTA] [nvarchar](255) NULL,
    [NAME] [nvarchar](255) NULL,
    [LSAD] [nvarchar](255) NULL,
    [LSAD_TRANS] [nvarchar](255) NULL,
    [geom] [geometry] NULL,
 CONSTRAINT [PK_AREAZIP] PRIMARY KEY CLUSTERED
(
    [ident] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]