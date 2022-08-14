//
//  SaveData.swift
//  GameStream (iOS)
//
//  Created by SBSCO3 on 14/08/22.
//

import Foundation

class SaveData {
    
    var correo:String = ""
    var password:String = ""
    var nombre:String = ""
    
    func guardarDatos(correo: String, password:String, nombre:String) -> Bool {
        
        print("Dentro de la funcion guardar datos obtuve: \(correo) + \(password) + \(nombre)")
        
        
        UserDefaults.standard.set([correo,password,nombre], forKey: "datosUsuario")
        
        
        
        return true
        
    
        
        
    }
    
    
    func recuperarDatos() -> [String] {
        
        
        let datosUsuario: [String] =  UserDefaults.standard.stringArray(forKey: "datosUsuario")!
        
        print("Estoy en elmetodo recuperarDatos y recupere: \(datosUsuario)")
        
        return datosUsuario
        
        
    }
    
    
    func validar(correo: String, password:String ) -> Bool {
        
        
        var correoGuardado=""
        
        var passwordGuardado=""
        
        print("Revisando si tengo datos en userdefault con el correo: \(correo)  y el passoword+ \(password) ")

        
        if UserDefaults.standard.object(forKey: "datosUsuario") != nil{
           
            correoGuardado = UserDefaults.standard.stringArray(forKey: "datosUsuario")![0]
            
            passwordGuardado = UserDefaults.standard.stringArray(forKey: "datosUsuario")![1]

            print("El correo guardado es \(correoGuardado) y el password guardado es \(passwordGuardado)")
            
            
            if(correo == correoGuardado && password == passwordGuardado){
                
                return true;
            }else{
                
                return false

            }
            
            
            
            
        }else{
            
            print("No hay datos de usuario guardados en el user defaults")
            
            return false
            
        }
        
        
        
    }
    
}
