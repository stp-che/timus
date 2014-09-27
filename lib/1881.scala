object Pr1881 {  
  def main(args: Array[String]) {

    def pagesCount(pHeight: Int, pWidth: Int, wordsCount: Int): Int = {
      def iter(pagesCount: Int, linesLeft: Int, lineSpaceLeft: Int, wordsLeft: Int): Int = {
        if (wordsLeft == 0) pagesCount
        else {
          val w_len = readLine().length

          val p = if (w_len <= lineSpaceLeft) 
            (pagesCount, linesLeft, lineSpaceLeft-w_len-1)
          else if (linesLeft > 0)
            (pagesCount, linesLeft-1, pWidth-w_len-1)
          else
            (pagesCount+1, pHeight-1, pWidth-w_len-1)
            
          iter(p._1, p._2, p._3, wordsLeft-1)
        }
      }
      iter(1, pHeight-1, pWidth, wordsCount)
    }

    val params = readLine() split " " map (s => s.toInt)

    println( pagesCount(params(0), params(1), params(2)) )
  }
}