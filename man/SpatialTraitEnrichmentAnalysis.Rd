% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SpatialTraitEnrichmentAnalysis.R
\name{SpatialTraitEnrichmentAnalysis}
\alias{SpatialTraitEnrichmentAnalysis}
\title{Spatial Trait Enrichment Analysis}
\usage{
SpatialTraitEnrichmentAnalysis(
  se,
  perm.mat.label.data,
  perm.mat.window50.data,
  window_rank_list_abr_label,
  gene_list,
  cluster_anno = "seurat_clusters",
  imputation = "all",
  log_file = NULL
)
}
\arguments{
\item{se}{A Seurat object containing gene scores and clustering metadata.}

\item{perm.mat.label.data}{A data frame of null median scores for the full gene list,
where columns correspond to cluster names.}

\item{perm.mat.window50.data}{A data frame of null median scores for ranked gene sets
(e.g., sliding windows), with columns corresponding to cluster names.}

\item{window_rank_list_abr_label}{A list or vector of window rank identifiers
used to reference the rank-specific gene sets.}

\item{gene_list}{A character string matching the name of the gene score column in \code{se@meta.data}
to test for enrichment (e.g., "OpenTargets_SCZ_Genetic_1").}

\item{cluster_anno}{Column name in \code{se@meta.data} specifying the clustering to use
(e.g., "seurat_clusters" or "supercluster_term").}

\item{imputation}{Strategy for handling p-value calculation when no permutations exceed the observed value.
Options are:
- "all": Always add 1 to numerator and denominator (default)
- "none": No imputation, can result in p=0
- "dynamic": Only impute when no permutations exceed observed value}

\item{log_file}{Path to the log file for imputed p-values}
}
\value{
A data frame of unadjusted p-values for each cluster.
}
\description{
Performs permutation-based enrichment analysis of a trait-specific gene score
(e.g. from OpenTargets) across spatial or single-cell clusters, comparing
observed medians to a null distribution.
}
\examples{
pval_mat <- SpatialTraitEnrichmentAnalysis(
  se = se,
  perm.mat.label.data = perm.mat.genetic.data,
  perm.mat.window50.data = perm.mat.window50.data,
  window_rank_list_abr_label = window50_rank_list_SCZ_Genetic,
  gene_list = "OpenTargets_SCZ_Genetic_1",
  cluster_anno = "supercluster_term",
  imputation = "dynamic"
)
}
