#include <fmt/core.h>
#include <header_only/lib.h>
#include <simple_lib/lib.h>

int main()
{
    fmt::print("{}", simple_lib::add("2", "5"));
}
