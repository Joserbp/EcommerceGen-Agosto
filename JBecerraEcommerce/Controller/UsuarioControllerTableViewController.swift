//
//  UsuarioControllerTableViewController.swift
//  JBecerraEcommerce
//
//  Created by Digis01 Soluciones Digitales on 21/09/22.
//

import UIKit
import SwipeCellKit

class UsuarioControllerTableViewController: UITableViewController {

    var usuarios : [Usuario] = []
    var usuario : Usuario = Usuario()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.register(UINib(nibName: "UsuarioCell", bundle: nil), forCellReuseIdentifier: "DatosCell")

    }
    
    func loadData()
    {
        do{
            let result = Usuario.GetAll()
            if result.Correct!{
                usuarios = result.Objects as! [Usuario]
                tableView.reloadData()
            }
        }catch{
            print("Ocurrio un error")
        }
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return usuarios.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DatosCell", for:indexPath) as! UsuarioCell
        
        cell.delegate = self
        
        let usuario : Usuario = usuarios[indexPath.row]
        cell.Nombre.text = usuario.Nombre
        cell.ApellidoPaterno.text = usuario.ApellidoPaterno
        cell.ApellidoMaterno.text = usuario.ApellidoMaterno
//        cell.FotoView.image = UIImage(named: usuario.Image)
        
        return cell
    }
}

extension UsuarioControllerTableViewController : SwipeTableViewCellDelegate{
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        
        if orientation == .left {
            let updateAction = SwipeAction(style: .default, title: "Actulizar") { action, indexPath in
                self.usuario = self.usuarios[indexPath.row]
                self.performSegue(withIdentifier: "SeguesActualizar", sender: self)
            }
            return [updateAction]
            
        }else{
            
            let deleteAction = SwipeAction(style: .destructive, title: "Borrar") { action, indexPath in
                let usuario : Usuario = self.usuarios[indexPath.row]
                Usuario.Delete(idUsuario: usuario.IdUsuario)
                self.loadData()
            }

            return [deleteAction]
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SeguesActualizar" {
            let viewController = segue.destination as? ViewController
            viewController?.IdUsuario = self.usuario.IdUsuario
        }
    }
}

