object Pr1510 {
  def main(args: Array[String]) = {

    def majority(n: Int) = {
      def iter(i: Int, candidate: Int, power: Int): Int = {
        if (i == n) candidate
        else {
          val cur = readInt
          if (power == 0) iter(i+1, cur, 1)
          else if (cur == candidate) iter(i+1, candidate, power+1)
          else iter(i+1, candidate, power-1)
        }
      }
      iter(1, readInt, 1)
    }

    println( majority(readInt) )

  }
}