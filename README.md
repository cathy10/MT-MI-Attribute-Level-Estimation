# MT-MI-Attribute-Level-Estimation
Matlab files for the MT/MI attribute level estimation of ACBC survey paper. Research 2019.

## MT/MI Attribute Level Estimation in the Paper Submitted to JOCM ##
This repository includes the files used to generate the results and graphs in the paper <i> Estimation of Most Typical/Most Ideal Attribute Levels in a Small Population ACBC Survey of Disaster Relief Organizations </i>

<ul style="list-style-type:square;">
  <li> [Excel file] count for FBO and NGO feasible sets.xlsx</li>
  The first tab contains MI attribute level counts for all the organizations.The second tab is the s.d.f., which yeilds Table 2 in the paper.
  <li> [Excel file] Ranks.xlsx</li>
  <li> [Excel file] MIRanking.xlsx</li>
  It gives the feasible sets of each organizations. The summary of the attribute levels to the right of each page may not be correct.
  <li> [Matlab file] MIFBO1.m to MINGO6.m</li>
  These are Matlab files that gives the feasible sets and information to build count for FBO and NGO feasible sets.xlsx file.
  <li> [Matlab file] processCount.m</li>
  A function used in MIFBO1.m to MINGO6.m files.
  <li> [Matlab file] ruleOut.m</li>
   A function used in MIFBO1.m to MINGO6.m files.
  <li> [Matlab file] MLE_WMAE.m</li>
  This creates Figure 4 and 5 in the paper. From the graph, we can find the WMAE, MLE, P<sup>*</sup> etc.
  
