#include <iostream>
#include <vector>
#include <queue>
#include <limits>
#include <random>
#include <chrono>

using namespace std;

const int INF = numeric_limits<int>::max();

struct Edge {
    int to, weight;
};

using Graph = vector<vector<Edge*>>;

// Function to generate a large random graph with pointer-based edges (for extra allocations)
Graph generate_large_graph(int nodes, int edges) {
    Graph graph(nodes);
    random_device rd;
    mt19937 gen(rd());
    uniform_int_distribution<> node_dist(0, nodes - 1);
    uniform_int_distribution<> weight_dist(1, 100);

    for (int i = 0; i < edges; ++i) {
        int u = node_dist(gen);
        int v = node_dist(gen);
        int weight = weight_dist(gen);

        if (u != v) {
            graph[u].push_back(new Edge{v, weight});
            graph[v].push_back(new Edge{u, weight}); // For undirected graph
        }
    }
    return graph;
}

vector<int> dijkstra(const Graph& graph, int start) {
    int n = graph.size();
    vector<int> dist(n, INF);
    priority_queue<pair<int, int>, vector<pair<int, int>>, greater<>> pq;

    dist[start] = 0;
    pq.push({0, start});

    while (!pq.empty()) {
        int d = pq.top().first;
        int u = pq.top().second;
        pq.pop();

        if (d > dist[u]) continue;

        // Memory-intensive temporary vector to store neighbors
        vector<Edge*> temp_neighbors = graph[u];

        for (auto edge : temp_neighbors) {
            int v = edge->to;
            int weight = edge->weight;

            // Additional allocation to simulate more malloc calls
            int* temp_weight = new int(weight);

            if (dist[u] + *temp_weight < dist[v]) {
                dist[v] = dist[u] + *temp_weight;
                pq.push({dist[v], v});
            }

            delete temp_weight; // Free temporary allocation
        }
    }
    return dist;
}

int main() {
    int nodes = 1000000;
    int edges = 100000000;

    Graph graph = generate_large_graph(nodes, edges);

    auto start_time = chrono::high_resolution_clock::now();
    vector<int> distances = dijkstra(graph, 0);
    auto end_time = chrono::high_resolution_clock::now();
    auto duration = chrono::duration_cast<chrono::milliseconds>(end_time - start_time);

    cout << "Time taken by Dijkstra's algorithm with extra allocations: " << duration.count() << " milliseconds" << endl;

    // Clean up allocated edges
    for (auto& edges : graph)
        for (auto edge : edges)
            delete edge;

    return 0;
}
