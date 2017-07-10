//
//  ViewController.swift
//  First Real Project
//
//  Created by Matthew on 7/8/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {
   var note:NoteElements?
     @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // It makes sense to put this line of code above in the view did load function beacuse we want the text field in the view controller to be set to an empty string when THE VIEW DOES LOAD
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
       
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
var listNotesTableViewController  = segue.destination as! TableViewController
            if segue.identifier == "Save" {
                
                print("Save button tapped")
                    let note = NoteElements()
                    note.title = self.textField.text!
                    listNotesTableViewController.tableView.reloadData()
                noteInitializer.append(note)
            }
                else {
                    print("Note title did not indeed save")
                }
            
            }
    override func viewWillAppear(_ animated: Bool) {
        
        // the reason we are setting this let constant equal to the the variable note of the data type Note? is because we only introduce that variable when we are appealing to both the add and edit existing note functionality of the app
        if let note = note{
            // REMEMBER WHEN WE THOUGHT THIS GOES INTO THE VIEW DID LOAD FUNCTION BUT NOW IT MAKES SENSE THAT IT WOULDNT BECAUSE WE WANT THIS CODE TO BE EXECUTED BEFORE THE VIEW LOADS, YESS THAT MAKES PERFECT SENSE BECUASE BEFORE WE VIEW THE CONTENT OF THE NOTE WE HAVE TO EE WHICH NOTE WE ARE CLICKING ON AND TO DO THAT WE MUST DECIPHER WHICH NOTE WE ARE CLICKING ON
        
            textView.text = note.title ?? ""
            textField.text = note.title ?? ""
            
        
        // Im guessing this function is preparing the code or the immediate code that needs to be executed in order for the view that will appear to be accurate
        
        }
        
    }



}

