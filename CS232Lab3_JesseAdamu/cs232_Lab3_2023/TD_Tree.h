


#ifndef TDTREE_H
#define  TDTREE_H

#include <cstdio>

#include "GenTree.h"

template <class BaseData>
class TDTree : public GenTree<BaseData>
  {

  public:
    TDTree ();
    TDTree (int (*precedes)(const BaseData& x, const BaseData& y));
    TDTree ( const TDTree<BaseData> & initTopDownTree);
    virtual bool add (BaseData parent, BaseData item, int childnum);
    virtual void breadthFirstTraversal( void (*processnode)(BaseData  &value) );

  protected:
    // Comparison function for items in tree
    // returns 0 if items identical
    int (*compare)(const BaseData& x, const BaseData& y);


  private:
    // Auxiliary function needed for add operation
    bool add_aux(GtNode<BaseData> * rt, BaseData parent,
                 BaseData item, int childnum);

  };



#include "TD_Tree.t"


#endif
