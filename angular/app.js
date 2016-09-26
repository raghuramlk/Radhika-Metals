/**
 * 
 */
var mainApp = angular.module("invoiceApp", []);




mainApp.controller('HeaderController', ['$scope','$window', function($scope,$window) {
//function SettingsController($scope, $window) {
    $scope.header={};


    $scope.header.url = "./includes/header.html";


    /*	$scope.$on('$includeContentLoaded', function(event){
     $window.alert('content load');
     });*/

}]);

mainApp.controller('DashboardController', ['$scope','$window', function($scope,$window) {
//function SettingsController($scope, $window) {
    $scope.dashboard={};


    $scope.dashboard.url = "./includes/dashboard.html";


    /*	$scope.$on('$includeContentLoaded', function(event){
     $window.alert('content load');
     });*/

}]);
mainApp.controller('SidebarController', ['$scope','$window', function($scope,$window) {
//function SettingsController($scope, $window) {
    $scope.sidebar={};


    $scope.sidebar.url = "./includes/sidebar.html";


    /*	$scope.$on('$includeContentLoaded', function(event){
     $window.alert('content load');
     });*/

}]);
mainApp.controller('FooterController', ['$scope','$window', function($scope,$window) {
//function SettingsController($scope, $window) {
    $scope.footer={};


    $scope.footer.url = "./includes/footer.html";


    /*	$scope.$on('$includeContentLoaded', function(event){
     $window.alert('content load');
     });*/

}]);