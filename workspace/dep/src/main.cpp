#include <fmt/core.h>
#include <gsl/zstring>

int main()
{
    gsl::czstring s = "fmtlib";
    fmt::print(s);
}
