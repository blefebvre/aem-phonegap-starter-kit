/*
 * Dismisses the splashscreen - if plugin is installed - as soon as deviceready
 * has fired.
 */
(function(document) {
    document.addEventListener("deviceready",
        function hideSplash() {
            if (navigator.splashscreen) {
                navigator.splashscreen.hide();
            }
        },
        false
    );
})(document);