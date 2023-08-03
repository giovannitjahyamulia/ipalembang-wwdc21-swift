import UIKit
import PlaygroundSupport

public class RoomBatikSongket: UIView {
    var frameWidth = 600
    var frameHeight = 400

    let songketImage = UIImageView(image: UIImage(named: "room_batik_songket.png")!)
    
    let backgroundView = UIView()
    
    let buttonGoOutside = UIButton(type: .custom)
    
    let buttonPlayPuzzle = UIButton()
    
    let buttonMaps = UIButton(type: .custom)
    let buttonHistory  = UIButton(type: .custom)
    
    let bacgroundHistory = UIImageView(image: UIImage(named: "bg_book.png")!)
    let songketLabel = UILabel()
    let songketHistoryLabel = UILabel()
    
    var showHistory: Bool = false
    
    public init(scene: UIView) {
        super.init(frame:CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        songketImage.frame = CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight)
        songketImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(songketImage)
        
        createButton()
        
        createHistoryBook(title: "Songket", description: "Songket Palembang is one of the cultural works from South Sumatra which was designated as an Intangible Cultural Heritage of Indonesia in 2013. Songket Palembang is not just an aesthetic body armor cloth but has a great meaning, namely prosperity, glory, and courage. The origin of songket cloth came from Chinese traders who brought silk, Indian and Middle Eastern traders brought gold so that gold-plated songket cloth was created in the hands of the native Palembang people.")
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
        
        buttonPlayPuzzle.setTitle("Play Puzzle", for: .normal)
        buttonPlayPuzzle.backgroundColor = UIColor.clear
        buttonPlayPuzzle.frame = CGRect(x: frameWidth / 2 - 70, y: frameHeight - 135, width: 150, height: 50)
        buttonPlayPuzzle.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        buttonPlayPuzzle.setTitleColor(UIColor.white, for: .normal)
        
        buttonPlayPuzzle.titleLabel!.layer.shadowColor = UIColor.black.cgColor
        buttonPlayPuzzle.titleLabel!.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        buttonPlayPuzzle.titleLabel!.layer.shadowOpacity = 1.0
        buttonPlayPuzzle.titleLabel!.layer.shadowRadius = 100
        buttonPlayPuzzle.titleLabel!.layer.masksToBounds = false
        
        buttonPlayPuzzle.addTarget(self, action: #selector(playPuzzle), for: .touchUpInside)
        
        self.addSubview(buttonPlayPuzzle)
        
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
        
        if let image = UIImage(named: "btn_out.png") {
            buttonGoOutside.setImage(image, for: .normal)
            buttonGoOutside.frame = CGRect(x: frameWidth - 120, y: frameHeight - 60, width: 50, height: 50)
        }
        else {
            buttonGoOutside.setTitle("Go Out", for: .normal)
            buttonGoOutside.frame = CGRect(x: frameWidth - 150, y: frameHeight - 30, width: 80, height: 20)
        }
        buttonGoOutside.addTarget(self, action: #selector(goOutside), for: .touchUpInside)
        self.addSubview(buttonGoOutside)
    }
    
    func createHistoryBook(title: String, description: String){
        songketLabel.text = title
        songketLabel.textColor = UIColor.black
        songketLabel.textAlignment = .center
        songketLabel.font = UIFont(name: "Bradley Hand", size: 18)
        
        songketHistoryLabel.text = description
        songketHistoryLabel.lineBreakMode = .byWordWrapping
        songketHistoryLabel.numberOfLines = 30
        songketHistoryLabel.textColor = UIColor.darkGray
        songketHistoryLabel.textAlignment = .center
        songketHistoryLabel.font = UIFont(name: "Bradley Hand", size: 12)
        
        bacgroundHistory.frame = CGRect(x: frameWidth + 100, y: frameHeight, width: 0, height: 0)
        songketLabel.frame = CGRect(x: self.frameWidth / 2 - 80, y: 50, width: 250, height: 50)
        songketHistoryLabel.frame = CGRect(x: self.frameWidth / 2 - 80, y: 35, width: 250, height: 100 + self.frameHeight / 2)
        
        songketLabel.alpha = 0
        songketHistoryLabel.alpha = 0
        
        self.addSubview(bacgroundHistory)
        self.addSubview(songketLabel)
        self.addSubview(songketHistoryLabel)
    }
    
    @objc func seeMaps(sender: UIButton) {
        self.removeFromSuperview()
        let scene = Maps(scene: self)
        PlaygroundPage.current.liveView = scene
    }
    
    @objc func playPuzzle(sender: UIButton) {
        self.removeFromSuperview()
        let scene = SongketPuzzle(scene: self)
        PlaygroundPage.current.liveView = scene
    }
    
    @objc func goOutside(sender: UIButton) {
        self.removeFromSuperview()
        let scene = LimasHouse(scene: self)
        PlaygroundPage.current.liveView = scene
    }
    
    @objc func seeHistory(sender: UIButton) {
        if showHistory {
            showHistory = false
            
            UIView.animate(withDuration: 0.5, animations: { [self]() -> Void in
                songketLabel.alpha = 0
                songketHistoryLabel.alpha = 0
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
                    songketLabel.alpha = 1
                    songketHistoryLabel.alpha = 1
                })
            })
        }
    }
}
