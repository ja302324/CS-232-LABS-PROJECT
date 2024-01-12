

#ifndef THREAD_BINNODE_H
#define THREAD_BINNODE_H


#ifndef leftChild
#define leftChild  firstChild
#endif

#ifndef rightChild
#define rightChild  sibling
#endif



#include "GtNode.h"

template <class BaseData>
class threadBinNode : public GtNode<BaseData>
  {
  public:
    bool leftThread, rightThread;
    threadBinNode();
    threadBinNode<BaseData> &operator = ( const threadBinNode<BaseData> & initThreadNode );
    threadBinNode (const threadBinNode<BaseData> &initNode);
  };


template <class BaseData>
threadBinNode<BaseData>::threadBinNode() : GtNode<BaseData>()
{
  leftThread = false;
  rightThread = false;
}


template <class BaseData>
threadBinNode<BaseData>& threadBinNode<BaseData>::
operator = (  const threadBinNode<BaseData> & initThreadNode )

{
  GtNode<BaseData>::operator = ( initThreadNode )
  (*this).leftThread = initThreadNode.leftThread;
  (*this).rightThread = initThreadNode.rightThread;

  return *this;
}




template <class BaseData>
threadBinNode<BaseData>::threadBinNode(  const threadBinNode<BaseData> & initNode )
    : GtNode<BaseData>(initNode)
{
  (*this).leftThread = initNode.leftThread;
  (*this).rightThread = initNode.rightThread;

}









#endif
