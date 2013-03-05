<cfcomponent displayname="PostSpec" extends="mxunit.framework.TestCase">
	<cffunction name="PostFirstStatus" returntype="void">
		<cfset locals.status = createObject("component", "facebug.domain.Status").init()>
		<cfset locals.newStatus = {text = "Hello World", date = now()}>
		<cfset locals.status.post(locals.newStatus)>
		<cfset locals.count = locals.status.count()>
		<cfset locals.allStatus = locals.status.getAllStatus()>
		<cfset locals.lastStatus = locals.allStatus[locals.count]>
		<cfset assertEquals(1, locals.count, "Given : no status , when: post new status, then: must count status is one")>		
	</cffunction>

	<cffunction name="PostAndGetLastStatus" returntype="void">
		<cfset locals.status = createObject("component", "facebug.domain.Status").init()>
		<cfset locals.newStatus = {text = "Hello World", date = now()}>
		<cfset locals.status.post(locals.newStatus)>
		<cfset locals.count = locals.status.count()>
		<cfset locals.allStatus = locals.status.getAllStatus()>
		<cfset locals.lastStatus = locals.allStatus[locals.count]>
		<cfset assertEquals(locals.lastStatus, locals.newStatus, "Given : no status , when: post new status and get last status, then: must equals status that post")>
	</cffunction>

	<cffunction name="PostEmptyStatus" returntype="void">
		<cfset locals.status = createObject("component", "facebug.domain.Status").init()>
		<cfset locals.newStatus = {text = "", date = now()}>
		<cfset locals.expected = "Status cannot empty.">
		<cftry>
			<cfset locals.status.post(locals.newStatus)>
		<cfcatch>
			<cfset locals.result = cfcatch.message>
		</cfcatch>
		</cftry>
		<cfset assertEquals(locals.expected, locals.result, "Given : no status , when: post empty text status, then: must throw with message 'Status cannot empty.'")>
	</cffunction>
</cfcomponent>