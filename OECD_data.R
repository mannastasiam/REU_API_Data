if (!require(jsonlite)) {
  install.packages("jsonlite")
  library(jsonlite)
}
  
# Define the API endpoint URL
api_endpoint1 <- "https://stats.oecd.org/SDMX-JSON/data/FDI_INC_IND/AUS+AUT+BEL+CAN+CHL+COL+CRI+CZE+DNK+EST+FIN+FRA+DEU+GRC+HUN+ISL+IRL+ISR+ITA+JPN+KOR+LVA+LTU+LUX+MEX+NLD+NZL+NOR+POL+PRT+SVK+SVN+ESP+SWE+CHE+TUR+GBR+USA.USD+SUB.DI+DO.T_D4P_F+T_D4S_F5+T_D42S_F5+T_D43S_F5+T_D4Q_FL.ALL+RSP+ROU.NET.IMC.W0.FDI_T+A+B+B06_09+A_B+C+C10T12+C13T18X15+C13_14+C16T18+C19T22+C19+C20+C21+C22+C24T28X27+C24_25+C26+C262+C263_264+C265_266+C28+C29_30+C29+C30+C303+C_OTH+D35+E+E36+E37T39+F+GTU+G+G45+G46+G47+H+HX53+H49+H50+H51+H52+H53+I+J+J58_62_63+J59_60+J61+K+K64+K641+K642+K643+K65+K66+L+M+M69+M691+M692+M70+M701+M702+M71+M72+M73+M731+M732+M74_75+N+N77+N78T82+N79+O_T_U+P85+Q+R+R90+R91+R92_93+S+S94+S95_96+C_NAL+PRV_RE+ATUXFPRV/all?startTime=2021&endTime=2021&pid=2a8d132d-88bd-4fdf-b158-f67f06f2da93"

# Fetch data from the OECD API
oecd_data <- fromJSON(api_endpoint1)

# Save the data to a CSV file
write.csv(oecd_data, file = "oecd_data.csv", row.names = FALSE)

api_endpoint2 <- "https://stats.oecd.org/SDMX-JSON/data/FDI_INC_CTRY/AUS+AUT+BEL+CAN+CHL+COL+CZE+DNK+EST+FIN+FRA+DEU+GRC+HUN+ISL+IRL+ISR+ITA+JPN+KOR+LVA+LTU+LUX+MEX+NLD+NZL+NOR+POL+PRT+SVK+SVN+ESP+SWE+CHE+TUR+GBR+USA.USD+SUB.DI+DO.T_D4P_F+T_D4S_F5+T_D42S_F5+T_D43S_F5+T_D4Q_FL.ALL+RSP+ROU.NET.IMC.W0+C_W190+P0+AUS+AUT+BEL+CAN+CHL+COL+CZE+DNK+EST+FIN+FRA+DEU+GRC+HUN+ISL+IRL+ISR+ITA+JPN+KOR+LVA+LTU+LUX+MEX+NLD+NZL+NOR+POL+PRT+SVK+SVN+ESP+SWE+CHE+TUR+GBR+USA+E1+E1X+ALB+AND+BLR+BIH+BGR+HRV+CYP+FRO+GIB+GGY+VAT+IMN+JEY+XKO+LIE+MKD+MLT+MDA+MNE+ROM+RUS+SMR+SRB+SCG+UKR+F1+F4+DZA+EGY+LBY+MAR+TUN+F2+AGO+BEN+BWA+IOT+BFA+BDI+CMR+CPV+CAF+TCD+COM+COG+COD+CIV+DJI+GNQ+ERI+ETH+GAB+GMB+GHA+GIN+GNB+KEN+LSO+LBR+MDG+MWI+MLI+MRT+MUS+MOZ+NAM+NER+NGA+RWA+SHN+STP+SEN+SYC+SLE+SOM+ZAF+SSD+SDN+SWZ+TZA+TGO+UGA+ZMB+ZWE+A1+A1X+A2+A2X+GRL+A5+A5X+AIA+ATG+ABW+BHS+BRB+BLZ+BMU+BES+CYM+CRI+CUB+CUW+DMA+DOM+SLV+GRD+GTM+HTI+HND+JAM+MSR+ANT+NIC+PAN+KNA+LCA+VCT+SXM+TTO+TCA+VGB+VIR+A7+A7X+ARG+BOL+BRA+ECU+FLK+GUY+PRY+PER+SUR+URY+VEN+S1+S1X+S3+S3X+S35+BHR+IRQ+KWT+OMN+QAT+SAU+ARE+YEM+S37+S37X+ARM+AZE+GEO+JOR+LBN+PSE+SYR+S6+S6X+AFG+BGD+BTN+BRN+KHM+CHN+HKG+IND+IDN+IRN+KAZ+PRK+KGZ+LAO+MAC+MYS+MDV+MNG+MMR+NPL+PAK+PHL+SGP+LKA+TWN+TJK+THA+TLS+TKM+UZB+VNM+O1+O1X0+ASM+ATA+BVT+CXR+CCK+COK+FJI+PYF+ATF+GUM+HMD+KIR+MHL+FSM+NRU+NCL+NIU+NFK+MNP+PLW+PNG+PCN+WSM+SLB+SGS+TKL+TON+TUV+UMI+VUT+WLF+ECO_ZONES+B6+B5+B4+B3+B2+R4+R220+R221+R222+F98+R25+R251+R252+R253+R254+R255/all?startTime=2021&endTime=2021&pid=2a8d132d-88bd-4fdf-b158-f67f06f2da93"
oecd_data2 <- fromJSON(api_endpoint2)