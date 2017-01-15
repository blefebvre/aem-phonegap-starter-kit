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

    var serverInfo = {};

    function AEMServerService($q) {

        /**
         * @private
         */
        var loadConfigInfo = function() {
            var deferred = $q.defer();

            if (window.cordova) {
                cq.mobileapps.util.file.fetchJSON("pge-content-packages.json", function(error, data) {
                    if (error) {
                        deferred.reject("Unable to load pge-content-packages.json");
                    } else {
                        var server = data.serverURL;
                        if (server.charAt(server.length - 1) === '/') {
                            serverInfo.server = server.substr(0, server.length - 1);
                        } else {
                            serverInfo.server = server;
                        }
                        deferred.resolve(serverInfo.server);
                    }
                });
            } else {
                deferred.reject("wcm is in edit mode");
            }

            return deferred.promise;
        };

        /**
         * Return the AEM Server URL that has been configured within the application.
         * If the server url contained a '/' after the port, the '/' character is removed.
         *
         * @return {Promise} - a promise that contains the server url
         */
        this.getServer = function () {
            var deferred = $q.defer();

            if (serverInfo.server) {
                deferred.resolve(serverInfo.server);
            } else {
                loadConfigInfo().then(function(server) {
                    deferred.resolve(serverInfo.server);
                });
            }

            return deferred.promise;
        };
    }

    angular.module('cqMobileApps')
        .service('AEMServerService', ['$q', AEMServerService]);

}(angular, cq));
