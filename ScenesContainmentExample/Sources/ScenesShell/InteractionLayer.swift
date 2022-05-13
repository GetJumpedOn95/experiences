import Scenes

// The interaction layer is generally the layer (or one of the layers)
// that the user interacts with.
class InteractionLayer : Layer {
    let reference : Box
    let target : Target

    init() {
        reference = Box()
        target = Target()

        super.init(name:"Interaction")

        insert(entity:reference, at:.front)
        insert(entity:target, at:.front)
    }
}
