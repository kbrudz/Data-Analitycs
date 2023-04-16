data {
    int<lower=0> N;  // number of samples
    real miles[N];  // samples
}

generated quantities {
    real alfa = normal_rng(2, 0.0001);
    real theta = normal_rng(0.0002, 0.00008);
    real lambda[N];
    real accidents_number[N];
    for (i in 1:N) {
       lambda[i] = exp(alfa + theta * miles[i]);
       accidents_number[i] = poisson_rng(lambda[i]);
    }
}