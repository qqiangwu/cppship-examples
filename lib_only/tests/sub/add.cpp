#include <gtest/gtest.h>

#include "lib.h"

TEST(test, add)
{
    EXPECT_EQ(lib::add(1, 2), 3);
}