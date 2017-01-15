/*
 *  Copyright 2016 Adobe Systems Incorporated
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
;(function (angular, cq, undefined) {

    "use strict";

    var auth,
        serverInfo;

    function AuthService($q, AEMServerService) {

        /**
         * @private
         */
        var loadConfigInfo = function() {
            var deferred = $q.defer();

            if (window.cordova) {
                // return the cached properties
                if (serverInfo) {
                    deferred.resolve(serverInfo);
                } else {
                    cq.mobileapps.util.file.fetchJSON("MobileAppsConfig.json", function(error, data) {

                        if (error) {
                            return deferred.reject("Unable to load the MobileAppsConfig.json file");
                        }

                        if (!data.oauth) {
                            var message = "An OAuth client has not been configured We.Retail. " +
                                "Visit the properties of the app and add a the OAuth client details " +
                                "to the authentication tab.";
                            return deferred.reject(message);
                        }

                        AEMServerService.getServer().then(function(server) {
                            serverInfo = {};

                            serverInfo.server       = server;
                            serverInfo.clientId     = data.oauth.clientId;
                            serverInfo.clientSecret = data.oauth.clientSecret;
                            serverInfo.redirectURI  = data.oauth.redirectURI;

                            deferred.resolve(serverInfo);
                        });

                    });
                }
            } else {
                deferred.reject("wcm is in edit mode");
            }

            return deferred.promise;
        };

        /**
         * The login function provides the user with an OAuth dialog to authenticate against AEM with.
         *
         * @return {Promise} A promise which gets resolved when the user successfully authenticates,
         * and is rejected when the user fails to authenticate.
         */
        this.login = function(quiet) {

            var self = this;
            var deferred = $q.defer();

            loadConfigInfo().then(function(serverInfo) {
                try {
                    auth = new cq.mobileapps.auth.OAuth({
                        'server': serverInfo.server,
                        'client_id': serverInfo.clientId,
                        'client_secret': serverInfo.clientSecret,
                        'redirect_uri': serverInfo.redirectURI,
                        'loadstop': function () {
                            deferred.notify('login.loadstop');
                        }
                    });
                } catch (error) {
                    return deferred.reject(error);
                }

                if (quiet) {
                    auth.getToken(function(error, token) {
                        if (token) {
                            deferred.resolve('login.finished');
                        } else {
                            deferred.reject('login.auth.required');
                        }
                    });
                } else {
                    auth.authorize(function (error) {
                        deferred.notify('login.finished');

                        if (error) {
                            deferred.reject("Unable to authenticate against the server " + serverInfo.server);
                        } else {
                            deferred.resolve();
                        }
                    });
                }
            }, function(error) {
                deferred.reject(error);
            });

            return deferred.promise;
        };

        /**
         * Return the OAuth instance that is being used to authenticate with.
         * @return {cq.mobileapps.auth.OAuth} the authentication instance.
         */
        this.getAuth = function() {
            return auth;
        };
    }

    angular.module('cqMobileApps')
        .service('AuthService', ['$q', 'AEMServerService', AuthService]);

}(angular, cq));
