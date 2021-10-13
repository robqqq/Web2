package com.example.web2.model;

import java.util.ArrayDeque;
import java.util.Collection;
import java.util.Collections;
import java.util.Deque;

public class Results {
    private Deque<Point> points;

    public Results() {
        this.points = new ArrayDeque<>();
    }

    public void addPoint(Point point){
        points.push(point);
    }

    public Collection<Point> getResults(){
        return Collections.unmodifiableCollection(points);
    }

    public Point getFirst(){
        return points.getFirst();
    }
}
