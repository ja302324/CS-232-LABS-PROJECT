
/* sample driver which your lab should demo */




#include <iostream>
using std::cout;
using std::cin;
using std::endl;


#include "pair.h"
#include "table.h"
/* where the mapping function is defined */
//#include "tableSpecificOps1.h"
#include "tableSpecificOps1.h"





int main()
{
  
  Table < char, int > t( 7, f);

  Pair< char, int > p1( 'a', 222 );
  Pair< char, int > p2( 'd', 666 );
  Pair< char, int > p3( 'e', 111 );

  t.insert( p1);
  t.insert( p2);

  t.print();
  cout << endl;

  char someKey =  'd';
  t.remove(someKey);

  t.print();
  cout << endl;

  t.insert( p3 );

  t.print();
  cout << endl;


  cout << t.lookUp( 'e' );
  cout << endl;

  cout << t.lookUp( 'z' );
  cout << endl;

  t.insert( ( makePair(  'b', 123) ) );


  t.print();
  cout << endl;


  return (0);

}
















