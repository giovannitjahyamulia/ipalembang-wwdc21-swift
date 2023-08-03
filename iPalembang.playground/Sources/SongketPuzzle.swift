import UIKit
import PlaygroundSupport

public class SongketPuzzle: UIView {
    let frameWidth: CGFloat = 600
    let frameHeight: CGFloat = 400
    
    let puzzles: [[UIButton]] = [
        [UIButton(), UIButton(), UIButton()],
        [UIButton(), UIButton(), UIButton()],
        [UIButton(), UIButton(), UIButton()],
        [UIButton(), UIButton(), UIButton()],
        [UIButton(), UIButton(), UIButton()]
    ]
    
    var angles: [[Int]] = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
    ]
    
    var checkers: [[Bool]] = [
        [false, false, false, false],
        [false, false, false, false],
        [false, false, false, false],
        [false, false, false, false],
        [false, false, false, false]
    ]
    
    let exampleImage: [[UIButton]] = [
        [UIButton(), UIButton(), UIButton()],
        [UIButton(), UIButton(), UIButton()],
        [UIButton(), UIButton(), UIButton()],
        [UIButton(), UIButton(), UIButton()],
        [UIButton(), UIButton(), UIButton()]
    ]
    
    var buttonOut = UIButton()
    let buttonContinue = UIButton()
    let puzzleTable = UIImageView(image: UIImage(named: "room_batik_songket_puzzle.png")!)
    let instruction = UIImageView(image: UIImage(named: "room_batik_songket_instruction.png"))
    
    let promptWinLabel = UILabel()
    
    public init(scene: UIView) {
        super.init(frame:CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        puzzleTable.frame = CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight)
        self.addSubview(puzzleTable)
        
        createPuzzle(puzzleSize: 70.0, imageExampleSize: 25.0)
        
        instruction.frame = CGRect(x: frameWidth / 2 - 150 , y: 10, width: 320, height: frameHeight)
        self.addSubview(instruction)
        
        buttonContinue.setTitle("Click here to continue", for: .normal)
        buttonContinue.backgroundColor = UIColor.clear
        buttonContinue.frame = CGRect(x: frameWidth / 2 - 70, y: frameHeight - 80, width: 150, height: 50)
        buttonContinue.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        buttonContinue.setTitleColor(UIColor.darkGray, for: .normal)
        
        buttonContinue.titleLabel!.layer.shadowColor = UIColor.white.cgColor
        buttonContinue.titleLabel!.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        buttonContinue.titleLabel!.layer.shadowOpacity = 1.0
        buttonContinue.titleLabel!.layer.shadowRadius = 100
        buttonContinue.titleLabel!.layer.masksToBounds = false
    
        buttonContinue.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        self.addSubview(buttonContinue)
        
        if let image = UIImage(named: "btn_out.png") {
            buttonOut.setImage(image, for: .normal)
            buttonOut.frame = CGRect(x: frameWidth - 60, y: frameHeight - 60, width: 50, height: 50)
        }
        else {
            buttonOut.setTitle("Go Out", for: .normal)
            buttonOut.frame = CGRect(x: frameWidth - 60, y: frameHeight - 30, width: 80, height: 20)
        }
        buttonOut.addTarget(self, action: #selector(goOut), for: .touchUpInside)
        self.addSubview(buttonOut)
    }
    
    func createPuzzle(puzzleSize: CGFloat, imageExampleSize: CGFloat) {
        for i in 0..<puzzles.count {
            for j in 0..<puzzles[0].count {
                let posX = (frameWidth / 2 - (2.5 * puzzleSize)) + (CGFloat(i) * puzzleSize)
                let posY = (frameHeight / 2 - (1.5 * puzzleSize)) + (CGFloat(j) * puzzleSize)
                
                let examplePosX: CGFloat = frameWidth - (CGFloat(i) * imageExampleSize) - 30
                let examplePosY: CGFloat = 5 + (CGFloat(j) * imageExampleSize)
                
                puzzles[i][j].addTarget(self, action: #selector(rotate), for: .touchUpInside)
                if j % 2 == 0 {
                    if i % 2 == 1 {
                        let image = UIImage(named: "component_batik.png")?.withHorizontallyFlippedOrientation()
                        puzzles[i][j].setImage(image, for: .normal)
                        puzzles[i][j].frame = CGRect(x: posX, y: posY , width: puzzleSize, height: puzzleSize)
                        self.addSubview(puzzles[i][j])
                        
                        exampleImage[i][j].setImage(image, for: .normal)
                        exampleImage[i][j].frame = CGRect(x: examplePosX, y: examplePosY , width: imageExampleSize, height: imageExampleSize)
                        self.addSubview(exampleImage[i][j])
                    }
                    else {
                        let image = UIImage(named: "component_batik.png")
                        puzzles[i][j].setImage(image, for: .normal)
                        puzzles[i][j].frame = CGRect(x: posX, y: posY , width: puzzleSize, height: puzzleSize)
                        self.addSubview(puzzles[i][j])
                        
                        exampleImage[i][j].setImage(image, for: .normal)
                        exampleImage[i][j].frame = CGRect(x: examplePosX, y: examplePosY , width: imageExampleSize, height: imageExampleSize)
                        self.addSubview(exampleImage[i][j])
                    }
                }
                else {
                    if i % 2 == 1 {
                        let image = UIImage(named: "component_batik_2.png")?.withHorizontallyFlippedOrientation()
                        puzzles[i][j].setImage(image, for: .normal)
                        puzzles[i][j].frame = CGRect(x: posX, y: posY , width: puzzleSize, height: puzzleSize)
                        self.addSubview(puzzles[i][j])
                        
                        exampleImage[i][j].setImage(image, for: .normal)
                        exampleImage[i][j].frame = CGRect(x: examplePosX, y: examplePosY , width: imageExampleSize, height: imageExampleSize)
                        self.addSubview(exampleImage[i][j])
                    }
                    else {
                        let image = UIImage(named: "component_batik_2.png")
                        puzzles[i][j].setImage(image, for: .normal)
                        puzzles[i][j].frame = CGRect(x: posX, y: posY , width: puzzleSize, height: puzzleSize)
                        self.addSubview(puzzles[i][j])
                        
                        exampleImage[i][j].setImage(image, for: .normal)
                        exampleImage[i][j].frame = CGRect(x: examplePosX, y: examplePosY , width: imageExampleSize, height: imageExampleSize)
                        self.addSubview(exampleImage[i][j])

                    }
                }
                
                let random = Int.random(in: 0...2)
                
                angles[i][j] = random
                if random > 0 {
                    rotatePuzzle(indexI: i, indexJ: j, angle: angles[i][j])
                }
                else {
                    checkers[i][j] = true
                }
            }
        }
    }
    
    func rotatePuzzle(indexI: Int, indexJ: Int, angle: Int) {
        let currentAngle: CGFloat = (CGFloat.pi / 2) * CGFloat(angle)
        UIView.animate(withDuration: 1.5, animations: {() -> Void in
            self.puzzles[indexI][indexJ].transform = CGAffineTransform(rotationAngle: currentAngle)
        }, completion: {(_ finished: Bool) -> Void in
            self.checkingCondition(indexI: indexI, indexJ: indexJ)
        })
    }
    
    func checkingCondition(indexI: Int, indexJ: Int){
        if angles[indexI][indexJ] % 4 == 0{
            self.puzzles[indexI][indexJ].transform = .identity
            checkers[indexI][indexJ] = true
            angles[indexI][indexJ] = 0
        }
        else {
            checkers[indexI][indexJ] = false
        }
        
        if finished() {
            promptWinLabel.text = "YOU DID IT!"
            promptWinLabel.layer.shadowColor = UIColor.white.cgColor
            promptWinLabel.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
            promptWinLabel.layer.shadowOpacity = 1.0
            promptWinLabel.layer.shadowRadius = 100
            promptWinLabel.layer.masksToBounds = false
            promptWinLabel.textColor = UIColor.white
            promptWinLabel.frame = CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight)
            promptWinLabel.textAlignment = .center
            promptWinLabel.font = UIFont(name: "Arial Black", size: 32)
            promptWinLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
            self.addSubview(promptWinLabel)
            
            buttonContinue.setTitle("Continue", for: .normal)
            buttonContinue.addTarget(self, action: #selector(startGame), for: .touchUpInside)
            buttonContinue.backgroundColor = UIColor.black
            buttonContinue.setTitleColor(UIColor.white, for: .normal)
            
            buttonContinue.addTarget(self, action: #selector(goOut), for: .touchUpInside)
            
            buttonContinue.frame = CGRect(x: frameWidth / 2 - 70, y: frameHeight - 100, width: 150, height: 50)
        }
    }
    
    func finished() -> Bool {
        for i in 0..<puzzles.count {
            for j in 0..<puzzles[0].count {
                if checkers[i][j] == false {
                    return false
                }
            }
        }
        return true
    }
    
    @objc func startGame(sender: UIButton) {
        UIView.animate(withDuration: 1.0) {
            self.buttonContinue.frame = CGRect(x: self.frameWidth / 2, y: self.frameHeight, width: 0, height: 0)
            self.instruction.frame = CGRect(x: self.frameWidth / 2, y: self.frameHeight, width: 0, height: 0)
        }
    }
    
    @objc func goOut(sender: UIButton) {
        self.removeFromSuperview()
        let scene = RoomBatikSongket(scene: self)
        PlaygroundPage.current.liveView = scene
    }
    
    @objc func rotate(sender: UIButton) {
        for i in 0..<puzzles.count {
            for j in 0..<puzzles[0].count {
                if sender == puzzles[i][j] {
                    angles[i][j] = angles[i][j] + 1
                    rotatePuzzle(indexI: i, indexJ: j, angle: angles[i][j])
                }
            }
        }
    }
}
