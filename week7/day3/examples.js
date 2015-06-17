/* global console */
'use strict';

var ageVerifier = function (age) {
  if (age < 21) {
    console.log('Sorry, you can\'t come in');
  } else {
    console.log('Go ahead');
  }
};

ageVerifier(24);
ageVerifier(18);


function foobar(foo, bar){
  return foo + bar;
}

foobar('hello', 'world');
