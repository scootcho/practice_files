var TodoApp = angular.module('TodoApp', []);

TodoApp.controller('TodoCtrl', function($scope) {
  $scope.todos = [
    { name: 'Learn Angular', done: false },
    { name: 'Learn React',   done: false },
    { name: 'Be awesome',    done: false }
  ];
  
  $scope.remove = function($index) {
    $scope.todos.splice($index, 1);
  }
  
  $scope.markSuccess = function($index) {
    var todo = $scope.todos[$index];
    
    // Remove the todo from its current position
    $scope.remove($index);
    
    todo.done = !todo.done;
    
    if (todo.done) {
      $scope.todos.push(todo);
    } else {
      $scope.todos.unshift(todo);
    }
  };
  
  $scope.addTodo = function() {
    if ($scope.toAdd) {
      $scope.todos.push({
        name: $scope.toAdd,
        done: false
      });
      $scope.toAdd = '';
    }
  };
});