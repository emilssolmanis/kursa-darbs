#include <random>

int main() {
    std::ranlux48_base rng;
    std::random_device rd;
    std::uniform_real_distribution<double> distr(0, 1);
    rng.seed(rd());

    for (int i = 0; i < NUM_IT; ++i) {
        distr(rng);
    }
    
    return 0;
}
