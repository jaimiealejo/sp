# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#appointments').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true

  $('#patients').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true

  $('#products').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true

  $('#invoices').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true