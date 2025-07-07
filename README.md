# Recovering genomes from microbial communities with unsupervised learning 

This repository contains the code developed as part of my Master’s thesis titled **“Recovering genomes from microbial communities with unsupervised learning”**, completed at **FCT-NOVA**.

The original implementation is based on **GraphMB**, a cutting-edge metagenomic binning tool designed to recover microbial genomes from long-read assemblies by leveraging assembly graphs and graph neural networks. GraphMB uses graph embeddings generated from the assembly graph to cluster contigs into genome bins.

## Thesis Contributions and Extensions

The work presented here extends the GraphMB framework by integrating additional clustering algorithms such as:

- **CHAMELEON**: A hierarchical clustering method that merges clusters based on connectivity and closeness.
- **K-Means**: The classic iterative clustering algorithm.
- **Gaussian Mixture Models (GMMs)**, among others.

These algorithms were incorporated alongside the existing GraphMB clustering approach to evaluate their performance in metagenomic binning tasks. The experiments focused on comparing these methods to understand the impact of different clustering strategies on genome recovery quality.

## Purpose and Impact

The motivation behind these extensions was to explore how traditional clustering algorithms, when combined with graph-based embeddings, could improve the binning of metagenomic data. This work contributes to advancing unsupervised learning methods in microbial genome assembly and helps expand the toolkit available to researchers in metagenomics.
