//
//  Conexion.swift
//  JBecerraEcommerce
//
//  Created by Digis01 Soluciones Digitales on 20/09/22.
//

import Foundation
import SQLite3

class Conexion {
    var db : OpaquePointer?
    var Path : String = "Document.JBecerraEcommerce.sql"
    
    init(){
        self.db = CreateDB()
    }
    
    func CreateDB() -> OpaquePointer? {
        let filePath = try! FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathExtension(Path)
        
        var db: OpaquePointer? = nil
        
        if sqlite3_open(filePath.path, &db) != SQLITE_OK{
            print("No se entro el archivo")
            return nil
        }else{
            print("La base de datos se creo exitosamente")
            print(filePath)
            return db
        }
    }
}

