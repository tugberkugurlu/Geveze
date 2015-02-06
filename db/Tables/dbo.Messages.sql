CREATE TABLE [dbo].[Messages]
(
[Id] [uniqueidentifier] NOT NULL CONSTRAINT [DF__Messages__Id__2A4B4B5E] DEFAULT (newsequentialid()),
[SenderId] [uniqueidentifier] NOT NULL,
[ReceiverId] [uniqueidentifier] NULL,
[Content] [nvarchar] (max) COLLATE Latin1_General_CI_AS NOT NULL,
[ReceivedOn] [datetimeoffset] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
ALTER TABLE [dbo].[Messages] ADD 
CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
ALTER TABLE [dbo].[Messages] ADD
CONSTRAINT [FK__Messages__Receiv__2C3393D0] FOREIGN KEY ([ReceiverId]) REFERENCES [dbo].[Users] ([Id])
ALTER TABLE [dbo].[Messages] ADD
CONSTRAINT [FK__Messages__Sender__2B3F6F97] FOREIGN KEY ([SenderId]) REFERENCES [dbo].[Users] ([Id])


GO
