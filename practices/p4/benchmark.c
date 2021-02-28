float foo(float x) {
    return x+0.f;
}

float bar(float x) {
    return x*1.f;
}

extern float powf( float base, float exponent);

float pows(float a,float b,float c, float d, float e, float f, float x)
{
  return
      a * powf(x, 5.f) +
      b * powf(x, 4.f) +
      c * powf(x, 3.f) +
      d * powf(x, 2.f) +
      e * x            + f;
}