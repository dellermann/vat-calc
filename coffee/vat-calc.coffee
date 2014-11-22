###

  vat-calc.coffee
 
  Copyright (c) 2014, Daniel Ellermann
 
  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:
 
  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.
 
  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.

###


# @nodoc
$ = jQuery


# Class `Calculator` represents the client-side V.A.T calculator.
#
# @author   Daniel Ellermann
# @version  0.9
# @since    0.9
#
class Calculator

  #-- Private variables -------------------------

  $ = jQuery


  #-- Instance variables ------------------------
  
  DEFAULT_OPTIONS =
    accessKeys:
      calculate: 'c'
      gross: 'g'
      input: 'i'
      net: 'n'
      vatRate: 'r'
    currency: '€'
    gross: false
    labels:
      calculate: 'Calculate'
      gross: 'Gross'
      net: 'Net'
      vat: 'V.A.T.'
      vatRate: 'Rate'
    point: '.'
    taxRates: [7, 19]


  #-- Constructor -------------------------------
  
  # Creates a new calculator within the given element.
  #
  # @param [Element] element  the given container element
  # @param [Object] options   any options that overwrite the default options
  #
  constructor: (element, options = {}) ->
    @$element = $el = $(element)
    @options = $.extend {}, DEFAULT_OPTIONS, options

    @_renderTemplate()


  #-- Non-public methods ------------------------

  # Renders the Handlebars template that displays the calculator.
  #
  # @private
  #
  _renderTemplate: ->
    html = Handlebars.templates['vat-calc']
      options: @options
    @$element.empty()
      .html(html)
#      .on('click', '.jscalc-key', (event) => @_onClickKey event)
#    $(window).on('keypress', (event) => @_onKeyPress event)
#      .on('keydown', (event) => @_onKeyDown event)
#      .on('keyup', (event) => @_onKeyUp())


Plugin = (option) ->
  args = arguments
  @each ->
    $this = $(this)
    data = $this.data 'bs.vatcalc'

    unless data
      $this.data 'bs.vatcalc', (data = new Calculator(this, args[0]))

# @nodoc
old = $.fn.vatcalc

# @nodoc
$.fn.vatcalc = Plugin
# @nodoc
$.fn.vatcalc.Constructor = Calculator

# @nodoc
$.fn.vatcalc.noConflict = ->
  $.fn.vatcalc = old
  this

