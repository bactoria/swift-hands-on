import Foundation

class MemoStore: ObservableObject {
    @Published var list: [Memo] // 배열을 published 로 설정하면 배열을 업데이트할 때마다 바인드되어있는 뷰도 자동으로 업데이트 된다.
    
    init() { // 초기화
        list = [
            Memo(content: "Hello123123123123123123123123123123123123123123123", insertDate: Date.now),
            Memo(content: "Awesome", insertDate: Date.now.addingTimeInterval(3600 * -24)),
            Memo(content: "SwiftUI", insertDate: Date.now.addingTimeInterval(3600 * -48)),
        ]
    }
    
    // crud 구현
    
    func insert(memo: String) {
        list.insert(Memo(content: memo), at: 0) // 0번 인덱스에 추가해라. (가장 앞에 추가한다는 뜻)
    }
    
    func update(memo: Memo?, content: String) {
        guard let memo = memo else { // memo가 옵셔널이니까 한번 옵셔널 바인딩을 한다.
            return
        }
        
        memo.content = content
    }
    
    func delete(memo: Memo) {
        list.removeAll { $0.id == memo.id }
    }

    func delete(set: IndexSet) {
        for index in set {
            list.remove(at: index)
        }
    }
}
