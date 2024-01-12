

#ifndef GENTREE_H
#define  GENTREE_H

#include <cstdio>

#include "GtNode.h"

template < typename BaseData >
class GenTree
  {

  public:
    GenTree();
    GenTree(const GenTree<BaseData> & initGenTree);
    virtual ~GenTree();
    bool empty();
    virtual bool full();
    void operator = (const GenTree<BaseData> & initGenTree);
    void depthFirstTraversal( void (*processnode)(BaseData  &value) );
    virtual void breadthFirstTraversal( void (*processnode)(BaseData  &value) ) = 0;

  protected:
    GtNode<BaseData> *root;

  private:
    void copyAux(GtNode<BaseData> * src, GtNode<BaseData> * dest);
    void delaux(GtNode<BaseData> * rt);
    void depthFirstTraversalAux( GtNode<BaseData> *item ,
                                 void (*processnode)(BaseData  &value) );

  };


#include "GenTree.t"


#endif
