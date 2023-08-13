//
//  File.swift
//  
//
//  Created by Jose Luis Bustos Esteban on 10/8/23.
//

import Security
import Foundation
import KeychainSwift


public struct KeyChainKC {
    
    public init() {
    }
    
    
    //funcion para Guardar
    @discardableResult public func saveKC(key:String, value:String) -> Bool {
        if let data = value.data(using: .utf8) {
            let keychain = KeychainSwift()
            return keychain.set(data, forKey: key)
        }
        else{
            return false
        }
    }

    //Cargar una Clave
    public func loadKC(key:String) -> String? {
        let keychain = KeychainSwift()
        if let data = keychain.get(key){
                return data
        }
        else{
                return ""
        }
    }

    //eliminar una clave

    @discardableResult public func deleteKC(key:String) -> Bool {
        let keychain = KeychainSwift()
        //keychain.accessGroup = "AH9SPD7BPD.com.keepcoding.kcherosMulti"
        /*
         Explicar el tema de Sharing claves entre dispositivos por iCloud. Solo comentarlo
         */
        return keychain.delete(key)
    }

    
    private func test() -> String {
        return "Hello World Test"
    }
    
}
