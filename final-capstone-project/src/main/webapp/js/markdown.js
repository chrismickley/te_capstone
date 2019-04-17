
window.addEventListener('DOMContentLoaded', (event) => {
//    console.log('DOM fully loaded and paaaaaaaaarsed');
    const converter = new showdown.Converter({
    	backslashEscapesHTMLTags: true
    });
    converter.setFlavor("github"); 
    const tabledata = document.querySelectorAll(".tabledata2");
    console.table(tabledata);
    tabledata.forEach(codeSnippet => {
    codeSnippet.innerHTML = converter.makeHtml(codeSnippet.innerText)
      
 }
 )
});
 






















// window.addEventListener('DOMContentLoaded', (event) => {
// console.log('DOM fully loaded and paaaaaaaaarsed');
//
// function displaywhatever() {
// const ul = document.querySelector('.landing ul');
// // const converter = new showdown.Converter();
// const li = document.createElement ('li');
// li.setAttribute('class', 'whatevertest');
// li.innerText = "anyString";
// ul.appendChild(li)
// // li.innerHTML = converter.makeHtml( x.currentTarget.value);
// // });
// }
// });
