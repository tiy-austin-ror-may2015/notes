var names = ['abby', 'aaron', 'sam', 'justin'];
// Defining an array full of strings

//Calling the function 'forEach' on the array 'names'
// We are giving the 'forEach' function a single argument.
// That argument is a function.
names.forEach(function (name) {
  console.log(name);
});

//We can write functions in javascript as expressions by assigning them to variables.
//Notice the semicolon at the end of the function body.
var sayHelloToName = function (name) {
    if (name !== undefined) { //Use === and !== in javascript

      console.log('Hello' + ' ' + name); // No string interpolation in js, use concat

    } else {

      console.log('no name given');

    }
};// <<-- End of expression
// In javascript, arity is not enforced. So calling a function with 0 arguments
// That actually takes 1 argument, will not throw an error, but it will not work correctly.

var names = ['justin', 'aaron', 'abby', 'sam'];

var loopNames = function () {
    for (var i = 0; i < names.length; i++) {
        sayHelloToName(names[i]);
    }
};
// Using a for loop in javascript has a very particular syntax
// for (INITIAL VAR ; WHILE PREDICATE ; ITERATOR INCREMENT) {
//  LOOP BODY
//}

loopNames; //<-- This line is 'referencing' the function, it is not calling it. This will only return the function with that name.
loopNames(); //<-- Calling a function in js is done by placing parens () at the end of the function name. Even if it takes 0 arguments.

function printMsg(msg) {
  console.log(msg);
}
// Functions can also be written in this style above.
// Notice there is no semicolon at the end of this function body.

names.forEach(printMsg);
//Instead of passing an anonymous function and passing that into the 'forEach' function as an argument,
//we can give it a function that has a name by 'referencing' that function. (Don't call it by accident)

names.forEach(function (name) {
  console.log('hi ' + name);
});


var options = { limit: 10, order: 'ASC' };
// Objects are what javascript uses for its key/value pair data structure.
// You can think of objects in javascript as hashes in ruby.
// They have keys that coorispond to values.


//Like hashes in ruby, objects in javascript can hold any data type. Strings, Numbers, Arrays, and other Objects.
var student = {
    name: 'Aaron',
    course: 'Rails',
    gpa: '199999',
    "favorite foods": [
        'sushi',
        'ice cream',
        'tacos'
    ],
    sayHello: function () {
        console.log("Hi!");
    }
};
//Values can be retrieved from objects by using either the subscript operator (like in ruby) or
// by using the dot notation. Keep in mind the dot notation only works if the keys are one word long.
student['favorite foods']
student.name
student['sayHello']();

var cat = {
  'name': 'beans',
  'age': 2,
  'speak': function() {
      console.log('mewwwwrrrrwwwwwwwwwww');
  },
  'play': function () {
      console.log('fetches the ball');
  }
};

cat.play();
// You can call any function that is inside of an object simply by accessing it and using parens to callit.
// The cat object works as a container or namespace for our play function that we wrote. You can only access
// the play function by going through cat first.
























