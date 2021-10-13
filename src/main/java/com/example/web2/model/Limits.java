package com.example.web2.model;

public class Limits<T extends Comparable<T>> {
    private final T min;
    private final T max;
    private final boolean minStrict;
    private final boolean maxStrict;

    public Limits(T min, T max, boolean minStrict, boolean maxStrict) {
        this.min = min;
        this.max = max;
        this.minStrict = minStrict;
        this.maxStrict = maxStrict;
    }

    public boolean checkLimits(T x){
        int minComparison = x.compareTo(min);
        if (minComparison < 0) {
            return false;
        }
        if (minComparison == 0 && minStrict) {
            return false;
        }
        int maxComparison = x.compareTo(max);
        if (maxComparison > 0){
            return false;
        }
        if (maxComparison == 0 && maxStrict) {
            return false;
        }
        return true;
    }
}
