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
    }
});
function updateInput(line, quantity){
    const ELT_input= document.getElementById('input_l'+line);
    ELT_input.value= quantity;
}
function updateButton(){
    let changesWaiting= false;
    for (const key in changesRegistered) {
        if(changesRegistered[key] == false){ 
            changesWaiting= true;
            break;
        }
    }
    if(changesWaiting){
        console.log('some updates need to be saved');
    }
    else console.log('up to date');
}