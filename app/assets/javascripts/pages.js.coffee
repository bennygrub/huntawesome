# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('.unveil-btn-one.btn-outline.text-center').click ->
    $('.intro-one').hide()
    $('.unveil-one').show(500)

  $('.unveil-btn-two').click ->
    $('.unveil-one').hide()
    $('.unveil-two').show(500)
  
  $('.unveil-btn-three').click ->
    $('.unveil-two').hide()
    $('.unveil-three').show(500)


  $(window).resize ->
  $('.home-center').css
    position: 'relative'
    top: ($(window).height() - $('.home-center').outerHeight()) / 3
  
  $(window).resize()