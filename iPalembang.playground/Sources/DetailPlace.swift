// Cannot be used, it only throw first index

/*
import UIKit
import PlaygroundSupport

public class DetailPlace: UIView {
    var frameWidth = 600
    var frameHeight = 400
    
    public var place: Place = Place()

    let imageView = UIImageView(image: UIImage(named: "place_\(place.image).png")!)
    
    public init(scene: UIView) {
        super.init(frame:CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
        backgroundView.backgroundColor = UIColor.systemTeal
        self.addSubview(backgroundView)
        
        for indexX in -1...7 {
            let randomX: CGFloat = CGFloat(Int.random(in: (100 * indexX)...(100 * (indexX + 1))))
            for indexY in 0...2 {
                let randomY: CGFloat = CGFloat(Int.random(in: (50 * indexY)...(50 * (indexY + 1))))
                
                createCloud(posX: randomX, posY: randomY)
            }
        }
        
        imageView.frame = CGRect(x: 0, y: 50, width: frameWidth, height: frameHeight - 50)
        imageView.translatesAutoresizingMaskIntoConstraints = true
        self.addSubview(imageView)
    }
    
    func createCloud(posX: CGFloat, posY: CGFloat) {
        let cloud = UIImageView(image: UIImage(named: "ornament_cloud.png")!)
        
        // set opacity with random
        cloud.alpha = 1.0 / CGFloat(Int.random(in: 3...5))
        
        // random size of cloud
        let randomWidth = CGFloat(Int.random(in: 70...150))
        let randomHeight = randomWidth / 2
        cloud.frame = CGRect(x: posX, y: posY, width: randomWidth, height: randomHeight)
        
        // animate cloud
        UIView.animate(withDuration: 5.0, delay: 0, options: [.autoreverse, .repeat]) {
            cloud.frame = CGRect(x: posX - 50, y: posY, width: randomWidth, height: randomHeight)
        }
        self.addSubview(cloud)
    }
}
*/
