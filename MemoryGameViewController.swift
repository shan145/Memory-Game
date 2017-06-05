//
//  MemoryGameViewController.swift
//  FinalMemoryGame
//
//  Created by samuelhan on 5/6/17.
//  Copyright © 2017 Samuel Han. All rights reserved.
//

import UIKit

extension MutableCollection where Index == Int {
    mutating func shuffle() {
        if count < 2 { return }
        for i in startIndex ..< endIndex - 1 {
            let j = Int(arc4random_uniform(UInt32(endIndex - i))) + i
            if i != j {
                swap(&self[i], &self[j])
            }
        }
    }
}

class MemoryGameViewController: UIViewController {
    
    var cards = [UIImageView]()
    var matchingCards = [UIImageView]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        getCards()
        setUpView()
        Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false) { (timer: Timer) in
            self.coverCards()
        }
        
    }
    
    func getCards() {
        let card1 = UIImageView(image: #imageLiteral(resourceName: "hillary"))
        let card2 = UIImageView(image: #imageLiteral(resourceName: "barney"))
        let card3 = UIImageView(image: #imageLiteral(resourceName: "elmo"))
        let card4 = UIImageView(image: #imageLiteral(resourceName: "bernie"))
        let card5 = UIImageView(image: #imageLiteral(resourceName: "donaldtrump"))
        let card6 = UIImageView(image: #imageLiteral(resourceName: "obama"))
        let card7 = UIImageView(image: #imageLiteral(resourceName: "bigbird"))
        let card8 = UIImageView(image: #imageLiteral(resourceName: "cookiemonster"))
        let card9 = UIImageView(image: #imageLiteral(resourceName: "hillary"))
        let card10 = UIImageView(image: #imageLiteral(resourceName: "barney"))
        let card11 = UIImageView(image: #imageLiteral(resourceName: "elmo"))
        let card12 = UIImageView(image: #imageLiteral(resourceName: "bernie"))
        let card13 = UIImageView(image: #imageLiteral(resourceName: "donaldtrump"))
        let card14 = UIImageView(image: #imageLiteral(resourceName: "obama"))
        let card15 = UIImageView(image: #imageLiteral(resourceName: "bigbird"))
        let card16 = UIImageView(image: #imageLiteral(resourceName: "cookiemonster"))

        
        cards = [card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12, card13, card14, card15, card16]
        
    }
    
    func setUpView() {
        
        var x_pos: CGFloat = 0
        var y_pos: CGFloat = 80
        cards.shuffle()
        for card in cards{
            card.frame = CGRect(x: x_pos, y: y_pos, width: 100, height: 150)
            view.addSubview(card)
            if(x_pos < 330 && y_pos <= 560){
                x_pos = x_pos + 110
            }
            else if(x_pos >= 330){
                x_pos = 0
                y_pos = y_pos + 160
            }
            
        }
    }
    
    func coverCards() {
        for card in cards{
            card.isHidden = true
        }
    }
    
    func checkIfMatch() {
        if(matchingCards.count == 2) {
            if(matchingCards[0].image == matchingCards[1].image){
                for card in matchingCards{
                    Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) { (timer: Timer) in
                        card.image = UIImage(named: "like")
                    }
                }
            }
                
            else{
                for card in matchingCards{
                    Timer.scheduledTimer(withTimeInterval: 0.75, repeats: false) { (timer: Timer) in
                        card.isHidden = true
                    }
                }
            }
            matchingCards.removeAll()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: view)  {
            for card in cards{
                if card.frame.contains(location){
                    card.isHidden = false
                    matchingCards.append(card)
                    checkIfMatch()
                }
            }
        }
    }
    
}
