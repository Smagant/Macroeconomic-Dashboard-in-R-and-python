library(shinydashboard)
library(reticulate)

source_python('functions.py')

dashboardPage(
  
  dashboardHeader(title = "Macroeconomic Dashboard",
                  titleWidth = 300),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Current figures",
               tabName = "currentfig",
               icon = icon("dashboard")
      ),
      
      menuItem("Graphics",
               tabName = "graphs",
               icon = icon('king',lib ="glyphicon")
      )
    )
  ),
  
  dashboardBody(
    tabItems(
      
      #Page for the current figures
      tabItem(tabName = 'currentfig',
              
              selectInput('country',
                          'Choose your country',
                          data_countries(),
                          selected = 'France'
              ),
              
              h2('Gross domestic product'),
              
              fluidRow(
                #GDP Indicators
                valueBoxOutput('gdpconstant_percentchange'),
                valueBoxOutput('gdpcurrent_dollars'),
                valueBoxOutput('gdpcurrent_percap_dollars'),
                valueBoxOutput('outputgap')
              ),
              
              h2('Inflation'),
              
              fluidRow(
                #Inflation indicators
                valueBoxOutput('inflation_CPI'),
                valueBoxOutput('gdp_deflator')
              ),
              
              h2('Labor Market'),
              
              fluidRow(
                #Labor Market indicators
                valueBoxOutput('unemployment'),
                valueBoxOutput('employment')
                
              ),
              
              h2('Investment and saving'),
              
              fluidRow(
                #Investment and saving indicators
                valueBoxOutput('investment'),
                valueBoxOutput('Gross_national_saving')
              ),
              
              h2('General Government'),
              
              h3('Revenues and expeditures'),
              
              fluidRow(
                valueBoxOutput('Revenue_percentgdp'),
                valueBoxOutput('Total_expenditure_percentgdp')
              ),
              
              h3('Net Lend/borrow and Structural balance'),
              
              fluidRow(
                valueBoxOutput('netlend_borrow_percentgdp'),
                valueBoxOutput('primary_netlend_borrow_percentgdp'),
                valueBoxOutput('struct_blc_percent_pot_gdp')
              ),
              
              h3('National Debt'),
              
              fluidRow(
                valueBoxOutput('grossdebt_percentgdp'),
                valueBoxOutput('netdebt_percentgdp') 
              ),
              
              h2('International Trade'),
              
              h3('Imports'),
              
              fluidRow(
                valueBoxOutput('vol_imports_gs'),
                valueBoxOutput('vol_imports_g')
              ),
              
              h3('Exports'),
              
              fluidRow(
                valueBoxOutput('vol_exports_gs'),
                valueBoxOutput('vol_exports_g')
              ),
              
              h3('Current Balance'),
              
              fluidRow(
                valueBoxOutput('current_blc_percentgdp'),
                valueBoxOutput('current_blc_dollars')
              )
      ),
      
      
      #Page for the graphics
      tabItem(tabName = 'graphs',
              
              h2('Gross domestic product'),
              
              fluidRow(
                #Graph with constant GDP in % change
                box(
                  title = textOutput('txt_cst_gdp_plot'),
                  status = 'primary',
                  plotOutput('constant_gdp_plot',
                             height = 300) 
                ),
                
                #Graph with Current GDP in dollars
                box(
                  title = textOutput('txt_current_gdp_plot'),
                  status = 'primary',
                  plotOutput('currentgdp_plot',
                             height = 300)
                )
                
              ),
              
              fluidRow(
                #Graph with current GDP per capita in dollars
                box(
                  title = textOutput('txt_gdp_percapita_plot'),
                  status = 'primary',
                  plotOutput('gdp_percapita_plot',
                             height = 300) 
                ),
                
                #Graph of the output gap
                box(
                  title = textOutput('txt_outputgap_plot'),
                  status = 'primary',
                  plotOutput('outputgap_plot',
                             height = 300)
                ),
                
              ),
              
              h2('Inflation'),
              
              fluidRow(
                #Inflation CPI
                box(
                  title = textOutput('txt_cpi_plot'),
                  status = 'primary',
                  plotOutput('cpi_plot',
                             height = 300) 
                ),
                box(
                  title = textOutput('txt_gdp_deflator_plot'),
                  status = 'primary',
                  plotOutput('gdp_deflator_plot',
                             height = 300) 
                )
              ),
              
              h2('Labour market'),
              
              fluidRow(
                #Unemployment rate
                box(
                  title = textOutput('txt_un_plot'),
                  status = 'primary',
                  plotOutput('un_plot',
                             height = 300)
                ),
                #Employment
                box(
                  title = textOutput('txt_en_plot'),
                  status = 'primary',
                  plotOutput('en_plot',
                             height = 300)
                )
              ),
              
              h2('Investment and saving'),
              
              fluidRow(
                #Investment
                box(
                  title = textOutput('txt_invest_plot'),
                  status = 'primary',
                  plotOutput('invest_plot',
                             height = 300)
                ),
                #Gross National Saving
                box(
                  title = textOutput('txt_gns_plot'),
                  status = 'primary',
                  plotOutput('gns_plot',
                             height = 300)
                )
              ),
              
              h2('General government'),
              
              fluidRow(
                #Revenues
                box(
                  title = textOutput('txt_rev_plot'),
                  status = 'primary',
                  plotOutput('rev_plot',
                             height = 300)
                ),
                #Total Expenditure
                box(
                  title = textOutput('txt_exp_plot'),
                  status = 'primary',
                  plotOutput('exp_plot',
                             height = 300)
                )
              ),
              fluidRow(
                #Net lending / borrowing (percent of GDP)
                box(
                  title = textOutput('txt_lend_borrow_plot'),
                  status = 'primary',
                  plotOutput('lend_borrow_plot',
                             height = 300)
                ),
                #Primary Net lending / borrowing (percent of GDP)
                box(
                  title = textOutput('txt_pri_lend_borrow_plot'),
                  status = 'primary',
                  plotOutput('pri_lend_borrow_plot',
                             height = 300)
                )
              ),
              
              fluidRow(
                #Structural Balance (percent potential of GDP)
                box(
                  title = textOutput('txt_struct_blc_plot'),
                  status = 'primary',
                  plotOutput('struct_blc_plot',
                             height = 300)
                ),
                #Gross Debt (percent of GDP)
                box(
                  title = textOutput('txt_gross_debt_plot'),
                  status = 'primary',
                  plotOutput('gross_debt_plot',
                             height = 300)
                )
              ),
              fluidRow(
                #Net debt (percent potential of GDP)
                box(
                  title = textOutput('txt_net_debt_plot'),
                  status = 'primary',
                  plotOutput('net_debt_plot',
                             height = 300)
                )
              ),
              
              h2('International trade'),
              
              fluidRow(
                #Volume of imports of goods and services (Percent change)
                box(
                  title = textOutput('txt_imports_gs_plot'),
                  status = 'primary',
                  plotOutput('imports_gs_plot',
                             height = 300)
                ),
                #Volume of imports of goods (Percent change)
                box(
                  title = textOutput('txt_imports_g_plot'),
                  status = 'primary',
                  plotOutput('imports_g_plot',
                             height = 300)
                )
              ),
              fluidRow(
                #Volume of exports of goods and services (Percent change)
                box(
                  title = textOutput('txt_exports_gs_plot'),
                  status = 'primary',
                  plotOutput('exports_gs_plot',
                             height = 300)
                ),
                #Volume of exports of goods (Percent change)
                box(
                  title = textOutput('txt_exports_g_plot'),
                  status = 'primary',
                  plotOutput('exports_g_plot',
                             height = 300)
                )
              ),
              fluidRow(
                #Current Balance (Percent of gdp)
                box(
                  title = textOutput('txt_current_blc_percentgdp_plot'),
                  status = 'primary',
                  plotOutput('current_blc_percentgdp_plot',
                             height = 300)
                ),
                #Current Balance (in dollars)
                box(
                  title = textOutput('txt_current_blc_dollars_plot'),
                  status = 'primary',
                  plotOutput('current_blc_dollars_plot',
                             height = 300)
                )
              )
      )
    )
  )
)

