import UIKit
import PlaygroundSupport

public class Ampera: UIView {
    var frameWidth = 600
    var frameHeight = 400

    // scenery
    let amperaImage = UIImageView(image: UIImage(named: "place_ampera.png")!)
    let backgroundView = UIView()
    
    // other button
    let buttonMaps  = UIButton(type: .custom)
    let buttonHistory  = UIButton(type: .custom)
    
    // history component
    let bacgroundHistory = UIImageView(image: UIImage(named: "bg_book.png")!)
    let amperaLabel = UILabel()
    let amperaHistoryLabel = UILabel()
    
    var showHistory: Bool = false
    
    public init(scene: UIView) {
        super.init(frame:CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        createSkyBackground()
        
        amperaImage.frame = CGRect(x: 0, y: 50, width: frameWidth, height: frameHeight - 50)
        amperaImage.translatesAutoresizingMaskIntoConstraints = true
        self.addSubview(amperaImage)
        
        createButton()
        
        createHistoryBook(title: "Ampera Bridge", description: "Ampera Bridge is a bridge in Palembang City which has become a symbol of the city. This bridge is located in the center of Palembang city. This bridge connects the Seberang Ulu and Seberang Ilir areas which are separated by the Musi River. This bridge has a length of 1,177 m and a width of 22 m.\n\nThis bridge was built in April 1962 and inaugurated in 1965. This bridge was originally named Bung Karno Bridge. However, in 1966, the name of the bridge was changed to Ampera Bridge (Amanat Penderitaan Rakyat or in English means Mandate for the suffering of the people).\n\nPreviously, the center of the bridge could be lifted so that large ships could pass. However, since 1970 the central part can no longer be removed.")
    }
    
    func createSkyBackground(){
        backgroundView.frame = CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight + 10)
        backgroundView.backgroundColor = UIColor.systemTeal
        self.addSubview(backgroundView)
        
        for indexX in -1...7 {
            let randomX: CGFloat = CGFloat(Int.random(in: (100 * indexX)...(100 * (indexX + 1))))
            for indexY in 0...2 {
                let randomY: CGFloat = CGFloat(Int.random(in: (50 * indexY)...(50 * (indexY + 1))))
                
                createCloud(posX: randomX, posY: randomY)
            }
        }
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
    
    func createButton(){
        if let image = UIImage(named: "btn_maps.png") {
            buttonMaps.setImage(image, for: .normal)
            buttonMaps.frame = CGRect(x: 10, y: frameHeight - 90, width: 80, height: 80)
        }
        else {
            buttonMaps.setTitle("See Maps", for: .normal)
            buttonMaps.frame = CGRect(x: 10, y: frameHeight - 30, width: 80, height: 20)
        }
        buttonMaps.addTarget(self, action: #selector(seeMaps), for: .touchUpInside)
        self.addSubview(buttonMaps)
        
        if let image = UIImage(named: "btn_history.png") {
            buttonHistory.setImage(image, for: .normal)
            buttonHistory.frame = CGRect(x: frameWidth - 60, y: frameHeight - 60, width: 50, height: 50)
        }
        else {
            buttonHistory.setTitle("See History", for: .normal)
            buttonHistory.frame = CGRect(x: frameWidth - 90, y: frameHeight - 30, width: 80, height: 20)
        }
        buttonHistory.addTarget(self, action: #selector(seeHistory), for: .touchUpInside)
        self.addSubview(buttonHistory)
    }
    
    func createHistoryBook(title: String, description: String){
        amperaLabel.text = title
        amperaLabel.textColor = UIColor.darkGray
        amperaLabel.textAlignment = .center
        amperaLabel.font = UIFont(name: "Bradley Hand", size: 18)
        
        amperaHistoryLabel.text = description
        amperaHistoryLabel.lineBreakMode = .byWordWrapping
        amperaHistoryLabel.numberOfLines = 30
        amperaHistoryLabel.textColor = UIColor.darkGray
        amperaHistoryLabel.textAlignment = .center
        amperaHistoryLabel.font = UIFont(name: "Bradley Hand", size: 12)
        
        bacgroundHistory.frame = CGRect(x: frameWidth + 100, y: frameHeight, width: 0, height: 0)
        amperaLabel.frame = CGRect(x: self.frameWidth / 2 - 80, y: 28, width: 250, height: 50)
        amperaHistoryLabel.frame = CGRect(x: self.frameWidth / 2 - 80, y: 25, width: 250, height: self.frameHeight)
        
        amperaLabel.alpha = 0
        amperaHistoryLabel.alpha = 0
        
        self.addSubview(bacgroundHistory)
        self.addSubview(amperaLabel)
        self.addSubview(amperaHistoryLabel)
    }
    
    @objc func seeMaps(sender: UIButton) {
        self.removeFromSuperview()
        let scene = Maps(scene: self)
        PlaygroundPage.current.liveView = scene
    }
    
    @objc func seeHistory(sender: UIButton) {
        if showHistory {
            showHistory = false
            
            UIView.animate(withDuration: 0.5, animations: { [self]() -> Void in
                amperaLabel.alpha = 0
                amperaHistoryLabel.alpha = 0
            }, completion: { (Bool) in
                UIView.animate(withDuration: 1.0, animations: { [self]() -> Void in
                    bacgroundHistory.frame = CGRect(x: frameWidth + 100, y: frameHeight, width: 0, height: 0)
                })
            })
        }
        else{
            showHistory = true
            UIView.animate(withDuration: 1.0, animations: { [self]() -> Void in
                self.bacgroundHistory.frame = CGRect(x: -100, y: 0, width: frameWidth, height: self.frameHeight)
             }, completion: { (Bool) in
                UIView.animate(withDuration: 0.5, delay: 0.5, animations: { [self]() -> Void in
                    amperaLabel.alpha = 1
                    amperaHistoryLabel.alpha = 1
                })
            })
        }
    }
}
