$('body').append("<div id='modal' class='modal fade address' aria-labelledby='myModalLabel' aria-hidden='true'></div>") if $('#modal').length is 0
$('#modal').html("<%= j render 'addresses/form_modal', address: @address %>")
$('#modal').modal('show')
