CREATE TABLE [dbo].[Messages]
(
[Id] [uniqueidentifier] NOT NULL,
[SenderId] [uniqueidentifier] NOT NULL,
[ReceiverId] [uniqueidentifier] NULL,
[Content] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[ReceivedOn] [datetimeoffset] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
ALTER TABLE [dbo].[Messages] ADD 
CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
ALTER TABLE [dbo].[Messages] ADD
CONSTRAINT [FK__Messages__Receiv__31EC6D26] FOREIGN KEY ([ReceiverId]) REFERENCES [dbo].[Users] ([Id])
ALTER TABLE [dbo].[Messages] ADD
CONSTRAINT [FK__Messages__Sender__30F848ED] FOREIGN KEY ([SenderId]) REFERENCES [dbo].[Users] ([Id])





GO
