#= require ./module

RouteProvider = ($locationProvider, $routeProvider) ->

  $locationProvider.html5Mode
    enabled: true
    requireBase: false

  homeConfig =
    templateUrl: "/templates/home/index"
    controller: "HomeCtrl"
    controllerAs: "ctrl"

  $routeProvider
    .when "/", homeConfig
    .otherwise
      redirectTo: "/"

RouteProvider.$inject = ["$locationProvider", "$routeProvider"]

angular
  .module "SampleApp"
  .config RouteProvider
