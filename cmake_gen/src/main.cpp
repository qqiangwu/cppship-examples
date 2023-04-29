#include <fmt/core.h>
#include <scope_guard.hpp>

int main()
{
        SCOPE_EXIT { fmt::print("{}", CMAKE_GEN_VERSION); };
}
