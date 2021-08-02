//
//  ViewController.swift
//  Task_number_3
//
//  Created by Кирилл Блохин on 26.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    static private  let model = Text()
    
    private let sumButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 750, width: 170, height: 70))
        button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        button.setTitle(NSLocalizedString("addition", comment: ""), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(touchSumButton(sender:)), for: .touchUpInside )
        return button
    }()
    
    private var guessButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 225, y: 750, width: 170, height: 70))
        button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        button.setTitle(NSLocalizedString("guess_the_number", comment: ""), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(touchGuessButton(sender:)), for: .touchUpInside )
        return button
    }()
    
    private var startButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 125, y: 600, width: 170, height: 70))
        button.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        button.setTitle(NSLocalizedString("to_begin", comment: ""), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(reversed), for: .touchUpInside )
        return button
    }()
    
    private var startLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 125, y: 500, width: 170, height: 70))
        label.font = label.font.withSize(20)
        label.textColor = #colorLiteral(red: 0.9999071956, green: 1, blue: 0.999881804, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = true
        label.textAlignment = .center
        return label
    }()
    
    private var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 50, width: 400, height: 70))
        label.text = NSLocalizedString("hello3", comment: "")
        label.font = label.font.withSize(20)
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        return label
    }()
    
    private var sumLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 200, width: 170, height: 170))
        label.textAlignment = .center
        label.font = label.font.withSize(20)
        label.textColor = #colorLiteral(red: 0.9999071956, green: 1, blue: 0.999881804, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = true
        return label
    }()
    
    private var guessLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 225, y: 200, width: 170, height: 170))
        label.textAlignment = .center
        label.font = label.font.withSize(20)
        label.textColor = #colorLiteral(red: 0.9999071956, green: 1, blue: 0.999881804, alpha: 1)
        label.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(sumButton)
        self.view.addSubview(guessButton)
        self.view.addSubview(nameLabel)
        self.view.addSubview(sumLabel)
        self.view.addSubview(guessLabel)
        self.view.addSubview(startButton)
        self.view.addSubview(startLabel)
        
        view.backgroundColor = #colorLiteral(red: 0.9999071956, green: 1, blue: 0.999881804, alpha: 1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        hello()
    }
    
    @objc func touchSumButton(sender: UIButton!){
        let alertController = UIAlertController(title: NSLocalizedString("sum", comment: ""), message: NSLocalizedString("enter_two_numbers", comment: ""), preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            let text = alertController.textFields?[0]
            let text2 = alertController.textFields?[1]
            self.sumLabel.text = (String(Int(text?.text ?? "0")! + Int(text2?.text ?? "0")!))
        }
        
        alertController.addTextField { (textField) in
            textField.keyboardType = .numberPad
        }
        alertController.addTextField { (textField) in
            textField.keyboardType = .numberPad
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @objc func touchGuessButton(sender: UIButton!){
        let alertController = UIAlertController(title:NSLocalizedString("guess_the_number", comment: ""), message: NSLocalizedString("Please_enter_a_number_from_1_to_10", comment: ""), preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            let text = alertController.textFields?.first
            let array = [1, 2, 3]
            let random = array.randomElement()
            
            if text?.text == String(random!) {
                self.guessLabel.text = NSLocalizedString("win", comment: "")
            } else if self.guessLabel.text != String(random!){
                self.guessLabel.text = NSLocalizedString("losing", comment: "")
            }
        }
        
        alertController.addTextField { (textField) in
            textField.keyboardType = .numberPad
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func hello(){
        let alertController = UIAlertController(title: NSLocalizedString("hello1", comment: ""), message: NSLocalizedString("enter_your_name", comment: ""), preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            let text = alertController.textFields?.first
            if text?.text == ""{
                self.nameLabel.text! += NSLocalizedString("user", comment: "") + " " + "!"
            } else if text?.text != ""{
                self.nameLabel.text! += (text?.text)! + " " + "!"
            }
        }
        
        alertController.addTextField { (textField) in
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @objc func reversed(sender: UIButton!)  {
        let alertController = UIAlertController(title: NSLocalizedString("hello1", comment: ""), message: NSLocalizedString("enter_a_word", comment: ""), preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            let text = alertController.textFields?.first
            self.startLabel.text = ViewController.model.hello(word: (text?.text)!)
        }
        
        alertController.addTextField { (textField) in
        }
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}
