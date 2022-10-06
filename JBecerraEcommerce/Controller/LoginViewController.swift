//
//  LoginViewController.swift
//  JBecerraEcommerce
//
//  Created by Digis01 Soluciones Digitales on 03/10/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var EmailInput: UITextField!
    
    @IBOutlet weak var PasswordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func IniciarSesion(_ sender: Any) {
        
        let email = EmailInput.text!
        let password = PasswordInput.text
        
        let result : Result = Usuario.GetByEmail(email)
        if result.Correct!{
            let usuario = result.Object as! Usuario
            if password == usuario.Password{
                self.performSegue(withIdentifier: "Usuario", sender: nil)
            }
            else{
                //Error contraseña incorrecta
            }
        }else{
            //Error no existe el usuario
        }
        
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
