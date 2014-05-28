AEM PhoneGap Starter Kit
========================

### Goal 

To provide you - the developer - with an AEM Apps project on your filesystem, ready to be built and installed to a running AEM 6.0 instance and committed to a version control system.


### Get started

Clone this repository to your machine to begin.


### Customize

This repository is built around two placeholders to enable quick customization: `brand_name_placeholder` and `app_name_placeholder`.

To customize this boilerplate for your own project, simply replace every occurrence of these two variables with (JCR-friendly) names of your choice. 

For example, let's say my brand name is 'Geometrixx' (originality is not the goal here) and app name is 'ShapesCon'. 

The following lines will update each directory occurrence of the two placeholders with our desired values. Use your own names to customize for your application:

	cd aem-phonegap-starter-kit
	find . -name brand_name_placeholder -type d -execdir mv {} Geometrixx \;
	find . -name app_name_placeholder -type d -execdir mv {} ShapesCon \;

You can ignore the 'No such file or directory' output.

Next, we'll replace every occurrence of these two strings in our project:

	find . -type f \( -name '*.xml' -o -name '*.jsp' -o -name index.html -o -name config.json \) -exec sed -i '' 's/brand_name_placeholder/Geometrixx/g' {} \;
	find . -type f \( -name '*.xml' -o -name '*.jsp' -o -name index.html -o -name config.json \) -exec sed -i '' 's/app_name_placeholder/ShapesCon/g' {} \;


### Install

This project is based on the [multimodule-content-package-archetype](http://dev.day.com/content/docs/en/aem/6-0/develop/how-tos/vlt-mavenplugin.html#multimodule-content-package-archetype) (with the bundle removed for simplicity), so it contains the same helpful profiles and properties to build and deploy your project with maven.

From the project directory, run:

    mvn -PautoInstallPackage clean install 

to build the bundle and content package and install to a CQ instance. The CRX host and port can be specified on the command line with `mvn -Dcrx.host=otherhost -Dcrx.port=5502 <goals>`


### Using with VLT

To use vlt with this project, first build and install the package to your local CQ instance as described above. Then cd to `src/main/content/jcr_root` and run

    vlt --credentials admin:admin checkout -f ../META-INF/vault/filter.xml --force http://localhost:4502/crx

Once the working copy is created, you can use the normal ``vlt up`` and ``vlt ci`` commands.


### Edit in AEM

Once built and installed via maven, your new app should be editable in AEM. Take a look at the new [Apps admin console](http://localhost:4502/aem/apps.html/content/phonegap) to view the available apps on your instance.

A new app with the name you specified above ('ShapesCon' in my case) should be listed with the Cordova logo as it's thumbnail. If you followed the instructions exactly and have your author instance running locally on :4502, you should be able to access your new app via the following link:

[http://localhost:4502/cf#/content/phonegap/Geometrixx/apps/ShapesCon/en/home.html](http://localhost:4502/cf#/content/phonegap/Geometrixx/apps/ShapesCon/en/home.html)

Note: A keen observer will see that I replaced `editor.html` with `cf#` in the URL. This was done to avoid a conflict the new editor has with the Ionic styles. YMMV depending on which client side libraries your project includes.

A few things to try:

- Add a child page. It will become linked via the Ionic Menu List component already included on the home page of your app
- Add an image or text component
- Install the [aem-phonegap-kitchen-sink](https://github.com/blefebvre/aem-phonegap-kitchen-sink) project to experiment with a number of other components that deal with PhoneGap's device level APIs
- Click and drag the page to the right to reveal the left shelf menu


### Run on iOS Sim

From the [Apps console](http://localhost:4502/aem/apps.html/content/phonegap), navigate to your app, and through the English page to the first page of the app (it will have the Cordova logo as it's thumbnail). Enter 'select' mode via the checkmark button in the action bar, and select the app card (named 'ShapesCon' in my case).

With your app selected, tap the PhoneGap icon to download your application to the filesystem.

Using the PhoneGap CLI, build and deploy your application to the iOS Simulator with the following command:

    phonegap run ios 


### Uninstall

Just testing the waters? No problem. From the [package manager console](http://localhost:4502/crx/packmgr/index.jsp), locate the package named '<your-app-name>-content-1.0-SNAPSHOT.zip'. It should be at the top. Uninstall this package to remove your app, it's template, component, design, and supporting clientlibs.


