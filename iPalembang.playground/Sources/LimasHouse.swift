import UIKit
import PlaygroundSupport

public class LimasHouse: UIView {
    var frameWidth = 600
    var frameHeight = 400
    
    // scenery
    let limasImage = UIImageView(image: UIImage(named: "place_limas.png")!)
    let backgroundView = UIView()
    
    // button
    let buttonMaps = UIButton(type: .custom)
    let buttonHistory  = UIButton(type: .custom)
    let buttonEnterHouse = UIButton()

    // history book
    let bacgroundHistory = UIImageView(image: UIImage(named: "bg_book.png")!)
    let limasLabel = UILabel()
    let limasCategoryLabel = UILabel()
    let limasHistoryLabel = UILabel()
    
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
        
        limasImage.frame = CGRect(x: 0, y: 50, width: frameWidth, height: frameHeight - 50)
        limasImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(limasImage)
        
        createButton()
        
        createHistoryBook(title: "Limas House", subtitle: "Indonesian Traditional House", description: "Limas House is a traditional house of South Sumatra Province which is shaped like a pyramid made in a stage style.\n\nThe Limas House style is like a stilt house, has five levels arranged using the Kekijing philosophy. Each room is arranged based on its occupants, namely age, gender, talent, rank, and dignity.\n\nAlmost all parts of the Limas House are made of wood. The wood used is Tembesu wood and unglen wood, a rare superior wood that only grows in Palembang.")
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
        
        buttonEnterHouse.setTitle("Enter Limas House", for: .normal)
        buttonEnterHouse.backgroundColor = UIColor.clear
        buttonEnterHouse.frame = CGRect(x: frameWidth / 2 - 80, y: frameHeight - 100, width: 150, height: 50)
        buttonEnterHouse.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        buttonEnterHouse.setTitleColor(UIColor.white, for: .normal)
        
        buttonEnterHouse.titleLabel!.layer.shadowColor = UIColor.white.cgColor
        buttonEnterHouse.titleLabel!.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        buttonEnterHouse.titleLabel!.layer.shadowOpacity = 1.0
        buttonEnterHouse.titleLabel!.layer.shadowRadius = 100
        buttonEnterHouse.titleLabel!.layer.masksToBounds = false
        
        buttonEnterHouse.addTarget(self, action: #selector(enterLimasHouse), for: .touchUpInside)
        
        self.addSubview(buttonEnterHouse)
        
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
    
    func createHistoryBook(title: String, subtitle: String, description: String){
        limasLabel.text = title
        limasLabel.textColor = UIColor.black
        limasLabel.textAlignment = .center
        limasLabel.font = UIFont(name: "Bradley Hand", size: 18)
        
        limasCategoryLabel.text = subtitle
        limasCategoryLabel.textColor = UIColor.darkGray
        limasCategoryLabel.textAlignment = .center
        limasCategoryLabel.font = UIFont(name: "Bradley Hand", size: 12)
        
        limasHistoryLabel.text = description
        limasHistoryLabel.lineBreakMode = .byWordWrapping
        limasHistoryLabel.numberOfLines = 30
        limasHistoryLabel.textColor = UIColor.darkGray
        limasHistoryLabel.textAlignment = .center
        limasHistoryLabel.font = UIFont(name: "Bradley Hand", size: 12)
        
        bacgroundHistory.frame = CGRect(x: frameWidth + 100, y: frameHeight, width: 0, height: 0)
        limasLabel.frame = CGRect(x: self.frameWidth / 2 - 80, y: 50, width: 250, height: 50)
        limasCategoryLabel.frame = CGRect(x: self.frameWidth / 2 - 80, y: 70, width: 250, height: 50)
        limasHistoryLabel.frame = CGRect(x: self.frameWidth / 2 - 80, y: 35, width: 250, height: self.frameHeight)
        
        limasLabel.alpha = 0
        limasCategoryLabel.alpha = 0
        limasHistoryLabel.alpha = 0
        
        self.addSubview(bacgroundHistory)
        self.addSubview(limasLabel)
        self.addSubview(limasCategoryLabel)
        self.addSubview(limasHistoryLabel)
    }
    
    @objc func seeMaps(sender: UIButton) {
        self.removeFromSuperview()
        let scene = Maps(scene: self)
        PlaygroundPage.current.liveView = scene
    }
    
    @objc func enterLimasHouse(sender: UIButton) {
        self.removeFromSuperview()
        let scene = RoomBatikSongket(scene: self)
        PlaygroundPage.current.liveView = scene
    }
    
    @objc func seeHistory(sender: UIButton) {
        if showHistory {
            showHistory = false
            
            UIView.animate(withDuration: 0.5, animations: { [self]() -> Void in
                limasLabel.alpha = 0
                limasCategoryLabel.alpha = 0
                limasHistoryLabel.alpha = 0
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
                    limasLabel.alpha = 1
                    limasCategoryLabel.alpha = 1
                    limasHistoryLabel.alpha = 1
                })
            })
        }
    }
}
