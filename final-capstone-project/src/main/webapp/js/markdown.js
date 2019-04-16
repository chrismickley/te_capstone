window.addEventListener('DOMContentLoaded', (event) => {
    console.log('DOM fully loaded and paaaaaaaaarsed');
    const converter = new showdown.Converter();
    converter.setFlavor("github"); // This is a showdown flavor
    const tabledata = document.querySelector("#tabledata2");
// tabledata.forEach(codeSnippet => {
      tabledata.innerHTML = converter.makeHtml(tabledata.innerHTML)
 }
 )





















//window.addEventListener('DOMContentLoaded', (event) => {
//    console.log('DOM fully loaded and paaaaaaaaarsed');
//
//function displaywhatever() {
//const ul = document.querySelector('.landing ul');
//// const converter = new showdown.Converter();
//const li = document.createElement ('li');
//li.setAttribute('class', 'whatevertest');
//li.innerText = "anyString";
//ul.appendChild(li)
//// li.innerHTML = converter.makeHtml( x.currentTarget.value);
//// });
//}
//});
