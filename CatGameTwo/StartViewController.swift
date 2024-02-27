//
//  StartViewController.swift
//  CatGameTwo
//
//  Created by Кирилл Курочкин on 23.01.2024.
//

import UIKit

class StartViewController: UIViewController {
    let button = UIButton(type: .system)
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
        button.setTitle("Start game", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        
        button.frame = CGRect(x: randomX, y: randomY, width: widthButton, height: heightButton)
        button.layer.cornerRadius = button.frame.size.width/2
        button.backgroundColor = randomColor

        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(button)

    }
    @IBAction func buttonAction(_ sender: UIButton) {
        
        guard let controler = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {return}
        controler.modalPresentationStyle = .fullScreen
        present(controler, animated: true,completion: nil)
        
        
    }



}
extension StartViewController {
    func getRandomColor() -> UIColor {
             let randomRed = CGFloat.random(in: 0...1)
             let randomGreen = CGFloat.random(in: 0...1)
             let randomBlue = CGFloat.random(in: 0...1)
             
             return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
         }
}
