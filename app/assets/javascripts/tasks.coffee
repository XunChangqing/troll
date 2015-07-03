# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#$(document).on "page:change", ->
  #$('.carousel').carousel 'next'

#$(document).on "page:change", ->
  #$("#new_comment").on("ajax:success", (e, data, status, xhr) ->
    ##$("#comments_list").append xhr.responseText
    ##console.log data.id
    #$("#comments_list").append "<tr><td>#{data.user_name}:::#{data.content}</td><tr>"
    #$("#comment_content").val('')
  #).on("ajax:error", (e, xhr, status, error) ->
    ##$("#new_comment").append xhr.responseText
    #alert(error)
  #)
#$(document).on "page:change", ->
  #$("#normal-btn").on('ajax:before', ->
    #alert "beform ajax"
  #).on("ajax:success", (e, data, status, xhr) ->
    ##$("#comments_list").append xhr.responseText
    ##console.log data.id
    #$("#comments_list").append "<tr><td>#{data.user_name}:::#{data.content}</td><tr>"
    #$("#comment_content").val('')
  #).on("ajax:error", (e, xhr, status, error) ->
    ##$("#new_comment").append xhr.responseText
    #alert(error)
  #)
$(document).on "page:change", ->
  $("#normal-pic-btn").on('click', ->
    jQuery.post("/tasks/submit_task", task: (id: '1', result: '2', nasd: "sdf"), (data) ->
      alert 'post yes'
    )
    $('.carousel').carousel 'next'
  )
#$('#myCarousel').on 'slide.bs.carousel', ->
#$('#myCarousel').on 'slid.bs.carousel', ->
