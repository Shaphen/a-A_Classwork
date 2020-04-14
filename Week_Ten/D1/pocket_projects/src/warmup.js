
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
  const str = document.createElement("p");
  const text = document.createTextNode(string); 
  str.appendChild(text);
  // debugger
  if (htmlElement.hasChildNodes()){
    let arr = Array.from(htmlElement.children);
    arr.forEach(child =>{
      htmlElement.removeChild(child);
    });
  }
  htmlElement.appendChild(str);
};

htmlGenerator('Party Time.', partyHeader);