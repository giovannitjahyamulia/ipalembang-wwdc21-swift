/*

import UIKit
import PlaygroundSupport

struct Recipe {
    var ingredientName: String
    var description: String
}

public class Cooking: UIView {
    var frameWidth = 600
    var frameHeight = 400
    
    // bowl to mix
    let innerBowl = UIImageView(image: UIImage(named: "component_bowl_inner.png")!)
    let outerBowl = UIImageView(image: UIImage(named: "component_bowl_outer.png")!)
    
    // recipe
    let ingredientPempek: [UIButton] = [UIButton(),UIButton(),UIButton(),UIButton(),UIButton(),UIButton()]
    let pempekRecipe: [Recipe] = [
        Recipe(ingredientName: "Grounded Fish", description: "You can also make it by yourself, use fillet and ground it with chopper"),
        Recipe(ingredientName: "Water", description: "Don't too much"),
        Recipe(ingredientName: "Garlic Paste", description: "You can also make it by yourself, use garlic cloves and ground it with chopper"),
        Recipe(ingredientName: "Salt", description: "Use how much you want"),
        Recipe(ingredientName: "MSG", description: "Just to give it more flavor"),
        Recipe(ingredientName: "Tapioca Starch", description: "Pour gradually")
    ]
    let ingredientCuko: [UIButton] = [UIButton(),UIButton(),UIButton(),UIButton(),UIButton(),UIButton()]
    let cukoRecipe: [Recipe] = [
        Recipe(ingredientName: "Gula Batok", description: "You can change it with palm sugar"),
        Recipe(ingredientName: "Asam Jawa", description: "It's tamarind "),
        Recipe(ingredientName: "Water", description: "Just pour until Gula Batook submerged"),
        
        Recipe(ingredientName: "Garlic Paste", description: "You can also make it by yourself, use garlic cloves and ground it with chopper"),
        Recipe(ingredientName: "Greenn Chili Paste", description: "Use how much you want"),
        
        Recipe(ingredientName: "Salt", description: "Use how much you want")
    ]
    
    public init(scene: UIView) {
        super.init(frame:CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        mixMixture()
        
    }
    
    
    // tahapan buat cuko
    func createCuko() {
        // air. gula batok, asam jawa
        
        // sesudah larut tambahkan cabe dan bawang
        
        // saring
    }
    
    // tahapan buat pempek
    func mixMixture(){
        innerBowl.frame = CGRect(x: frameWidth / 2 - 50, y: frameHeight / 2, width: 100, height: 50)
        outerBowl.frame = CGRect(x: frameWidth / 2 - 50, y: frameHeight / 2 + 30, width: 100, height: 35)
        
        self.addSubview(innerBowl)
        self.addSubview(outerBowl)
        
        outerBowl.layer.zPosition = 1000
        
        for i in 0..<ingredientPempek.count {
            ingredientPempek[i].frame = CGRect(x: 50 + (50 * i), y: 50, width: 50, height: 50)
//            ingredientPempek[i].setImage(UIImage(named: "component_\(String(pempekRecipe[i].ingredientName.lowercased()).replacingCharacters(in: " ", with: "_")).png"), for: .normal)
            
            ingredientPempek[i].addTarget(self, action: #selector(addIngredientToBowl), for: .touchUpInside)
            self.addSubview(ingredientPempek[i])
        }
    }
    
    func formPempek () {
        
    }
    
    func cookPempek (){
        
        
    }
    
    @objc func addIngredientToBowl(sender: UIButton){
        for i in 0..<ingredientPempek.count {
            UIImageView(image: UIImage(named: "component_cook_grounded_fish"))
            groundedFishInBowl.frame = CGRect(x: frameWidth / 2 - 40, y: frameHeight / 2 + 20, width: 20, height: 20)
            self.addSubview(groundedFishInBowl)
        }
    }
}
*/
