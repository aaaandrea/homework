//madLib
//Write a function that takes three strings - a verb, an adjective,
//and a noun - uppercases and interpolates them into the sentence
//"We shall VERB the ADJECTIVE NOUN". Use ES6 template literals.

function madLib(verb, adj, noun) {
  return `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()}
                    ${noun.toUpperCase()}.`;
}

madLib('make', 'best', 'guac');

// isSubstring
//Input
// 1) A String, called searchString.
// 2) A String, called subString.
// Output: A Boolean. true if the subString is a part of the searchString.

function isSubstring(phrase, subphrase) {
  return phrase.includes(subphrase);
}

// Phase II

// fizzBuzz
// 3 and 5 are magic numbers.
//
// Define a function fizzBuzz(array) that takes an array returns a
// new array of every number in the array that is divisible by either
// 3 or 5, but not both.

function fizzBuzz (array) {
  const fizzBuzzArr = [];

  array.forEach(el => {
    if ((el % 3 === 0) ^ (el % 5 === 0)) {
      fizzBuzzArr.push(el);
    }
  });

  return fizzBuzzArr;
}

// isPrime
// Define a function isPrime(number) that returns true if number is prime.
// Otherwise, false. Assume number is a positive integer.

function isPrime (n) {
  if (n < 2) { return false; }

  for (let i = 2; i < n; i++) {
    if (n % i === 0) {
      return false;
    }
  }

  return true;
}

// sumOfNPrimes
// sing firstNPrimes, write a function sumOfNPrimes(n) that returns the 
// sum of the first n prime numbers. Hint: use isPrime as a helper method.

function sumOfNPrimes (n) {
  let sum = 0;
  let countPrimes = 0;
  let i = 2;

  while (countPrimes < n) {
    if (isPrime(i)) {
      sum += i;
      countPrimes++;
    }
    i++;
  }

  return sum;
}
