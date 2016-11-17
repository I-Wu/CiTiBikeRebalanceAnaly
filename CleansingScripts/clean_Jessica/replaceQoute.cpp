#include <iostream>
#include <fstream>
using namespace std;


int main(int argc, const char * argv[]) {
    ifstream in(argv[1], ios::binary);
    ofstream out(argv[2], ios::binary);
    char c ;
    
    if(in){
        while (!in.eof())
         {
            in.get(c);
            if (c == '\"')
             {
                 out<< ' ';
             }
            else
            {
                out<< c;
            }
        }
    }

    return 0;
}