package main

import (
    "github.com/prometheus/client_golang/prometheus"
    "github.com/prometheus/client_golang/prometheus/promhttp"
    "net/http"
)

var (
    // Define a new counter metric
    requestCount = prometheus.NewCounterVec(
        prometheus.CounterOpts{
            Name: "http_requests_total",
            Help: "Total number of HTTP requests",
        },
        []string{"method", "status"},
    )
)

func init() {
    // Register the counter in the global Prometheus registry
    prometheus.MustRegister(requestCount)
}

func handler(w http.ResponseWriter, r *http.Request) {
    // Increment the counter metric for this request
    requestCount.WithLabelValues(r.Method, "200").Inc()
    w.Write([]byte("Hello, Prometheus!"))
}

func main() {
    // Expose the /metrics endpoint for Prometheus scraping
    http.Handle("/metrics", promhttp.Handler())
    http.HandleFunc("/", handler)
    http.ListenAndServe(":8080", nil)
}
