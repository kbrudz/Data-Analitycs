data {
    int<lower=0> N;  // number of samples
    real miles[N];  // samples
}

generated quantities {
    real theta = normal_rng(0.0001, 0.00005);
    real alfa[N];
    real lambda[N];
    array[N] int<lower=0> accidents_number;
    for (i in 1:N) {
        alfa[i] = normal_rng(2.5, 0.001);
        lambda[i] = exp(alfa[i] + theta * miles[i]);
        accidents_number[i] = poisson_rng(lambda[i]);
    }
}