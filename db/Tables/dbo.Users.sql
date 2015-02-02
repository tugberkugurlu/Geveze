CREATE TABLE [dbo].[Users]
(
[Id] [int] NOT NULL,
[Name] [nvarchar] (200) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
