###*
  @author Jakub Nerad
  @inspired https://github.com/nzakas/computer-science-in-javascript/blob/master/algorithms/sorting/quicksort/quicksort.js
###

class QuickSort 
  
  ###*
    The unsorted array
    @type {Array}
    @protected
  ###
  items: []
  
  ###*
    Constructor 
    @param The unsorted array
  ###
  constructor: (@items) ->
  
  ###*
    A Quick sort implementation
    @param {int} left starts from left
    @param {int} right starts from right
    @return {Array} The sorted array
  ###
  sorted: (left, right) ->
 
    if @items.length > 1
      
      left = 0 if typeof left != "number"
      right = @items.length - 1 if typeof right != "number"
      
      index = @divide left, right

      if left < index - 1 
        @sorted left, index - 1

      if index < right 
        @sorted index, right
      
    return @items
  
  ###*
    Swaps two values in an array
    @protected
    @param {int} a index of first item to swap
    @param {int} b index of second item to swap
    @return {void}
  ###
  swap: (a, b) ->
    tmp = @items[a]
    @items[a] = @items[b]
    @items[b] = tmp
    return
    
  ###*
    @protected
    @param {int} left starts from left
    @param {int} right starts from right
    @return {int} index in an array
  ###
  divide: (left, right) ->
    
    middle = Math.floor (right + left) / 2
    pivot = @items[middle]
    i = left
    j = right
    
    while i <= j 
      
      while @items[i] < pivot
        i++
      while @items[j] > pivot
        j--
        
      if i <= j 
        @swap i, j
        i++
        j--
        
    return i