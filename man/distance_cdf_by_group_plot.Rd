% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_distance_cdf_by_group.R
\name{distance_cdf_by_group_plot}
\alias{distance_cdf_by_group_plot}
\title{What percentage of this group's population lives less than X miles from a site?}
\usage{
distance_cdf_by_group_plot(
  results_bybg_people,
  radius_miles = round(max(results_bybg_people$distance_min_avgperson, na.rm = T),
    table_rounding_info("distance_min_avgperson")),
  demogvarname = "Demog.Index",
  demoglabel = demogvarname,
  color1 = "red",
  color2 = "black"
)
}
\arguments{
\item{results_bybg_people}{data.table from doaggregate()$results_bybg_people}

\item{radius_miles}{miles radius that was max distance analyzed}

\item{demogvarname}{name of column in results_bybg_people, e.g., "pctlowinc"}

\item{demoglabel}{friendly text name for labelling graphic, like "Low income residents"}

\item{color1}{color like "red" for residential population group of interest}

\item{color2}{color like "gray" for everyone else}
}
\value{
invisibly returns full table of sorted distances of blockgroups, cumulative count of demog group at that block group's distance,
and cumulative count of everyone else in that block group
}
\description{
This plots the cumulative share of residents found within each distance,
for a single population group.

This function, distance_cdf_by_group_plot(), is based on ejamit()$results_bybg_people,
which provides only block group resolution information about distance.
For block resolution analysis of distance by group, see \code{\link[=plot_distance_by_pctd]{plot_distance_by_pctd()}}.
}
\details{
The function distance_cdf_by_group_plot is SLOW - ***needs to be optimized
}
\examples{
 y <- ejamit(testpoints_100, radius = 3)
 
 # see barplot and table comparing groups to see which are closer to sites analyzed
 plot_distance_mean_by_group(y$results_bybg_people) # or distance_mean_by_group() synonym
 
 # table - proximity of sites for just one demog group vs rest of population
 print(distance_by_group(y$results_bybg_people,
   demogvarname = 'pctlowinc'))
   
 # plot cumulative share of group by distance vs overall population
  distance_by_group_plot(y$results_bybg_people,
     demogvarname = 'pctlowinc' )
     
 # plot cum. shares for two groups  
 # about 14\% of black and 12\% of asian residents have a site within 1 mile. 
 # 29\% vs 21\% have a site within 1.5 miles.
 round(xyz[findInterval(c(1, 1.5),  xyz$dist), ], 3) 
 
 # plot is too busy for all groups at once so this is a way to tap through them 1 by 1
 these = c(names_d, names_d_subgroups)
 for (i in 1:length(these)) {
   readline("press any key to see the next plot")
   print(distance_by_group_plot(y$results_bybg_people, demogvarname = these[i]) )
 }
 

}
\seealso{
\code{\link[=distance_by_group]{distance_by_group()}} \code{\link[=getblocksnearbyviaQuadTree]{getblocksnearbyviaQuadTree()}} for examples
}
