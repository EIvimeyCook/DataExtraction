<div align="center">
 <h1>DataExtraction</h1>
</div>

<!-- badges: start -->
[![DOI](https://img.shields.io/badge/DOI-10.1002%2Fjrsm.1663-blue)](https://doi.org/10.1002/jrsm.1663)
[![Zenodo](https://img.shields.io/badge/Zenodo-10.5281%2Fzenodo.8187175-blue)](https://doi.org/10.5281/zenodo.8187175)
[![License: MIT](https://img.shields.io/badge/license-MIT-green)](LICENSE.md)
[![Data: CC BY 4.0](https://img.shields.io/badge/data-CC%20BY%204.0-green)](LICENSE-data.md)
<!-- badges: end -->

Data and code for the paper:

> Ivimey-Cook, E. R., Noble, D. W. A., Nakagawa, S., Lajeunesse, M. J., & Pick,
> J. L. (2023). Advice for improving the reproducibility of data extraction in
> meta-analysis. *Research Synthesis Methods*, 14(6), 911–915.
> <https://doi.org/10.1002/jrsm.1663>

## Overview

Meta-analyses across ecology, evolution, and the health sciences depend heavily
on effect sizes read off figures in the primary literature. That extraction step
is rarely described in enough detail to be repeated. Even where a
meta-analysis's data are archived (43 of the 55 screened here), the calibration
data and source figures almost never are (3 and 4 of 55). The
result is that a substantial fraction of the evidence base in any given synthesis
cannot be verified by anyone else.

This paper surveys how reproducibly data extraction is currently reported and
sets out practical advice for improving it. This repository holds the **screening
dataset and analysis code** behind that survey: a review of 80 screened records
(mostly journal articles, but also theses, preprints and other record types).
For the 55 published meta-analyses, it records whether extracted data
were archived, whether they were interoperable, whether calibration data were
retained, and whether the location of extracted values was documented.

## Authors

Edward R. Ivimey-Cook, Daniel W. A. Noble, Shinichi Nakagawa, Marc J. Lajeunesse,
and Joel L. Pick

## Files

### `metaDigitiseExtraction_dat.csv`

Screening results for 80 records, published and unpublished. Of these, 55 are
published meta-analyses, and only those have the later screening fields filled
in; the rest are systematic reviews, databases, guidelines, theses, preprints
and other record types.

**Dimensions:** 80 rows × 19 columns. One row per screened record.

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
| `Interoperable` | categorical | Were archived data in a non-proprietary, reusable format? All records with archived data are `Yes`; `No` occurs only where `Data_Present` is `No`, meaning no data were archived |
| `MetaDigitise_Use?` | categorical | Was `metaDigitise` or comparable software used, and was extraction from figures? The only values are `Figures` (all 55 meta-analyses) and `NA` |
| `No_Effects/Studies` | character | Number of effect sizes or studies extracted from figures; `No` where no count was recorded, so convert to numeric before use |
| `No_Total` | numeric | Total number of effect sizes or studies in the synthesis |
| `Prop_Extract` | numeric | Percentage (0-100) of the synthesis derived from figure extraction: `No_Effects/Studies` / `No_Total` × 100 |
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

Depends on `tidyverse`, `janitor`, `hablar`, `patchwork`, `ggthemes`, `extrafont`, and
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

## License

Code is licensed under the [MIT License](LICENSE.md).
Data are licensed under [CC BY 4.0](LICENSE-data.md).

A machine-readable [`CITATION.cff`](CITATION.cff) is included, so GitHub's
"Cite this repository" button gives formatted APA and BibTeX.
