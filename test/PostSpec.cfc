<cfcomponent displayname="PostSpec" extends="mxunit.framework.TestCase">
	<cffunction name="PostFirstStatus" returntype="void">
		<cfset status = createObject("component", "facebug.domain.Status").init()>
		<cfset newStatus = {text = "Hello World", date = now()}>
		<cfset status.post(newStatus)>
		<cfset count = status.count()>
		<cfset allStatus = status.getAllStatus()>
		<cfset lastStatus = allStatus[count]>
		<cfset assertEquals(1, count, "Given : no status , when: post new status, then: must count status is one")>		
	</cffunction>

	<cffunction name="PostAndGetLastStatus" returntype="void">
		<cfset status = createObject("component", "facebug.domain.Status").init()>
		<cfset newStatus = {text = "Hello World", date = now()}>
		<cfset status.post(newStatus)>
		<cfset count = status.count()>
		<cfset allStatus = status.getAllStatus()>
		<cfset lastStatus = allStatus[count]>
		<cfset assertEquals(lastStatus, newStatus, "Given : no status , when: post new status and get last status, then: must equals status that post")>
	</cffunction>

	<cffunction name="PostEmptyStatus" returntype="void">
		<cfset status = createObject("component", "facebug.domain.Status").init()>
		<cfset newStatus = {text = "", date = now()}>
		<cfset expected = "Status cannot empty.">
		<cfset result = "">
		<cftry>
			<cfset status.post(newStatus)>
		<cfcatch>
			<cfset result = cfcatch.message>
		</cfcatch>
		</cftry>
		<cfset assertEquals(expected, result, "Given : no status , when: post empty text status, then: must throw with message 'Status cannot empty.'")>
	</cffunction>
</cfcomponent>