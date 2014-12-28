jQuery ->
  $('#appointments').dataTable
    sPaginationType: 'full_numbers'
    bJQueryUI: true
    'order': [[0, 'desc']]

  $('#patients').dataTable
    sPaginationType: 'full_numbers'
    bJQueryUI: true

  $('#products').dataTable
    sPaginationType: 'full_numbers'
    bJQueryUI: true

  $('#invoices').dataTable
    sPaginationType: 'full_numbers'
    bJQueryUI: true
    'order': [[4, 'desc']]

  pane = window.location.hash.substr(1)
  cal = window.location.search.substr(1).indexOf('start_date')
  if (pane == "appointments" || cal > -1)
    $('#appointments-container').addClass('active')
    $('#appointments-tab').addClass('active')
  else if (pane == "invoices")
    $('#invoices-container').addClass('active')
    $('#invoices-tab').addClass('active')
  else if (pane == "products")
    $('#products-container').addClass('active')
    $('#products-tab').addClass('active')
  else if (pane == "" || pane == "patients")
    $('#patients-container').addClass('active')
    $('#patients-tab').addClass('active')

