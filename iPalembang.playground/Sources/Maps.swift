import UIKit
import PlaygroundSupport

public struct Places {
    let name: String
    let coordinat: [Float]
    // let introduction: String
    // let image: String
}

public let places: [Places] = [
    Places(name: "Ampera Bridge", coordinat: [125, 222]),
    Places(name: "Kuto Besak Fortress", coordinat: [85, 208]),
    Places(name: "Limas House", coordinat: [32, 134]),
    Places(name: "Empek Empek Store", coordinat: [38, 95]),
    Places(name: "Kemaro Island", coordinat: [466, 135]),
]

public class Maps: UIView {
    let frameWidth = 600
    let frameHeight = 400
    
    // map component
    let mapTitileLabel = UILabel()
    let palembangMapsImage = UIImageView(image: UIImage(named: "maps_palembang.png")!)
    let pin: [UIButton] = [UIButton(), UIButton(), UIButton(), UIButton(), UIButton()]
    
    // intro component
    let nextButton = UIButton()
    let introLabel = UILabel()
    
    // intro dialog
    var introDone: Bool = false
    var index: Int = 0
    var introduction: [String] = [
        "I want to give you something before we start",
        "This is the map of Palembang city",
        "There are pins to show some recommended places in Palembang",
        "You can visit it by clicking the pin on the maps",
        "Some places can be enter",
        "Psst... There are also a hidden-mini-games on it",
        "You can open the map again, by click button on the left-side",
        "And the second one is this book, it is about history",
        "It can be history of the places or the cultural heritage there",
        "Click button on the right-side to open the book",
        "Okay, now let's start!!"
    ]
    
    public init(scene: UIView) {
        super.init(frame:CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        showMap()
        
        /*
        if !introDone {
            intro()
        }
        */
    }
    
    func showMap() {
        palembangMapsImage.frame = CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight)
        palembangMapsImage.translatesAutoresizingMaskIntoConstraints = true
        self.addSubview(palembangMapsImage)
        
        mapTitileLabel.text = "P A L E M B A N G"
        mapTitileLabel.textColor = UIColor.darkGray
        mapTitileLabel.frame = CGRect(x: 0, y: 20, width: frameWidth, height: 50)
        mapTitileLabel.textAlignment = .center
        mapTitileLabel.font = UIFont(name: "Arial", size: 28)
        self.addSubview(mapTitileLabel)
        
        addPin()
    }
    
    func addPin() {
        for (index, place) in places.enumerated() {
            pin[index].setTitle("📍\(place.name)", for: .normal)
            pin[index].backgroundColor = UIColor.clear
            pin[index].frame = CGRect(x: CGFloat(place.coordinat[0]), y: CGFloat(place.coordinat[1]), width: CGFloat(2 + place.name.count * 2), height: 50)
            pin[index].titleLabel?.font = UIFont.systemFont(ofSize: 14)
            pin[index].titleLabel?.textAlignment = .left
            pin[index].sizeToFit()
            pin[index].setTitleColor(UIColor.black, for: .normal)
            pin[index].layer.cornerRadius = 4
            pin[index].addTarget(self, action: #selector(goToPlace), for: .touchUpInside)
            
            self.addSubview(pin[index])
        }
    }
    
    func intro() {
        introLabel.text = introduction[0]
        introLabel.textColor = UIColor.white
        introLabel.frame = CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight)
        introLabel.textAlignment = .center
        introLabel.lineBreakMode = .byWordWrapping
        introLabel.numberOfLines = 30
        introLabel.font = UIFont(name: "Arial", size: 14)
        introLabel.backgroundColor = UIColor.black
        introLabel.frame = CGRect(x: 0, y: frameHeight - 120, width: frameWidth, height: 100)
        self.addSubview(self.introLabel)
        
        nextButton.setTitle("", for: .normal)
        nextButton.backgroundColor = UIColor.clear
        nextButton.frame = CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        nextButton.setTitleColor(UIColor.white, for: .normal)
        nextButton.layer.cornerRadius = 4
        nextButton.addTarget(self, action: #selector(self.nextIntro), for: .touchUpInside)
        self.addSubview(nextButton)
    }
    
    func openScene(index: Int) {
        self.removeFromSuperview()
        
        // var scene = DetailPlace(scene: self)
        // scene.place = places[index]
        
        if index == 0 {
            let scene = Ampera(scene: self)
            PlaygroundPage.current.liveView = scene
        }
        else if index == 1 {
            let scene = BKB(scene: self)
            PlaygroundPage.current.liveView = scene
        }
        else if index == 2 {
            let scene = LimasHouse(scene: self)
            PlaygroundPage.current.liveView = scene
        }
        else if index == 3 {
            let scene = CookingPreparation(scene: self)
            PlaygroundPage.current.liveView = scene
        }
        else if index == 4 {
            let scene = KemaroIsland(scene: self)
            PlaygroundPage.current.liveView = scene
        }
        else {
            let scene = KemaroIsland(scene: self)
            PlaygroundPage.current.liveView = scene
        }
        
    }
    
    @objc func nextIntro(sender: UIButton) {
        if index < introduction.count - 1 {
            self.index = self.index + 1
            UIView.animate(withDuration: 0.5, animations: {() -> Void in
                self.introLabel.text = self.introduction[self.index]
            })
        }
        else {
            nextButton.frame = CGRect(x: frameWidth, y: frameHeight, width: 0, height: 0)
            introLabel.frame = CGRect(x: frameWidth, y: frameHeight, width: 0, height: 0)
            introDone = true
        }
    }
    
    @objc func goToPlace(sender: UIButton) {
        for i in 0...4 {
            if sender == pin[i]{
                openScene(index: i)
            }
        }
    }
}
