// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import '../stylesheets/application'
import 'materialize-css/dist/js/materialize'

document.addEventListener('turbolinks:load', function() {
  M.AutoInit();

  if ($('.autocomplete').length > 0) {
    const elem = document.querySelector('.autocomplete');
    const instance = M.Autocomplete.init(elem);
    $('.autocomplete').on('input', function(){
      $.ajax({
        url: '/contents/search.json',
        type: 'GET',
        data: {name: $('.autocomplete').val()},
        dataType: 'json'
      }).done(function(response) {
        var contents1 = {};
        var contents2 = {};
        for (var i = 0; i < response.length; i++) {
          contents1[response[i].name_jpn] = null;
          contents2[response[i].name_jpn] = {
            'id': response[i].id,
            'name': response[i].name,
            'name_jpn': response[i].name_jpn,
          };
        }
        instance.updateData(contents1);
      }).fail(function(jqXHR, textStatus, errorThrown) {
        console.log('fail');
      });
    });
  }

  if ($('.datepicker').length > 0) {
    var elems = document.querySelectorAll('.datepicker');
    var instances = M.Datepicker.init(elems, {
      autoClose: true,
      format: 'yyyy/mm/dd'
    });
  }
});

document.addEventListener("turbolinks:before-cache", function () {
  $('.sidenav').sidenav('destroy');
  $('.dropdown-trigger').dropdown('destroy');
  $('.modal').modal('destroy');
});