#include <math.h>

typedef float V __attribute__((vector_size(16)));

extern float bar(float a, float b);

V foo(V a, V b)  {
    return a+b*a;
}

float foo(float a, float b)  {
    return bar(a, b)+b*a;
}

int f1(int height, int width, const unsigned char* img) {
    int count = 0;
    for (int j = 0; j < height; j++)
        for (int i = 0; i < width; i++)
            if (img[j * width + i] > 0)
                count++;
    return count;
}

int f2(int height, int width, const unsigned char* img) {
    int count = 0;
    for (int j = 0; j < width; j++)
        for (int i = 0; i < height; i++)
            if (img[j * width + i] > 0)
                count++;
    return count;
}

float pows(float a,float b,float c, float d, float e, float f, float x)
{
  return
      a * powf(x, 5.f) +
      b * powf(x, 4.f) +
      c * powf(x, 3.f) +
      d * powf(x, 2.f) +
      e * x            + f;
}

float horner(float a, float b, float c, float d, float e, float f, float x)
{
  return ((((a * x + b) * x + c) * x + d) * x + e) * x + f;
}

void f3(int cols, const unsigned char* p0,
                const unsigned char* p1,
                unsigned char* dptr) {

    for (int col = 0; col < cols; ++col) {
        dptr[col] = (p0[col*2]+p0[col*2+1]
                    + p1[col*2]+p1[col*2+1]+2)>>2;
    }
}

int sum(int n, int m) {
    int sum = 0;
    for (int c0 = n; c0 > 0; c0--) {
        for (int c1 = m; c1 > 0; c1--) {
            sum += c0 > c1 ? 1 : 0;
        }
    }
    return sum;
}