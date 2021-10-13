package com.example.web2.model;

public class Point {
    private final double x;
    private final double y;
    private final double r;
    private boolean isValid;
    private boolean result;

    public Point(double x, double y, double r) {
        this.x = x;
        this.y = y;
        this.r = r;
    }

    void setResult(boolean result){
        this.result = result;
    }

    void setValid(boolean isValid){
        this.isValid = isValid;
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public double getR() {
        return r;
    }

    public boolean getResult() {
        return result;
    }

    public boolean isValid(){
        return isValid;
    }
}
