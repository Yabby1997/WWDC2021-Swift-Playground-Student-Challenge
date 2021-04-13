import SpriteKit

public class PlayerWarheadExplosion: SKSpriteNode {
    let explosionSound = soundPlayer(sound: "Audio/hostile_explosion.wav")
    
    public init(position: CGPoint) {
        super.init(texture: SKTexture(imageNamed: "Sprite/player_warhead_explosion.png"), color: .clear, size: CGSize(width: 30, height: 30))
        self.position = position
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.width / 2)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.categoryBitMask = playerExplosionCategory
        self.physicsBody?.contactTestBitMask = enemyWarheadCategory
        self.physicsBody?.collisionBitMask = 0
        self.physicsBody?.usesPreciseCollisionDetection = true
        
        guard let explosionSound = explosionSound else { return }
        explosionSound.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + GameScene.playerExplosionDuration) {
            self.removeFromParent()
        }
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
