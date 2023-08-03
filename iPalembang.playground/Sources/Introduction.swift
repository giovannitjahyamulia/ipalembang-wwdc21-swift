import UIKit
import PlaygroundSupport

public class Introduction: UIView {
    var frameWidth = 600
    var frameHeight = 400
    
    let buttonStart = UIButton()
    let titleLabel = UILabel()
    let indonesiaMapsImage = UIImageView(image: UIImage(named: "maps_indonesia.png")!)
    
    var isStarted: Bool = false;
    var index: Int = 0
    
    var introduction: [String] = [
        "Indonesia is an archipelago country, consisting of 34 provinces and has 17,504 islands",
        "Indonesia has a diversity of cultures, races, ethnicities, beliefs, religions and languages",
        "Hi! My name is Giovanni Tjahyamulia, you can call me Gio",
        "I grew up in city of Palembang",
        "And I'm super excited to tell you more about my city",
        "Are you ready?",
        "Let's begin our journey! Wohooo!"
    ]
    
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
        
        indonesiaMapsImage.frame = CGRect(x: 20, y: 100, width: frameWidth - 40, height: frameHeight - 200)
        indonesiaMapsImage.translatesAutoresizingMaskIntoConstraints = true
        self.addSubview(indonesiaMapsImage)
        
        titleLabel.text = "🇮🇩   I N D O N E S I A"
        titleLabel.textColor = UIColor.white
        titleLabel.frame = CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "Arial", size: 28)
        self.addSubview(titleLabel)
        
        buttonStart.setTitle("", for: .normal)
        buttonStart.backgroundColor = UIColor.clear
        buttonStart.frame = CGRect(x: 20, y: frameHeight - 80, width: frameWidth - 40, height: 50)
        buttonStart.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        buttonStart.setTitleColor(UIColor.white, for: .normal)
        buttonStart.layer.cornerRadius = 4
        
        indonesiaMapsImage.transform = CGAffineTransform(scaleX: 10, y: 10)
        titleLabel.transform = CGAffineTransform(scaleX: 10, y: 10)
        UIView.animate(withDuration: 1.5, animations: {() -> Void in
            self.indonesiaMapsImage.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.titleLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: {(_ finished: Bool) -> Void in
            UIView.animate(withDuration: 0.7, animations: {() -> Void in
                self.titleLabel.frame = CGRect(x: 0, y: 50, width: self.frameWidth, height: 20)
            }, completion: { (_ finished: Bool) in
                self.addSubview(self.buttonStart)
                self.buttonStart.addTarget(self, action: #selector(self.buttonStartPressed), for: .touchUpInside)
                var count = 1
                Timer.scheduledTimer(withTimeInterval: 0.6, repeats: true) { timer in
                    count = count + 1
                    DispatchQueue.main.async { [self] in
                        if isStarted {
                            timer.invalidate()
                        }
                        else if count % 2 == 0 {
                            buttonStart.setTitle("Click here to start", for: .normal)
                        }
                        else {
                            buttonStart.setTitle("", for: .normal)
                        }
                    }
                }
            })
        })
    }
    
    @objc func buttonStartPressed(sender: UIButton) {
        if isStarted {
            if index == 3 {
                nextIntro(isContinue: true)
            }
            else if index < introduction.count {
                nextIntro(isContinue: false)
            }
            else {
                self.removeFromSuperview()
                let scene = Maps(scene: self)
                PlaygroundPage.current.liveView = scene
            }
        }
        else {
            isStarted = true
            buttonStart.setTitle("", for: .normal)
            buttonStart.frame = CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight)
            titleLabel.frame = CGRect(x: 20, y: frameHeight - 80, width: frameWidth - 40, height: 50)
            titleLabel.text = ""
            titleLabel.font = UIFont(name: "Arial", size: 14)
            
            self.nextIntro(isContinue: false)
        }
    }
    
    func nextIntro(isContinue: Bool) {
        if index < introduction.count {
            UIView.animate(withDuration: 0.5, animations: {() -> Void in
                self.titleLabel.alpha = 0
                if self.index == 2 {
                    UIView.animate(withDuration: 1.5, animations: { [self]() -> Void in
                        self.indonesiaMapsImage.frame = CGRect(x: 20, y: 50, width: frameWidth - 40, height: self.frameHeight - 200)
                    }) { [self] (_ finished: Bool) in
                        self.titleLabel.backgroundColor = UIColor.black
                        self.titleLabel.frame = CGRect(x: 0, y: frameHeight - 120, width: frameWidth, height: 100)
                    }
                }
            }) { [self] (_ finished: Bool) in
                self.titleLabel.text = self.introduction[self.index]
                self.index = self.index + 1
                UIView.animate(withDuration: 0.8, animations: {() -> Void in
                    self.titleLabel.alpha = 1
                }) { [self] (_ finished: Bool) in
                    if isContinue {
                        let pin = UILabel()
                        pin.text = "📍 Palembang, South Sumatera, Indonesia"
                        pin.textColor = UIColor.black
                        pin.frame = CGRect(x: frameWidth / 2 - 50 , y: frameHeight / 2 - 30, width: 300, height: 30)
                        pin.textAlignment = .center
                        pin.font = UIFont(name: "Arial", size: 12)

                        UIView.animate(withDuration: 1.0, animations: {() -> Void in
                            indonesiaMapsImage.frame = CGRect(x: 600, y: 50, width: frameWidth - 40, height: frameHeight - 200)
                            indonesiaMapsImage.transform = CGAffineTransform(scaleX: 3.5, y: 3.5)
                        }) { (Bool) in
                            UIView.animate(withDuration: 1.0) {
                                self.addSubview(pin)
                            }
                        }
                    }
                }
            }
        }
    }
}
