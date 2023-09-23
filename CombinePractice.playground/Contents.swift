import UIKit
import Combine

//Publisher 만들기 (RxSwift 랑 동일한 방법)

var myIntArrayPublisher: Publishers.Sequence<[Int], Never> = [1,2,3].publisher //RxSwift에서의 Observable과 같음(데이터 흐름)

myIntArrayPublisher.sink(receiveCompletion: { completion in //sink: 구독 시작
    switch completion {
    case .finished:
        print("완료") //이 순간 데이터 흐름이 끊기게 된다.
    case .failure(let error):
        print("실패 : error : \(error)")
    }
}, receiveValue: { receivedValue in
    print("값을 받았다. : \(receivedValue)")
})

//MARK: - NotifciationCenter 관련

var mySubscription: AnyCancellable? //RxSwift에서 disposebag과 같음
var mySubsciptionSet = Set<AnyCancellable>()

var myNotification = Notification.Name("com.dev.customNotification")

var myDefaultPublisher = NotificationCenter.default.publisher(for: myNotification)

mySubscription = myDefaultPublisher.sink(receiveCompletion: { completion in
    switch completion {
    case .finished:
        print("완료")
    case .failure(let error):
        print("실패: error: \(error)")
    }
}, receiveValue: { receivedValue in
    print("받은 값: \(receivedValue)")
})

mySubscription?.store(in: &mySubsciptionSet)

NotificationCenter.default.post(Notification(name: myNotification))
NotificationCenter.default.post(Notification(name: myNotification))
NotificationCenter.default.post(Notification(name: myNotification))

//MARK: - KVO = Key value observing

class MyFriend {
    var name = "철수" {
        didSet {
            print("name - didSet(): ", name)
        }
    }
}

var myFriend = MyFriend()

//sink, assign 통해서 구독
var myFriendSubscription: AnyCancellable = ["영수"].publisher.assign(to: \.name, on: myFriend)
