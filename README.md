<div align="center">
 <h1>DataExtraction</h1>
</div>

<!-- badges: start -->
[![Paper](https://img.shields.io/badge/paper-10.1002%2Fjrsm.1663-blue)](https://doi.org/10.1002/jrsm.1663)
[![Zenodo](https://img.shields.io/badge/Zenodo-10.5281%2Fzenodo.8187175-blue)](https://doi.org/10.5281/zenodo.8187175)
<!-- badges: end -->

Data and code for the paper:

> Ivimey-Cook, E. R., Noble, D. W. A., Nakagawa, S., Lajeunesse, M. J., & Pick,
> J. L. (2023). Advice for improving the reproducibility of data extraction in
> meta-analysis. *Research Synthesis Methods*, 14(6), 911–915.
> <https://doi.org/10.1002/jrsm.1663>

## Overview

Meta-analyses across ecology, evolution, and the health sciences depend heavily
on effect sizes read off figures in the primary literature. That extraction step
is rarely described in enough detail to be repeated, and the extracted values,
the calibration data, and the source figures are almost never archived. The
result is that a substantial fraction of the evidence base in any given synthesis
cannot be verified by anyone else.

This paper surveys how reproducibly data extraction is currently reported and
sets out practical advice for improving it. This repository holds the **screening
dataset and analysis code** behind that survey: a review of published
meta-analyses and systematic reviews recording, for each, whether extracted data
were archived, whether they were interoperable, whether calibration data were
retained, and whether the location of extracted values was documented.

## Authors

Edward R. Ivimey-Cook, Daniel W. A. Noble, Shinichi Nakagawa, Marc J. Lajeunesse,
and Joel L. Pick

## Files

### `metaDigitiseExtraction_dat.csv`

Screening results for published meta-analyses and systematic reviews.

**Dimensions:** 79 rows × 19 columns. One row per screened article.

| Column | Type | Description |
| :----- | :--- | :---------- |
| `Key` | character | Zotero item key for the screened record |
| `Item Type` | categorical | Record type (`journalArticle`, `bookSection`, …) |
| `Publication Year` | integer | Year of publication |
| `Author` | character | Author list, semicolon separated |
| `Title` | character | Article title |
| `Journal Title` | character | Journal or book title |
| `Date` | character | Publication date as recorded |
| `Published` | categorical | Publication status |
| `Paper_Type` | categorical | Meta-analysis, systematic review, or other |
| `Data_Present` | categorical | Were extracted data archived? |
| `Interoperable` | categorical | Were archived data in a non-proprietary, reusable format? |
| `MetaDigitise_Use?` | categorical | Was `metaDigitise` or comparable software used, and was extraction from figures? |
| `No_Effects/Studies` | numeric | Number of effect sizes or studies extracted from figures |
| `No_Total` | numeric | Total number of effect sizes or studies in the synthesis |
| `Prop_Extract` | numeric | Proportion of the synthesis derived from figure extraction |
| `Figures_Present?` | categorical | Were the source figures themselves archived? |
| `Caldat?` | categorical | Were calibration data archived? |
| `Location_Given` | categorical | Was the location of extracted values within the source documented? |
| `Notes` | character | Free-text screening notes |

`NA` is used for fields not applicable to a given record — most often where a
record was excluded at the `Paper_Type` stage and later fields were never
assessed.

### `dataExtraction_AnalysisCode.R`

The analysis script. Reads `metaDigitiseExtraction_dat.csv`, summarises the
screening results, and produces the bar figure reported in the paper
(`MD_bars.jpg`). Run it from the repository root.

Depends on `tidyverse`, `hablar`, `patchwork`, `ggthemes`, `extrafont`, and
[`pilot`](https://github.com/olihawkins/pilot), which is installed from GitHub.

## Related tools

- [**shinyDigitise**](https://github.com/EIvimeyCook/shinyDigitise) — the GUI for
  `metaDigitise`, introduced in this paper
- [**metRscreen**](https://github.com/EIvimeyCook/metRscreen) — screening for
  meta-analyses and systematic reviews
- [**DCQC**](https://github.com/EIvimeyCook/DCQC) — data and code quality control
  for editors and reviewers

## Citation

> Ivimey-Cook, E. R., Noble, D. W. A., Nakagawa, S., Lajeunesse, M. J., & Pick,
> J. L. (2023). Advice for improving the reproducibility of data extraction in
> meta-analysis. *Research Synthesis Methods*, 14(6), 911–915.
> <https://doi.org/10.1002/jrsm.1663>

A machine-readable [`CITATION.cff`](CITATION.cff) is included.

## Contact

Edward R. Ivimey-Cook — <e.ivimeycook@gmail.com> —
[ORCID 0000-0003-4910-0443](https://orcid.org/0000-0003-4910-0443)
