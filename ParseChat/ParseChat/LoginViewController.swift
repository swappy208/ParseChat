//
//  LoginViewController.swift
//  ParseChat
//
//  Created by Swapnil Tamrakar on 2/23/17.
//  Copyright © 2017 Swapnil Tamrakar. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBAction func logInButton(_ sender: Any) {
        /*PFUser.logInWithUsername(inBackground: emailTextField.text!, password: passwordTextField.text!) { (user: PFUser?, error: Error?) in
            
            if user != nil {
                self.performSegue(withIdentifier: "ChatRoomViewController", sender: nil)
            } else {
                let ac = UIAlertController(title: "Login Failed", message: "Email/Password is not correct", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(okAction)
                self.present(ac, animated: true, completion: nil)
            }
            
        }*/
    }
    @IBAction func signUpButton(_ sender: Any) {
        var user = PFUser()
        user.username = emailTextField.text
        user.password = passwordTextField.text
        //user.email = "email@example.com"
        // other fields can be set just like with PFObject
        //user["phone"] = "415-392-0202"
        
        user.signUpInBackground {
            (succeeded: Bool, error:Error?) -> Void in
            if let error = error {
                print(error.localizedDescription)
                // Show the errorString somewhere and let the user try again.
                let ac = UIAlertController(title: "Error!", message: "", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Error", style: .default, handler: nil)
                ac.addAction(okAction)
                self.present(ac, animated: true, completion: nil)
            } else {
                // Hooray! Let them use the app now.
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
