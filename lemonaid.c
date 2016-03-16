#include "lemonaid.h"

#include <stdlib.h>

int main(void)
{
    char *payload = "PAYLOAD";

    struct node *node = node_create(N_TRANSLATION_UNIT, payload, 0);

    free(node);

    return EXIT_SUCCESS;
}
