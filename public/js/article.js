"use strict";

const Elt_inpQuantity= document.getElementById('quantity');
const Elt_price= document.getElementById('price');

Elt_inpQuantity.addEventListener('change', e=>{
    console.log(e.target.dataset.price);
    Elt_price.textContent= Math.round(e.target.value*e.target.dataset.price*100)/100;
});