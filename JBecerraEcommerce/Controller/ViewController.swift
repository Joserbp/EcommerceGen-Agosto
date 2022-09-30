//
//  ViewController.swift
//  JBecerraEcommerce
//
//  Created by Digis01 Soluciones Digitales on 20/09/22.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var ActionButton: UIButton!
    
    var IdUsuario : Int = 0
    @IBOutlet weak var NombreField: UITextField!
    @IBOutlet weak var ApellidoPaternoField: UITextField!
    @IBOutlet weak var ApellidoMaternoField: UITextField!
    @IBOutlet weak var UserNameField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Validar()
    }

    func Validar (){
        if self.IdUsuario != 0 {  //UPDATE
            ActionButton.setTitle("Actualizar", for: .normal)
            ActionButton.backgroundColor = UIColor.yellow
            
            let result: Result = Usuario.GetById(IdUsuario)
            if result.Correct! {
                let usuario = result.Object as! Usuario
                NombreField.text = usuario.Nombre
                ApellidoPaternoField.text  = usuario.ApellidoPaterno
                ApellidoMaternoField.text  = usuario.ApellidoMaterno
                UserNameField.text  = usuario.UserName
                PasswordField.text  = usuario.Password
            }
            else
            {
                print("Ocurrio un error \(result.ErrorMessage)")
            }
        }
        else{ //ADD
            ActionButton.setTitle("Agregar", for: .normal)
            ActionButton.backgroundColor = UIColor.green
        }
    }

    @IBAction func ActionButton(_ sender: UIButton) {
        
            let usuario = Usuario()
            usuario.Nombre = NombreField.text
            usuario.ApellidoPaterno = ApellidoPaternoField.text
            usuario.ApellidoMaterno = ApellidoMaternoField.text
            usuario.UserName = UserNameField.text
            usuario.Password = PasswordField.text
            
        if sender.currentTitle == "Agregar" {
                Usuario.Add(usuario)
            }
        else if sender.currentTitle  == "Actualizar"{
                usuario.IdUsuario = self.IdUsuario
                Usuario.Update(usuario)
            }
        else{
            print("Opcion no encontrada")
        }
    }
}
