// First write a constructor function for an elephant. Each elephant
// should have a name, height (in inches), and array of tricks in
// gerund form (e.g. "painting a picture" rather than "paint a picture").
//
// Next write a few prototype functions that will be shared among all
// elephants:
//
// Elephant.prototype.trumpet: should print "(name) the elephant goes
// 'phrRRRRRRRRRRR!!!!!!!'"
// Elephant.prototype.grow: should increase the elephant's height by
// 12 inches
// Elephant.prototype.addTrick(trick): add a new trick to their
// existing repertoire
// Elephant.prototype.play: print out a random trick,
// e.g. "(name) is (trick)!"
// Hint: look up some JS Math methods!
// Make sure to create an elephant and test all of these functions
// out on them method style!


console.log("Hello from the JavaScript console!");

$.ajax({
  type: 'GET',
  url: 'http://api.openweathermap.org/data/2.5/weather' +
  	'?q=London,uk&appid=bcb83c4b54aee8418983c2aff3073b3b',
  success(data) {
    console.log("We have your weather!");
    console.log(data);
  },
  error() {
    console.error("An error occurred.");
  },
});

console.log("THE AJAX has been dispatched.");
