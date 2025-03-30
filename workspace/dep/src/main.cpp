#include <fmt/core.h>
#include <gsl/zstring>

int main()
{
    constexpr gsl::czstring s = "fmtlib";
    fmt::print(s);
}
