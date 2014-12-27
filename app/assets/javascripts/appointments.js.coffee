jQuery ->
	procedure_field = $('#procedure-field')
	procedure_field.tag
		placeholder: procedure_field.attr('placeholder')
		source: ['Bracket Placement', 'Dentures', 'Extraction', 'Fixed bridge', 'Jacket', 'Light Cure', 'Retainer']
		allowNew: true
	return

