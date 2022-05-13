import Scenes

class MainScene : Scene {
    // Declare the layers that will be included in this scene
    let backgroundLayer : Layer
    let interactionLayer : Layer

    init() {
        // Initialize the layers.
        // It's fine to use parameters if desired.
        // At a minimum, most scenes should have a backgroud layer and
        // an interaction layer.
        backgroundLayer = BackgroundLayer()
        interactionLayer = InteractionLayer()

        super.init(name:"Main")

        // Insert each layer into the scene.
        // In general this will occur from back to front.
        // When inserting at the front, all existing layers are pushed
        // back.
        insert(layer:backgroundLayer, at:.front)
        insert(layer:interactionLayer, at:.front)
    }
}
