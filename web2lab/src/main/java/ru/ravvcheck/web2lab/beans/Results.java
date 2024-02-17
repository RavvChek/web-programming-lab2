package ru.ravvcheck.web2lab.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Results implements Serializable {
    private List<Hit> results;

    public Results() {
        results = new ArrayList<>();
    }

    public List<Hit> getResults() {
        return results;
    }

    public void setResults(List<Hit> results) {
        this.results = results;
    }

    @Override
    public String toString() {
        return "Results{" +
                "results=" + results +
                '}';
    }
}
