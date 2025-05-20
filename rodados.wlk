import wollok.game.*
class Corsa{
  var property color
  var position = new Position(x=4,y=7) //game.at(0,0)
  const pasoPor = []
  method capacidad() = 4
  method velMax() = 150
  method peso() = 1300
}
class Kwid{
  var property tanqueAdicional
  method velMax() = if(tanqueAdicional) 110 else 120
  method capacidad() = if(tanqueAdicional) 3 else 4
  method peso() = 1200 + if(tanqueAdicional) 150 else 0
  method color() = "azul"
}
object trafic {
  var property interior = comodo
  var property motor = pulenta
  method capacidad() = interior.capacidad()
  method peso() = 4000 + interior.peso() + motor.peso()
  method velMax() = motor.velocidad()
  method color() = "blanco"
}
class Especial {
  var property capacidad 
  const property velMax //Si no puede cambiar la velMax de cada Auto. 
  var property peso 
  var property color 
  //Si tiene un tope el valor
  //const property velocidadMaxima
  //method velocidadMaxima() = velocidadMaxima.min(topeVelocidadMaxma.tope())
}
object topeVelocidadMaxma {
  var property tope = 200 
}
object comodo {
  method capacidad() = 5
  method peso() = 700
}
object popular {
  method capacidad() = 12
  method peso() = 1000
}
object pulenta {
  method velocidad() = 130
  method peso() = 800
}
object bataton {
  method velocidad() = 80
  method peso() = 500
}
class Dependencia {
  const flota = []
  var property empleados = 0
  method agregarAFlota(rodado){
    flota.add(rodado)
  }
  method quitarDeFlota(rodado){
    flota.remove(rodado)
  }
  method pesoTotalFlota() = flota.sum({r=>r.peso()})
  method cantidadRodados() = flota.size()
  method todosAlmenosA100() = flota.all({r=>r.velMax() >= 100})
  method estaBienEquipada() = self.cantidadRodados() >= 3 and self.todosAlmenosA100()
  method rodadosConColor(color) = flota.filter({r=>r.color() == color})
  method capacidadTotalEnColor(color) = self.rodadosConColor(color).sum({r=>r.capacidad()})
  method colorDelRodadoMasRapido() = flota.max({r=>r.velMax()}).color()
  method capacidadTotal() = flota.sum({r=>r.capacidad()})
  method capacidadFaltante() = 0.max(empleados - self.capacidadTotal())
  method esGrande() = empleados >= 40 and flota.size() >= 5
}
//Etapa 4
