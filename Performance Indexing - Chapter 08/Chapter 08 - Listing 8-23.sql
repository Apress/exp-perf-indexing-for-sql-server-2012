--Listing 8-23.  Dropping Indexes in Included Columns Pattern
IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('dbo.Contacts')
AND name = 'IX_Contacts_FirstNameLastName')
         DROP INDEX IX_Contacts_FirstNameLastName ON dbo.Contacts
GO
IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('dbo.Contacts')
AND name = 'IX_Contacts_FirstNameLastNameIsActive')
         DROP INDEX IX_Contacts_FirstNameLastNameIsActive ON dbo.Contacts
GO
IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID('dbo.Contacts')
AND name = 'IX_Contacts_FirstName')
         DROP INDEX IX_Contacts_FirstName ON dbo.Contacts
GO