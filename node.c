#include "node.h"

#include <stdlib.h>

#if INTERFACE

enum node_type {
    N_TRANSLATION_UNIT
};

struct node {
    char *payload;
    enum node_type type;
    int childc;
    struct node *childv[];
};

#endif

struct node *node_create(enum node_type type, char *payload, int childc, ...)
{
    struct node *node =
        malloc(sizeof(struct node) + (childc * sizeof(struct node *)));

    return node;
}
