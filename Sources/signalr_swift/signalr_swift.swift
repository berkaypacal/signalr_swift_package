import Foundation
import SignalRClient

public class SignalRService {
    private var connection: HubConnection
    private var connectionUrl: URL? = URL(string: "https://192.168.1.7:7007/Chat")
    
    public init() {
        connection = HubConnectionBuilder(url: connectionUrl!).withLogging(minLogLevel: .error).build()
        connection.on(method: "BroadcastMessage", callback: { (message: String) in
            do {
                self.handleMessage(message)
            }
        })
        
        connection.start()
    }
    
    private func handleMessage(_ message: String) {
        print(message)
        
    }
}
