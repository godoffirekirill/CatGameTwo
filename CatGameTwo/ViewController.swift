//
//  ViewController.swift
//  CatGameTwo
//
//  Created by Кирилл Курочкин on 23.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: -let/var
    let button = UIButton(type: .system)
    let newButton = UIButton(type: .system)
    let heightButton: CGFloat = 150
    let widthButton: CGFloat = 150
    override func viewDidLoad() {
        super.viewDidLoad()
        let randomColor = getRandomColor()
        
        let maxX: CGFloat = self.view.frame.width - widthButton
        let maxY: CGFloat = self.view.frame.height - heightButton
        
        let randomX: CGFloat = CGFloat.random(in: 0...maxX)
        let randomY: CGFloat = CGFloat.random(in: 0...maxY)
        //MARK: -IBOutlet
        button.setTitle("Click Me", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        
        button.frame = CGRect(x: randomX, y: randomY, width: widthButton, height: heightButton)
        button.layer.cornerRadius = button.frame.size.width/2
        button.backgroundColor = randomColor

        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        newButton.addTarget(self, action: #selector(buttonTwoAction), for: .touchUpInside)

        view.addSubview(button)

    }
    
    //MARK: -IBActon

    
    @IBAction func buttonAction(_ sender: UIButton) {
        
        button.removeFromSuperview()
        removeSub()
        getNewButton()
        
        
    }
    
    @IBAction func buttonTwoAction(_ sender: UIButton) {
        view.addSubview(button)
        button.removeFromSuperview()
        removeSub()
        getNewButton()
    }

    //MARK: -lifecycle funcs
   private func getRandomColor() -> UIColor {
            let randomRed = CGFloat.random(in: 0...1)
            let randomGreen = CGFloat.random(in: 0...1)
            let randomBlue = CGFloat.random(in: 0...1)
            
            return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        }
    private func getNewButton() {
        newButton.setTitle("Click Me", for: .normal)
        let maxX: CGFloat = self.view.frame.width - widthButton
        let maxY: CGFloat = self.view.frame.height - heightButton
        let randomColor = getRandomColor()
        let randomX: CGFloat = CGFloat.random(in: 0...maxX)
        let randomY: CGFloat = CGFloat.random(in: 0...maxY)
 
        newButton.frame = CGRect(x: randomX, y: randomY, width: widthButton, height: heightButton)
        newButton.layer.cornerRadius = newButton.frame.size.width/2
        newButton.backgroundColor = randomColor
        view.addSubview(newButton)
    }
    private func removeSub() {
        newButton.removeFromSuperview()
    }
    
}


