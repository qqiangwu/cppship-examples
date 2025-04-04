#include <iostream>
#include <scope_guard.hpp>

int main()
{
    SCOPE_EXIT { std::cout << "header_only_dep"; };
}
