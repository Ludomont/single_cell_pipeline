# Single-cell Analysis Pipeline

This repository contains integrated workflows for multi-omic analysis of **CD8+ T cells** across various experimental conditions. It focuses on deciphering cellular states, clonal dynamics, and regulatory landscapes.

### Key Features & Tools:
*   **scRNA-seq:** Full preprocessing, QC, and clustering using `Scanpy`.
*   **scATAC-seq:** Chromatin accessibility profiling and peak calling with `SnapATAC2`.
*   **Multi-omic Integration:** Joint analysis of RNA and ATAC modalities via `MOFA+`.
*   **scTCR-seq:** Clonal repertoire analysis and downstream mapping with `Scirpy`.
*   **Automated Annotation:** High-throughput cell type identification using `CellTypist`.
*   **Regulatory Genomics:** Transcription factor footprinting and motif analysis via the `HINT-ATAC` pipeline.

---
*Developed for theoretical and computational applications in T cell immunology.*
