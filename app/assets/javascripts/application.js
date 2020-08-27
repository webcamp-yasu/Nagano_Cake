// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require jquery.jposta
//= require_tree .

// 新規登録住所検索機能
$(function(){
  $(document).on('turbolinks:load', () => {
    $('#customer_postal_code').jpostal({
      postcode: [
        '#customer_postal_code'
      ],
      address: {
        "#customer_address": "%3%4%5%6%7"
      }
    });
  });
});

// 配送先住所検索機能
$(function(){
  $(document).on('turbolinks:load', () => {
    $('#address_postal_code').jpostal({
      postcode: [
        '#address_postal_code'
      ],
      address: {
        "#address_address": "%3%4%5%6%7"
      }
    });
  });
});

// 注文情報入力住所検索機能
$(function(){
  $(document).on('turbolinks:load', () => {
    $('#order_new_postal_code').jpostal({
      postcode: [
        '#order_new_postal_code'
      ],
      address: {
        "#order_new_address": "%3%4%5%6%7"
      }
    });
  });
});