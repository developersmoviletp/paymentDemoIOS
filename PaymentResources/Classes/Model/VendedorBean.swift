
//
//  ArrServicesAdditionals.swift
//  VentasTotalPlayiOS
//
//  Created by Daniel García Aldynamic varado on 12/20/16.
//  Copyright © 2016 TotalPlay. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift

public class VendedorBean  : Object, Mappable {

    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var IdEmpleado : String = ""
    @objc dynamic var Canal : String = ""
    @objc dynamic var SubCanal : String = ""
    @objc dynamic var FolioContrato : String = ""
    @objc dynamic var IdDispositivo : String = ""
    @objc dynamic var IdDistrital : String = ""
    @objc dynamic var IdEmpleadoDistrital : String = ""
    
    
    @objc dynamic var OrigenApp : String = ""
    @objc dynamic var EsComisionable : String = ""
    @objc dynamic var IMEI : String = ""
    @objc dynamic var ModeloCelular : String = ""
    @objc dynamic var EmpleadoDistribuidor : String = ""
    @objc dynamic var UsuarioLogueado : String = ""
    @objc dynamic var aprobarVentaExpress : String = ""
    
    @objc dynamic var ventaExpress : String = ""

	required convenience public init?(map: Map) {
        self.init()
    }

    public func mapping(map: Map) {
         
		IdEmpleado		<- map["IdEmpleado"] 
		Canal		<- map["Canal"] 
		SubCanal		<- map["SubCanal"] 
		FolioContrato		<- map["FolioContrato"] 
		IdDispositivo		<- map["IdDispositivo"] 
		IdDistrital		<- map["IdDistrital"] 
		IdEmpleadoDistrital		<- map["IdEmpleadoDistrital"]
        OrigenApp		<- map["OrigenApp"]
        EsComisionable		<- map["EsComisionable"]
        IMEI		<- map["IMEI"]
        ModeloCelular		<- map["ModeloCelular"]
        EmpleadoDistribuidor		<- map["Empleado_Distribuidor"]
        UsuarioLogueado		<- map["Usuario_Logueado"]
        ventaExpress		<- map["VentaExpress"]
        aprobarVentaExpress		<- map["AprobarVentaExpress"]

        
    }
    
    override public static func primaryKey() -> String? {
        return "uuid"
    }


}
