//
//  ViewController.swift
//  JBecerraEcommerce
//
//  Created by Digis01 Soluciones Digitales on 20/09/22.
//

import UIKit

class ViewController: UIViewController {


    let IdUsuario : Int = 0
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
        if self.IdUsuario != 0 {
            let result: Result = Usuario.GetById(IdUsuario)
            if result.Correct {
                let usuario = result.Object as! Usuario
                NombreField.text = usuario.Nombre
                
                button.text = "Actualizar"
                button.background = .yellow
            }
            else
            {
                print("Ocurrio un error \(result.ErrorMessage)")
            }
        }
    }
    @IBAction func AddButton() {
        
        var usuario = Usuario()
        usuario.Nombre = NombreField.text
        usuario.ApellidoPaterno = ApellidoPaternoField.text
        usuario.ApellidoMaterno = ApellidoMaternoField.text
        usuario.UserName = UserNameField.text
        usuario.Password = PasswordField.text
        usuario.IdUsuario = self.IdUsuario
        
        if sender.text == "Agregar" {
            Usuario.Add(usuario)
        }
        else if sender.text == "Actualizar"{
            Usuario.Update(usuario)
        }
        
    }
    @IBAction func segues(_ sender: UIButton) {
        self.performSegue(withIdentifier: "test", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "test" {
            var testViewController = segue.destination as? testViewController

            testViewController?.idUsuario = usurio.IdUsuario

            //let destinationVC = sender.destination as!     nameViewController
           //            destinationVC.property = value
        }
        if segue.identifier == "deploy"{
            //Action for deploy
        }
    }
    
}
