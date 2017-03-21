<div class="reveal"><div class="slides">


<section>
  <h2>NDev Meetup #13</h2>
  <p>ECMAscript-Next: How and why you should modernize your Javascript</p>
  
  <p><small>Paul Doucet, M.Sc. Physics</small></p>
  <p><small>paul@paulswildyears.com</small></p>
<!-- 
  <p><img src="src/images/7upspot.gif">  <img src="src/images/7upspot.gif">  <img src="src/images/7upspot.gif">  <img src="src/images/7upspot.gif"></p> -->

 <p><img src="src/images/gif.gif"></p>


</section>

<section data-markdown>
Overview
--------

1. Bitta History
2. Bitta ECMAscript 6/7/Next
3. Bitta Babel + JSPM
</section>

<section data-markdown>
tl;dl 
-----

Why upgrade:
 * concise, manageable and future-ready code
 * static analysis for javascript is _amazing_

How:
 * use Babel (optional: JSPM)
 * start small
 * keep **learning** Javascript

note:

 * pitfalls - extra complexity due to shims/transpilation
</section>

<section>
  <section data-markdown><script type="text/template">
JavaScript in a nutshell
========================
  </script></section>
  <section data-markdown><script type="text/template">
Casting is weird
----------------

  <pre><code lang="javascript" data-trim data-noescape>'0' == false
-1 < null
null < 1
0.1 + 0.2 !== 0.3 
0.0 === 0
"" == "0" <span class="fragment">// false</span></code></pre>

note:
* `null` cast to a number is `0` (groan)
* Use `===`, not `==` for type equality!
* Also.. there's a mistake!

  </script></section>
  <section data-markdown><script type="text/template">

Historically quirky
-------------------

<pre><code lang="javascript" data-trim data-noescape>parseInt("32") === 32
parseInt("032") === 26
<span class="fragment">parseInt("032", 10) === 32</span></code></pre>

note:

OK, this was changed in ES5. So the correct answer is: it depends! 
  </script></section>

  <section data-markdown><script type="text/template">

Function-level Scoping
----------------------
```js
var a = 9999;       // Redundant
var b = 2;
if (true) {
    var a = 1;      // `a` redeclared in global scope
}
console.log(a);     // "1"
console.log(foo()); // "3"
console.log(a+3);   // "4" (`a` is still 1)
console.log(c);     // "5"

function foo() {    // foo() gets "hoisted" to the top
    var a = 3;      // function-scoped `a`
    console.log(b); // "2" (from outer scope)
    c = 5;          // No `var`, `c` leaks into parent 
    return a;
}
```

note:

* "What do you get if you run this... nothing! No console.log in IE9!"
* Javascript has function-level scope, not block-level. 
* JS has closures: passing variables into inner scopes is common practice
  </script></section>


  <section data-markdown><script type="text/template">

Classes are a fraud
-------------------
```js
function Person(name, lastName) {
  this.name = name;
  this.lastName = lastName;
}

Person.prototype.greet = function() {
  console.log('Hello ' + this.lastName + ', ' + this.name);
}

var greet = me.greet;
greet();      // Hello undefined, 
```

note:

* Because Javascript is prototypically-inherited, classes are largely fake - cobbled 
  together from a few behaviours into something that resembles partial Class-like 
  behaviour (ie, addition of the `new` keyword)
* Note that if you run this in a browser, in second greet call `this.name = ""`
  because `this` is inherited as `window`, and `window.name = ''`
  </script></section>


  <section data-markdown><script type="text/template">

Classes are a fraud
------------------
```js
var me = {
  name: 'Paul',
  lastName: 'Foo',
  greet: function() {
    console.log('Hello ' + this.lastName + ', ' + this.name);
  }
}

me.greet();   // Hello Foo, Paul
```

note:

* 
  </script></section>
</section>

<section>
  <section data-markdown><script type="text/template">

Background
----------

_The history of JavaScript is the history of the web_

  </script></section>
  <section data-markdown><script type="text/template">

1993
----

* First "popular" graphical web browser **Mosaic** is released.
* Mosaic is available for Windows, Macintosh and Unix. 

note:

* The graphical internet is now not only a _thing_ but it is 
  a _cross platform_ thing.

  </script></section>
  <section data-markdown><script type="text/template">

1994
----

* Netscape Communications is founded, releases **Netscape Navigator** (ne _Mosaic Netscape_). It gains 75% market share.

!["Netscape Mosaic"](src/images/netscape_mosaic.png)

note:

* The codename for Mosaic Netscape is "Mozilla": meaning "Mosaic Killer"
* Paul Doucet uses Netscape's browser to download and print _colour_ photos of the planets from NASA's _world wide web_ site. Bedazzles grade 6 teacher.

  </script></section>
  <section data-markdown><script type="text/template">

1995
----

<div style="position: relative;">

  <ul class="fragment current-visible" style="position: absolute; top: 0; left: 0">
    <li>Microsoft **Internet Explorer** debuts as does **IIS**</li>
    <li>The idea of using the web as a distributed OS catches on</li>
  </ul>

  <ul class="fragment current-visible" style="position: absolute; top: 0; left: 0">
    <li>Netscape hires Brendan Eich</li>
    <li>Netscape wants a scripting language for their web browser</li>
    <li>Java was hot on the server-side, but they wanted something friendlier for the browser</li>
  </ul>

  <ul class="fragment current-visible" style="position: absolute; top: 0; left: 0">
    <li>... they give Brendan 10 days to do it</li>
  </ul>

  <!-- <div class="fragment current-visible" style="position: absolute; top: 0; left: 0">
    <p>Design:</p>
    <ul>
      <li>Basic syntax borrowed from C</li>
      <li>Simplified approach to concurrency and memory management due to web pages being short-lived</li>
    </ul>

    <p>"Features"</p>
    <ul>
      <li>No exception handling (hence type forcing is aggressive and silent fails are common)</li>
      <li>No block scope</li>
      <li>No modules</li>
      <li>No subclassing</li>
    </ul>

  </div> -->

  <div class="fragment current-visible" style="position: absolute; top: 0; left: 0">
    <ul>
      <li>**JavaScript** is born (ne LiveScript) in **Netscape Navigator** 2.0</li>
      <li>Netscape also adds **JavaScript** support to its **Netscape Enterprise Server**</li>
      <li>Netscape also blesses the world with its proprietary `<blink>` and `<marquee>` tags</li>
    </ul>

    !["Netscape 2.0"](src/images/navigator.gif)
  </div>

  <div class="fragment current-visible" style="position: absolute; top: 0; left: 0">
    <ul>
      <li>Sun and Netscape were partners against Microsoft</li>
      <li>**JavaScript** renamed from **LiveScript** at Sun's request</li>
      <li>Sun (now Oracle) registers the trademark for "JavaScript"</li>
      <li>Sun licenses "JavaScript" to Netscape in perpetuity</li>
    </ul>

  </div>

</div>

[0]: https://www.youtube.com/watch?v=RO1Wnu-xKoY&t=438s
[1]: https://www.computer.org/csdl/mags/co/2012/02/mco2012020007.html

note:

* The pace of browser development is furious - IE version 1 and 2 in the same year. 
* MS originally makes IE available through "Microsoft Plus" and NT
* MS begins to push IE to the forefront of its desktop O/S
* I think that Netscape and Sun were buddies at the time, partly why JS was made "java-sounding"
* Java was the heavyweight language for prefessionals of the day, wanted casual and approachable to non-professionals
  
  </script></section>
  <section data-markdown><script type="text/template">

1996
----

* Microsoft introduces **CSS**, **VBScript** and **JScript** (reverse-engineered from JavaScript)
in Internet Explorer 3.0.
* IE3 is embedded in Windows 95 SP2. Gains 25% market share.
* Netscape submits JavaScript to Ecma International for standardization

!["IE 3"](src/images/ie3.png)

note:

* IE3 also has: ActiveMovie plugins, VRML
* ECMA: European Computer Manufacturers Association

  </script></section>
  <section data-markdown><script type="text/template">

Browser wars are officially _on_.

!["IE 3"](src/images/ie.gif) !["Best viewed in Netscape"](src/images/ns.gif)

<p class="fragment">For the next few years, new web innovation proceeds at break-neck speed.</p>

<p class="fragment">...even though a lot of it is crap.</p>

<p class="fragment">The phrase, "Best viewed in ____" becomes prevalent on the web.</p>

note:

* `<frame>`s were hot
* Everything was optimized for 1024 by 768 
* Counters were necessary, guestbooks were facebooks
  
  </script></section>
  <section data-markdown><script type="text/template">

In browser-land: 

* **1998** Netscape bought by AOL. Navigator made open source.
* **2001** Windows XP is released. IE6 is bundled with SP1. Quickly reaches 90%+ share.
* **2003** Mozilla Foundation is created 
* **2004** Firefox launches
* **2006** IE7 lands, the first new version in 5 years.
* **2007** Safari for iOS launches
* **2008** Chrome launches
* **2010** IE share dips below 50%

note:

* Netscape is dead ~ 2001

  </script></section>
  <section data-markdown><script type="text/template">

In JS Feature-land: 

* **1997** DOM manipulation
* **1999** XMLHttpRequest is added to IE5
* **2001** JSON is invented
* **2005** AJAX (asynchronous http) is a _thing_. The web ignites.
* **2006** jQuery brings functional JavaScript to the masses
* **2009** NodeJS polarizes everybody

note:

* 2006 tools for decent front-end apps now exist. Frameworks appear by the dozens. De-facto standards evolve and begin to take hold. A lot more money and infrastructure become quickly tied up in JS

  </script></section>

  <section data-markdown><script type="text/template">

In ECMAScript land: 


* **1997** ECMA-262 is published (ECMAScript). 
* **1998** ECMAScript 2, minor revisions for ISO/IEC 16262. 
* **1999** ECMAScript 3, modern JavaScript: `try/catch`, `concat`, `match`, `replace`, `slice`, `RegExp`, etc
* **2003** ECMAScript 4 work _stalls_, as does a ES3.1 draft proposal
* **2008** ECMAScript 4 is _abandoned_. 

[4]: https://en.wikipedia.org/wiki/JavaScript

note:

* JavaScript is the most well-known ES implementation (along with ActionScript, JScript, others) 
* Great lull: Initially due to IE's domination followed by explosive growth in new browsers
  and rich JavaScript application development needing stability
* ES4: Grew too big and too difficult to actually make _work_. Lots of push-back. Lots of players.
* Doesn't include W3C standards (ie DOM functions)
  </script></section>
  <section data-markdown><script type="text/template">

The "Harmony" Proposal
----------------------

* ES working group agrees to mothball ES3.1 and ES4
* ES5 to contain minor updates
* Major changes pushed to ES6 and beyond (the "Harmony" releases)

note: 
* ES working group ultimately decides to forge a path forward by mothballing ES4 in favour of a minor revision, followed by several smaller releases collectively called "Harmony".

* After the initial spark, followed by Great Vendor Lull: Enter the period of standardization. Annual revisions!


  </script></section>
  <section data-markdown><script type="text/template">

ECMAScript 5
------------

* Released December 2009. 
* Today it is good baseline for browser modernity 
* Codifies many common implementations
* Adds standard library functions `Object.create()`, `Object.keys()` `JSON.parse()`, etc
* Adds getters and setters, strict mode
* Full support: IE10, FF21, Chrome 23, Safari 6, Android 4.4

[es5]: http://caniuse.com/#search=es5

note: 

* Some earlier browsers have decent support. Chrome 19-22 only lack `parseInt` change
* Minor corrections for ISO standardization released as 5.1
  </script></section>
  <section data-markdown><script type="text/template">

ECMAScript 6
------------

1. ECMAScript Harmony
2. ECMAScript.next
3. ECMAScript 6
4. ECMAScript 2015
5. _ECMAScript 6_? (de-facto reversion?)

!["ES6 Spec"](src/images/es6.png)

  </script></section>
  <section data-markdown><script type="text/template">

ECMAScript 6 / 2015
-------------------

* Released June 2015
* Fully backwards-compatible
* Includes: Lots. New syntax, new features, new standard library functions...

Modules, classes, promises, iterators, generators, maps, sets, weakMaps, proxies, oh my!

[es6-table]: http://kangax.github.io/compat-table/es6/

note:
* Do not break the web

  </script></section>
  <section data-markdown><script type="text/template">

Looking forward
---------------

<dl>
  <dt>ECMAScript 7 / 2016</dt>
  <dd>
Released June 2016. Changes are mostly minor compared to es6.
  </dd>
  <dt>ECMAScript Next</dt>
  <dd>
Placeholder name for all future draft proposals
  </dd>
</dl>


  </script></section>
  <section data-markdown><script type="text/template">

ES6 was a long, tumultuous process. Lots of last-minute changes.

!["ES6 Spec"](src/images/underconstruction.gif) !["ES6 Spec"](src/images/underconstruction.gif) !["ES6 Spec"](src/images/underconstruction.gif) !["ES6 Spec"](src/images/underconstruction.gif) !["ES6 Spec"](src/images/underconstruction.gif) 

Beware reading articles about DRAFT specifications!

Dropped from ES6:
 * Array comprehensions
 * Decorators
 * ...

note:

* People often purport to be discussing a spec when they're actually talking about a draft.

  </script></section>
  <section data-markdown><script type="text/template">

!["Bad ES6 2"](src/images/bad-es6-2.png) 

  </script></section>
  <section data-markdown><script type="text/template">
```js
class Speaker(name) { // Incorrect!
  this.name = name;

  speak(message) {
    return `${this.name}: ${message}`;
  }
}
```

```js
class Speaker {
  constructor(name) {
    this.name = name;
  }

  speak(message) {
      return `${this.name}: ${message}`;
  }
}
```

note:
* not how constructors work in the final spec!
  </script></section>
</section>

<section data-markdown><script type="text/template">
Time for some ES6+ !
--------------------

<!--
* New syntax for existing concepts (Classes)
* Standard library additions 
  * Standardization of existing concepts (Promises)
  * Useful new functions (new array methods)
* New translatable features (Generators/Iterators)
* New Backwards-incompatible features (WeakMaps)
* Modules
--> 
* New syntax 
* New features 
* Modules!

note:
 * Some additions standardize existing practices (Promises)
 * Some additions are minor additions to the standard library (new array functions)
 * Some additions can be translated easily to ES5 (Modules, Classes)
 * Some additions are not backwards compatible (WeakMaps)
 * Standardization of existing concepts (Promises)

  
</script></section>
<section>
  <section data-markdown><script type="text/template">
New syntax 
----------

It'll make you pretty... so pretty

note:

* rest operator
* arrow functions
* class
* spread operator
* string templates 

  </script></section>
  <section data-markdown><script type="text/template">

Rest operator, default values...

```js
function format(precision = 2, ...values) {
  for (const v of values) {
    console.log(v.toFixed(precision))
  }
}
```

```js
function format(precision) {
  var i;
  if (precision === undefined) {
    precision = 2;
  }
  for (i = 1; i < arguments.length; i++){
    console.log(arguments[i].toFixed(precision));
  }
}

// format(3, 1.1111, 2.2222) -> 1.111, 2.222
```

note:

 * No more arguments!!!

  </script></section>
  <section data-markdown><script type="text/template">

destructuring, string templates...

```js
function printValues(values, { p='[', delim=',', s=']' } = {}) {
  console.log(`my list: ${p} ${values.join(delim)} ${s}`)
}
```

```js
function printValues(values, options) {
  options || (options = {});
  var delim = options.delim === undefined ? ',' : options.delim;
  var p = options.p === undefined ? '[' : options.p;
  var s = options.s === undefined ? ']' : options.s;

  console.log('my list: '+p+' '+values.join(delim)+' '+s);
}

// printValues([2,3,5], {delim: '-'}) 
//    -> my list: [ 2-3-5 ]
```

  </script></section>
  <section data-markdown><script type="text/template">

Classes

```js
class Employee extends Person {
  constructor(name, title) {
    super(name);
    this.title = title;
  }
  greet() {
    return `Hello ${this.title} ${this.name}`
  }
}
```

```js
function Employee(name, title) {
    Person.call(this, name);
    this.title = title;
}
Employee.prototype = Object.create(Person.prototype);
Employee.prototype.greet = function () {
  return 'Hello ' + this.title + ' ' + this.name;
};
```

  </script></section>

</section>
<section>
  <section data-markdown><script type="text/template">

New Features
------------

Will make you smart
  </script></section>
  <section data-markdown><script type="text/template">
Regular 'ol callbacks be like...

```js
var MongoClient = require('mongodb').MongoClient;
MongoClient.connect('mongodb://localhost/test', function(err, db) {

  var collection = db.collection('test');

  // Insert some test documents
  collection.insertMany([{a:1}, {b:2}, {c:3}], {w:1}, function(err, res) {

    collection.findAndRemove({b:2}, [['b', 2]], function(err, doc) {
      console.log(doc.value.b); // 2

      // Verify that the document is gone
      collection.findOne({b:2}, function(err, item) {
        console.log(item); // null

        db.close();
      });
    });
  });
});
```

  </script></section>
  <section data-markdown><script type="text/template">
Promises!

```js
var MongoClient = require('mongodb').MongoClient;
MongoClient.connect('mongodb://localhost/test').then(function(db) {

  var collection = db.collection('test');

  // Insert some test documents
  return collection.insertMany([{a:1}, {b:2}, {c:3}], {w:1})
    .then(function(result) {
      return collection.findAndRemove({b:2}, [['b', 2]])
    })
    .then(function(doc) {
      console.log(doc.value.b); // 2

      // Verify that the document is gone
      return collection.findOne({b:2})
    })
    .then(function(item) {
      console.log(item); // null

      return db.close();
    });
});

```

note:

* MongoClient is using promises (could be a shim).
* Above runs fine in ES5, but now Promises are native
* Should be using promises now!

  </script></section>
  <section data-markdown><script type="text/template">
Promises + Generators + "co" module

```js
var MongoClient = require('mongodb').MongoClient;
var co = require('co');

co(function*() {
  var db = yield MongoClient.connect('mongodb://localhost/test');
  var collection = db.collection('test');
  
  // Insert some test documents
  yield collection.insertMany([{a:1}, {b:2}, {c:3}], {w:1});

  var doc = yield collection.findAndRemove({b:2}, [['b', 2]]);
  console.log(doc.value.b); // 2

  // Verify that the document is gone
  var item = yield collection.findOne({b:2});

  console.log(item); // null
  db.close();
});
```

note:

* `function*` indicates that it returns a generator object. 
* generators are snippets of code the can be paused and resumed
* `co` is a trivial library that takes a gen obj and keeps running it
* Haven't discussed error handling. As easy as throw-catch
* ES2017 has a draft for async/await keywords, eliminating need for "co" module (already in node)

  </script></section>
</section>
<section>
  <section data-markdown><script type="text/template">
Modules 
------- 

So sexy, too sexy 

!["mango"](src/images/mango.gif)

  </script></section>
  <section data-markdown><script type="text/template">
Why so sexy?? 
------------- 

* Any project consisting of more than one function needs more than one file
* Need glue!
* ES5 has no prescribed module loader
* Global variables **suck**

  </script></section>
  <section data-markdown><script type="text/template">
Old and busted...
-----------------

* index.html `<script>` overload
* Makefile/Gulpfile/Rakefile/Jakefile concatenation
* AMD + r.js
* CJS (CommonJS) + browserify or webpack

```js
// CommonJS: square.js:
module.exports = {
  square: function(x) {
    return x * x;
  }
};
```
```js
// app.js:
var square = require('./square.js').square;
console.log(square(2));
```

note:

* Last two NOT busted
* CommonJS worked well. Designed for synchronous loading. Popularized by nodeJS
* Asynchronous Module Definition (AMD): Designed for asynchronous loading. Complex.

  </script></section>
  <section data-markdown><script type="text/template">
New hotness!
------------ 

```js
// square.js
export default function square(x) {
  if (x < 0) {
    throw new SquareError(`No negative values plz`)
  }
  return x * x;
}
export class SquareError extends Error {
  constructor(...args) {
    super(...args)
  }
}
```
```js
// app.js:
import doTheSquare from './square.js' // Default import
import { SquareError } from './square.js' // Named import
console.log(doTheSquare(2));
```

note: 

* I can rename the default export easily in my app!

  </script></section>
  <section data-markdown><script type="text/template">
ES6 import syntax
-----------------

* Support default and named exports
* Very compact
* Supports static analysis
* Standardized!

**Not** allowed:

```js
if (true) {
  import func from 'someModule'
}
```

  </script></section>
  <section data-markdown><script type="text/template">
Static analysis
---------------

Packagers, optimizers, IDEs, linters can all easily trace, follow and partly understand your code without having to _run_ it.

ECMA standardization provides a strong, consistent reference for these tools.

Better tools = better code

  </script></section>
  <section data-markdown><script type="text/template">
ES6 Dynamic loading
-------------------

Bonus: Dynamic loading is still supported via

```js
System.import('someModule')
  .then(function(someModule) {
      // Use someModule
  })
  .catch(function(err) {
      // Failed
  }
```

note: not as interesting as the static usage, IMO
  </script></section>

</section>
<section>
  <section data-markdown><script type="text/template">
Using ES6+ 
----------

There is no complete browser implementation of ES6!

note:

* NodeJS is close, but no module loader
  </script></section>
  <section data-markdown><script type="text/template">

Transpiling with BabelJS
-------------------------

<img src="src/images/babel.png" style="height: 45px; width: auto; vertical-align: middle;"> Converts JavaScript to JavaScript

!["b1"](src/images/babel1.png)
!["b2"](src/images/babel2.png)
!["b3"](src/images/babel3.png)

note:

* Alernative: Traceur. Babel is READABLE!
* We still need a module loader! Will only convert to CJS, AMD, SystemJS..
* Transpiling is not new to JS. See Coffeescript.
* Babel 6 does _nothing_ by default. Need plugins. Use this.
* Babel 5 converts to an ES6 draft. Configured differently. Beware!
  </script></section>
  <section data-markdown><script type="text/template">

JSPM + SystemJS
---------------

* Use JSPM to get started quickly. - Babel (old v5) is built in.
* Ignore JSPM's package management features
* SystemJS is also included automatically.

note:

* JSPM is also a super-duper package manager, but is exceptionally complicated and under heavy development.
* JSPM's configuration of Babel is rigid (unfortunately) and based on an old version. But it works.
  </script></section>
  <section data-markdown><script type="text/template">

Lets make an app!
-----------------

```bash
mkdir greener && cd greener
npm init -y
npm install --save-dev jspm@beta
./node_modules/.bin/jspm init -y
```

note: 

* this could also be a new part of an existing app 

  </script></section>
  <section data-markdown><script type="text/template">

```js
// run.js
import greener from 'greener'
greener.run()
```

```js
// src/greener.js
import changeBackground from './changeBackground.js'
export default { run }
function run() {
  changeBackground('#006000')
}
```

```js
// src/changeBackground.js
import { $ } from './lib.js'

export default function changeBackground(colour) {
  $('body').css('background-color', colour)
}
```

```js
// src/lib.js
export const $ = window.$
```

note:

* JSPM maps greener to src/ and greener.js as default file
* If we're migrating, we're going to leave all the global variables as-is
  without worrying about wiring them into JSPM. Just put them in a separate file.
  </script></section>
  <section data-markdown><script type="text/template">

<p>dev.html:</p>

<pre><code language="html">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
  &lt;head&gt;
    &lt;meta charset="utf-8" /&gt;
    &lt;script src="jspm_packages/system.js"&gt;&lt;/script&gt;
    &lt;script src="jspm.config.js"&gt;&lt;/script&gt;
  &lt;/head&gt;
  &lt;body&gt;
    &lt;script&gt;
      SystemJS.import('run.js');
    &lt;/script&gt;
    &lt;script src="http://code.jquery.com/jquery-3.1.1.js"&gt;&lt;/script&gt;
  &lt;/body&gt;
&lt;/html&gt;    
</code></pre>

  </script></section>
  <section data-markdown><script type="text/template">

Fire up a webserver with the project as the root `/` directory. 

```
python -m SimpleHTTPServer
```

Browse to `http://localhost:8000/dev.html` everything is built on the fly!

  </script></section>
  <section data-markdown data-background="#006000"><script type="text/template">

Voila!

  </script></section>
  <section data-markdown><script type="text/template">

Add new features to the application. When ready, create a distributable bundle:

```sh 
./node_modules/.bin/jspm build 'src/greener.js' 'greener-dist.js' \
  --format global --global-name greener
```

  </script></section>
  <section data-markdown><script type="text/template">

It runs by itself!

<pre><code language="html">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
  &lt;head&gt;
    &lt;meta charset="utf-8" /&gt;
  &lt;/head&gt;
  &lt;body&gt;
    &lt;script src="http://code.jquery.com/jquery-3.1.1.js"&gt;&lt;/script&gt;
    &lt;script src="greener-dist.js"&gt;&lt;/script&gt;
    &lt;script&gt;
      greener.default.run();
    &lt;/script&gt;
  &lt;/body&gt;
&lt;/html&gt;    
</code></pre>

note: 

 * Not sure why JSPM created extra wrapping "greener.default.run()"

  </script></section>
  <section data-markdown><script type="text/template">

```js
(function (exports) {
'use strict';

var $ = window.$;

function changeBackground(colour) {
  $('body').css('background-color', colour);
}

var talkGreener = { run: run };

function run() {
  changeBackground('#006000');
}

exports['default'] = talkGreener;

}((this.greener = this.greener || {})));

//# sourceMappingURL=greener-dist.js.map
```

note:
* Can install jquery via JSPM and create bundles including or excluding it
* Can also create "bundles" so that the app can be used as a library from a single optimized file
  </script></section>

  <section data-markdown><script type="text/template">

Moving forward
--------------

* Start small: Keep using your old code 
* Add support for transpiled ES6 but stick to ES5
* Build new features using ES6 modules for "wiring"
* Slowly introduce new ES6+ syntax that you are comfortable with, verify the ES5 output
* Expand ES6+ usage

</script></section>

  <section data-markdown><script type="text/template">

The future
--------------

* Migrate to JSPM for managing packages, dependencies and components
* Create native ES6+ rich distributions (non-transpiled) for supporting browsers (very close with NodeJS!)

</script></section>

  <section data-markdown><script type="text/template">

Babel use dependencies
----------------------

* Some uses of Babel require a polyfill and/or runtime (eg, Promises)

note:

* Babel runtime (regenerator function to support generator functions)
* Core-js polyfill: emulates ES2015 functions
* Intended for use by applications, not components
* transform-runtime babel plugin avoids modifying globals (can't use Array.prototype.includes)


  </script></section>
  <section data-markdown><script type="text/template">

NodeJS
------

* Latest version supports most ES6+ features but _not_ modules 
* Can use Babel to transform ES6 to CJS format. 
* `iojs` was a brief fork that is now merged again


  </script></section>
  <section data-markdown><script type="text/template">

```js
function sum(...values) {
  return values.reduce((result = 0, val) => result += val)
}
```

Becomes:

```js
function sum() {
  for (var _len = arguments.length, values = Array(_len), _key = 0; _key < _len; _key++) {
    values[_key] = arguments[_key];
  }

  return values.reduce(function () {
    var result = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 0;
    var val = arguments[1];
    return result += val;
  });
}
```

note:

 * Don't use bindAll to "fix" class methods

  </script></section>
  <section data-markdown><script type="text/template">

_Philosophical pause on the general topic of transpiling..._

Very useful, powerful and appropriate when it is:

* Understood (both input + output)
* Standards-based 
* Future-forward 


note:

* Like a bridge: know where you're coming from and where you're going
* In general, I think you should stick close to the actual language as it is designed
* Transpiling _can_ take you away from what your code is actually doing, which is bad. It shouldn't 
  feel like coding with mittens.
* "legacy" JavaScript often requires complex patterns and work-arounds in real applications 
  even for simple things. That complexity makes it hard for machines (for optimization)
  and humans (for debugging) to understand
* it's important for JS to EVOLVE. This is the way to do it.
  </script></section>
  
</section>
<section data-markdown><script type="text/template">

Action toolkit
--------------

* Read: http://exploringjs.com/es6/
* Reference: http://speakingjs.com/es5/
* Verify: http://kangax.github.io/compat-table/
* Migrate: https://leanpub.com/setting-up-es6/
* Lint: http://eslint.org/
* Be stylish: https://github.com/airbnb/javascript
* Transpile: https://babeljs.io/
* Package: http://jspm.io/ 

<div class="fragment">
<img src="src/images/mchammer.gif" style="vertical-align: middle;"> Thanks for listening! <img src="src/images/mchammer.gif" style="vertical-align: middle;">
</div>
</script></section>

<!-- <dl>
  <dt>1997</dt>
  <dd></dd>
  <dt>1999</dt>
  <dd></dd>
</dl> -->


