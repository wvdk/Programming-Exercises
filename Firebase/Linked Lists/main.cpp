#include <stddef.h>
#include <stdlib.h>
#include <stdio.h>

struct Node {
  int data;
  Node *next;
};

// The linked list we're trying to create is 1->2->3->NULL

int main() {

  printf("\nStarting.\n");

  //  Node *A;
  
  //  A = NULL;

  Node *temp = new Node();

  temp->data = 3;

  printf("\nEnding.\n\n");

  return 0;
}

