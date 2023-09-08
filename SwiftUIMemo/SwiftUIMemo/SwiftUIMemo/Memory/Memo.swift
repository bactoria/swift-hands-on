import Foundation
import SwiftUI

class Memo: Identifiable, ObservableObject { // Identifiable: 데이터를 리스트에 쉽게 바인딩하기 위해 ObservableObject: 뷰를 자동으로 업데이트하기 위해
    let id: UUID
    @Published var content: String // Published: 새로운 값을 저장할 때 마다 바인드된 UI가 자동으로 업데이트 됨.
    let insertDate: Date
    
    init(content: String, insertDate: Date = Date.now) {
        id = UUID()
        self.content = content
        self.insertDate = insertDate
    }
}
