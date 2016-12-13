import java.io.IOException;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class ProfileReducer
	extends Reducer<Text, IntWritable, Text, IntWritable>{
	
	@Override
	public void reduce(Text key, Iterable<IntWritable> values, Context context)
		throws IOException, InterruptedException{
		
		if (key.toString().equals("10"))
 		{
			int maxValue = Integer.MIN_VALUE;
			int minValue = Integer.MAX_VALUE;
			for (IntWritable value: values)
			{
				maxValue = Math.max(maxValue, value.get());
				minValue = Math.min(minValue, value.get());
			}
			context.write(key,new IntWritable(maxValue));
			context.write(key,new IntWritable(minValue));
	        }
		else if (key.toString().equals("2"))
		{
			int maxVal = 0;	
			for (IntWritable value: values)
			{
				maxVal = Math.max(maxVal, value.get());
			}
			context.write(key, new IntWritable(maxVal));
		}
		else if (key.toString().equals("1"))
		{
			int maxVa = 0;	
			for (IntWritable value: values)
			{
				maxVa = Math.max(maxVa, value.get());
			}
			context.write(key, new IntWritable(maxVa));
		}
		else if (key.toString().equals("8"))
		{
			int maxV = 0;	
			for (IntWritable value: values)
			{
				maxV = Math.max(maxV, value.get());
			}
			context.write(key, new IntWritable(maxV));
		}
	   }
	}

