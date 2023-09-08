//
//  SwiftUIMemoApp.swift
//  SwiftUIMemo
//
//  Created by kakao on 2023/09/08.
//

import SwiftUI

@main
struct SwiftUIMemoApp: App {
    @StateObject
    var store = MemoStore() // MemoStore 를 모든 뷰에서 사용할 수 있도록 커스텀공유데이터로 등록한다. 하나의 데이터를 여러 뷰에서 공유하고 싶을 때 사용한다.
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(store)
        }
    }
}
