// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

$(document).ready(function() {

    $('select#question_attribute_type').on('change', function() {
        var type = $('select#question_attribute_type option:selected').val();
        if (type == 'name') {
            $('.question_names').show();
            $('.question_hair_types').hide();
            $('.question_hair_colors').hide();
            $('.question_glasses').hide();
            $('.question_hats').hide();
            $('.question_eye_colors').hide();
            $('.question_facial_hairs').hide();
            $('.question_genders').hide();
        }
        else if (type == 'hair_type') {
            $('.question_names').hide();
            $('.question_hair_types').show();
            $('.question_hair_colors').hide();
            $('.question_glasses').hide();
            $('.question_hats').hide();
            $('.question_eye_colors').hide();
            $('.question_facial_hairs').hide();
            $('.question_genders').hide();
        }
        else if (type == 'hair_color') {
            $('.question_names').hide();
            $('.question_hair_types').hide();
            $('.question_hair_colors').show();
            $('.question_glasses').hide();
            $('.question_hats').hide();
            $('.question_eye_colors').hide();
            $('.question_facial_hairs').hide();
            $('.question_genders').hide();
        }
        else if (type == 'glasses') {
            $('.question_names').hide();
            $('.question_hair_types').hide();
            $('.question_hair_colors').hide();
            $('.question_glasses').show();
            $('.question_hats').hide();
            $('.question_eye_colors').hide();
            $('.question_facial_hairs').hide();
            $('.question_genders').hide();
        }
        else if (type == 'hat') {
            $('.question_names').hide();
            $('.question_hair_types').hide();
            $('.question_hair_colors').hide();
            $('.question_glasses').hide();
            $('.question_hats').show();
            $('.question_eye_colors').hide();
            $('.question_facial_hairs').hide();
            $('.question_genders').hide();
        }
        else if (type == 'eye_color') {
            $('.question_names').hide();
            $('.question_hair_types').hide();
            $('.question_hair_colors').hide();
            $('.question_glasses').hide();
            $('.question_hats').hide();
            $('.question_eye_colors').show();
            $('.question_facial_hairs').hide();
            $('.question_genders').hide();
        }
        else if (type == 'facial_hair') {
            $('.question_names').hide();
            $('.question_hair_types').hide();
            $('.question_hair_colors').hide();
            $('.question_glasses').hide();
            $('.question_hats').hide();
            $('.question_eye_colors').hide();
            $('.question_facial_hairs').show();
            $('.question_genders').hide();
        }
        else if (type == 'gender') {
            $('.question_names').hide();
            $('.question_hair_types').hide();
            $('.question_hair_colors').hide();
            $('.question_glasses').hide();
            $('.question_hats').hide();
            $('.question_eye_colors').hide();
            $('.question_facial_hairs').hide();
            $('.question_genders').show();
        }
    });

    $('input.celeb-toggle').on('change', function() {
        var is_checked = $('input.celeb-toggle').prop('checked');
        var cartoon_cards = $('div.card img.cartoon')
        
        console.log(cartoon_cards[1])

        if (is_checked) {
            for (let i = 0; i < cartoon_cards.length; i++) {
                cartoon_cards[i].className += " hide";
            }
        } else if (!is_checked) {
            for (let i = 0; i < cartoon_cards.length; i++) {
                cartoon_cards[i].className = "cartoon";
            }
        }
    });
});