#= require ./../base

#= require angular-file-model
#= require angular-file-upload

appMainRunner = ($rootScope, $mdSidenav, $mdMedia, $window, $mdToast, $mdDialog, $location, StateDefine)->

  StateDefine($rootScope)

  $rootScope.currentMenu = $location.path()
  $rootScope.pageTitle = ""

  $rootScope.stillLoading = false

  $rootScope.isMainSideNavOpen = if $mdMedia('gt-xs') then true else false

  $rootScope.setPageTitle = (title)->
    $rootScope.pageTitle = "#{title} | International Classification of Crimes for Statistical Purposes"

  $rootScope.isSideNavOpen = (navID)->
    $mdSidenav(navID).isOpen()

  $rootScope.toggleSideNav = (navID)->
    $mdSidenav(navID).toggle()

  $rootScope.back = ->
    $window.history.back()

  $rootScope.showPrompt = (message, args = {})->
    opts =
      textContent: message
      position: 'bottom right'
      hideDelay: 3000
    angular.extend(opts, args)

    $mdToast.show(
      $mdToast.simple()
        .textContent(opts.textContent)
        .position(opts.position)
        .hideDelay(opts.hideDelay)
    )

  $rootScope.showToastAction = (args = {}, func = null)->
    opts =
      action: 'Delete'
      hideDelay: '10000'
      highlightAction: true
      highlightClass: 'md-warn'
      position: 'bottom right'
      content: 'Delete?'
    angular.extend(opts, args)

    $mdToast.show(
      $mdToast.simple()
        .content(opts.content)
        .action(opts.action)
        .highlightAction(opts.highlightAction)
        .highlightClass(opts.highlightClass)
        .position(opts.position)
        .hideDelay(opts.hideDelay)
    ).then(func)

  $rootScope.showDialog = (event, args = {}, func = null)->
    opts =
      clickOutsideToClose: false
      parent: angular.element(document.body)
      targetEvent: event
    angular.extend(opts, args)

    $mdDialog.show(opts).then(func)

  $rootScope.selectMenu = (url = '')=>
    $rootScope.currentMenu = url
    $rootScope.toggleSideNav('mainSideNav') if $mdMedia('xs')

  $rootScope.isSelected = (url = '')=>
    $location.path() is url

appMainRunner.$inject = ['$rootScope', '$mdSidenav', '$mdMedia', '$window', '$mdToast', '$mdDialog', '$location', "StateDefine"]

angular
  .module "SampleApp", ["CommonApp", "file-model", "angularFileUpload"]
  .run appMainRunner
