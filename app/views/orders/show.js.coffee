$('body').append("<div id=\"modal\" class='modal fade cart' aria-labelledby='myModalLabel' aria-hidden='true'></div>") if $('#modal').length is 0
$('#modal').html("<%= j render 'orders/show', order: @order %>")
$('#modal').modal('show')
