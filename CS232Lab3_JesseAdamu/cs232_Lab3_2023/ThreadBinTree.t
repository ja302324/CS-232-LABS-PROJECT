

#ifndef THREADBINTREE_T
#define THREADBINTREE_T



#include <cstdio>

#ifndef leftChild
#define leftChild  firstChild
#endif

#ifndef rightChild
#define rightChild  sibling
#endif



template <class BaseData>
BinThreadTree<BaseData>::
BinThreadTree (  bool (*precedes)(const BaseData& x, const BaseData& y)    )   : BinSearchTree<BaseData> ( /* BinSearchTree<BaseData>::*/ precedes )
{

  if (   GenTree<BaseData>::root == 0 )
    delete GenTree<BaseData>::root;

  BinThreadTree<BaseData>::root = new threadBinNode<BaseData>;
  BinThreadTree<BaseData>::root -> leftChild =  BinThreadTree<BaseData>::root;
  BinThreadTree<BaseData>::root -> rightChild =  BinThreadTree<BaseData>::root;
  BinThreadTree<BaseData>::root -> leftThread =  true;
  BinThreadTree<BaseData>::root -> rightThread =  false;

}



/*

template <class BaseData>
BinSearchTree<BaseData>::BinSearchTree (const BinSearchTree<BaseData> &initBinSTree)
{
  precedes=initBinSTree.precedes;
}

*/


template <class BaseData>
bool BinThreadTree<BaseData>::inOrderAdd( BaseData item)
{

  threadBinNode<BaseData> *q, *p, *parentq;
  bool left, done;
  p = new threadBinNode<BaseData>;
  p -> info = item;

  // Prepare for the while test by following the left child pointer
  // from the dummy header

  parentq =  BinThreadTree<BaseData>::root;
  q =   static_cast< threadBinNode<BaseData>*  >
        ( BinThreadTree<BaseData>::root ->  leftChild ) ;

  left = true;
  done = parentq -> leftThread;



  while ( !done )

    // Now allow q and its parent to travel down an appropriate branch until
    // an insertion spot is found
    //   if (precedes( item, q -> info) )
    if ( item <= q -> info )
      {
        parentq = static_cast< threadBinNode<BaseData>*  >(q);
        q =  static_cast< threadBinNode<BaseData>*  >
             (q -> leftChild )  ;
        left = true;
        done = parentq -> leftThread;
      }
    else
      {

        parentq = static_cast< threadBinNode<BaseData>*  >(q);
        q =  static_cast< threadBinNode<BaseData>*  >
             ( q -> rightChild ) ;
        left = false;
        done = parentq -> rightThread;
      }


  // Now insert p as the left or right child of parentq
  p -> leftThread = true;
  p -> rightThread = true;
  if (left)
    {
      p -> leftChild = static_cast< threadBinNode<BaseData>*  >( parentq -> leftChild);
      p -> rightChild =static_cast< threadBinNode<BaseData>*  >(parentq);
      parentq -> leftChild = static_cast< threadBinNode<BaseData>*  >(p);
      parentq -> leftThread = false;
    }
  else
    {
      p -> rightChild =
        static_cast< threadBinNode<BaseData>*  >(parentq -> rightChild);
      p -> leftChild =
        static_cast< threadBinNode<BaseData>*  >(parentq);

      parentq -> rightChild = static_cast< threadBinNode<BaseData>*  >(p);
      parentq -> rightThread = false;
    }


  return true ;
}



template <class BaseData>
void BinThreadTree<BaseData>::inorder(void (*processNode)(BaseData &item))
{

  threadBinNode<BaseData>  *p;
  p =   BinThreadTree<BaseData>::root;
  do
    {
      if (p->rightThread)
        p = static_cast< threadBinNode<BaseData>*  >(p->rightChild);
      else
        {
          p = static_cast< threadBinNode<BaseData>*  >(p->rightChild);
          while (!p->leftThread)
            p =  static_cast< threadBinNode<BaseData>*  >(p->leftChild);
        }
      if (p !=  BinThreadTree<BaseData>::root )
        processNode(p->info);
    }
  while (p != root);
}




template <class BaseData>
bool BinThreadTree<BaseData>::preOrderAdd( BaseData item)
{

/*  TODO */

  threadBinNode<BaseData> *q, *p, *parentq;
  bool left, done;
  p = new threadBinNode<BaseData>;
  p -> info = item;

  // Prepare for the while test by following the left child pointer
  // from the dummy header

  parentq =  BinThreadTree<BaseData>::root;
  q =   static_cast< threadBinNode<BaseData>*  >
        ( BinThreadTree<BaseData>::root ->  leftChild ) ;

  left = true;
  done = parentq -> leftThread;



  while ( !done )

    // Now allow q and its parent to travel down an appropriate branch until
    // an insertion spot is found
    //   if (precedes( item, q -> info) )
    if ( item <= q -> info )
      {
        parentq = static_cast< threadBinNode<BaseData>*  >(q);
        q =  static_cast< threadBinNode<BaseData>*  >
             (q -> leftChild )  ;
        left = true;
        done = parentq -> leftThread;
      }
    else
      {

        parentq = static_cast< threadBinNode<BaseData>*  >(q);
        q =  static_cast< threadBinNode<BaseData>*  >
             ( q -> rightChild ) ;
        left = false;
        done = parentq -> rightThread;
      }


  // Now insert p as the left or right child of parentq
  p -> leftThread = true;
  p -> rightThread = true;
 
 if(left == true)
{
  if (parentq -> rightThread == false)
    {
      p -> rightChild = static_cast< threadBinNode<BaseData>*  >( parentq -> rightChild);
      p -> leftChild =static_cast< threadBinNode<BaseData>*  >(parentq);
      parentq -> leftChild = static_cast< threadBinNode<BaseData>*  >(p);
      parentq -> leftThread = false;
    }
  else
    {
      p -> leftChild = static_cast< threadBinNode<BaseData>*  >(parentq -> rightChild);
      p -> rightChild = static_cast< threadBinNode<BaseData>*  >(parentq);
      parentq -> rightChild = static_cast< threadBinNode<BaseData>*  >(p);
      parentq -> leftChild = static_cast< threadBinNode<BaseData>*  >(p);
      parentq -> leftThread = false;
    }
}
else
  if (parentq -> leftThread == true)
  {
      p -> leftChild = static_cast< threadBinNode<BaseData>*  >(parentq);
      p -> rightChild =static_cast< threadBinNode<BaseData>*  >(parentq -> rightChild);
      parentq -> rightChild = static_cast< threadBinNode<BaseData>*  >(p);
      parentq -> rightThread = false;
  }
  else
  {
      p -> leftChild = static_cast< threadBinNode<BaseData>*  >(parentq);
      p -> rightChild = static_cast< threadBinNode<BaseData>*  >(p->leftChild->rightChild);
      parentq -> rightChild = static_cast< threadBinNode<BaseData>*  >(p);
      parentq -> leftChild = static_cast< threadBinNode<BaseData>*  >(p);
      parentq -> leftThread = false;
  }


  return true ;
}

template <class BaseData>
threadBinNode<BaseData>* BinThreadTree<BaseData>::find_rightmost(threadBinNode<BaseData>* parentq)
{
  threadBinNode<BaseData>* temp = parentq;
  while (temp->leftThread == false)
  {
    temp = static_cast<threadBinNode<BaseDatas*>( parentq->leftchild);
  }

  while (temp->rightThread == false)
  {
    temp = static_cast<threadBinNode<BaseData>*> (temp->rightChild);
  }
}

template <class BaseData>
void BinThreadTree<BaseData>::preorder(void (*processNode)(BaseData &item))
{

  threadBinNode<BaseData>  *p;
  p =    static_cast< threadBinNode<BaseData>*  >
         ( BinThreadTree<BaseData>::root ->  leftChild ) ;
  do
    {
      if ( p !=   BinThreadTree<BaseData>::root )
        processNode( p->info );
      if  (!p -> leftThread )
        p =  static_cast< threadBinNode<BaseData>*  >(p -> leftChild);
      else
        p = static_cast< threadBinNode<BaseData>*  >(p->rightChild);

    }
  while (p !=   BinThreadTree<BaseData>::root );


}





#endif

