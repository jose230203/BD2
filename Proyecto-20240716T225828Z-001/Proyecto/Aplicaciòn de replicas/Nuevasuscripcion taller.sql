-----------------INICIO: script que se ejecutará en el publicador 'DESKTOP-SQQF78L'-----------------
use [tallercuero]
exec sp_addmergesubscription @publication = N'Pub taller', @subscriber = N'DESKTOP-SQQF78L', @subscriber_db = N'Replica_taller', @subscription_type = N'Push', @sync_type = N'Automatic', @subscriber_type = N'Global', @subscription_priority = 75, @description = null, @use_interactive_resolver = N'False'
exec sp_addmergepushsubscription_agent @publication = N'Pub taller', @subscriber = N'DESKTOP-SQQF78L', @subscriber_db = N'Replica_taller', @job_login = null, @job_password = null, @subscriber_security_mode = 1, @publisher_security_mode = 1, @frequency_type = 64, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 20240517, @active_end_date = 99991231, @enabled_for_syncmgr = N'False'
GO
-----------------FIN: script que se ejecutará en el publicador 'DESKTOP-SQQF78L'-----------------

