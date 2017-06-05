//
//  InstructionsViewController.swift
//  FinalMemoryGame
//
//  Created by samuelhan on 5/5/17.
//  Copyright © 2017 Samuel Han. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
     
        let text = UITextView(frame: CGRect(x: 50, y: 50, width: 300, height: 600))
        text.font = .systemFont(ofSize: 30)
        
        text.text = "Welcome to the Memory Game! There are 16 tiles, two of each have the same image. Once you start, you'll have 10 seconds to look at the pictures before they get covered. Don't try to cheat by going back! The tiles will randomize each time you go back! Once you get all the matching tiles, you're done! Good luck!"
        
        view.addSubview(text)
        
    }

   
}
