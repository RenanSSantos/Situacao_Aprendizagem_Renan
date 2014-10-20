/* 
 * Medidas.js
 */

var spanlargura = document.getElementById('largura');
var spanaltura = document.getElementById('altura');

window.onresize= function(){
    altura= window.innerHeight;
    largura= window.innerWidth;
    
    spanlargura.innerHTML = largura +"px ";
    spanaltura.innerHTML= altura +"px ";
    
    
    
    
};
