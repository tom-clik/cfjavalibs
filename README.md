# cfjavalibs

Collection of java Libraries for use with CFML

## Background

With the advent of the OSGI mechanism for specifying which JAR file we want to load when creating a Java object, it makes sense to have the JAR files in a convenient repository. With OSGI there is no problem any more with class path contamination so you can put different versions of the same library into the folder.

## Loading using OSGI

By specifying the file to load from, we only need the bundle name

```cfscript
local.jarpath = full path to your jar
// Install the bundle through OSGI mechanism to avoid conflicts
local.CFMLEngine = createObject( "java", "lucee.loader.engine.CFMLEngineFactory" ).getInstance();
local.OSGiUtil = createObject( "java", "lucee.runtime.osgi.OSGiUtil" );
local.resource = CFMLEngine.getResourceUtil().toResourceExisting( getPageContext(), jarpath );
local.bundle = OSGiUtil.installBundle( CFMLEngine.getBundleContext(), local.resource, true);

// Load using bundle name
this.jsoup             = createObject( "java", "org.jsoup.Jsoup", "org.jsoup");
```

## Checking bundle names

Lucee has a function `manifestRead()` that you can use to check a JAR to see if it has a bundle name. If it does, you can load it using this method. 

## Creating bundles

If you have a JAR that isn't a bundle you can use [OSGi JAR Converter](https://www.forgebox.io/view/commandbox-osgi) from Evagoras Charalambous with commandbox.



