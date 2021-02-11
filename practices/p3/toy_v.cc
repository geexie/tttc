#define VEC_SIZE 16
typedef float V __attribute__((vector_size(VEC_SIZE)));

V foo(V a, V b)  {
    return a+b*a;
}

float foo(float a, float b)  {
    return a+b*a;
}
