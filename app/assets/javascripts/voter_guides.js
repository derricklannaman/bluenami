$(document).on('turbolinks:load', function(){
  $('.content-title').hover(selectIndication, deselectIndication);
})

function selectIndication() {
  $(this).addClass('content-title-highlighter');
}

function deselectIndication() {
  $(this).removeClass('content-title-highlighter');
}
