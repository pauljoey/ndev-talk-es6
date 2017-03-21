import reveal from 'reveal.js'

import 'reveal.js/css/reveal.css!css'
import 'reveal.js/css/theme/serif.css!css'
import 'reveal.js/lib/css/zenburn.css!'

import 'reveal.js/plugin/notes/notes.js'
import 'reveal.js/plugin/highlight/highlight.js'
import hljs from 'hljs'

import markdown from 'reveal.js/plugin/markdown/markdown.js'

import indexPage from 'talk/templates/index.tpl!text'

import 'talk/less/main.less!less'

export default { 
  run: run 
}

function run() {
  // Look ma! No globals!
  inject()
  reveal.initialize({
    // Display a presentation progress bar
    progress: true,

    // Display the page number of the current slide
    slideNumber: false,

    // vertical centering
    center: false,

    // Push each slide change to the browser history
    history: true,

    markdown: {
      sanitize: false
    }
  }) 
  markdown.initialize();
  hljs.initHighlighting();

  // Append hljs class to code 
  //let codeBlocks = document.getElementsByTagName('code')
  //for (let block of codeBlocks) {
    //block.className += ' hljs'
  //}
  
}

function inject() {
  let root = document.getElementsByTagName('my-talk')[0]

  if (!root) {
    throw new Error('<my-talk> root not found')
  }

  let notes = `<script type="text/template" src="jspm_packages/npm/reveal.js@3.4.1/plugin/notes/notes.js"></script>`
  root.innerHTML = indexPage + notes

}
