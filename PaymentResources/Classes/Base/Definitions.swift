//
//  Definitions.swift
//  EstrategiaDigital
//
//  Created by Charls Salazar on 27/06/17.
//  Copyright © 2017 Charls Salazar. All rights reserved.
//

import Foundation

public class ApiDefinition: NSObject {
    
    static let CUSTOM_HEADERS = [
        "Content-Type": "application/json",
        "Authorization" : "Basic ZmZtYXBwOjRnZW5kNG1pM250bw==",
        "Accept" : "application/json"
    ]
    
    /// MAPS
    
    static let GEO_CODING_BASE_URL = "https://maps.googleapis.com/maps/api/geocode/json?"
    static let GEO_CODING_API_KEY = "AIzaSyBvPtCfXHLfAtgHmfdNJBOiRLMVnkQdAOQ"
    
    static let API_TOTAL = "https://mss.totalplay.com.mx"
    //static let API_TOTAL = "https://189.203.181.233:443"
    //static let API_TOTAL = "https://msstest.totalplay.com.mx"

    static let WS_LOGIN = API_TOTAL + "/Estrategia/LoginUserApp"
    static let WS_REGISTER_USER = API_TOTAL + "/Estrategia/RegisterUser"
    static let WS_RECOVERY_PASSWORD = API_TOTAL + "/Estrategia/RecoverPassword"
    static let WS_MY_ACCOUNT = API_TOTAL + "/Estrategia/MyAccount"
    static let WS_CONSULT_OT = API_TOTAL + "/FFM/ConsultaOTAccountApp"
    static let WS_STATEMENTS = API_TOTAL + "/Estrategia/Statements"
    static let WS_MY_ACCOUNT_BALANCE = API_TOTAL + "/Estrategia/CheckBalance"
    static let WS_MY_ACCOUNT_CARDS = API_TOTAL + "/Estrategia/RegisteredCards"
    static let WS_ADD_NEW_CARD = API_TOTAL + "/Estrategia/RegisterCard"
    static let WS_TRACING_ROUTE = API_TOTAL + "/FFM/TiempoLlegadaAPP"
    static let WS_COVERAGE_VALIDATE = API_TOTAL + "/Estrategia/ValidarCobertura"
    static let WS_GET_PLANS = API_TOTAL + "/Estrategia/PM_Planes"
    static let WS_PLAIN_DETAIL = API_TOTAL + "/Estrategia/PlainDetail"
    static let WS_FAMILY_PACKAGE = API_TOTAL + "/Estrategia/FamilyPackages"
    static let WS_CHECK_BILLING_INFORMATION = API_TOTAL + "/Estrategia/CheckBillingInformation"
    static let WS_PAYMENT_UNIQUE = API_TOTAL + "/Estrategia/PaymentUnique"
    static let WS_PAYMENT_REGISTERED_CARD = API_TOTAL + "/Estrategia/PaymentRegisteredCard"
    static let WS_ARRIVAL_TIME = API_TOTAL + "/FFMTpe/TiempoLlegadaAPP"
    static let WS_NO_COVERAGE = API_TOTAL + "/Estrategia/NoCoverage"
    static let WS_SAVE_ID_DEVICE = API_TOTAL + "/Estrategia/SaveIdDevice"
    static let WS_GET_BILLS_BRM = API_TOTAL + "/Estrategia/GetBillsBRM"
    static let WS_CHECK_BALANCE_BRM = API_TOTAL + "/Estrategia/ConsultaSaldoBRM"
    
    static let API_QUERY_UPLOAD_DOCUMENT = API_TOTAL + "/ventasmovil/AgregarDocumento"
    static let API_ACD = API_TOTAL + "/ventasmovil/EnviaACD"
    
    static let WS_SEND_OPPORTUNITY = API_TOTAL + "/ventasmovil/AgregarOportunidad"
    static let API_CP = API_TOTAL + "/ventasmovil/ConsultaCP"
    
}
