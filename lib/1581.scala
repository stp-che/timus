object Pr1581 {  
  def main(args: Array[String]) {
    
    type Pair = (Int, Int)

    def transform(list: List[Int]) = {
      if (list.isEmpty) List[Pair]()
      else {
        def iter(i: Int, acc: List[Pair], cur: Pair): List[Pair] = {
          if (i >= list.length) acc :+ cur
          else if (list(i) == cur._2) iter(i+1, acc, (cur._1+1, cur._2))
          else iter(i+1, acc :+ cur, (1, list(i)))
        }
        iter(1, List[Pair](), (1, list.head))
      }
    }

    readLine() // skip N
    val data = (readLine() split " " map (s => s.toInt) toList)
    println( transform(data) map (p => p._1 + " " + p._2) mkString " " )
  }
}