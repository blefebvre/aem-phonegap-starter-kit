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

    function ProfileService($q, AuthService) {

        var userProfile;

        /**
         * Loads the user profile information given an authenticated user.
         *
         * @return promise - the promise will resolve the user's profile information.
         */
        this.loadProfile = function () {
            var self = this;
            var deferred = $q.defer();
            var profileProvider = cq.mobileapps.provider.ProfileProviderRegistry.getProvider(AuthService.getAuth());

            profileProvider.fetch(function (error, profile) {
                if (!error && profile) {
                    // store the user profile for later calls to the service to retrieve it.
                    self.userProfile = profile;

                    deferred.resolve(self.userProfile);
                } else {
                    deferred.reject("Unable to fetch profile");
                }
            });

            return deferred.promise;
        };

        /**
         * getProfile returns the already resolved user profile information from the Profile Provider.
         * If the profile has not been loaded undefined will be returned;
         *
         * @return {Object} returns the profile information if the profile has been loaded.
         */
        this.getProfile = function() {
            return userProfile;
        }
    }

    angular.module('cqMobileApps')
        .service('ProfileService', ['$q', 'AuthService', ProfileService]);


}(angular, cq));
