<cfcomponent output="false" displayname="Status">
	<cffunction name="init" returntype="any">
		<cfset variables.statusArray = arrayNew()>
		<cfreturn this>
	</cffunction>

	<cffunction name="post" returntype="void">
		<cfargument name="status" type="struct" required="true">
		<cfif trim(arguments.status.text) eq "">
			<cfthrow message="Status cannot empty.">
		</cfif>
		<cfset arrayAppend(variables.statusArray, arguments.status)>
	</cffunction>

	<cffunction name="count" returntype="numeric">
		<cfreturn ArrayLen(variables.statusArray)>
	</cffunction>

	<cffunction name="getAllStatus" returntype="array">
		<cfreturn variables.statusArray>
	</cffunction>
</cfcomponent>