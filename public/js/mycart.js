"use strict";

const changesRegistered= {};
const ELT_table= document.getElementsByTagName('table')[0];
ELT_table.addEventListener("click", e=>{
    if(e.target.classList.contains('addQuantity')){
        e.preventDefault();
        
        const line= e.target.dataset.line;
        changesRegistered['l'+line]= false;

        const ELT_quantity= document.getElementById('l'+line+'Quantity');
        let newQuantity= parseInt(ELT_quantity.textContent) + 1;
        if(newQuantity > 9) newQuantity= 9;
        if(newQuantity == e.target.dataset.quantity) changesRegistered['l'+line]= true;
        ELT_quantity.textContent= newQuantity;

        updateInput(line, newQuantity);
        updateButton();
        updatePrice();
    }
    else if(e.target.classList.contains('removeQuantity')){
        e.preventDefault();

        const line= e.target.dataset.line;
        changesRegistered['l'+line]= false;

        const ELT_quantity= document.getElementById('l'+line+'Quantity');
        let newQuantity= parseInt(ELT_quantity.textContent) - 1;
        if(newQuantity < 1) newQuantity= 1;
        if(newQuantity == e.target.dataset.quantity) changesRegistered['l'+line]= true;
        ELT_quantity.textContent= newQuantity;

        updateInput(line, newQuantity);
        updateButton();
        updatePrice();
    }
});

function updatePrice(){
    const ELTS_quantity= document.getElementsByClassName('quantity');
    const ELTS_price= document.getElementsByClassName('price');
    let total= 0;
    for (let i = 0; i < ELTS_quantity.length; i++) {
        total+= ELTS_quantity[i].value * ELTS_price[i].textContent;
    }
    total= Math.round(total * 100) / 100;
    const tva= Math.round((1 / 6 * total) * 100) / 100;
    const ht= Math.round((total - tva) * 100) / 100;
    document.getElementById('priceHT').textContent= ht;
    document.getElementById('totalTVA').textContent= tva;
    document.getElementById('priceTotal').textContent= total;
}

function updateInput(line, quantity){
    const ELT_input= document.getElementById('input_l'+line);
    ELT_input.value= quantity;
}

function updateButton(){
    const ELT_saveCart= document.getElementById('saveCart');
    let changesWaiting= false;

    for (const key in changesRegistered) {
        if(changesRegistered[key] == false){ 
            changesWaiting= true;
            break;
        }
    }
    if(changesWaiting){
        ELT_saveCart.className= '';
    }
    else ELT_saveCart.className= 'hidden';
}