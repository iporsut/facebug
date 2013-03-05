<!doctype>
<html>
<head>
	<title>FaceBug Post Status</title>
</head>
<body>
	<h1>FaceBug Post Status</h1>
	<form action="" method="post">
		<textarea name="text"></textarea>
		<input name="post" type="submit" value="Post">
	</form>
	<cfif isDefined("form.post")>
		<cfset status = {text = form.text, date = now()}>
		<cftry>
			<cfset application.Status.post(status)>	
		<cfcatch>
			Error : <div style="color:red"><cfoutput>#cfcatch.message#</cfoutput></div>
		</cfcatch>
		</cftry>
		
	</cfif>
	<cfset allStatus = application.Status.getAllStatus()>
	<cfloop index="i" from="#ArrayLen(allStatus)#" to="1" step="-1">
		<p><cfoutput>#allStatus[i].text#<br />#DateTimeFormat(allStatus[i].date,"dd/MM/yyyy HH:mm:ss")#</cfoutput></p>
		<hr />
	</cfloop>
</body>
</html>