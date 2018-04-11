//
//  ViewController.swift
//  Animal Guessing
//
//  Created by Ricardo Perez on 2/1/17.
//  Copyright © 2017 Ricardo Perez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTitleOUTLET: UILabel!
    @IBOutlet weak var imvImageView: UIImageView!
    @IBOutlet weak var btnButton1: UIButton!
    @IBOutlet weak var btnButton2: UIButton!
    
    var imageArray = [#imageLiteral(resourceName: "Crocodile"),
                      #imageLiteral(resourceName: "Elephant"),
                      #imageLiteral(resourceName: "Giraffe"),
                      #imageLiteral(resourceName: "Gorilla"),
                      #imageLiteral(resourceName: "Hippopotamus"),
                      #imageLiteral(resourceName: "Lion"),
                      #imageLiteral(resourceName: "Meerkat"),
                      #imageLiteral(resourceName: "Ostrich"),
                      #imageLiteral(resourceName: "Rhinoceros"),
                      #imageLiteral(resourceName: "Zebra")]
    
    var animalNamesArray = ["Crocodile",
                            "Elephant",
                            "Giraffe",
                            "Gorilla",
                            "Hippopotamus",
                            "Lion",
                            "Meerkat",
                            "Ostrich",
                            "Rhinoceros",
                            "Zebra"]
    
    var randomNumber : Int?
    var lastRandomNumber : Int?
    var animalChoice : String?
    var wrongAnimalChoice : String?
    var buttonWithCorrectChoice : Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setButtonTitles()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressButton1(_ sender: UIButton) {
        switch buttonWithCorrectChoice! {
        case 0:
            lblTitleOUTLET.text = "That's correct!"
        case 1:
            lblTitleOUTLET.text = "Not quite, good try!"
        default:
            break
        }
    }

    @IBAction func pressButton2(_ sender: UIButton) {
        switch buttonWithCorrectChoice! {
        case 0:
            lblTitleOUTLET.text = "Not quite, good try!"
        case 1:
            lblTitleOUTLET.text = "That's correct!"
        default:
            break
        }
    }
    
    func chooseImage(){
        randomNumber = Int(arc4random_uniform(10))
        if(randomNumber == lastRandomNumber){
            chooseImage()
        }
        lastRandomNumber = randomNumber
        imvImageView.image = imageArray[randomNumber!]
        
    }
    
    func setChoice(){
        chooseImage()
        animalChoice = animalNamesArray[randomNumber!]
        let randomWrongChoice = Int(arc4random_uniform(10))
        
        //Se hace esta verificacion por que el incorrecto no puede
        //ser al mismo tiempo el correcto
        if(randomWrongChoice == randomNumber){
            setChoice()
        }
        wrongAnimalChoice = animalNamesArray[randomWrongChoice]
    }
    
    func setButtonTitles(){
        setChoice()
        buttonWithCorrectChoice = Int(arc4random_uniform(2))
        switch buttonWithCorrectChoice! {
        case 0:
            btnButton1.setTitle(animalChoice, for: UIControlState.normal)
            btnButton2.setTitle(wrongAnimalChoice, for: UIControlState.normal)
        case 1:
            btnButton2.setTitle(animalChoice, for: UIControlState.normal)
            btnButton1.setTitle(wrongAnimalChoice, for: UIControlState.normal)
        default:
            break
        }
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        setButtonTitles()
        lblTitleOUTLET.text?.removeAll()
    }
}

