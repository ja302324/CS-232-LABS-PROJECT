

#ifndef NODE_H
#define NODE_H


template <class BaseData>
class Node
  {
  public:
    BaseData info;                   // the data in the node
    Node();
  };

template <class BaseData>
Node<BaseData>::Node()
{
  info = (BaseData)0;
}


#endif
