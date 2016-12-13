import java.io.IOException;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class tripProfileMapper
    extends Mapper<LongWritable, Text, Text, Text> {

 /*5 6 7 9 10 11 column no use*/
 /*1 2 3 4 8 12 13 14 15 used*/
  private String[] column = { "tripduration", "starttime", "stoptime", "start station id",
                             "end station id", "bikeid", "usertype", "birth year", "gender"};

  @Override
  public void map(LongWritable key, Text value, Context context)
     throws IOException, InterruptedException {

  String line = value.toString();
  String[] byColumn = line.split(",");

  if(byColumn[0]!="tripduration"){
        context.write(new Text(column[0]), new Text(byColumn[0]));
        context.write(new Text(column[1]), new Text(byColumn[1]));
        context.write(new Text(column[2]), new Text(byColumn[2]));
        context.write(new Text(column[3]), new Text(byColumn[3]));
        context.write(new Text(column[4]), new Text(byColumn[7]));
        context.write(new Text(column[5]), new Text(byColumn[11]));
        context.write(new Text(column[6]), new Text(byColumn[12]));
        context.write(new Text(column[7]), new Text(byColumn[13]));
        context.write(new Text(column[8]), new Text(byColumn[14]));
  }
 }
}

