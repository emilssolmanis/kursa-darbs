#include <boost/random/lagged_fibonacci.hpp>
#include <boost/random/variate_generator.hpp>
#include <boost/random/uniform_real.hpp>
#include <boost/random/normal_distribution.hpp>
#include <boost/nondet_random.hpp>

int main() {
    boost::lagged_fibonacci44497 rng;
    boost::random_device rd;
    boost::uniform_real<double> distr(0, 1);
    rng.seed(rd());

    for (int i = 0; i < NUM_IT; ++i) {
        distr(rng);
    }
    
    return 0;
}
