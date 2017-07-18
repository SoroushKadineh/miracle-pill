//  ViewController.swift
//  Miracle Pills
//
//  Created by Soroush Kadineh on 7/6/17.
//  Copyright © 2017 Soroush Kadineh. All rights reserved.
//
/*
 
 state pickerView is hidden initially
 successImageLabel is hidden initially
 gave tags 1 through 17 to objects in viewcontroller, so i can hide them all once buy now button is pressed
 
 */

import UIKit

//adding some protocals here; UIPickerViewDataSource provides data for the state pickerView
//UIPickerViewDelegate handles the scrolling, and what data is selected   
//need to "initialize" statePickerView to these protocals
class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    //IBOutlet for the state pickerView
    @IBOutlet weak var statePickerView: UIPickerView!
    
    //need the state button to be label, so when user picked the satet, the text of the button should be changed to that specific state
    @IBOutlet weak var stateButtonLabel: UIButton!
    
    
    @IBOutlet weak var pillImage: UIImageView!
    @IBOutlet weak var miraclePriceLabl: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var viewBar: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var streetTF: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryTF: UITextField!
    @IBOutlet weak var zipcodeLabel: UILabel!
    @IBOutlet weak var zipcodeTF: UITextField!
    @IBOutlet weak var buyImage: UIButton!
    
    @IBOutlet weak var successImageLabel: UIImageView!
    
    let states = ["Alaska", "Alabama", "Arkansas", "American Samoa", "Arizona", "California", "Colorado", "Connecticut", "District of Columbia", "Delaware", "Florida", "Georgia", "Guam", "Hawaii", "Iowa", "Idaho", "Illinois", "Indiana", "Kansas", "Kentucky", "Louisiana", "Massachusetts", "Maryland", "Maine", "Michigan", "Minnesota", "Missouri", "Mississippi", "Montana", "North Carolina", "North Dakota", "Nebraska", "New Hampshire", "New Jersey", "New Mexico", "Nevada", "New York", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Puerto Rico", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Virginia", "Virgin Islands", "Vermont", "Washington", "Wisconsin", "West Virginia", "Wyoming"]
  
    override func viewDidLoad() {
        
        //initializing the statePickerView to UIPickerViewDataSource and UIPickerViewDelegate
        statePickerView.dataSource = self
        statePickerView.delegate   = self
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //the actual state button
    @IBAction func stateButtonAction(_ sender: UIButton) {
        //unhides the state picker view once the state button is pressed
        statePickerView.isHidden = false
        
        //making sure country and zip code are hidden
        countryLabel.isHidden = true
        countryTF.isHidden = true
        zipcodeLabel.isHidden = true
        zipcodeTF.isHidden = true
    }

//when pickerView loads on the screen, it will call the followings
//remeber to keep the followings outside of any loops; independent
    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1  //we have 1 column of states
    }
    
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count //returns the number of states in the states array
    }
    
    //returns either a plain NSString, a NSAttributedString, or a view (e.g UILabel) to display the row for the component
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]   //returns the name of a state for each row, and each is a string type, we have about 50 rows
    }
    
    //if a row is selected ...
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //hides the state picker view once a row is selected
        statePickerView.isHidden = true
        
        //setting the state button label's title to the selected state
        //states[row] is a string and .normal is the UIControlState; mainly we have normal/default, highlighted, selected, and disabled for state config (can find these in the attribute inspector)
        stateButtonLabel.setTitle(states[row], for: .normal)
        
        //making sure country and zip code are shown after state selection
        countryLabel.isHidden = false
        countryTF.isHidden = false
        zipcodeLabel.isHidden = false
        zipcodeTF.isHidden = false
        
    }
    
    //we want screen to be clear, and only show the success image
    @IBAction func buyImageButton(_ sender: UIButton) {
        
        //making every view hidden in view controller, but only making success image shown 
        for i in 1...17 {
            view.viewWithTag(i)?.isHidden = true
        }
        
        //showing the success image only
        successImageLabel.isHidden = false
    }
    
}

