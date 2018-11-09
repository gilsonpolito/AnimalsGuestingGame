//
//  ViewController.swift
//  AnimalsGuestingGame
//
//  Created by pos on 09/11/2018.
//  Copyright © 2018 pos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    var imageArray = [UIImage(named: "cachorro"),UIImage(named: "foca"),UIImage(named: "galo"),UIImage(named: "girafa"),UIImage(named: "leao"),UIImage(named: "lobo"),UIImage(named: "panda"),]
    
    var animalsArray = ["cachorro", "foca", "galo", "girafa", "leao", "lobo", "panda"]
    var ramdomNumber: Int?
    var lastRamdomNumber: Int?
    var animalChoice: String!
    var wrongAnimalChoice: String!
    var buttonWithCorrectChoice: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonTitles()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func pressButton1(_ sender: UIButton) {
        switch buttonWithCorrectChoice! {
        case 0:
            titleLabel.text = "That's correct"
        case 1:
            titleLabel.text = "Not quite, good try."
        default:
            break
        }
    }
    
    @IBAction func pressButton2(_ sender: UIButton) {
        switch buttonWithCorrectChoice! {
        case 0:
            titleLabel.text = "Not quite, good try."
        case 1:
            titleLabel.text = "That's correct"
        default:
            break
        }
    }
    
    func chooseImage(){
        ramdomNumber = Int(arc4random_uniform(6))
        if ramdomNumber == lastRamdomNumber{
            chooseImage()
        }
        
        lastRamdomNumber = ramdomNumber
        imageView.image = imageArray[ramdomNumber!]
    }
    
    func setChoice(){
        chooseImage()
        animalChoice = animalsArray[ramdomNumber!]
        let randomWrongChoice = Int(arc4random_uniform(6))
        if(randomWrongChoice == ramdomNumber){
            setChoice()
        }
        wrongAnimalChoice = animalsArray[randomWrongChoice]
    }
    
    func setButtonTitles(){
        setChoice()
        buttonWithCorrectChoice = Int(arc4random_uniform(2))
        switch buttonWithCorrectChoice! {
        case 0:
            button1.setTitle(animalChoice, for:UIControl.State.normal)
            button2.setTitle(wrongAnimalChoice, for:UIControl.State.normal)
        case 1:
            button1.setTitle(wrongAnimalChoice, for:UIControl.State.normal)
            button2.setTitle(animalChoice, for:UIControl.State.normal)
        default:
            break
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        setButtonTitles()
        titleLabel.text?.removeAll()
    }
    
}

