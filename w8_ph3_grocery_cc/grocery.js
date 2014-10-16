var GroceryList = {};

//-----------------------------------------------------------------------------------------
//--------------------------------------------Models---------------------------------------
//-----------------------------------------------------------------------------------------

//Models - should know how to calculate the total of all food items
//item model knows what its name and price is
GroceryList.Item = function(name, price) {
  this.name = name;
  this.price = price;
}

//could also be function ItemList() {}... but we want to namespace
//itemlist model holds collection of item objects, each instance is able to know its total
GroceryList.ItemList = function() {
  this.total = 0.0;
  this.foodItems = [];
}

GroceryList.ItemList.prototype = {

  addItem: function(item_object) {
    this.foodItems.push(item_object);
    this.total += item_object.price;
  }
}

//---------------------------------------------------------------------------------------
//--------------------------------------------View---------------------------------------
//---------------------------------------------------------------------------------------
//View ... only knows what the DOM elements are and how to render a new total
//total cost div to render total, array of food item TRs, table to append TRs to
GroceryList.View = function() {
  this.totalElement = $('#total_cost')
  this.food_items = $('.item')
  this.item_list = $('#grocery_list')
}

GroceryList.View.prototype = {
  drawTotal: function(total) {
    this.totalElement.text(total.toFixed(2));
  },
}

//---------------------------------------------------------------------------------------------
//--------------------------------------------Controller---------------------------------------
//---------------------------------------------------------------------------------------------
GroceryList.Controller = function(itemList, view) {
  this.view = view
  this.itemList = itemList
  this.bindEvents();
}

GroceryList.Controller.prototype = {

  handleDragAndDrop: function() {
    var that = this;
    $('.item').draggable({
      helper:'clone'
      });

    $('#grocery_list').droppable({
     accept: '.item', //if you have multiple items draggable and you want to be specific for this function
      drop: function(event, ui) {
        $(this).append(ui.draggable.clone())

        var newItemName = $(ui.draggable).find('.item_name').text()
        console.log(newItemName)
        var newItemPrice = parseFloat($(ui.draggable).find('.item_price').text())
        var itemObject = new GroceryList.Item(newItemName, newItemPrice)
        that.itemList.addItem(itemObject);
        that.updateTotal();
      }
    })
  },

  updateTotal: function(itemList) {
    var total = this.itemList.total;
    this.view.drawTotal(total);
    console.log(total)
  },

  bindEvents: function() {
    this.handleDragAndDrop();
  }
};

$(document).ready( function(){
  var itemList = new GroceryList.ItemList();
  var view = new GroceryList.View();
  var controller = new GroceryList.Controller(itemList, view);
})