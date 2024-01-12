


#ifndef BINSEARCHTREE_T
#define BINSEARCHTREE_T

#include <queue>

#include <cstdio>


template <class BaseData>
BinSearchTree<BaseData>::
BinSearchTree ( bool (*precedes)(const BaseData& x, const BaseData& y) ) : BinTree<BaseData> ()
{
  this->precedes = precedes;
}

/*
template <class BaseData>
BinTree<BaseData>::BinTree( int numOfNodes ) : GenTree<BaseData> ()
{
  maxNodes = numOfNodes;
  numNodes = 0;
}
*/


template <class BaseData>
BinSearchTree<BaseData>::BinSearchTree (const BinSearchTree<BaseData> &initBinSTree)
{
  precedes=initBinSTree.precedes;
}



/*
void BinSearchTree<BaseData>::operator = (const BinSearchTree<BaseData> & initBinSTree)
{
 (BinTree<BaseData>)(*this) = (Bintree<BaseData>)initBinSTree;
  precedes = initBinSTree.precedes;
}
*/


template <class BaseData>
bool BinSearchTree<BaseData>::add( BaseData item)
  {
    return addAux( GenTree<BaseData>::root, item);
  }





template <class BaseData>
bool BinSearchTree<BaseData>::addAux(GtNode<BaseData> *& rt, BaseData item)
// Note that since the pointer rt will be altered by this
// function, it must be passed by reference.
{

  if (rt == NULL)
    {
      rt = new GtNode<BaseData>;
      if (!rt)
        return false;
      else
        {
          rt -> info = item;
          rt -> leftChild  = 0;
          rt -> rightChild = 0;
          return true;
        }
    }
  else
    if (precedes(item, rt -> info))
      return addAux(rt -> leftChild, item);
    else
      return addAux(rt -> rightChild, item);



}



#endif

