CREATE TABLE [dbo].[Messages]
(
[Id] [int] NOT NULL,
[SenderId] [int] NOT NULL,
[ReceiverId] [int] NULL,
[Content] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[ReceivedOn] [datetimeoffset] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
ALTER TABLE [dbo].[Messages] ADD
CONSTRAINT [FK__Messages__Receiv__182C9B23] FOREIGN KEY ([ReceiverId]) REFERENCES [dbo].[Users] ([Id])
ALTER TABLE [dbo].[Messages] ADD
CONSTRAINT [FK__Messages__Sender__173876EA] FOREIGN KEY ([SenderId]) REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Messages] ADD CONSTRAINT [Id] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
