App.notification = App.cable.subscriptions.create "NotificationChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    request_notification()

$(document).on 'turbolinks:load', ->
  request_notification()

$(document).on 'ready', ->
  $('#notify').on 'click', ->
    $.ajax '/notifications/update',
    type: 'PUT'
    dataType: 'JSON'
    success: () ->
      $('#notify-count').text(0)

request_notification = () ->
  $.ajax '/notifications',
  type: 'GET',
  dataType: 'JSON',
  success:(data) ->
    notifications = $.map data.notifications, (notify) ->
      if notify.readed is true
        "<li class='notify'>
          <a href=#{notify.url} id=#{notify.id}>
            #{notify.content} #{notify.time}
          </a>
        </li>"
      else
        "<li class='unread'>
          <a href=#{notify.url} id=#{notify.id}>
            #{notify.content} #{notify.time}
          </a>
        </li>"
    $('#notify-count').text(data.unread)
    $('#notify-list').html(notifications)
