#include <gtest/gtest.h>

#include "inner.h"

TEST(inner_test, header)
{
    EXPECT_EQ(foo(), 1);
}