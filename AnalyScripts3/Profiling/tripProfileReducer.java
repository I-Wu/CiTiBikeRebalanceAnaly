import java.io.IOException;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class tripProfileReducer
        extends Reducer<Text, Text, Text, Text>{


@Override
        public void reduce(Text key, Iterable<Text> values, Context context)
                throws IOException, InterruptedException{

        int max = 0;

        for(Text value : values){
                if(value.toString().length() > max)
                   max = value.toString().length();
        }
        context.write(key, new Text(String.valueOf(max)));

 }
}
