window.addEventListener('DOMContentLoaded', (event) => {
    console.log('DOM fully loaded and paaaaaaaaarsed');
// var d = new Date();
// document.getElementById("markdownOutput").innerHTML = d;});

const textArea = document.querySelector('#tabledata2');
const markdownOutput = document.querySelector("#markdownOutput");

const converter = new showdown.Converter();

converter.setFlavor("github"); // This is a showdown flavor
textArea.addEventListener("load", x => {
  markdownOutput.innerHTML = converter.makeHtml( x.currentTarget.value);
})});

/** 
the code below is awesome or something:
```java
for (int i = 0) {

}
```
**/
