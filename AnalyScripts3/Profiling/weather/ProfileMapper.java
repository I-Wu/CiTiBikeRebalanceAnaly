import java.io.IOException;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class ProfileMapper
	extends Mapper<LongWritable, Text, Text, IntWritable>{
	
	@Override
	public void map(LongWritable key, Text value, Context context)
		throws IOException, InterruptedException{

	String line = value.toString();
	String [] parts = line.split(",");
	context.write(new Text("1"), new IntWritable(parts[1].length()));
	context.write(new Text("2"), new IntWritable(parts[2].length()));
	context.write(new Text("8"), new IntWritable(parts[8].length()));
	context.write(new Text("10"), 
		new IntWritable(Integer.parseInt(parts[10]))); // temperature
	}

}
