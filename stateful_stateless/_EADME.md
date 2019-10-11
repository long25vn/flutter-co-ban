# Flutter: Stateless và Stateful

:checkered_flag:  ```  Nôm na theo cách hiểu ```

## 1. State

<img src = "./images/ui-equals-function-of-state.png" width="300">

Với Flutter, giao diện người dùng phản ánh trạng thái ứng dụng, thay đổi `state` -> giao diện được vẽ lại.

`BuildContext` tham chiếu đến vị trí của widget trong `Widget tree`, nơi widget được gắn vào `tree`.

Một `BuildContext` chỉ thuộc về một widget. Nếu một widget chứa các widget con,  `BuildContext` của widget cha sẽ trở thành `parent BuildContext` của các `BuildContext` của các widget con.

`StatelessWidget` được vẽ một lần khi `build`, và không được vẽ lại với 