//
//  TableViewController.swift
//  First Real Project
//
//  Created by Matthew on 7/8/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import UIKit
import CoreData

var noteInitializer : [NoteElements] = []

class TableViewController: UITableViewController {
    @IBAction func saveUnwind (_segue:UIStoryboardSegue){
      
    }
        
//    var noteInitializer = [Note]() {
//        didSet{
//        tableView.reloadData()
//        
//        }
//    
//    }
    // In this line of code we are initializing out class Note in the untouched data file to become an array in this variable instance we are making called "noteInitializer"
    let notes = Note()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let noteElements = NoteElements(context:context)
        // At this point of our code we have basically assigned all our information from the NoteElements class entity to this new variable we have made called "noteEntityAssignment" and again the reason I call it class beause the entity is set to be defined as class definition BUT NOW IT IS TIME TIME TO STORE OUR CODE
    // WE LEFT OFF HERE
        //save transaction
        
        appDelegate.saveContext()
        do {
        let result = try context.fetch(NoteElements.fetchRequest())
            let notez = result as! [NoteElements]
        }
        catch{
        print("error")
        
        } // what this essentially does is try to fetch data from the context and assign it to the variable result
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return noteInitializer.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell")
      //  cell?.textLabel?.text = ... I believe we do not need this line of code because we
        cell?.textLabel?.text = notes.title
        
       return cell!       // for now you might get a delegate error on this line of code above because as it states its it needs a title on the view controller screen or else it will so I believe we need to add save functionality before we can do anything with the cell title
        // BUT WAIT I HAVE AN ASSUMPTION MAYBE FOR THE TIME BEING WE CAN HARD CODE A LABEL SO THEIR WILL ALWAYS BE CONTENT OR TEXT ON THE VIEW CONTROLLER SCREEN
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var identifier = segue.identifier {
            if identifier == "displayExistingNote"{
            print(" An exisitng Note has been tapped on")
            let indexPath = tableView.indexPathForSelectedRow // table view already pops up and we dont even have to downcast it because the table view controller already inherits from the superclass UITableViewController
               let note = noteInitializer[indexPath!.row]
                var displaynoteviewController = segue.destination as! ViewController
                displaynoteviewController.note = note
                
                
                
            }
        }
    }
    
}
