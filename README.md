Spark 3.2.0 & MinIO S3 Integration
==================================

```
import java.time.temporal.ChronoUnit
import java.time.format.DateTimeFormatter
import java.time.LocalDateTime
import math.random

def t =  LocalDateTime.now()
def f(t: LocalDateTime, day: Int) = DateTimeFormatter.ISO_DATE.format(t.minus(day, ChronoUnit.DAYS))
val rnd = new scala.util.Random
def r(start: Int, end: Int) = start + rnd.nextInt( (end - start) + 1 )
def generateSeq(n: Int) = Range(0, n).map{_ => (r(1, 10), "a" + r(1, 4).toString, t.minus(r(0, 30), ChronoUnit.DAYS).toString, f(t, r(0, 10)))}.toSeq


val df = generateSeq(50).toDF("projectId", "event", "time", "date")

df.write.format("delta").save("s3a://path/genseq")
```
