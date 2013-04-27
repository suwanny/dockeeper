# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.EditorCtrl = ($scope, $http) ->
  $scope.content = "# Dockeeper\n
---------\n
Dockeeper is a realtime markdown editor which you can \n
see the result while you're editing.\n
\n
"
  $scope.editor = editor = ace.edit("editor")
  $scope.editor.setTheme("ace/theme/monokai")
  $scope.editor.getSession().setMode("ace/mode/markdown")

  $scope.translateMd2Html = (text) ->
    success = (data,status) -> 
      console.log(data)
      $scope.content = data
    $http.post('/md2html', {md:text}).success(success)
    
  $scope.onChange = (data) ->
    text = $scope.editor.getValue()
    $scope.translateMd2Html(text)
    # $scope.$digest()
    
  editor.on "change", (data) -> $scope.onChange(data)
  $scope.editor.setValue($scope.content)
    
    




