var SeaLion = function(args){
  this.name = args.name || "SeaLion Demo";
  this.age = args.age || 1;
  this.wiskers = args.wiskers || [];

  this.addWisker = function(){
    
  }
}

var Wisker = function(size){
  this.size = size || 1;
}


SeaLion.prototype.totalWiskerLength = function(){
  var sum = 0;
  for(var i=0; i< this.wiskers.length; i++){
    sum = sum + this.wiskers[i].size;
  }
  return sum;
}

SeaLion.prototype.addWisker= function(newWisker){
  this.wiskers.push(newWisker);
}



