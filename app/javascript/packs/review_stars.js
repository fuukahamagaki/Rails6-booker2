const stars = document.querySelector(".ratings").children;
const ratingValue = document.querySelector("#rating_value");
const ratingValueDisplay = document.querySelector("#rating-value-display");


let index;

for(let i=0; i < stars.length; i++){
  stars[i].addEventListener("mouseover", () => {
  for(let j=0; j<stars.length; j++){
  stars[j].classList.remove("fa-star")
  stars[j].classList.add("fa-star-o")
  }
  for(let j=0; j<=i; j++){
    stars[j].classList.remove("fa-star-o");
    stars[j].classList.add("fa-star");
  }
  })

  stars[i].addEventListener("click", () => {
    ratingValue.value = i+1;
    ratingValueDisplay.textContent = ratingValue.value;

    index = i;
  })

  stars[i].addEventListener("mouseout", () => {
    for(let j=0; j<stars.length; j++){
      stars[i].classList.remove("fa-star");
      stars[i].classList.add("fa-star-o");
    }
    for(let j=0; j <=index; j++){
      stars[j].classList.remove("fa-star-o");
      stars[j].classList.add("fa-star");
    }
  })
}