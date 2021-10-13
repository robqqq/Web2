package com.example.web2.model;

public class PointChecker {
    private final Limits<Double> xLimits;
    private final Limits<Double> yLimits;
    private final Limits<Double> rLimits;

    public PointChecker(Limits<Double> xLimits, Limits<Double> yLimits, Limits<Double> rLimits) {
        this.xLimits = xLimits;
        this.yLimits = yLimits;
        this.rLimits = rLimits;
    }

    public void check(Point point){
        double x = point.getX();
        double y = point.getY();
        double r = point.getR();
        if (!valid(x, y, r)){
            point.setValid(false);
        } else {
            point.setResult(hit(x, y ,r));
            point.setValid(true);
        }
    }

    private boolean valid(double x, double y, double r){
        return xLimits.checkLimits(x) && yLimits.checkLimits(y) && rLimits.checkLimits(r);
    }

    private boolean hit(double x, double y, double r) {
        return x >= 0 && y >= 0 && x <= r && y <= r ||
                x <= 0 && y <= 0 && y >= - x - r / 2 ||
                x  >= 0 && y <= 0 && x * x + y * y <= r * r / 4;
    }

}
