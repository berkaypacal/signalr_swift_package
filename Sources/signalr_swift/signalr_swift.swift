import Foundation
import SignalRClient

public class SignalRService {
    private var connection: HubConnection
    private var connectionUrl: URL? = URL(string: "http://192.168.1.7:7007/Chat")
    
    public init() {
        connection = HubConnectionBuilder(url: connectionUrl!).withLogging(minLogLevel: .error).build()
        connection.on(method: "BroadcastMessage", callback: { (message: MessageModel) in
            do {
                self.handleMessage(message)
            }
        })
        
        connection.start()
    }
    
    private func handleMessage(_ message: MessageModel) {
        print(message.message)
        print(message.connectionID)

        
    }
}


import Foundation

struct MessageModel: Codable {
    let message, connectionID: String

    enum CodingKeys: String, CodingKey {
        case message
        case connectionID = "connectionId"
    }
}
