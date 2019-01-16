$(document).on('turbolinks:load', function(){
  $("#listing_property_type").change(function(){
    $.ajax({
      method: "GET",
      url: "/listings/property_types",
      data: { property_type: this.value },
      dataType: "json",
      success: function(data) {
        $("#listing_property_subtype").children().remove();
        data.forEach(function(el) { 
          $("#listing_property_subtype").append(`<option value='${el}'>${el}</option>`)
        })
      },
      error: function(error) {
        console.log(error)
      }
    });
  });
})