

#ifndef GTNODE_H
#define GTNODE_H


#include "Node.h"

template <class BaseData>
class GtNode : public Node<BaseData>
  {
  public:
    GtNode *firstChild, *sibling;  // pointers to subtrees
    GtNode();
    GtNode<BaseData> &operator = ( const GtNode<BaseData> & initGtNode );
    //needs copy constructor
    GtNode (const GtNode<BaseData> &initNode);
  };


template <class BaseData>
GtNode<BaseData>::GtNode() : Node<BaseData>()
{
  firstChild = 0;
  sibling = 0;
}


template <class BaseData>
GtNode<BaseData>& GtNode<BaseData>::operator = (  const GtNode<BaseData> & initGtNode )
{
  this = 0;
  GtNode<BaseData>   temp;
  temp -> info = initGtNode;
  temp-> firstChild = *(initGtNode.firstChild);
  temp -> sibling = *(initGtNode.sibling);
  this = &temp;

  return *this;
}

template <class BaseData>
GtNode<BaseData>::GtNode(  const GtNode<BaseData> & initGtNode )
{
  this = 0;
  GtNode<BaseData>   temp;
  temp -> info = initGtNode;
  temp-> firstChild = *(initGtNode.firstChild);
  temp -> sibling = *(initGtNode.sibling);
  this = &temp;

}















#endif
