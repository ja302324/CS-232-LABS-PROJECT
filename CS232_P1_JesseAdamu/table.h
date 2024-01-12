/******************************************************************************
*
*   File name : table.h
*
*   Header file for Table ADT
*
*   Programmer:  		B.J. Streller
*
*   Date Written:		in the past
*
*   Date Last Revised:
*
******************************************************************************/


#ifndef  TABLE_H
#define  TABLE_H


#include <stdexcept>
#include "pair.h"		// Pair class


// implements a table containing key/value pairs.
// a table does not contain multiple copies of the same item.
// types T and Key must have a default constructor



template < class Key, typename T >
class Table
  {

  public:
    typedef Key key_type;
    // for  convenience


  private:
    // table implemented using a one dimensional array of key-value pairs
    int tableCapacity;
    int tableSize;

    Pair< key_type, T > *the_table;

    int (*Mapping)( Key k);
    // Mapping is a function which maps keys to
    // an array index; ie a key to address mapping
    // the idea is that Mapping will act on a given key
    // in such a way as to return the relative postion
    // in the sequence at which we expect to find the key
    // Mapping will be used in the remove, add, lookup. =
    // member functions and copy constructor

    void deepCopy(const Table& initTable);

  public:

    // only for debugging
    void   print();

    Table( int n, int (*map)( Key k)  );
    // map is a function to map key to address
    // in the implementation
    // set the function ie have the code line
    // Mapping = map;
    // populates table with default values
    // for the class Key and T


    bool insert(  Pair<  Key, T >  kvpair );
    // return true if item could be added to the
    // table; false if item was not added.


    bool remove(  const Key  aKey );
    // erase the key/value pair with the specified key
    // from the table and return if successful
    // removed item is replaced with default
    // values for Key and T


    T  lookUp (const Key aKey) ;
    // what if key not in table??


    //need copy constructor
    Table( const Table<  Key, T   >   &initTable );


    //need destructor
	~Table();

    // Return true if table contains a key 
    bool isIn(const Key &key) const;

    // Return true if table is empty 
    bool empty() const;

    // Return current size of the table 
    int size() const;

    // Return true if the table is full 
    bool full() const;


	//need assignment operator
	Table< Key, T >&
	operator= (const Table<  Key, T   >   &initTable );


};

#include "table.t"


#endif
