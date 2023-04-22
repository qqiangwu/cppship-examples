#include <benchmark/benchmark.h>

static void BM_SomeFunction(benchmark::State& state)
{
    int x = 0;
    // Perform setup here
    for (auto _ : state) {
        // This code gets timed
        benchmark::DoNotOptimize(++x);
    }

    benchmark::DoNotOptimize(x);
}

// Register the function as a benchmark
BENCHMARK(BM_SomeFunction);

// Run the benchmark
BENCHMARK_MAIN();