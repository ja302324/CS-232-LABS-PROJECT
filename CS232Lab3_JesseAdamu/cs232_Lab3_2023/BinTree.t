

#ifndef BINTREE_T
#define BINTREE_T

#include <queue>

#include <cstdio>


template <class BaseData>
BinTree<BaseData>::BinTree() : GenTree<BaseData> ()
{
  maxNodes = 0;
  numNodes = 0;
}

template <class BaseData>
BinTree<BaseData>::BinTree( int numOfNodes ) : GenTree<BaseData> ()
{
  maxNodes = numOfNodes;
  numNodes = 0;
}

template <class BaseData>
BinTree<BaseData>::BinTree( const BinTree<BaseData> & initBinTree )
    : GenTree<BaseData>(initBinTree)
{
  if ( initBinTree.root != 0 )
    {
      maxNodes = initBinTree.maxNodes ;
      numNodes = initBinTree.numNodes ;
    }
  else GenTree<BaseData>::root  = 0;
  maxNodes = 0;
  numNodes = 0;
}



template<class BaseData>
BinTree<BaseData>::~BinTree()
{ }



template<class BaseData>
bool BinTree<BaseData>::full()
{
  if ( maxNodes == 0 ) return(false);
  else if ( numNodes == maxNodes ) return(true);
  else
    {
      return ( this -> GenTree<BaseData>::full() ) ;
    }

}




template <class BaseData>
void BinTree<BaseData>::operator = ( const BinTree<BaseData> & initBinTree )
{
  GenTree<BaseData>::operator = (initBinTree);

  maxNodes = initBinTree.maxNodes;
  numNodes = initBinTree.numNodes;
}



template <class BaseData>
void BinTree<BaseData>::breadthFirstTraversal( void (*processnode)(BaseData &value) )
{

  std::queue<  GtNode<BaseData>* > nodes2visit;

  GtNode<BaseData>  *item = GenTree<BaseData>::root;

  if ( item )
    {
      nodes2visit.push( item );

      while ( !nodes2visit.empty() )
        {
          item  =  nodes2visit.front();
          nodes2visit.pop();
          processnode( (item->info) );

          if (item -> firstChild )
            nodes2visit.push( item -> firstChild );

          if (item -> sibling )
            nodes2visit.push( item -> sibling );
        }
    }

}



#endif


