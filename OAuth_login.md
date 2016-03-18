# OAuth Login Support

## Setup

#### Enable Client Application Access

- Log into your publish instance, via the [CRX/explorer](http://localhost:4503/crx/explorer/login.jsp)
- Open the System Console [Configuration page](http://localhost:4503/system/console/configMgr)
- Find the config entry for "Apache Sling Referrer Filter"
    - Use the edit button (pencil icon) to open it's config dialog
    - Select the "Allow Empty" checkbox to enable requests from Cordova apps
    - Tap "Save" to continue

#### Enable OAuth

- Open the System Console [Configuration page](http://localhost:4503/system/console/configMgr)
- Find the config entry for "Adobe Granite OAuth Server Authentication Handler"
    - Use the edit button (pencil icon) to open it's config dialog
    - Tap "Save" to enable OAuth on your publish instance
    - Alternatively, use the following cURL command to perform this action: 
```
curl -u admin:admin --data "apply=true&action=ajaxConfigManager&%24location=launchpad%3Aresources%2Finstall.crx3%2F0%2Fcom.adobe.granite.oauth.server-1.0.8.jar&path=%2F&jaas.controlFlag=sufficient&jaas.realmName=jackrabbit.oak&jaas.ranking=1000&oauth.offline.validation=true&propertylist=path%2Cjaas.controlFlag%2Cjaas.realmName%2Cjaas.ranking%2Coauth.offline.validation" http://localhost:4503/system/console/configMgr/com.adobe.granite.oauth.server.auth.impl.OAuth2ServerAuthenticationHandler
```
- Find the config entry for "Day CQ Login Selector Authentication Handler"
    - Use the edit button (pencil icon) to open it's config dialog
    - Configure the login page by adding a new value to `auth.loginselector.mappings` with value: `/libs/granite/core/content/login:/libs/granite/oauth/content`
    - Tap "Save" to enable the Granite login page for OAuth requests

#### Create a client for your app

- Navigate to the [OAuth Clients console](http://localhost:4503/libs/granite/oauth/content/clients.html)
- Tap the '+ Create Client' button to create a new client for your app
    - Give your new client an ID, such as `geometrixx-app`
    - In the URI field, enter `http://localhost`
    - Tap 'Create Client ID' to continue
- A Client ID and Secret will be generated for your app. Make note of these values for the next step
- Tap "Close" to continue


#### Link the app to your client

- Log into your [author instance](http://localhost:4502/aem/apps.html/content/mobileapps)
- From your app's "Manage App" tile, use the ellipsis to open the [details page](http://localhost:4502/libs/mobileapps/admin/content/dashboard/appdetails.html/content/phonegap/geometrixx-outdoors/shell)
- Select the "Authentication" tab
- Enter the "Client ID", "Client Secret", and "Redirect URI" as generated on your publish instance [OAuth Clients console](http://localhost:4503/libs/granite/oauth/content/clients.html)
- Tap "Save" to persist your changes and continue


## Use

- With OAuth configured and a ContentSyncConfig node of type `mobileappconfig` with it's `providers[]` property containing `com.adobe.cq.mobile.platform.impl.provider.MobileAppsOAuthInfoProvider`, you should be all set
- Download your app's source via the "PhoneGap Build" tile
- Verify that the `www` directory contains a file named `MobileAppsConfig.json`
    - This file should contain the values you generated above
- Run the app targeting either iOS or Android
- From the left flyout data, tap "Login"
