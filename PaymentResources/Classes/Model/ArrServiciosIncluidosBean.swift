//
//  ArrServiciosIncluidosBean.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 25/10/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import UIKit
import ObjectMapper

open class ArrServiciosIncluidosBean: NSObject {
    
    var Id : String?
    var Nombre : String?
    var CantidadEquiposAutomaticos : String?
    var Comentario : String?
    var MaximoAgregar : String?
    var Nombrecomercial : String?
    var NombreEditable : String?
    var PlanId : String?
    var Precio : String?
    var SeActiva : String?
    var SeFactura : String?
    var ServicioId : String?
    var SRV_Mode : String?
    var TipoServicio : String?
    var TipoTelefonia : String?
    var ArrProductosIncluidos : [ArrProductosIncluidosBean] = []
    
}
