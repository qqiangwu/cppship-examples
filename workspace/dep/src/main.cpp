#include <fmt/core.h>
#include <gsl/zstring>

int main()
{
    constexpr gsl::czstring s = "dep";
    fmt::print(s);
}
