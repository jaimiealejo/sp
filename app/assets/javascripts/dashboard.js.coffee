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
  else if (pane == "patients")
    $('#patients-container').addClass('active')
    $('#patients-tab').addClass('active')
  else if (pane == "" || pane == "overview")
    $('#overview-container').addClass('active')
    $('#overview-tab').addClass('active')

  $('.sparkline').sparkline('html', {type: 'bar', height: '40px', barWidth:5, barColor:'#fff'})
  $('.sparkline').each ->
    container = $(this).closest('.infobox').find('.stat')
    v = $(this).attr('values').split(',')
    stat = v[1]/v[0]
    container.text(stat.toFixed(2)+'%')
    
    if stat < 0
      container.addClass('stat-important')
    else if stat > 0
      container.addClass('stat-success')
  return
