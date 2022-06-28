//Navbar Code 

const menuOpen = document.querySelector('.btn-open')
const navbar = document.querySelector(".navbar");
const menuClose = document.querySelector(".btn-close");

menuOpen.addEventListener('click', ()=> {
  navbar.style.display = "flex";
})

menuClose.addEventListener('click', ()=> {
  navbar.style.display = "none";
})

// menuItems.forEach((element) => {
//   element.addEventListener('click', collapseMenu);
// });
