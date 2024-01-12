


#ifndef GENTREE_T
#define GENTREE_T

#include "GtNode.h"


#include <queue>

#include <cstdio>

#include <iostream>
using std::cout;
using std::endl;

template <class BaseData>
GenTree<BaseData>::GenTree()
{
  root = 0;
}



template <class BaseData>
GenTree<BaseData>::GenTree(const GenTree<BaseData> & initGenTree)
{
  if (initGenTree.root != NULL)
    {
      root=new GtNode<BaseData>;
      copyAux(initGenTree.root,root);
    }
  else root=NULL;
}



template <class BaseData>
GenTree<BaseData>::~GenTree()
{
  delaux(root);
}



template <class BaseData>
bool GenTree<BaseData>::empty()
{
  if (root==NULL) return(true);
  else return(false);
}



template <class BaseData>
bool GenTree<BaseData>::full()
{
  GtNode<BaseData> *p;
  p=new GtNode<BaseData>;
  if (p==0) return(true);
  else
    {
      delete p;
      return(false);
    }
}



template <class BaseData>
void GenTree<BaseData>::operator = (const GenTree<BaseData> & initGenTree)
{
  if (root != NULL)
    {
      delaux(root->firstChild);
      delaux(root->sibling);
    }
  if (initGenTree.root != NULL)
    {
      if (root==NULL)
        root=new GtNode<BaseData>;
      copyAux(initGenTree.root,root);
    }
  else
    {
      if (root !=NULL) delete root;
      root=NULL;
    }
}



template <class BaseData>
void GenTree<BaseData>::copyAux(GtNode<BaseData> *src, GtNode<BaseData> *dest)
{
  if (src !=NULL)
    {
      dest->info=src->info;
      if (src->firstChild != NULL)
        {
          GtNode<BaseData> *temp;
          temp=new GtNode<BaseData>;
          dest->firstChild=temp;
          copyAux(src->firstChild,temp);
        }
      if (src->sibling != NULL)
        {
          GtNode<BaseData> *temp;
          temp=new GtNode<BaseData>;
          dest->sibling=temp;
          copyAux(src->sibling,temp);
        }
    }
}



template <class BaseData>
void GenTree<BaseData>::delaux(GtNode<BaseData> * rt)
{
  if (rt != NULL)
    {
      delaux(rt->firstChild);
      delaux(rt->sibling);
      delete rt;
    }
}




template <class BaseData>
void GenTree<BaseData>::depthFirstTraversal( void (*processnode)(BaseData &value) )
{
  depthFirstTraversalAux( GenTree<BaseData>::root,  processnode    )  ;
}



template <class BaseData>
void GenTree<BaseData>::depthFirstTraversalAux(  GtNode<BaseData>  *item ,
    void (*processnode)(BaseData &value) )
{
  if (item)
    {

      processnode( (item->info) );
      depthFirstTraversalAux(  (item->firstChild),  processnode )  ;
      depthFirstTraversalAux(  (item->sibling) , processnode  );
    }

}



#endif



