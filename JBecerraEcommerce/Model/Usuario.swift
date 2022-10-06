//
//  Usuario.swift
//  JBecerraEcommerce
//
//  Created by Digis01 Soluciones Digitales on 20/09/22.
//

import Foundation
import SQLite3

class Usuario{
    
    var IdUsuario : Int = 0
    var Nombre: String? = nil
    var ApellidoPaterno : String? = nil
    var ApellidoMaterno : String? = nil
    var UserName : String? = nil
    var Password : String? = nil
    var Usuarios : [Usuario]?
    
    static func GetByEmail(_ email : String) -> Result{
        let result = Result()
        return result
    }
    static func Add(_ usuario : Usuario){
        let query = "INSERT INTO Usuario (Nombre,ApellidoPaterno,ApellidoMaterno,UserName,Password) VALUES(?,?,?,?,?);"        
        let conexion = Conexion.init()
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(conexion.db, query, -1 , &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 1, (usuario.Nombre! as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 2, (usuario.ApellidoPaterno! as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 3, (usuario.ApellidoMaterno! as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 4, (usuario.UserName! as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 5, (usuario.Password! as NSString).utf8String, -1, nil)
            //
            //
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Usuario agregado exitasamento")
            }else{
                print("Ocurrio un error")
            }
        }
        sqlite3_close(conexion.db)
    }
    static func GetAll() -> Result{
        let result = Result()
        
        let query =  "SELECT IdUsuario,Nombre,ApellidoPaterno,ApellidoMaterno,UserName,Password FROM Usuario;"
        var statement : OpaquePointer? = nil
        let conexion = Conexion.init()
        do{
            if let context =  try? sqlite3_prepare_v2(conexion.db, query, -1, &statement, nil) == SQLITE_OK{
                result.Objects = [Any]()
                while sqlite3_step(statement) == SQLITE_ROW {
                    let usuario = Usuario()
                    usuario.IdUsuario = Int(sqlite3_column_int(statement, 0)) //int.parse(row[0])
                    usuario.Nombre = String(cString:sqlite3_column_text(statement, 1))
                    //row[1].ToString
                    usuario.Nombre = String(describing: String(cString: sqlite3_column_text(statement, 1)))
                    usuario.ApellidoPaterno = String(describing: String(cString: sqlite3_column_text(statement, 2)))
                    usuario.ApellidoMaterno = String(describing: String(cString: sqlite3_column_text(statement, 3)))
                    usuario.UserName = String(describing: String(cString: sqlite3_column_text(statement, 4)))
                    usuario.Password = String(describing: String(cString: sqlite3_column_text(statement, 5)))
                    
                    result.Objects?.append(usuario)
                }
                result.Correct = true
            }
            else{
                result.Correct = false
                result.ErrorMessage = "No se encontro información en la tabla Usuario"
            }
        }catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        sqlite3_close(conexion.db)
        return result
    }
    
    static func GetById(_ idUsuario : Int) -> Result{
        let result = Result()
        
        var query =  "SELECT IdUsuario,Nombre,ApellidoPaterno,ApellidoMaterno,UserName,Password FROM Usuario WHERE IdUsuario = \(idUsuario);"
        var statement : OpaquePointer? = nil
        let conexion = Conexion.init()
        do{
            if let context =  try? sqlite3_prepare_v2(conexion.db, query, -1, &statement, nil) == SQLITE_OK{
                if sqlite3_step(statement) == SQLITE_ROW {
                    let usuario = Usuario()
                    usuario.IdUsuario = Int(sqlite3_column_int(statement, 0)) //int.parse(row[0])
                    usuario.Nombre = String(cString:sqlite3_column_text(statement, 1))
                    //row[1].ToString
                    usuario.Nombre = String(describing: String(cString: sqlite3_column_text(statement, 1)))
                    usuario.ApellidoPaterno = String(describing: String(cString: sqlite3_column_text(statement, 2)))
                    usuario.ApellidoMaterno = String(describing: String(cString: sqlite3_column_text(statement, 3)))
                    usuario.UserName = String(describing: String(cString: sqlite3_column_text(statement, 4)))
                    usuario.Password = String(describing: String(cString: sqlite3_column_text(statement, 5)))
                    
                    result.Object = usuario
                }
                result.Correct = true
            }
            else{
                result.Correct = false
                result.ErrorMessage = "No se encontro información en la tabla Usuario"
            }
        }catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        sqlite3_close(conexion.db)
        return result
    }
    
    static func Update(_ usuario: Usuario) -> Result{
        let result = Result()
        let conexion = Conexion.init()
        do{
            var query = "UPDATE Usuario SET Nombre = \\'name\' , 'ApellidoPaterno' = 'update' , ApellidoMaterno = 'test', UserName = 'user', Password = '143' WHERE IdUsuario = \(usuario.IdUsuario);"
            var statement : OpaquePointer? = nil
            if sqlite3_prepare_v2(conexion.db, query, -1, &statement, nil) == SQLITE_OK{
                if sqlite3_step(statement) == SQLITE_DONE {
                    result.Correct = true
                }else {
                    result.ErrorMessage = "Ocurrio 'un error al actualizar el usuario"
                    result.Correct = false
                }
            }
            
        }catch let error{
            result.Correct = false
            result.Ex = error
            result.ErrorMessage = error.localizedDescription
        }
        sqlite3_close(conexion.db)
        return result
    }
    
    static func Delete(idUsuario: Int){
        var query = "DELETE FROM Usuario WHERE IdUsuario = \(idUsuario)"
        var statement : OpaquePointer? = nil
        let conexion = Conexion.init()
        
        if sqlite3_prepare_v2(conexion.db, query, -1, &statement, nil) == SQLITE_OK{
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Usuario eliminado correctamente")
            }else {
                print("Error al eliminar el usuario")
            }
        }
        sqlite3_close(conexion.db)
    }
}






