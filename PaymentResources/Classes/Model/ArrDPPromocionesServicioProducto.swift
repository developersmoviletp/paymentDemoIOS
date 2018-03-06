import UIKit
import ObjectMapper
import RealmSwift

open class ArrDPPromocionesServicioProducto  : Object, Mappable {

    @objc dynamic var uuid : String = UUID().uuidString
    @objc dynamic var id : String = ""
    @objc dynamic var nombre : String = ""
    @objc dynamic var agregarServicio : String = ""
    @objc dynamic var esCargoUnico : String = ""
    @objc dynamic var estatus : String = ""
    @objc dynamic var iEPS : String = ""
    @objc dynamic var iVA : String = ""
    @objc dynamic var mesInicio : String = ""
    @objc dynamic var montoC : String = ""
    @objc dynamic var planServicio : String = ""
    @objc dynamic var porcentaje : String = ""
    @objc dynamic var productoCaracteristica : String = ""
    @objc dynamic var promocionPlan : String = ""
    @objc dynamic var servicioProducto : String = ""
    @objc dynamic var vigenciaMes : String = ""
    @objc dynamic var idProductoC : String = ""
    @objc dynamic var nameProductoC : String = ""
    @objc dynamic var productoId : String = ""
    @objc dynamic var ciudad : String = ""
    @objc dynamic var velocidadSubida : String = ""
    @objc dynamic var velocidadBajada : String = ""
    @objc dynamic var tieneIPDinamica : String = ""
    @objc dynamic var tieneIPFija : String = ""
    @objc dynamic var tieneSTBAdicional : String = ""
    @objc dynamic var esCCTV : String = ""
    @objc dynamic var esWiFi : String = ""
    @objc dynamic var cantidad : String = ""
    @objc dynamic var estatusProductoC : String = ""
    @objc dynamic var fechaInicio : String = ""
    @objc dynamic var fechaFin : String = ""
    @objc dynamic var comentario : String = ""
    @objc dynamic var esProntoPago : String = ""
    @objc dynamic var dPServicioProducto : DPServicioProducto? = DPServicioProducto()

    required convenience public init?(map: Map) {
        self.init()
    }

    open func mapping(map: Map) {
         
		id		<- map["Id"]
		nombre		<- map["Nombre"]
		agregarServicio		<- map["AgregarServicio"]
		esCargoUnico		<- map["EsCargoUnico"]
		estatus		<- map["Estatus"]
		iEPS		<- map["IEPS"]
		iVA		<- map["IVA"]
		mesInicio		<- map["MesInicio"]
		montoC		<- map["Monto__c"]
		planServicio		<- map["PlanServicio"]
		porcentaje		<- map["Porcentaje"]
		productoCaracteristica		<- map["ProductoCaracteristica"]
		promocionPlan		<- map["PromocionPlan"]
		servicioProducto		<- map["ServicioProducto"]
		vigenciaMes		<- map["VigenciaMes"]
		idProductoC		<- map["IdProductoC"]
		nameProductoC		<- map["NameProductoC"]
		productoId		<- map["ProductoId"]
		ciudad		<- map["Ciudad"]
		velocidadSubida		<- map["VelocidadSubida"]
		velocidadBajada		<- map["VelocidadBajada"]
		tieneIPDinamica		<- map["TieneIPDinamica"]
		tieneIPFija		<- map["TieneIPFija"]
		tieneSTBAdicional		<- map["TieneSTBAdicional"]
		esCCTV		<- map["EsCCTV"]
		esWiFi		<- map["EsWiFi"]
		cantidad		<- map["Cantidad"]
		estatusProductoC		<- map["EstatusProductoC"]
		fechaInicio		<- map["FechaInicio"]
		fechaFin		<- map["FechaFin"]
		comentario		<- map["Comentario"]
		esProntoPago		<- map["EsProntoPago"]
        
        self.dPServicioProducto = DPServicioProducto(value: dPServicioProducto as Any)
		self.dPServicioProducto		<- map["DP_ServicioProducto"]
	}
    
    override open static func primaryKey() -> String? {
        return "uuid"
    }

}
