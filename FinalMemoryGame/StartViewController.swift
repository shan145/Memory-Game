//
//  StartViewController.swift
//  FinalMemoryGame
//
//  Created by samuelhan on 5/5/17.
//  Copyright © 2017 Samuel Han. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        
        let memoryImage = UIImageView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        memoryImage.image = #imageLiteral(resourceName: "memory")
        view.addSubview(memoryImage)
        
        let gameImage = UIImageView(frame: CGRect(x: 180, y: 240, width: 70, height: 50))
        gameImage.image = #imageLiteral(resourceName: "game")
        view.addSubview(gameImage)
        
        let instructbutton = UIButton(frame: CGRect(x: 100, y: 350, width: 200, height: 50))
        instructbutton.setTitle("Instructions", for: .normal)
        instructbutton.setTitleColor(UIColor.blue, for: .normal)
        instructbutton.addTarget(self, action: #selector(instructionsPressed), for: .touchUpInside)
        view.addSubview(instructbutton)
        
        let startbutton = UIButton(frame: CGRect(x: 100, y: 400, width: 200, height: 50))
        startbutton.setTitle("Start", for: .normal)
        startbutton.setTitleColor(UIColor.blue, for: .normal)
        startbutton.addTarget(self, action: #selector(startPressed), for: .touchUpInside)
        view.addSubview(startbutton)
    }

    func startPressed() {
        navigationController?.pushViewController(MemoryGameViewController(), animated: true)
    }
    
    func instructionsPressed() {
        navigationController?.pushViewController(InstructionsViewController(), animated: true)
    }
    
}
