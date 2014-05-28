AEM PhoneGap Starter Kit
========================

### Goal 

To provide you - the developer - with an AEM Apps project on your filesystem, ready to be built and installed to a running AEM 6.0 instance and committed to a version control system.

### Get it

Clone this repository to your machine to begin.

### Customize

This repository is built around two placeholders to enable quick customization: `brand_name_placeholder` and `app_name_placeholder`.

To customize this boilerplate for your own project, simply replace every occurrence of these two variables with (JCR-friendly) names of your choice. 

For example, let's say my brand name is 'Geometrixx' (originality is not the goal here) and app name is 'ShapesCon'. 

The following lines will update each directory occurrence of the two placeholders with our desired values. Use your own names to customize for your application:

	cd aem-phonegap-starter-kit
	find . -name brand_name_placeholder -type d -execdir mv {} Geometrixx \;
	find . -name app_name_placeholder -type d -execdir mv {} ShapesCon \;

Next, we'll replace every occurrence of these two strings in our project:

	find . -type f -exec sed -i '' 's/brand_name_placeholder/Geometrixx/g' {} \;
	find . -type f -exec sed -i '' 's/app_name_placeholder/ShapesCon/g' {} \;