//
//  ViewController.swift
//  Concentration
//
//  Created by Mahesh Kumaran on 16/08/18.
//  Copyright © 2018 Mahesh Kumaran. All rights reserved.
//

import UIKit


class ViewController: UIViewController  {
    
    
    // Lazy  -  initializes only when the gane is used , meantime cardButtons get initialized
    lazy var game = Concentration(numberOfPairOfCards: (cardButtons.count + 1 ) / 2 )

    //THEMESETTER
    
    var emojiChoices = ["🦇","😱","🙀","😈","🎃","👻","🍭","🍬","🍎"]
    
    var windowBackGround : UIColor = UIColor.black {
        didSet{
            view.backgroundColor = windowBackGround
        }
    }
    
    
    var themeColor : UIColor = UIColor.orange
    var flipColor : UIColor = UIColor.white
    var emoji = [Int : String]()
    
    
    // OUTLET CONNECTIONS
    
    @IBOutlet weak var themeShuffler: UIButton!
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var resetButton: UIButton!
    
    
    //VIEW DID LOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardButtons.forEach { (button) in button.layer.cornerRadius = 10.0}
    }
    
    // TOUCH CARD ACTION HANDLER
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        if let cardNumber = cardButtons.index(of: sender){
            
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    
    // UPDATE THE VIEW WITH EMOJIS FROM THE MODEL
    
    func updateViewFromModel(){
        
        print(emojiChoices)
        
        for index in cardButtons.indices{
            
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if(card.isFaceUp){
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = flipColor
            }
            else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : themeColor
            }
        }
    }
    
    // ASSIGNING THE EMOJI'S TO THE CARD
    
    func emoji(for Card : Card) -> String {
        if emoji[Card.identifier] == nil , emojiChoices.count > 0 {
            let randomIndex =  Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[Card.identifier] = emojiChoices.remove(at: randomIndex)
    
        }
        return emoji[Card.identifier] ?? "?"
    }
    
    
    // RESET THE GAME
    
    @IBAction func resetNewGame(_ sender: UIButton) {
    
        for index in  cardButtons.indices{
    
            let button = cardButtons[index]
            var card = game.cards[index]
            card.isFaceUp = false
            card.isMatched = false
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = self.themeColor
            game.cards[index] = card
    
        }
        game.cards.shuffle()
    }

    // GAME THEME SHUFFLER
    
    
    @IBAction func shuffler(_ sender: UIButton) {
        
        //        let randomTheme = Int(arc4random_uniform(UInt32(1)))
        
        let randomTheme = 0
        
        switch randomTheme {
            
        case 0:
            
            // CHANGING EMOJIS
            
            emojiChoices.removeAll()
            
            cardButtons.forEach{ button in
                button.setTitle("", for: UIControlState.normal)
                themeColor =  UIColor.blue
                button.backgroundColor = themeColor
            }
            
            updateViewFromModel()
            windowBackGround = UIColor.white
            themeShuffler.backgroundColor = UIColor.blue
            resetButton.backgroundColor = UIColor.blue
            
        default:
            break
            
        }
        
        
    }
    
    



















}// END OF THE VIEWCONTROLLER












