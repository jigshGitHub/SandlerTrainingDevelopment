--delete from [dbo].[TBL_ACEEmails];
--delete from [dbo].[Tbl_ACEGroups];
--delete from [dbo].[Tbl_AceMainInfo];

--update tbl_aceemailtracker set isviewed = 1 where emailaddress <> 'jigsh@hotmail.com';
--update Tbl_EmailGroup set groupccemails = 'thakkar' where groupid=1
--update Tbl_EmailBank set emailBody = '
--<body> <div style="background-color:#ffffff;">   <!--[if gte mso 9]>   <v:background xmlns:v="urn:schemas-microsoft-com:vml" fill="t">     <v:fill type="tile" src="http://minedsystemsassetmanagement.com/spm2/images/heroAccent.png" color="#ffffff"/>   </v:background>   <![endif]-->   <table height="100%" width="100%" cellpadding="0" cellspacing="0" border="0">    	<tr>      		<td valign="top" align="left" background="http://minedsystemsassetmanagement.com/spm2/images/heroAccent.png"> 			<table width="100%"> 				<tr> 					<td> 						if you want to set a background image or color in your HTML email, you can set it in your BODY tag, where it usually goes. That’ll work ok for some desktop email applications, like Microsoft Outlook.  But to make it work across more email applications, you need to "rig" your code so that your entire email is set inside a big TABLE WRAP. Just set a big table that’s 100% wide, then specify your background color and image there. We recommend doing it the old-fashioned "bgcolor" or "background="" way. If you prefer doing it with CSS, be sure to read the "CSS" tips below. As with all images in HTML email, they need to be hosted on your server, and you need to point to them with absolute (not relative) paths.  Once you’ve created the big TABLE WRAP with your background color or image, place your actual newsletter code inside, and you’re good to go.  If you’re a very experienced web designer, this will no doubt make you feel dirty, and make you want to take a shower immediately afterwards. But HTML email isn’t as reliable as web pages are (yet) and there are way too many email apps out there that display HTML differently. Until all the various email apps get a little more consistent, you’re going to have to get used to "rigs" like this. 	  					</td> 				</tr> 				<tr> 					<td align="centre"><a href="http://minedsystemsassetmanagement.com/spm2/" target="_blank">Click Me</a> 				</tr> 			</table>  		 		</td> 	</tr> </table> </div> </body> 
--' where emailbankid=1

select * from [dbo].[TBL_ACEEmails];
select * from [dbo].[Tbl_ACEGroups];
select * from Tbl_EmailBank;
select * from Tbl_EmailGroup;

select * from  [dbo].[Tbl_AceMainInfo];
select * from tbl_aceemailtracker order by aceid desc;
select * from [dbo].[TBL_UserEmailGroup] where id in (32,33)
select * from dbo.TBL_CONTACTS where CONTACTSID in (25668,28680,29530,31064,29535,29490)

exec [sp_GetUserEmailGroupAddresses] 33

--update [Tbl_AceMainInfo] set messagenumber=2, eventdate = '03/13/2015', messagesubject = 'Test Msg 4 days before event subject', messagetext = '<p>Test Msg 4 days before test with email tracker</p>' where aceid=4
--update [Tbl_AceMainInfo] set messagenumber=3, eventdate = '03/13/2015', messagesubject = 'Test Msg 1 day1 before event subject', messagetext = '<p>Test Msg 1 day before test with email tracker</p>' where aceid=5
--update Tbl_AceMainInfo set MessageSentDate = NULL;
SELECT a.CallToActionText,t.TypeDescription, i.* FROM [dbo].[Tbl_AceMainInfo] i INNER JOIN [dbo].[Tbl_AceCallToActionType] a ON i.CallToActionId = a.CallToActionId INNER JOIN [dbo].[Tbl_AceCampaignType] t ON i.CampaignTypeId = t.CampaignTypeId WHERE i.CampaignTypeId = 1 AND DATEDIFF(day,GetDate(),i.EventDate) = i.DaysFromEvent;
SELECT i.* FROM [dbo].[Tbl_AceMainInfo] i WHERE i.CampaignTypeId = 1 AND DATEDIFF(day,'03/09/2015',i.EventDate) = i.DaysFromEvent;
SELECT i.* FROM [dbo].[Tbl_AceMainInfo] i WHERE i.CampaignTypeId = 1 AND DATEDIFF(day,'03/12/2015',i.EventDate) = i.DaysFromEvent;
SELECT i.* FROM [dbo].[Tbl_AceMainInfo] i WHERE i.CampaignTypeId = 2 AND DATEDIFF(day,i.EventDate,'03/20/2015') = i.DaysFromEvent;


exec sp_GetACECampaignsForCampaignType 1;
exec sp_GetACECampaignsForCampaignType 1,'03/09/2015';
exec sp_GetACECampaignsForCampaignType 1,'03/12/2015';
exec sp_GetACECampaignsForCampaignType 2,'03/20/2015';

exec [sp_AceMainView] @orderBy='CampaignName ASC' ,@pageSize=50,@pageNo=1,@franchiseeId=10008,@searchText=''