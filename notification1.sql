
--Steps to configure database mail using the wizard.
--1.configure SQL Server Agent to use Database Mail
--2. Create a Database Mail account for the SQL Server Agent service account to use.
EXECUTE msdb.dbo.sysmail_add_account_sp
@account_name = 'Teresa',
@description = 'Teresa mail.',
@email_address = 'tfitzge134@yahoo.com',
@display_name = 'Teresa',
@mailserver_name = 'the name of the stmp server'

--To create a database mail use the sysmail_add_profile procedure.

EXECUTE msdb.dbo.sysmail_add_profile_sp
@profile_name = 'Teresa',
@description = 'Teresa profile'
Now you can add the mail account and the profile to the store procedure.

  EXECUTE msdb.dbo.sysmail_add_profileaccount_sp
@profile_name = 'Teresa',
@account_name = 'Teresa',
@sequence_number = 1
--Finally you need to make the profile your created public.


EXECUTE msdb.dbo.sysmail_add_principalprofile_sp
@profile_name = 'Teresa',
@principal_name = 'public',
@is_default = 1 ;