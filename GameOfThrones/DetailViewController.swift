//
//  DetailViewController.swift
//  GameOfThrones
//
//  Created by Mesut Aygün on 12.05.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var wordsLabel: UILabel!
    @IBOutlet var regionLabel: UILabel!
    @IBOutlet var region: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var coatLabel: UILabel!
    @IBOutlet var textViewField: UITextView!
    
  
    
    var houseInfo : HouseInfo!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if houseInfo == nil {
            houseInfo = HouseInfo(name: "", region: "", coatOfArms: "", words: "")
        }
        
        updateUserInterface()
    }
    
    func updateUserInterface() {
        nameLabel.text = houseInfo.name
        wordsLabel.text = houseInfo.words
        if wordsLabel.text != "" {
            wordsLabel.text = "\"\(houseInfo.words)\""
        }
        regionLabel.text = houseInfo.region
        imageView.image = UIImage(named: houseInfo.region)
        textViewField.text = houseInfo.coatOfArms
        if textViewField.text == "" {
            coatLabel.isHidden = true
        }
        
    }
    

}
