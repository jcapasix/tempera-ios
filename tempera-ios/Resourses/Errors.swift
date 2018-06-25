

import Foundation

let upsError:ErrorEntity = ErrorEntity(title: "¡Ups!", detail: "Ocurrió un problema al conectarse con el servidor, por favor intenta nuevamente.")

let redError:ErrorEntity = ErrorEntity(title: "", detail: "Tu conecxión a internet esta fallando, por favor intenta de nuevo.")


struct Errors {
    static let UPS:ErrorEntity = ErrorEntity(title: "¡Ups!", detail: "Ocurrió un problema al conectarse con el servidor, por favor intenta nuevamente.")
    
    static let RED:ErrorEntity = ErrorEntity(title: "", detail: "Tu conecxión a internet esta fallando, por favor intenta de nuevo.")
    
    static let LOGIN:ErrorEntity = ErrorEntity(title: "Error", detail: "El Usuario o Controseña son incorrectas.")
    
    static let USER:ErrorEntity = ErrorEntity(title: "Error", detail: "Ingrese El Usuario")
    
    static let MESSAGES:ErrorEntity = ErrorEntity(title: "Error", detail: "Error al cargar los mensages")
    
    static let APPLICATIONS:ErrorEntity = ErrorEntity(title: "Error", detail: "Error al cargar las aplicaciones")
    
    
     static let INTERNET:ErrorEntity = ErrorEntity(title: "Error", detail: "No tienes conexión a internet")
}
