% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generatePermutationMatrix.R
\name{generate_permutation_matrix}
\alias{generate_permutation_matrix}
\title{Generate a permutation matrix of module scores}
\usage{
generate_permutation_matrix(
  se,
  gnum = 50,
  permutation_nr = 1000,
  cluster_anno = "seurat_clusters",
  workers = NULL
)
}
\arguments{
\item{se}{A Seurat object containing gene expression and metadata.}

\item{gnum}{Number of genes to sample for each permutation (default: 50).}

\item{permutation_nr}{Number of permutations to perform (default: 1000).}

\item{cluster_anno}{The name of the column in the metadata with cluster identities (default: \code{"seurat_clusters"}).}

\item{workers}{Optional. Number of parallel workers. If \code{NULL} or \code{workers <= 1}, runs sequentially.}
}
\value{
A data frame where rows represent permutations and columns represent clusters.
Each entry is the median module score of a randomly sampled gene set for that cluster.
}
\description{
This function computes a permutation matrix by generating random gene sets and scoring them
using Seurat's \code{AddModuleScore()}. Results are aggregated as median scores per cluster.
Supports both sequential and parallel computation for reproducibility and speed.
}
\examples{
# Run sequentially
perm.mat <- generate_permutation_matrix(se, gnum = 50, permutation_nr = 100)

# Run in parallel
perm.mat <- generate_permutation_matrix(se, gnum = 50, permutation_nr = 100, workers = 4)
}
