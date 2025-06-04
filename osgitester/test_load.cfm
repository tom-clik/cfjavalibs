<cfscript>
jarpath = "C:\git\libraries\cfjavalibs\flexmark-osgi-0.64.8.jar";
bundlename="com.vladsch.flexmark.osgi";
class="com.vladsch.flexmark.html.HtmlRenderer";


// jarpath = "C:\git\libraries\cfjavalibs\jsoup-1.20.1.jar";
// bundlename="org.jsoup";
// class="org.jsoup.Jsoup";

request.CFMLEngine = createObject( "java", "lucee.loader.engine.CFMLEngineFactory" ).getInstance();
request.OSGiUtil = createObject( "java", "lucee.runtime.osgi.OSGiUtil" );
local.resource = request.CFMLEngine.getResourceUtil().toResourceExisting( getPageContext(), jarpath );
local.bundle = request.OSGiUtil.installBundle( request.CFMLEngine.getBundleContext(), local.resource, true);

// Load using bundle name
this.class             = createObject( "java", class, bundlename);

</cfscript>