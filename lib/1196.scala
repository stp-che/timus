import scala.collection.SortedSet

object Pr1196 {
  def main(args: Array[String]) = {

    val usefulDates = 1.to(readInt).foldLeft(SortedSet[Int]()) ((s,x) => s+readInt)

    def successCount(datesCount: Int, acc: Int): Int = {
      if (datesCount == 0) acc
      else {
        successCount( datesCount-1, if (usefulDates.contains(readInt)) acc+1 else acc )
      }
    }

    println( successCount(readInt, 0) )

  }
}