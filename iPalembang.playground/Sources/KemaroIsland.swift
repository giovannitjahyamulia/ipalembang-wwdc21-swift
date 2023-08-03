/*: History of Kemaro Island
Kemaro Island is the only island in Palembang City. This island name means the island that is never flooded even though the river is high.\n\nIn Kemaro Island, there is also a pagoda (Soei Goeat Kiong) which was built around 1839, a large Buddha statue, and a 9-storey 40-meter pagoda which adds to the beauty of Kemaro Island.\n\nThis island is also often referred as the Island of Love, because in Kemaro Island there is a banyan tree (or called the love tree), if someone writes the name of himself and his partner on the tree of love, their love will last and if you don't have a partner and write name of the person you like, then one day they will become lovers.
 
On the island of Kemaro, there is a sacred place which is the tomb of a Palembang princess named Siti Fatimah and her husband Tan Bun Ann, a merchant from China. Based on his story that is engraved on a rock on the island of Kemaro, it is told: There is a legend of a king's daughter named Siti Fatimah who was edited by a Chinese merchant named Tan Bun An during the Palembang kingdom, Siti Fatimah was invited to the Chinese land to see Tan Bun An's parents After being there for a while, Tan Bun An and his wife said goodbye to Palembang and were rewarded with 7 (seven) jars, when they arrived at the Musi waters near Kemaro Island, Tan Bun An wanted to see the gifts that were given. Once opened, Tan Bun An was very surprised that the contents of salted mustard greens, without much thought he immediately threw it into the river, but the last jar fell and broke on the deck of the sailboat. It turned out that there was a gift stored in it, Tan Bun An didn't think much. He immediately jumped into the river to find the jars, a bodyguard also jumped in to help. Seeing that the 2 (two) people did not appear, Siti Fatimah also jumped to help. It turned out that the three of them did not appear again. The people around the island often came to Kemaro Island to commemorate the 3 (three) people and this place is considered to be a very sacred place. Kemaro Island is said to be the grave of the three men, because before jumping to help, Siti Fatimah had said to her bodyguard: "If there is soil growing on the banks of this river, that's where my grave is." It was true, after some time, from under the river around where they jumped appeared a mound of earth which was believed to be the tomb of Siti Fatimah, Tan Bun An and the bodyguard, which finally this place is now known as Kemaro Island.
*/

import UIKit
import PlaygroundSupport

public class KemaroIsland: UIView {
    var frameWidth = 600
    var frameHeight = 400

    // scenery
    let bkbImage = UIImageView(image: UIImage(named: "place_kemaro.png")!)
    let backgroundView = UIView()
    
    // button
    let buttonMaps  = UIButton(type: .custom)
    let buttonHistory  = UIButton(type: .custom)
    
    // history book
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
        
        bkbImage.frame = CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight)
        bkbImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bkbImage)
        
        createButton()
        
        createHistoryBook(title: "Kemaro Island", description: "Kemaro Island is the only island in Palembang City. This island name means the island that is never flooded even though the river is high.\n\nIn Kemaro Island, there is also a pagoda (Soei Goeat Kiong) which was built around 1839, a large Buddha statue, and a 9-storey 40-meter pagoda which adds to the beauty of Kemaro Island.\n\nThis island is also often referred as the Island of Love, because in Kemaro Island there is a banyan tree (or called the love tree), if someone writes the name of himself and his partner on the tree of love, their love will last and if you don't have a partner and write name of the person you like, then one day they will become lovers.")
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
