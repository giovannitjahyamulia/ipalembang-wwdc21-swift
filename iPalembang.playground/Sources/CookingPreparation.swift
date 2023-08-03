import UIKit
import PlaygroundSupport

struct Ingredients {
    let name: String
    let qty: Int
    var pempekRecipe: Bool
    var cukoRecipe: Bool
    var isFounded: Bool
    let image: String
    let coordinat: [Float]
    let size: [Float]
    let place: String
}

var ingredients: [Ingredients] = [
    Ingredients(name: "Salt", qty: 1, pempekRecipe: true, cukoRecipe: true, isFounded: false, image: "salt", coordinat: [411, 47], size: [11, 21], place: "Main"),
    Ingredients(name: "Black Pepper", qty: 1, pempekRecipe: false, cukoRecipe: false, isFounded: false, image: "blackpepper", coordinat: [423.62, 47], size: [11, 21], place: "Main"),
    Ingredients(name: "Pepper", qty: 1, pempekRecipe: false, cukoRecipe: false, isFounded: false, image: "pepper", coordinat: [436.21, 47], size: [11, 21], place: "Main"),
    Ingredients(name: "Sugar", qty: 1, pempekRecipe: true, cukoRecipe: true, isFounded: false, image: "sugar", coordinat: [449.48, 44], size: [20, 26], place: "Main"),
    Ingredients(name: "MSG", qty: 1, pempekRecipe: true, cukoRecipe: false, isFounded: false, image: "msg", coordinat: [470, 44], size: [20, 26], place: "Main"),
    Ingredients(name: "Water", qty: 1, pempekRecipe: true, cukoRecipe: true, isFounded: false, image: "water", coordinat: [380, 129], size: [30, 42], place: "Main"),
    
    Ingredients(name: "Flour", qty: 1, pempekRecipe: false, cukoRecipe: false, isFounded: false, image: "flour", coordinat: [65.3, 1.74], size: [132, 157], place: "Cupboard"),
    Ingredients(name: "Tapioca Starch", qty: 1, pempekRecipe: true, cukoRecipe: false, isFounded: false, image: "tapioca", coordinat: [396, 0], size: [131, 156], place: "Cupboard"),
    Ingredients(name: "Gula Batok", qty: 1, pempekRecipe: false, cukoRecipe: true, isFounded: false, image: "gula_batok", coordinat: [70.34, 206.36], size: [132, 96], place: "Cupboard"),
    Ingredients(name: "Asam Jawa", qty: 1, pempekRecipe: false, cukoRecipe: true, isFounded: false, image: "asam_jawa", coordinat: [380, 235], size: [163, 48], place: "Cupboard"),
    
    Ingredients(name: "Garlic Paste", qty: 1, pempekRecipe: true, cukoRecipe: true, isFounded: false, image: "garlic_paste", coordinat: [212, 21], size: [57, 65], place: "Refrigator"),
    Ingredients(name: "Green Chili Paste", qty: 1, pempekRecipe: false, cukoRecipe: true, isFounded: false, image: "green_chili_paste", coordinat: [275, 21], size: [57, 65], place: "Refrigator"),
    Ingredients(name: "Grounded Fish", qty: 1, pempekRecipe: true, cukoRecipe: false, isFounded: false, image: "grounded_fish", coordinat: [25.3, 123.72], size: [126, 73], place: "Refrigator"),
    Ingredients(name: "Egg", qty: 1, pempekRecipe: true, cukoRecipe: false, isFounded: false, image: "egg", coordinat: [394.96, 172], size: [27.39, 36], place: "Refrigator")
]


public class CookingPreparation: UIView {
    var frameWidth = 600
    var frameHeight = 400
    
    var background = UIImageView(image: UIImage(named: "room_kitchen.png")!)
    let object: [UIButton] = [ UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton(), UIButton()]
    let buttonGoOutside = UIButton(type: .custom)
    let buttonOpenCupboard = UIButton()
    let buttonOpenRefrigator = UIButton()
    let buttonMaps = UIButton(type: .custom)
    let buttonHistory  = UIButton(type: .custom)
    let buttonStart = UIButton()
    let titleLabel = UILabel()
    
    let recipe = UIImageView(image: UIImage(named: "recipe_pempek.png")!)
    
    // history
    let bacgroundHistory = UIImageView(image: UIImage(named: "bg_book.png")!)
    let pempekLabel = UILabel()
    let pempekHistoryLabel = UILabel()
    
    var showHistory: Bool = false
    var isShowPempek: Bool = false
    
    var introduction: [String] = [
        "Good Afternoon and welcome to our store",
        "Today we will do a cooking demo",
        "Today's menu is Empek-Empek",
        "For today cooking session, I need an assistant",
        "How about you there?",
        "(And then you go there)",
        "Thank you for coming",
        "First we need to prepare the ingredients for Empek-Empek",
        "",
        "Great! Now we need to prepare the ingredients for Cuko",
        "",
        "Fantastic, now we can start to cooking!",
        "(After a while...)",
        "Alright, we already finsih the cooking, let's eat!"
    ]
    var index: Int = 0
    
    var searchedFor: String = "Pempek"
    
    public init(scene: UIView) {
        super.init(frame:CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        background.frame = CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight)
        background.translatesAutoresizingMaskIntoConstraints = true
        self.addSubview(background)
        
        createObject()
        showObject(place: "Main")
        
        createButton()
        
        createHistoryBook(title: "Pempek", description: "Pempek or Empek-Empek is a typical Palembang food made from finely ground fish meat mixed with starch or sago flour, as well as the composition of several other ingredients such as eggs, mashed garlic, flavorings, and salt. Pempek is usually served with cuko which has a sour, sweet, and spicy taste.\n\nPempek has existed in Palembang since the arrival of Chinese immigrants to Palembang, namely around the 16th century, when Sultan Mahmud Badaruddin II was in power in the Palembang-Darussalam sultanate. Traditionally, the name empek-empek or pempek is believed to have originated from the term apek or pek-pek, which is the name for uncle or old Chinese man.")
        
        intro()
    }
    
    func intro() {
        titleLabel.text = introduction[0]
        titleLabel.textColor = UIColor.white
        titleLabel.frame = CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight)
        titleLabel.textAlignment = .center
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 30
        titleLabel.font = UIFont(name: "Arial", size: 14)
        titleLabel.backgroundColor = UIColor.black
        titleLabel.frame = CGRect(x: 0, y: frameHeight - 120, width: frameWidth, height: 100)
        self.addSubview(self.titleLabel)
        
        buttonStart.setTitle("", for: .normal)
        buttonStart.backgroundColor = UIColor.clear
        buttonStart.frame = CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight)
        buttonStart.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        buttonStart.setTitleColor(UIColor.white, for: .normal)
        buttonStart.layer.cornerRadius = 4
        buttonStart.addTarget(self, action: #selector(self.nextIntro), for: .touchUpInside)
        self.addSubview(buttonStart)
    }
    
    func next(){
        self.index = self.index + 1
        if index == 8 {
            buttonStart.isHidden = true
            titleLabel.text = ""
            
            showRecipe()
        }
        else if index == 10 {
            buttonStart.isHidden = true
            titleLabel.text = ""
            showRecipe()
        }
        else if index < introduction.count {
            buttonStart.isHidden = false
            UIView.animate(withDuration: 0.5, animations: {() -> Void in
                self.titleLabel.text = self.introduction[self.index]
            })
            recipe.alpha = 0
        }
        else {
            buttonStart.isHidden = true
            titleLabel.isHidden = true
            
            hideAllObject()
            
            background.image = UIImage(named: "room_kitchen.png")
            
            UIView.animate(withDuration: 0.5, animations: {() -> Void in
                let pempek = UIButton()
                let image = UIImage(named: "pempek.png")
                pempek.setImage(image, for: .normal)
                pempek.frame = CGRect(x: 128, y: 180 , width: 90, height: 30)
                self.addSubview(pempek)
            })
        }
    }
    
    func showRecipe(){
        recipe.alpha = 1
        if searchedFor == "Pempek" {
            recipe.image = UIImage(named: "recipe_pempek.png")
            recipe.frame = CGRect(x: 215, y: frameHeight - 110, width: frameWidth - 430, height: 80)
        }
        else {
            recipe.image = UIImage(named: "recipe_cuko.png")
            recipe.frame = CGRect(x: 225, y: frameHeight - 110, width: frameWidth - 450, height: 80)

        }
        self.addSubview(recipe)
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
        
        buttonOpenCupboard.setTitle("Open Cupboard", for: .normal)
        buttonOpenCupboard.backgroundColor = UIColor.clear
        buttonOpenCupboard.frame = CGRect(x: 125, y: 30, width: 150, height: 50)
        buttonOpenCupboard.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        buttonOpenCupboard.setTitleColor(UIColor.darkGray, for: .normal)
        
        buttonOpenCupboard.titleLabel!.layer.shadowColor = UIColor.black.cgColor
        buttonOpenCupboard.titleLabel!.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        buttonOpenCupboard.titleLabel!.layer.shadowOpacity = 1.0
        buttonOpenCupboard.titleLabel!.layer.shadowRadius = 100
        buttonOpenCupboard.titleLabel!.layer.masksToBounds = false
        
        buttonOpenCupboard.addTarget(self, action: #selector(openCupboard), for: .touchUpInside)
        
        buttonOpenRefrigator.setTitle("Open Refrigator", for: .normal)
        buttonOpenRefrigator.backgroundColor = UIColor.clear
        buttonOpenRefrigator.frame = CGRect(x: frameWidth - 120, y: frameHeight / 2, width: 120, height: 50)
        buttonOpenRefrigator.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        buttonOpenRefrigator.setTitleColor(UIColor.white, for: .normal)
        
        buttonOpenRefrigator.titleLabel!.layer.shadowColor = UIColor.black.cgColor
        buttonOpenRefrigator.titleLabel!.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        buttonOpenRefrigator.titleLabel!.layer.shadowOpacity = 1.0
        buttonOpenRefrigator.titleLabel!.layer.shadowRadius = 100
        buttonOpenRefrigator.titleLabel!.layer.masksToBounds = false
        
        buttonOpenRefrigator.addTarget(self, action: #selector(openRefrigator), for: .touchUpInside)
        
        self.addSubview(buttonOpenCupboard)
        self.addSubview(buttonOpenRefrigator)
        
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
            buttonGoOutside.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
        }
        else {
            buttonGoOutside.setTitle("Go Out", for: .normal)
            buttonGoOutside.frame = CGRect(x: frameWidth - 150, y: frameHeight - 30, width: 80, height: 20)
        }
        buttonGoOutside.addTarget(self, action: #selector(goOutside), for: .touchUpInside)
        self.addSubview(buttonGoOutside)
        buttonGoOutside.alpha = 0
    }
    
    func createHistoryBook(title: String, description: String){
        pempekLabel.text = title
        pempekLabel.textColor = UIColor.black
        pempekLabel.textAlignment = .center
        pempekLabel.font = UIFont(name: "Bradley Hand", size: 18)
        
        pempekHistoryLabel.text = description
        pempekHistoryLabel.lineBreakMode = .byWordWrapping
        pempekHistoryLabel.numberOfLines = 30
        pempekHistoryLabel.textColor = UIColor.darkGray
        pempekHistoryLabel.textAlignment = .center
        pempekHistoryLabel.font = UIFont(name: "Bradley Hand", size: 12)
        
        bacgroundHistory.frame = CGRect(x: frameWidth + 100, y: frameHeight, width: 0, height: 0)
        pempekLabel.frame = CGRect(x: self.frameWidth / 2 - 80, y: 50, width: 250, height: 50)
        pempekHistoryLabel.frame = CGRect(x: self.frameWidth / 2 - 80, y: 75, width: 250, height: 100 + self.frameHeight / 2)
        
        pempekLabel.alpha = 0
        pempekHistoryLabel.alpha = 0
        
        self.addSubview(bacgroundHistory)
        self.addSubview(pempekLabel)
        self.addSubview(pempekHistoryLabel)
    }
    
    func createObject() {
        for i in 0..<ingredients.count {
            let image = UIImage(named: "component_\(ingredients[i].image).png")
            object[i].setImage(image, for: .normal)
            object[i].frame = CGRect(x: Int(ingredients[i].coordinat[0]), y: Int(ingredients[i].coordinat[1]) , width: Int(ingredients[i].size[0]), height: Int(ingredients[i].size[1]))
            object[i].addTarget(self, action: #selector(pick), for: .touchUpInside)
            
            self.addSubview(object[i])
            object[i].alpha = 0
            object[i].isEnabled = false
        }
    }
    
    func hideAllObject(){
        for i in 0..<ingredients.count {
            object[i].alpha = 0
            object[i].isEnabled = false
        }
    }
    
    func showObject(place: String){
        if place == "Main" {
            background.image = UIImage(named: "room_kitchen.png")
            buttonGoOutside.alpha = 0
            buttonOpenRefrigator.alpha = 1
            buttonOpenCupboard.alpha = 1
        }
        else {
            background.image = UIImage(named: "room_kitchen_\(place.lowercased()).png")
            buttonGoOutside.alpha = 1
            buttonOpenRefrigator.alpha = 0
            buttonOpenCupboard.alpha = 0
        }
        
        for i in 0..<ingredients.count {
            if !ingredients[i].isFounded && ingredients[i].place == place{
                object[i].alpha = 1
                object[i].isEnabled = true
            }
            else {
                object[i].alpha = 0
                object[i].isEnabled = false
            }
        }
    }
    
    func pempekRecipeChecker() -> Bool {
        for i in 0..<ingredients.count {
            if ingredients[i].pempekRecipe {
                if ingredients[i].isFounded == false  {
                    return false
                }
            }
        }
        return true
    }
    
    func cukoRecipeChecker() -> Bool {
        for i in 0..<ingredients.count {
            if ingredients[i].cukoRecipe {
                if ingredients[i].isFounded == false  {
                    return false
                }
            }
        }
        return true
    }
    
    @objc func nextIntro(sender: UIButton) {
        next()
    }
    
    @objc func seeMaps(sender: UIButton) {
        self.removeFromSuperview()
        let scene = Maps(scene: self)
        PlaygroundPage.current.liveView = scene
    }
    
    @objc func openCupboard(sender: UIButton) {
        showObject(place: "Cupboard")
    }
    
    @objc func openRefrigator(sender: UIButton) {
        showObject(place: "Refrigator")
    }
    
    @objc func goOutside(sender: UIButton) {
        showObject(place: "Main")
    }
    
    @objc func seeHistory(sender: UIButton) {
        if showHistory {
            showHistory = false
            
            UIView.animate(withDuration: 0.5, animations: { [self]() -> Void in
                pempekLabel.alpha = 0
                pempekHistoryLabel.alpha = 0
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
                    pempekLabel.alpha = 1
                    pempekHistoryLabel.alpha = 1
                })
            })
        }
    }
    
    @objc func pick(sender: UIButton) {
        for i in 0..<ingredients.count {
            if sender == object[i] {
                if searchedFor == "Pempek" {
                    if ingredients[i].pempekRecipe {
                        object[i].alpha = 0
                        ingredients[i].isFounded = true
                    }
                    else {
                        
                    }
                    if pempekRecipeChecker() {
                        for i in 0..<ingredients.count {
                            ingredients[i].isFounded = false
                        }
                        searchedFor = "Cuko"
                        buttonStart.isHidden = false
                        next()
                    }
                }
                else if searchedFor == "Cuko" {
                    if ingredients[i].cukoRecipe {
                        object[i].alpha = 0
                        ingredients[i].isFounded = true
                    }
                    if cukoRecipeChecker() {
                        buttonStart.isHidden = false
                        next()
                    }
                }
            }
        }
    }
}
