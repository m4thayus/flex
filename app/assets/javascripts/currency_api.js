
document.addEventListener('DOMContentLoaded', apiFetch())

function apiFetch(){
  fetch("https://api.coindesk.com/v1/bpi/currentprice/XBT.json")
    .then(response => response.json())
    .then(jsonData => currencyObj(jsonData)) 
}


function currencyObj(jsonData){
  console.log(jsonData)
}
