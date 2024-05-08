//
//  ColoursDetailViewController.swift
//  RandomColors
//
//  Created by Atharva Zanwar on 07/05/24.
//

import UIKit

class ColoursDetailViewController: UIViewController {

    /*
     Here we want to take value from the other view controller , now since there might
     occur a error in this we will keep variable as optional
     */
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         Here afdter geeting value of colour in calour variable we use it to set the bg colour
         of screen as that colour
         Now since colour is optional here we use no coallesing to unwrap optional
         what below statement means is set colour as given value and if there is not value set it as blue
         */
        view.backgroundColor = color ?? .blue
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
