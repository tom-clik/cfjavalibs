<cfscript>
dir = "C:\git\libraries\cfjavalibs"
param name="dir" default="C:\dev\java";

files = directoryList(path=dir,recurse=true,type="file",filter="*.jar",listinfo="path");

request.CFMLEngine = createObject( "java", "lucee.loader.engine.CFMLEngineFactory" ).getInstance();
request.OSGiUtil = createObject( "java", "lucee.runtime.osgi.OSGiUtil" );

for (filename in files) {
	meta = manifestRead(filename);
	writeDump(meta);
}

</cfscript>