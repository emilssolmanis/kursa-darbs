//#include <atlas/cblas.h>
#include <Eigen/Dense>

using Eigen::MatrixXd;

enum CBLAS_ORDER {CblasRowMajor=101, CblasColMajor=102 };
enum CBLAS_TRANSPOSE {CblasNoTrans=111, CblasTrans=112, CblasConjTrans=113,
                      AtlasConj=114};
enum CBLAS_UPLO  {CblasUpper=121, CblasLower=122};
enum CBLAS_DIAG  {CblasNonUnit=131, CblasUnit=132};
enum CBLAS_SIDE  {CblasLeft=141, CblasRight=142};

extern "C" void cblas_dgemm(const enum CBLAS_ORDER Order, const enum CBLAS_TRANSPOSE TransA,
                 const enum CBLAS_TRANSPOSE TransB, const int M, const int N,
                 const int K, const double alpha, double const *A,
                 const int lda, double const *B, const int ldb,
                 const double beta, double *C, const int ldc);

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
        cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, size, size, size, one, m1.data(), size, m2.data(), size, zero, m3.data(), size);
    }
}
