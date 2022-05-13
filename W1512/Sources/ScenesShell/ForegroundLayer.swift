import Scenes
  /*
     This class is responsible for the foreground Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class ForegroundLayer : Layer {
    init() {
        let foreground = Foreground()
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Foreground")

          // We insert our RenderableEntities in the constructor

          // We insert our RenderableEntities in the constructor
          insert(entity:foreground, at:.front)
      }
    
  }
