## Outline
- Homework Review
- Wat Talk
- Javascript.com video
- History of Javascript
	- Not Java
	- ECMAScript
- Javascript Grammar and Types
  - Expressions vs Statements
    - http://www.2ality.com/2012/09/expressions-vs-statements.html (Really great JS website)
	- Boolean
	- Null, Undefined
	- Number `23`
	- String `"hello world"`
	- variables `var foo = 'bar';`
	- Object (Think Hash) `var obj = {};`
		- JSON
	- Functions
	   - `function foo() { return 'bar'; }`
           - `var foo = function() { return 'bar'; }`
           - Functions are variables, can be passed around.
	- If ` if () { } `
	- Looping
```
var limit = 100;
for(var i = 0; i < limit; i++) {
  i + 10;
}
```
```
[1,2,3,4].forEach(function(num) {
  console.log(num);
});
```
- Getting Output
	- `console.log`
	- `console.warn`
	- `console.table` Use for arrays of objects
	- `alert`
	- `prompt`
- Equality in Javascript
	- http://zero.milosz.ca/
	- Use `===` instead of `==` in JS.
- Scope
	- Javascript only has function scope.
	- Hoisting
		- Variables will be 'hoisted' to the top of the function they are in.

- Birth and Death of Javascript Discussion

- **Bonus**
- The DOM
	- Document Object Model
	- The JS Object representation of your HTML page.
- Querying the DOM
All dom queries will return either an element node, an array of element nodes, or `null`.
	- `document.getElementByID()`
	- `document.getElementsByClassName()`
	- `document.querySelector()`
	- `document.querySelectorAll()`
- Events
Events are 'bound' to an element and then are executed whenever the event you specified occurs on that selected element.
```
var element = document.querySelector('#submit-button');
element.addEventListener("click", function () {
  console.log('wooo');
});
```

## Resources
- https://www.javascript.com/
- http://zero.milosz.ca/
- https://developer.mozilla.org/en-US/docs/Web/JavaScript
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures
- https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener
- https://www.destroyallsoftware.com/talks/the-birth-and-death-of-javascript
- http://javascriptweekly.com/
- http://www.unistorgroup.com/uploads/documents/OReilly.JavaScript.The.Good.Parts.May.2008.pdf
- [Aaron's Intro to JS](https://github.com/TIY-Austin-Front-End-Engineering/Curriculum/tree/master/javascript-introduction)
- [Aaron's JS Functions Notes](https://github.com/TIY-Austin-Front-End-Engineering/Curriculum/blob/master/DAY09.md)
- [Aaron's Notes for the DOM](https://github.com/TIY-Austin-Front-End-Engineering/Curriculum/blob/master/DAY10.md)
- [Opalrb Ruby -> JS](http://opalrb.org/)
- [asm.js](http://asmjs.org/)
