AEM Apps Starter Kit
====================

:new: Note that the requirements have changed as of June 2015. If you do not yet have AEM 6.1, please use the `release/6.0-apps-featurepack` branch.


### Goal 

To provide you - the developer - with an AEM Apps project on your filesystem, ready to be built and installed to a running AEM 6.0 instance and committed to a version control system.


### Requirements

- AEM 6.1
- [node.js](http://nodejs.org/) version `>=0.12.x`
- [PhoneGap CLI](https://github.com/phonegap/phonegap-cli) version `>=5.0.0`
- (iOS only) Xcode version `>=6.3.1`
- (iOS only) [ios-sim](https://github.com/phonegap/ios-sim#installation) 
- (Android only) [Android SDK](https://developer.android.com/sdk/index.html)


### Get started

Clone this repository to your machine to begin.


### Customize

This repository is built around two placeholders to enable quick customization: `brand_name_placeholder` and `app_name_placeholder`.

To customize this boilerplate for your own project, simply replace every occurrence of these two variables with (JCR-friendly) names of your choice. You can use [customize-app.sh](customize-app.sh) for this, if you're using bash.

For example, let's say my brand name is 'Geometrixx' (originality is not the goal here) and app name is 'ShapesCon'. 

Note: the following has only been tested on OS X. YMMV.

	./customize-app.sh Geometrixx ShapesCon


### Install

This project is based on the [multimodule-content-package-archetype](http://dev.day.com/content/docs/en/aem/6-0/develop/how-tos/vlt-mavenplugin.html#multimodule-content-package-archetype) (with the bundle removed for simplicity), so it contains the same helpful profiles and properties to build and deploy your project with maven.

From the project root, run:

    mvn -PautoInstallPackage clean install 

... to build the content package and install to a AEM instance. The CRX host and port can be specified on the command line with `mvn -Dcrx.host=otherhost -Dcrx.port=5502 <goals>`


### Edit in AEM

Once built and installed via maven, your new app should be editable in AEM. Take a look at the new [Apps admin console](http://localhost:4502/aem/apps.html/content/phonegap) to view the available apps on your instance.

A new app folder with the brand name you specified above ('Geometrixx' in my case) should be listed. Tap it to view the app you created, which will be listed with the Cordova logo as it's thumbnail. If you followed the instructions exactly and have your author instance running locally on :4502, you should be able to author your new app via the following link:

[http://localhost:4502/editor.html/content/phonegap/Geometrixx/ShapesCon/en/home.html](http://localhost:4502/editor.html/content/phonegap/Geometrixx/ShapesCon/en/home.html)

A few things to try:

- Add a child page. It will become linked via the Ionic Menu List component already included on the home page of your app
- Add an image or text component
- Install the [aem-phonegap-kitchen-sink](https://github.com/blefebvre/aem-phonegap-kitchen-sink) project to experiment with a number of other components that deal with PhoneGap's device APIs
- Enter 'preview' mode, and drag the page to the right to reveal the left shelf menu


### Run on the iOS Simulator

From the [Apps console](http://localhost:4502/aem/apps.html/content/phonegap), navigate to your app's [Command Center](http://localhost:4502/libs/mobileapps/admin/content/dashboard.html/content/phonegap/Geometrixx/ShapesCon/shell) (your URI will differ based on the values you provided to `customize-app.sh`).

Locate the 'PhoneGap Build' tile, and the down arrow to the top right of the pane. Tap this arrow, then tap the 'Download CLI' item to initiate a download of your app's content. A .zip payload will be downloaded locally. Using your command line of choice, navigate to the directory created by extracting the payload. Using OS X? this handy [Finder toolbar app](https://github.com/jbtule/cdto) makes it easy.

Using the [PhoneGap CLI](https://github.com/phonegap/phonegap-cli), build and deploy your application to the iOS Simulator with the following command:

    phonegap run ios --emulator


### Using with VLT

To use vlt with this project, first build and install the package to your local AEM instance as described above. Then `cd content/src/main/content/jcr_root/` and run:

    vlt --credentials admin:admin checkout -f ../META-INF/vault/filter.xml --force http://localhost:4502/crx

Once the working copy is created, you can use the normal ``vlt up`` and ``vlt ci`` commands.


### Uninstall

Just testing the waters? No problem. From the [package manager console](http://localhost:4502/crx/packmgr/index.jsp), locate the package named 'your-app-name-content-1.0-SNAPSHOT.zip'. It should be at the top of the list. Uninstall this package to remove your app, it's template, component, design, and supporting clientlibs.


