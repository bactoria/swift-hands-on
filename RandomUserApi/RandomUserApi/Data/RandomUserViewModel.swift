//
//  RandomUserViewModel.swift
//  RandomUserApi
//
//  Created by kakao on 2023/09/08.
//

import Foundation
import Combine
import Alamofire

class RandomUserViewModel: ObservableObject { // ObsevableObject 이므로 @Published 되어있는 데이터의 변경 사항을 알 수가 있다.
    
    var subscription = Set<AnyCancellable>()
    
    @Published var randomUsers = [RandomUser]()
    
    var baseUrl = "https://randomuser.me/api/?results=100"
    
    init() {
        print(#fileID, #function, #line, "")
        fetchRandomUsers()
    }
    
    func fetchRandomUsers() {
        print(#fileID, #function, #line, "")
        AF.request(baseUrl)
            .publishDecodable(type: RandomUserResponse.self) // publishDecodable: json 형태 받은걸 바로 객체로 만든다
            .compactMap { $0.value } // 응답에서 optionnal 없애고, value를 unwrapping 한다.
            .map { $0.results } // 응답값의 results 만 빼내온다
            .sink(receiveCompletion: { completion in
                print("데이터스트림 완료")
            }, receiveValue: { receivedValue in
                print("받은 값: \(receivedValue.count)")
                self.randomUsers = receivedValue
            })
            .store(in: &subscription) // 메모리에서 날리기
    }
}
