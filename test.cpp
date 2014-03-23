/******************************************************************\
 * File:           Rngs.cpp for rng
 * Language:       C++ (ISO 1998)
 * Copyright:      Jiheng Zhang
 *                 Hong Kong University of Science and Technology
 * Date:           March 23, 2014
\******************************************************************/

#include <iostream>
#include "Rngs.h"
using namespace std;

int main ()
{
    RngBase *p[5];
    p[0]= new ExpGen(0.5);
    p[1]= new HyperExp2Gen('N', 1, 19, 0.5);
    p[2]= new BimodalGen('N', 3, 19);
    p[3]= new Hyper2StarGen('N', 1, 19);
    p[4]= new ErlangGen(0.3, 3);

    for (int j=0;j<5;j++){
        for(int i=0; i<10; i++)
            cout<<p[j]->genNext();

        cout<<"\n"<<p[j]->getName()<<endl;
        cout<<"mean="<<p[j]->getMean()<<endl;
        cout<<"cv="<<p[j]->getCV()<<endl;
        cout<<"var="<<p[j]->getVar()<<endl;
        cout<<"secondM="<<p[j]->getMoment(2)<<endl;
        cout<<"thirdM="<<p[j]->getMoment(3)<<endl;
    }
        return 0;
}
