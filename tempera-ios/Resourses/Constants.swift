

import Foundation

struct Constants {
    static let RADIUS_BUTTON:Float = 22.0
    static let ID_WARROOM = "WARROOM"
    static let ID_WARROOM_NOTIFICATION = "WARROOMNotification"
    static let ID_NOWARROOM_NOTIFICATION = "NOWARROOMNotification"
    static let ID_RELOADMESSAGES_NOTIFICATION = "RELOADMESSAGESNotification"
}

public enum AlertType {
    case confirmAlert
    case infoAlert
    case errorValidAlert
    case successAlert
    case errorAlert
    case errorRed
}
