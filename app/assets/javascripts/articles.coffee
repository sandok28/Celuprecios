# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	jQuery ->
		phones = $('#article_phone_id').html()
		console.log(phones)
		$('#article_brand_id').change ->
			brand = $('#article_brand_id :selected').text()
			console.log(brand)
			options = $(phones).filter("optgroup[label='#{brand}']").html()
			
			if options
				console.log("No debe entrar")
				$('#modelo').show()
				$('#article_phone_id').html(options)
			else
				console.log("SI debe entrar")
				$('#article_phone_id').html("<option value='nil'>No hay celulares disponibles</option>")
				$('#modelo').show()



		$('#myBtn').click ->
	  		console.log("boton btn!")
	  		$('#myModal').show()
		$('#myBtn2').click ->
			console.log("boton btn2!")
			$('#myModal').show()
		$('.close').click ->
			console.log("boton close!")
			$('#myModal').hide()



		$('#myBtnlogin').click ->
			console.log("boton myBtnlogin1!")
			$('#logmodlogo').show()
			$("#coverslides").hide()
			$("#coverslidesfondo").show()
		$('#myBtnlogin2').click ->
			console.log("boton myBtnlogin2!")
			$('#logmodlogo').show()
		$('#myBtnlogin3').click ->
			console.log("boton myBtnlogin3!")
			$('#logmodlogo').show()
			$("#coverslides").hide()
			$("#coverslidesfondo").show()
		$('.logmod__close').click ->
			console.log("boton closelogin!")
			$('#logmodlogo').hide()
			$("#coverslides").show()
			$("#coverslidesfondo").hide()
  $('#contactoInfo').click ->
    console.log("aca contactoInfo")
    $('#contacto_info').show()
  $('#acercaInfo').click ->
    console.log("aca acercaInfo")
    $('#acerca_info').show()
  $('#QuienesSomosInfo').click ->
    console.log("aca QuienesSomosInfo")
    $('#QuienesSomos_info').show()
  $('#PoliticaInfo').click ->
    console.log("aca PoliticaInfo")
    $('#Politica_info').show()

  $('.close_info').click ->
    console.log("boton close info!")
    $('#contacto_info').hide()
    $('#acerca_info').hide()
    $('#QuienesSomos_info').hide()
    $('#Politica_info').hide()









