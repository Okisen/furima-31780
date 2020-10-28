function item_price(){
  const itemPrice = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  itemPrice.addEventListener("input", () => {
    const inputTaxValue = itemPrice.value / 10;
    const inputProfitValue = itemPrice.value - inputTaxValue;
    addTaxPrice.innerHTML = Math.floor(inputTaxValue);
    profit.innerHTML = Math.floor(inputProfitValue);
  });
}
window.addEventListener("load",item_price);