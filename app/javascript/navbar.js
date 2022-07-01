//Navbar Code 
document.addEventListener("DOMContentLoaded", function(event) {  
  const menuOpen = document.querySelector('.btn-open')
  const navbar = document.querySelector(".navbar");
  const menuClose = document.querySelector(".btn-close");
  const body = document.querySelector('body');

  menuOpen.addEventListener('click', ()=> {
    navbar.style.display = "flex";
    body.classList.add('blur');
  })

  menuClose.addEventListener('click', ()=> {
    navbar.style.display = "none";
    body.classList.remove('blur');
  })
});







