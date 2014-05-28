AEM PhoneGap Starter Kit
========================

### Goal 

To provide you - the developer - with an AEM Apps project on your filesystem, ready to be built and installed to a running AEM 6.0 instance and committed to a version control system.

### Get it

Clone this repository to your machine to begin.

### Customize

This repository is built around two path names to enable quick customization: `brand_name_placeholder` and `app_name_placeholder`.

To customize this code for your own project, simply replace every occurence of these two variables with (JCR-friendly) names of your choice. 

For example, let's say my brand name is 'Geometrixx' (originality is not the goal here) and app name is 'ShapesCon'. 

The following lines will update each directory occurence of the two placeholders with our desired values. Use your own variables to customize for your application:

	cd aem-phonegap-starter-kit
	find . -name brand_name_placeholder -type d -execdir mv {} Geometrixx \;
	find . -name app_name_placeholder -type d -execdir mv {} ShapesCon \;
