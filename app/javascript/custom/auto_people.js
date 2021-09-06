document.addEventListener("turbolinks: load", function() {
  var options = {
    data: ["John", "Paul", "George", "Ringo"]
  };
  console.log("asin")
  $('*[data-behavior="autocomplete"]').easyAutocomplete(options);
});