window.addEventListener('load', () => {
  console.log("起動準備完了しました");
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom =document.getElementById("add-tax-price");
    const addProfit =document.getElementById("profit");
    addTaxDom.innerHTML =Math.floor(inputValue*0.1);
    addProfit.innerHTML =Math.ceil(inputValue*0.9);
 })
});