window.addEventListener('DOMContentLoaded', (event) => {
    console.log('DOM fully loaded and paaaaaaaaarsed');
    const converter = new showdown.Converter();
    converter.setFlavor("github"); // This is a showdown flavor
    const tabledata = document.querySelectorAll(".tabledata2");
    console.table(tabledata);
    tabledata.forEach(codeSnippet => {
    codeSnippet.innerHTML = converter.makeHtml(codeSnippet.innerHTML)
      
 }
 )
});
 
// window.addEventListener('DOMContentLoaded', (event) => {
// console.log('DOM fully loaded and paaaaaaaaarsed');
// function displaySnippets() {
// const snippets = [];
// const converter = new showdown.Converter();
// const tabledata = document.querySelector("#tabledata2");
// snippets.forEach(codeSnippet => {
// tabledata.innerHTML = converter.makeHtml(tabledata.innerHTML)
// }
// )
// }
// });





















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
