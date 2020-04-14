
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator(){
  return Object.keys(dogs).map(key => {
    let a = document.createElement("a");
    a.innerHTML = key;
    a.href = dogs[key];
    let li = document.createElement("li");
    li.className = "dog-link";
    li.appendChild(a);
    return li;
  });
}

function attachDogLinks () { 
  let dogLinks = dogLinkCreator(); 
  // let ul = document.getElementsByClassName('drop-down-dog-list')[0]; 
  let ul = document.querySelector(".drop-down-dog-list");
  console.log(ul)
  return dogLinks.forEach((dog) => ul.appendChild(dog));
}

function handleEnter () { 
  let nav = document.querySelector(".drop-down-dog-nav"); 
  nav.addEventListener('mouseenter', (event) => {
    let ul = document.querySelector(".drop-down-dog-list"); 
    console.log(ul)
    ul.classList.toggle("drop-down-dog-list")
  })
}

function handleLeave () { 
  let nav = document.querySelector(".drop-down-dog-nav");
  nav.addEventListener('mouseleave', (event) => {
    console.log(nav.children);
    let ul = nav.children[1];
    console.log(ul);
    ul.classList.toggle("drop-down-dog-list");
  })
}

attachDogLinks(); 

handleEnter();
handleLeave();