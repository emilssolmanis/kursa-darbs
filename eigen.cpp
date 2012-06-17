#include <Eigen/Dense>

using Eigen::MatrixXd;

int main() {
    MatrixXd m1 = MatrixXd::Random(1024, 1024);
    MatrixXd m2 = MatrixXd::Random(1024, 1024);
    MatrixXd m3;

    for (int i = 0; i < NUM_IT; ++i) {
        m3 = m1 * m2;
    }
}
