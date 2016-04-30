/**
 * Created by guzhen on 16/4/28.
 */
// declare a new module called 'myApp', and make it require the `ng-admin` module as a dependency
var myApp = angular.module('myApp', ['ng-admin']);
// declare a function to run when the module bootstraps (during the 'config' phase)
myApp.config(['NgAdminConfigurationProvider', function (nga) {
    // create an admin application
    var admin = nga.application('My First Admin');
    // more configuration here later
    // ...
    // attach the admin application to the DOM and execute it
    nga.configure(admin);
}]);