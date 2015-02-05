CREATE TABLE [dbo].[Messages]
(
[Id] [int] NOT NULL,
[SenderId] [int] NOT NULL,
[ReceiverId] [int] NOT NULL,
[Content] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[ReceivedOn] [datetimeoffset] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Messages] ADD CONSTRAINT [Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
