% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/aggregateMetacells.R
\name{aggregate_metacells}
\alias{aggregate_metacells}
\title{Aggregate Gene Expression into Metacells}
\usage{
aggregate_metacells(cell_type_clusters, cluster_col = "cluster_anno")
}
\arguments{
\item{cell_type_clusters}{A list of clustered Seurat objects, typically output from \code{generate_metacell_clusters()}.}

\item{cluster_col}{The metadata column used to track original cell type annotations (default: \code{"cluster_anno"}).}
}
\value{
A merged Seurat object representing all metacells with summed gene expression and assigned metadata.
}
\description{
Aggregates expression data across clusters (metacells) by summing counts
within each cluster of each cell type. Preserves the most common cell type label as metadata.
}
\examples{
clustered_se_list <- generate_metacell_clusters(se, cluster_col = "subclass_label")
metacell_seurat <- aggregate_metacells(clustered_se_list)
}
