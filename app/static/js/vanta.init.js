class VantaWave {
  constructor(config) {
    this.config = config;
    this.running = false;
    this.restart();
  }
  restart(){
    if(!this.running){
      this.running = true;
      this.effect = VANTA.WAVES(this.config);
    }
  }
  destroy(){
    if(this.running){
      this.effect?.destroy();
      this.running = false;
    }else{
      console.log("already stopped")
    }
  }
}

var vantaWaves = new VantaWave({
  el: "#app-home-bg",
  mouseControls: true,
  touchControls: true,
  gyroControls: false,
  minHeight: 200.00,
  minWidth: 200.00,
  scale: 1.00,
  scaleMobile: 1.00,
  color: 0x10071d
});

window.navigation.addEventListener("navigate", (event) => {
  var baseUrl = event.destination?.url?.split("#!")
  if(baseUrl?.[1] === "/"){
    vantaWaves.restart()
  } else {
    vantaWaves.destroy()
  }
});