<cfcomponent output="false">
	<cfset this.version = "2.0.3">
	<cfset this.name = "FaceBugApp#this.version#">

	<cffunction name="onApplicationStart" returntype="boolean">
		<cfset application.Status = createObject("component", "facebug.domain.Status").init()>
		<cfreturn true>
	</cffunction>
</cfcomponent>