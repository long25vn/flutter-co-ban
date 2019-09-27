# Flutter Image

<table>
<tr>
<td>
  <pre>
  
      // Hình ảnh
      Container(
        constraints: BoxConstraints.expand(height: 200),
        child: Image.asset(
          "assets/images/glass.jfif",
        ),
      ),

      // fit: BoxFit.fill,
      Container(
        constraints: BoxConstraints.expand(
          height: 200,),
        child: Image.asset(
          "assets/images/glass.jfif",
          fit: BoxFit.fill,
        ),
      ),

      // fit: BoxFit.cover,
      Container(
        constraints: BoxConstraints.expand(
          height: 200,),
        child: Image.asset(
          "assets/images/glass.jfif",
          fit: BoxFit.cover,
        ),
      )
   </pre>
</td>
<td>
  <img src = "./images/1.png" width="300">
</td>
</tr>
<tr>
<td>
  <pre>

      // alignment: Alignment.topLeft
      Container(
        constraints: BoxConstraints.expand(
          height: 200,),
        child: Image.asset(
          "assets/images/glass.jfif",
          alignment: Alignment.topLeft,
        ),
      ),

      // alignment: Alignment.bottomRight
      Container(
        constraints: BoxConstraints.expand(
          height: 200,),
        child: Image.asset(
          "assets/images/glass.jfif",
          alignment: Alignment.bottomRight,
        ),
      ),

      // alignment: Alignment.bottomRight
      // fit: BoxFit.cover,
      Container(
        constraints: BoxConstraints.expand(
          height: 200,),
        child: Image.asset(
          "assets/images/glass.jfif",
          fit: BoxFit.cover,
          alignment: Alignment.bottomRight,
        )
   </pre>
</td>
<td>
  <img src = "./images/2.png" width="300">
</td>
</tr>
  </table>
