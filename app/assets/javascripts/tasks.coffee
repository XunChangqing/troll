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
    #console.log $("div#carousel-content .active img").attr('task_id')
    tid = $("div#carousel-content .active img").attr('task_id')
    jQuery.post("/tasks/submit_task", task: (task_id: tid, result: '1') , ((data, textStatus, jqXHR) ->
      #console.log data
      #console.log data.url
      #console.log data.id
      $("div#carousel-content").append "<div class='item'><img alt= 'cannot access' src= #{data.url} task_id= #{data.id}></div>"
    ), 'json')
    #console.log yes
    $('.carousel').carousel 'next'
    #src = "http://y1.ifengimg.com/a/2015_20/876db9ede4ee79a_size27_w258_h258.jpg"
    #task_id = 1
  )
#$('#myCarousel').on 'slide.bs.carousel', ->
#$('#myCarousel').on 'slid.bs.carousel', ->
