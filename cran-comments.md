## R CMD check results
0 errors ✔ | 0 warnings ✔ | 1 note ✖

checking CRAN incoming feasibility ... NOTE
  Maintainer: 'Assad Asil Companioni <aasil@iom.int>'
  
  New submission
  
  Package was archived on CRAN
  
  CRAN repository db overrides:
    X-CRAN-Comment: Archived on 2025-07-30 for repeated policy violation.
  
    On Internet access.

## Addressing CRAN policy violation
* The policy violation noted above pertained to:
> Packages which use Internet resources should fail gracefully with an informative message if the resource is not available or has changed (and not give a check warning nor error).
This was addressed by conditioning the execution of cell blocks in the README
and vignettes on the availability of a subscription key through an environment
variable.
