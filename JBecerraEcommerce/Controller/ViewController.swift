//
//  ViewController.swift
//  JBecerraEcommerce
//
//  Created by Digis01 Soluciones Digitales on 20/09/22.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var NombreField: UITextField!
    @IBOutlet weak var ApellidoPaternoField: UITextField!
    @IBOutlet weak var ApellidoMaternoField: UITextField!
    @IBOutlet weak var UserNameField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func AddButton() {
        var usuario = Usuario()
        usuario.Nombre = NombreField.text
        usuario.ApellidoPaterno = ApellidoPaternoField.text
        usuario.ApellidoMaterno = ApellidoMaternoField.text
        usuario.UserName = UserNameField.text
        usuario.Password = PasswordField.text
        Usuario.GetAll()
        
        Usuario.Add(usuario)
        
    }
}

