

#ifndef BINSEARCHTREE_H
#define  BINSEARCHTREE_H

#include <cstdio>

#include "BinTree.h"



template < typename BaseData >
class BinSearchTree : public BinTree<BaseData>
  {

  public:
    BinSearchTree (bool (*precedes)(const BaseData& x, const BaseData& y));
    BinSearchTree (const BinSearchTree<BaseData> &initBinSTree);
    //void operator = (const BinSSearchTree<BaseData> & initBinSTree);
    virtual bool add ( BaseData item);

  protected:
    // Comparison function for items in tree
    bool (*precedes)(const BaseData& x, const BaseData& y);

  private:
    //  private auxiliary functions
    bool addAux( GtNode<BaseData> *&rt, const BaseData item);

  };



#include "BinSearchTree.t"


#endif
