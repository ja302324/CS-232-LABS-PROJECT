

#ifndef BINTREE_H
#define  BINTREE_H

#include <cstdio>

#include "GenTree.h"


#ifndef leftChild
#define leftChild  firstChild
#endif

#ifndef rightChild
#define rightChild  sibling
#endif


template < typename BaseData >
class BinTree : public GenTree<BaseData>
  {
  protected:
    int maxNodes;
    int numNodes;

  public:
    BinTree();
    BinTree( int numOfNodes );     // constructor
    BinTree ( const BinTree<BaseData> & initBinTree );    // copy constructor
    virtual ~BinTree();
    bool full();
    void operator = ( const BinTree<BaseData> & initBinTree );  // assign
    virtual void breadthFirstTraversal( void (*processnode)(BaseData  &value) );
    virtual bool add( BaseData item ) = 0;

  };


#include "BinTree.t"


#endif
