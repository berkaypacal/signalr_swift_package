import Foundation
import SignalRClient

public class SignalRService {
    private var connection: HubConnection
    
    public init(url: URL) {
        connection = HubConnectionBuilder(url: url).withLogging(minLogLevel: .error).build()
        connection.on(method: "MessageReceived", callback: { (user: String, message: String) in
            do {
                self.handleMessage(message, from: user)
            }
        })
        
        connection.start()
    }
    
    private func handleMessage(_ message: String, from user: String) {
        print(message)
    }
}
