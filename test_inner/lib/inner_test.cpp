#include <gtest/gtest.h>

#include "lib.h"

TEST(lib, x)
{
    EXPECT_EQ(add(1, 1), 2);
}