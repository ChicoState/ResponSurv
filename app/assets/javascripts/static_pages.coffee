# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

(($) ->
) jQuery

ready = -> 
  switch $('#page_type').data('type')
    when 'pictures' then pictures()
    when 'finder' then finder()
    when 'followup' then followup()
    when 'welcome' then welcome()
    else null

welcome = ->
  add_next_button()

followup = ->
  #add_next_button()
  toggle_next_button()

  if $('#question_timer').data('timer') != null
    document.getElementById('h3').style.visibility = 'hidden'
    document.getElementById('radio-wrapper').style.visibility = 'hidden'
    $('#timer').pietimer {
      seconds: $('#question_timer').data('timer'),
      color: 'rgba(200, 200, 200, 0)'
    }, ->
      document.getElementById('h3').style.visibility = 'visible'
      document.getElementById('radio-wrapper').style.visibility = 'visible'
      return
    $('#timer').pietimer 'start' 

  $(document).on "change", ".radio", ->
    toggle_next_button()
    
pictures = ->
  start_of_selections()

  if !$('#finder_options').data('noneenabled')
    remove_none_button()
  else
    add_none_button()

  add_next_button()
  toggle_next_button()

  ###   start pietime   ###
  if $('#finder_options').data('timed')
    $('#timer').pietimer {
      seconds: 20,
      color: 'rgba(200, 200, 200, 0.8)'
    },done
    $('#timer').pietimer('start')

  ###   make a selection   ###

  $(document).on "change", ".imgcheck", ->
    event.preventDefault()
    id = $(this).attr('id')
    row = id.charAt(0)
    col = id.charAt(1)

    if $('#finder_options').data('multiplechoice')
      multiple_choice(row, col)
    else
      single_choice(this)

    if @checked
      $(this).parents('.thumbnail').css( "border-color", "#f00")
    else
      $(this).parents('.thumbnail').css( "border-color", "#ddd")

    toggle_next_button()

finder = ->
  add_next_button()

#remove the none button
remove_none_button = -> 
  $('#none').remove()
  return

#enables next button if a selection is made
toggle_next_button = ->
  if $(':checked').length == 0
    $('#next_button').prop('disabled', true)
  else
    $('#next_button').prop('disabled', false)

#Adds click attribute to next button
add_next_button = ->
  $('#next_button').click (event) ->
    event.preventDefault()
    done()
    return

#Adds click attributes to none button
add_none_button = ->
  $('#none_button').click (event) ->
    event.preventDefault()
    none()
    return

#Single choice
single_choice = (selected) ->
  $(':checked').each ->
    if !($(selected).attr('id') == $(this).attr('id'))
      $(this).prop("checked", false)
    if @checked
      $(this).parents('.thumbnail').css( "border-color", "#f00")
    else
      $(this).parents('.thumbnail').css( "border-color", "#ddd")
    return


#Multiple choice
multiple_choice = (row, col) ->
  if @checked
    $(this).parents('.thumbnail').css( "border-color", "#f00")
  else
    $(this).parents('.thumbnail').css( "border-color", "#ddd")
  select(row,col)

#Make a selection
select = (row, col) ->
  time = new Date().toISOString().slice(0, 23).replace('T', ' ')
  $.ajax
    url: "/SelectionCreate/?row="+row+"&column="+col+"&local_time="+time
    type: "post"
    success: ->
      console.log 'success'
      return
    error: ->
      console.log 'error'
      return

#Unselects all currently selected images
none = ->
  $(':checked').each ->
    id = $(this).attr('id')
    row = id.charAt(0)
    col = id.charAt(1)
    select(row,col)
    $(this).prop("checked", false)
    if @checked
      $(this).parents('.thumbnail').css( "border-color", "#f00")
    else
      $(this).parents('.thumbnail').css( "border-color", "#ddd")


#Request to go to next question
done = ->
  if !($('#finder_options').data('multiplechoice'))
    $(':checked').each ->
      id = $(this).attr('id')
      row = id.charAt(0)
      col = id.charAt(1)
      select(row,col)

  if $('#page_type').data('type') == 'pictures'
    end_of_selections()

  $.ajax
    url: "/NextQuestion"
    type: "post"
    success: ->
      console.log 'success'
      return
    error: ->
      console.log 'error'
      return
  return

start_of_selections = ->
  time = new Date().toISOString().slice(0, 23).replace('T', ' ')
  $.ajax
    url: "/SelectionStart/?local_time="+time
    type: "post"
    success: ->
      console.log 'success'
      return
    error: ->
      console.log 'error'
      return
  return

end_of_selections = ->
  time = new Date().toISOString().slice(0, 23).replace('T', ' ')
  $.ajax
    url: "/SelectionEnd/?local_time="+time
    type: "post"
    success: ->
      console.log 'success'
      return
    error: ->
      console.log 'error'
      return
  return


$(document).ready ready
$(document).on 'page:load', ready
