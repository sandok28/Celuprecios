$("#results").html(" <h1>Resultados para \"<%= @busqueda %>\" </h1> \
					<%= j render @phones %> <hr class= 'liena'>\
					")
$("#principal").hide()