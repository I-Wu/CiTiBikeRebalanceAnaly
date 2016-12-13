//
//  main.cpp
//  clearFile
//
//  Created by Xinpei Lin on 2016/11/30.
//  Copyright © 2016年 Xinpei Lin. All rights reserved.
//

#include <iostream>
#include <fstream>
using namespace std;


int main(int argc, const char * argv[]) {
    ifstream in(argv[1], ios::binary);
    ofstream out(argv[2], ios::binary);
    char c ;
    string s;
    getline(in, s);
    if(in){
        while (!in.eof())
        {
            in.get(c);
            if (c == '\"')
            {
                ;
            }
            else if (c =='/')
            {
                
                out << '-';
            }
            else
            {
                out<< c;
            }
        }
    }
    
    return 0;
}