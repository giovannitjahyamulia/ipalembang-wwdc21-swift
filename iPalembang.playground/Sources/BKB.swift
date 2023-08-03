import UIKit
import PlaygroundSupport

public class BKB: UIView {
    var frameWidth = 600
    var frameHeight = 400

    // scenery
    let bkbImage = UIImageView(image: UIImage(named: "place_bkb.png")!)
    let backgroundView = UIView()
    
    // button
    let buttonMaps  = UIButton(type: .custom)
    let buttonHistory  = UIButton(type: .custom)
    
    // history component
    let bacgroundHistory = UIImageView(image: UIImage(named: "bg_book.png")!)
    let bkbLabel = UILabel()
    let bkbHistoryLabel = UILabel()
    
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
        
        bkbImage.frame = CGRect(x: 0, y: frameHeight - 150, width: frameWidth, height: 150)
        bkbImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bkbImage)
        
        createButton()
        
        createHistoryBook(title: "Kuto Besak Fortress", description: "Benteng Kuto Besak or Kuto Besak Fortress is a palace building which in the XVIII century became the center of the Palembang Sultanate. Kuto Besak Fortress has a length of 288.75 meters with a height of 9.99 meters and a thickness of 1.99 meters. The idea of establishing Kuto Besak Fortress was initiated by Sultan Mahmud Badaruddin I (1724-1758) and completed by Sultan Mahmud Bahauddin (1776-1803).\n\nThe courtyard area in front of Kuto Besak Fortress was arranged to became a plaza by the government. Sometimes this place is used for holding events or festivals with Musi River and Ampera Bridge as the backdrop.\n\nAt night, the courtyard is filled with night market traders selling various merchandise and local culinary.")
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
        bkbLabel.text = title
        bkbLabel.textColor = UIColor.darkGray
        bkbLabel.textAlignment = .center
        bkbLabel.font = UIFont(name: "Bradley Hand", size: 18)
        
        bkbHistoryLabel.text = description
        bkbHistoryLabel.lineBreakMode = .byWordWrapping
        bkbHistoryLabel.numberOfLines = 30
        bkbHistoryLabel.textColor = UIColor.darkGray
        bkbHistoryLabel.textAlignment = .center
        bkbHistoryLabel.font = UIFont(name: "Bradley Hand", size: 12)
        
        bacgroundHistory.frame = CGRect(x: frameWidth + 100, y: frameHeight, width: 0, height: 0)
        bkbLabel.frame = CGRect(x: self.frameWidth / 2 - 80, y: 28, width: 250, height: 50)
        bkbHistoryLabel.frame = CGRect(x: self.frameWidth / 2 - 80, y: 25, width: 250, height: self.frameHeight)
        
        bkbLabel.alpha = 0
        bkbHistoryLabel.alpha = 0
        
        self.addSubview(bacgroundHistory)
        self.addSubview(bkbLabel)
        self.addSubview(bkbHistoryLabel)
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
                bkbLabel.alpha = 0
                bkbHistoryLabel.alpha = 0
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
                    bkbLabel.alpha = 1
                    bkbHistoryLabel.alpha = 1
                })
            })
        }
    }
}
