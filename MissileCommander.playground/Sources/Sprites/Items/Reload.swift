import SpriteKit

public class Reload: Item {
    init(position: CGPoint, gameScene: SKScene) {
        super.init(texture: SKTexture(imageNamed: "Sprite/reload.png"), position: position, gameScene: gameScene)
        
        self.physicsBody?.categoryBitMask = reloadItemCategory
        
        self.color = .blue
        self.colorBlendFactor = 1.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

