

#ifndef THREADBINTREE_H
#define THREADBINTREE_H

#include <cstdio>

#include "BinSearchTree.h"
#include "threadBinNode.h"


template < typename BaseData >
class BinThreadTree : public BinSearchTree<BaseData>
  {

  public:
    BinThreadTree (   bool (*precedes)(const BaseData& x, const BaseData& y)    );
    //  BinSearchTree (const BinSearchTree<BaseData> &initBinSTree);
    void preorder(void (*processNode)(BaseData &item));
    void inorder(void (*processNode)(BaseData &item));
    virtual bool inOrderAdd ( BaseData item);
    virtual bool preOrderAdd ( BaseData item);

  protected:


  private:
    threadBinNode<BaseData> *root;

  };



#include "ThreadBinTree.t"


#endif
