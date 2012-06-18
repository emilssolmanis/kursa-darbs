#include <Eigen/Dense>

using Eigen::MatrixXd;

extern "C" int dgemm_(char* transa, 
                     char* transb, 
                     long int *m, 
                     long int *n, 
                     long int *k, 
                     double *alpha, 
                     double *a, 
                     long int *lda, 
                     double *b, 
                     long int *ldb, 
                     double *beta, 
                     double *c, 
                     long int *ldc);


int main() {
    long int size = 1024;
    double one = 1.0;
    double zero = 0.0;
    char *n = "N";
    
    MatrixXd m1 = MatrixXd::Random(1024, 1024);
    MatrixXd m2 = MatrixXd::Random(1024, 1024);
    MatrixXd m3 = MatrixXd::Random(1024, 1024);

    // double *m1 = new double[1024*1024];
    // double *m2 = new double[1024*1024];
    // double *m3 = new double[1024*1024];

    for (int i = 0; i < NUM_IT; ++i) {
        dgemm_(n, n, &size, &size, &size, &one, m1.data(), &size, m2.data(), &size, &zero, m3.data(), &size);
        // dgemm_(n, n, &size, &size, &size, &one, m1, &size, m2, &size, &zero, m3, &size);
    }
}
