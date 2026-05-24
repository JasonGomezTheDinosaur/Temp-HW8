#include <gtest/gtest.h>
#include <sstream>

#include "graph.h"


TEST(Edge, TestingInput) {
    Edge e;
    istringstream input("0 3 1");

    input >> e;

    EXPECT_EQ(e.u, 0);
    EXPECT_EQ(e.v, 3);
    EXPECT_EQ(e.weight, 1);
}


TEST(Graph, EdgesFromTest) {
    Graph g;
    g.numVertices = 3;
    g.push_back({0, 1, 5});
    g.push_back({0, 2, 3});

    VertexList neighbors = g.edges_from(0);
    EXPECT_EQ(neighbors.size(), 2);

    bool has1 = find(neighbors.begin(), neighbors.end(), 1) != neighbors.end();
     bool has2 = find(neighbors.begin(), neighbors.end(), 2) != neighbors.end();

    EXPECT_TRUE(has1);
    EXPECT_TRUE(has2);

}

TEST(Graph, SumWeightsTest) {
EdgeList edges = {{0, 1, 5}, {1, 2, 3}, {6, 9, 7}};
    int total = sum_weights(edges);
    EXPECT_EQ(total, 15);
}

TEST(Graph, SmallDFSTest) {
Graph g;
    g.numVertices = 4;
    g.push_back({0, 3, 1});
    g.push_back({3, 1, 2});
    g.push_back({1, 2, 3});
    
    EXPECT_EQ(g.size(), 3);

    VertexList result = dfs(g, 0);
    EXPECT_EQ(result[0], 0);
    EXPECT_EQ(result[1], 3);
    EXPECT_EQ(result[2], 1);
    EXPECT_EQ(result[3], 2);



}

TEST(Graph, MediumDFSTest) {
Graph g;
    g.numVertices = 6;
    g.push_back({4, 0, 1});
    g.push_back({5, 2, 1});
    g.push_back({0, 5, 2});
    g.push_back({3, 5, 3});
    g.push_back({1, 2, 4});

    EXPECT_EQ(g.size(), 5);

    VertexList result = dfs(g, 0);
    EXPECT_EQ(result[0], 0);
    EXPECT_EQ(result[1], 5);
    EXPECT_EQ(result[2], 2);
    EXPECT_EQ(result[3], 3);
    EXPECT_EQ(result[4], 4);
    EXPECT_EQ(result[5], 1);



}


TEST(Graph, LargeDFSTest) {
Graph g;
    g.numVertices = 6;
    g.push_back({5, 6, 1});
    g.push_back({0, 3, 5});
    g.push_back({2, 4, 5});
    g.push_back({3, 5, 6});
    g.push_back({0, 1, 7});
    g.push_back({1, 4, 7});
    
    EXPECT_EQ(g.size(), 6);

    VertexList result = dfs(g, 0);
    EXPECT_EQ(result[0], 0);
    EXPECT_EQ(result[1], 3);
    EXPECT_EQ(result[2], 5);
    EXPECT_EQ(result[3], 6);
    EXPECT_EQ(result[4], 4);
    EXPECT_EQ(result[5], 1);
    EXPECT_EQ(result[6], 2);



}


TEST(Graph, SmallBFSTest) {
Graph g;
    g.numVertices = 4;
    g.push_back({0, 3, 1});
    g.push_back({3, 1, 2});
    g.push_back({1, 2, 3});
    
    EXPECT_EQ(g.size(), 3);

    VertexList result = bfs(g, 0);
    EXPECT_EQ(result[0], 0);
    EXPECT_EQ(result[1], 3);
    EXPECT_EQ(result[2], 1);
    EXPECT_EQ(result[3], 2);



}

TEST(Graph, MediumBFSTest) {
Graph g;
    g.numVertices = 6;
    g.push_back({4, 0, 1});
    g.push_back({5, 2, 1});
    g.push_back({0, 5, 2});
    g.push_back({3, 5, 3});
    g.push_back({1, 2, 4});

    EXPECT_EQ(g.size(), 5);

    VertexList result = bfs(g, 0);
    EXPECT_EQ(result[0], 0);
    EXPECT_EQ(result[1], 1);
    EXPECT_EQ(result[2], 5);
    EXPECT_EQ(result[3], 2);
    EXPECT_EQ(result[4], 4);
    EXPECT_EQ(result[5], 3);



}


TEST(Graph, LargeBFSTest) {
Graph g;
    g.numVertices = 7;
    g.push_back({5, 6, 1});
    g.push_back({0, 3, 5});
    g.push_back({2, 4, 5});
    g.push_back({3, 5, 6});
    g.push_back({0, 1, 7});
    g.push_back({1, 4, 7});
    
    EXPECT_EQ(g.size(), 6);

    VertexList result = bfs(g, 0);
    EXPECT_EQ(result[0], 0);
    EXPECT_EQ(result[1], 1);
    EXPECT_EQ(result[2], 3);
    EXPECT_EQ(result[3], 2);
    EXPECT_EQ(result[4], 4);
    EXPECT_EQ(result[5], 5);
    EXPECT_EQ(result[6], 6);



}
