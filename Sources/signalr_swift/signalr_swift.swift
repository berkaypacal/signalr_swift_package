import Foundation
import SignalRClient

@available(iOS 13.0, *)
public class SignalRService: ObservableObject {
    public var connection: HubConnection
    private var connectionUrl: URL? = URL(string: "http://192.168.1.7:7007/Chat")
    @Published var messageList: [MessageModel] = []
    @Published var isPresented: Bool = false



    public init() {
        connection = HubConnectionBuilder(url: connectionUrl!).withLogging(minLogLevel: .error).build()
        connection.on(method: "BroadcastMessage", callback: { (message: MessageModel) in
            do {
                self.handleMessage(message: message)
            }
        })

        connection.start()
    }

    private func handleMessage(message: MessageModel) {
      
        messageList.append(message)
        if(message.connectionID != connection.connectionId!){
            isPresented = true
        }

        



    }
    
    public func sendMessage(message: String){
        let meesageTm: MessageModel = MessageModel(message: message, connectionID: connection.connectionId!)
        
        connection.invoke(method: "SendMessage", meesageTm) { error in
        if let error = error {
        print("error: \(error)")
            } else {
        print("Broadcast invocation completed without errors")
            }
        }
    }


  
}


import Foundation

struct MessageModel: Codable, Hashable {
    let message, connectionID: String

    enum CodingKeys: String, CodingKey {
        case message
        case connectionID = "connectionId"
    }
}
