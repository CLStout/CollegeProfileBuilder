//
//  ViewController.swift
//  College Profile Builder
//
//  Created by Stanley Stout on 7/25/16.
//  Copyright © 2016 Chris Stout. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var colleges : [College] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButton.tag = 0
        colleges.append(College(name: "Northwestern", location: "IL", enrollment: 20336, image: UIImage(named: "Northwestern")!, website: "http://www.northwestern.edu/"))
        colleges.append(College(name: "Harvey Mudd", location: "CA", enrollment: 735, image: UIImage(named: "HarveyMudd")!, website: "https://www.hmc.edu/"))
        colleges.append(College(name: "Mossouri S&T", location: "MO", enrollment: 8889, image: UIImage(named: "MissouriST")!, website: "http://www.mst.edu/"))
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colleges.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        cell.textLabel?.text = colleges[indexPath.row].name
        return cell
    }
    
    @IBAction func onTappedPlusButton(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler { (textField) in textField.placeholder = "Add College Here" }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: .Default) { (action) in
            let collegeTextField = alert.textFields![0] as UITextField
            self.colleges.append(College(name: collegeTextField.text!))
            self.tableView.reloadData()
        }
        alert.addAction(addAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            colleges.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }
    @IBAction func onTappedEditButton(sender: UIBarButtonItem) {
        if sender.tag == 0 {
            tableView.editing = true
            sender.tag = 1
        } else {
            tableView.editing = false
            sender.tag = 0
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc = segue.destinationViewController as! DetailedViewController
        let index = tableView.indexPathForSelectedRow?.row
        dvc.college = colleges[index!]
    }
}

