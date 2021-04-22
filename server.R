library(reticulate)
library(ggplot2)
library(shinydashboard)
library(ggthemes)

source_python('functions.py')

# Define server logic required to draw a histogram
server <- function(input, output) { 
  
  #GROSS DOMESTIC PRODUCT
  #=============================================================================
  
  #Constant GDP (% change)
  output$gdpconstant_percentchange <- renderValueBox({
    m <- valbox(country=input$country,code='NGDP_RPCH')
    valueBox(
      #Paste the number and the unit
      paste0(m[1],m[3]),
      #Paste the other information concerning the number
      paste(m[4],m[5],m[6],m[7],sep = ' '),
      #Change the color according to the previous number
      color = ifelse(m[2]=='+','green',
                     ifelse(m[2]=='=','yellow',
                            ifelse(m[2]=='-','red','navy'
                            )
                     )
      )
    )
  })
  
  #Current GDP (in dollars)
  output$gdpcurrent_dollars <- renderValueBox({
    m <- valbox(country=input$country,code='NGDPD')
    valueBox(
      #Paste the number and the unit
      paste0(m[1],m[3]),
      #Paste the other information concerning the number
      paste(m[4],m[5],m[6],m[7],sep = ' '),
      #Change the color according to the previous number
      color = ifelse(m[2]=='+','green',
                     ifelse(m[2]=='=','yellow',
                            ifelse(m[2]=='-','red','navy'
                            )
                     )
      )
    )
  })
  
  #Current GDP per capita (in dollars)
  output$gdpcurrent_percap_dollars <- renderValueBox({
    m <- valbox(country=input$country,code='NGDPDPC')
    valueBox(
      #Paste the number and the unit
      paste0(m[1],m[3]),
      #Paste the other information concerning the number
      paste(m[4],m[5],m[6],m[7],sep = ' '),
      #Change the color according to the previous number
      color = ifelse(m[2]=='+','green',
                     ifelse(m[2]=='=','yellow',
                            ifelse(m[2]=='-','red','navy'
                            )
                     )
      )
    )
  })
  
  #Output Gap
  output$outputgap <- renderValueBox({
    m <- valbox(country=input$country,code='NGAP_NPGDP')
    valueBox(
      #Paste the number and the unit
      paste0(m[1],m[3]),
      #Paste the other information concerning the number
      paste(m[4],m[5],m[6],m[7],sep = ' '),
      #Change the color according to the previous number
      color = ifelse(m[2]=='+','green',
                     ifelse(m[2]=='=','yellow',
                            ifelse(m[2]=='-','red','navy'
                            )
                     )
      )
    )
  })
  
  #INFLATION
  #=============================================================================
  
  #Inflation CPI
  output$inflation_CPI <- renderValueBox({
    m <- valbox(country=input$country,code='PCPIPCH')
    valueBox(
      #Paste the number and the unit
      paste0(m[1],m[3]),
      #Paste the other information concerning the number
      paste(m[4],m[5],m[6],m[7],sep = ' '),
      #Change the color according to the previous number
      color = ifelse(m[2]=='+','green',
                     ifelse(m[2]=='=','yellow',
                            ifelse(m[2]=='-','red','navy'
                            )
                     )
      )
    )
  })
  #GDP Deflator
  output$gdp_deflator <- renderValueBox({
    m <- valbox(country=input$country,code='NGDP_D')
    valueBox(
      #Paste the number and the unit
      paste0(m[1],m[3]),
      #Paste the other information concerning the number
      paste(m[4],m[5],m[6],m[7],sep = ' '),
      #Change the color according to the previous number
      color = ifelse(m[2]=='+','green',
                     ifelse(m[2]=='=','yellow',
                            ifelse(m[2]=='-','red','navy'
                            )
                     )
      )
    )
  })
  
  #LABOR MARKET
  #=============================================================================
  
  #Unemployment rate
  output$unemployment <- renderValueBox({
    m <- valbox(country=input$country,code='LUR')
    valueBox(
      #Paste the number and the unit
      paste0(m[1],m[3]),
      #Paste the other information concerning the number
      paste(m[4],m[5],m[6],m[7],sep = ' '),
      #Change the color according to the previous number
      color = ifelse(m[2]=='+','red',
                     ifelse(m[2]=='=','yellow',
                            ifelse(m[2]=='-','green','navy'
                            )
                     )
      )
    )
  })
  
  #Employment
  output$employment <- renderValueBox({
    m <- valbox(country=input$country,code='LE')
    valueBox(
      #Paste the number and the unit
      paste0(m[1],m[3]),
      #Paste the other information concerning the number
      paste(m[4],m[5],m[6],m[7],sep = ' '),
      #Change the color according to the previous number
      color = ifelse(m[2]=='+','green',
                     ifelse(m[2]=='=','yellow',
                            ifelse(m[2]=='-','red','navy'
                            )
                     )
      )
    )
  })
  
  #Investment and saving
  #=============================================================================
  
  #Total Investment
  output$investment <- renderValueBox({
    m <- valbox(country=input$country,code='NID_NGDP')
    valueBox(
      #Paste the number and the unit
      paste0(m[1],m[3]),
      #Paste the other information concerning the number
      paste(m[4],m[5],m[6],m[7],sep = ' '),
      #Change the color according to the previous number
      color = ifelse(m[2]=='+','green',
                     ifelse(m[2]=='=','yellow',
                            ifelse(m[2]=='-','red','navy'
                            )
                     )
      )
    )
  })
  
  #Gross national saving
  output$Gross_national_saving <- renderValueBox({
    m <- valbox(country=input$country,code='NGSD_NGDP')
    valueBox(
      #Paste the number and the unit
      paste0(m[1],m[3]),
      #Paste the other information concerning the number
      paste(m[4],m[5],m[6],m[7],sep = ' '),
      #Change the color according to the previous number
      color = ifelse(m[2]=='+','green',
                     ifelse(m[2]=='=','yellow',
                            ifelse(m[2]=='-','red','navy'
                            )
                     )
      )
    )
  })
  
  #General Government
  #=============================================================================
  
  #Revenues and expenditures
  #-----------------------------------------------------------------------------
  
  #Revenues
  output$Revenue_percentgdp <- renderValueBox({
    m <- valbox(country=input$country,code='GGR_NGDP')
    valueBox(
      #Paste the number and the unit
      paste0(m[1],m[3]),
      #Paste the other information concerning the number
      paste(m[4],m[5],m[6],m[7],sep = ' '),
      #Change the color according to the previous number
      color = ifelse(m[2]=='+','green',
                     ifelse(m[2]=='=','yellow',
                            ifelse(m[2]=='-','red','navy'
                            )
                     )
      )
    )
  })
  
  #Expenditures
  output$Total_expenditure_percentgdp <- renderValueBox({
    m <- valbox(country=input$country,code='GGX_NGDP')
    valueBox(
      #Paste the number and the unit
      paste0(m[1],m[3]),
      #Paste the other information concerning the number
      paste(m[4],m[5],m[6],m[7],sep = ' '),
      #Change the color according to the previous number
      color = ifelse(m[2]=='+','red',
                     ifelse(m[2]=='=','yellow',
                            ifelse(m[2]=='-','green','navy'
                            )
                     )
      )
    )
  })
  
  #Net Lend/borrow and Structural balance
  #-----------------------------------------------------------------------------
  
  #Net lend and borrow
  output$netlend_borrow_percentgdp <- renderValueBox({
    m <- valbox(country=input$country,code='GGXCNL_NGDP')
    valueBox(
      #Paste the number and the unit
      paste0(m[1],m[3]),
      #Paste the other information concerning the number
      paste(m[4],m[5],m[6],m[7],sep = ' '),
      #Change the color according to the previous number
      color = ifelse(m[2]=='+','green',
                     ifelse(m[2]=='=','yellow',
                            ifelse(m[2]=='-','red','navy'
                            )
                     )
      )
    )
  })
  
  #Primary net lend and borrow
  output$primary_netlend_borrow_percentgdp <- renderValueBox({
    m <- valbox(country=input$country,code='GGXONLB_NGDP')
    valueBox(
      #Paste the number and the unit
      paste0(m[1],m[3]),
      #Paste the other information concerning the number
      paste(m[4],m[5],m[6],m[7],sep = ' '),
      #Change the color according to the previous number
      color = ifelse(m[2]=='+','green',
                     ifelse(m[2]=='=','yellow',
                            ifelse(m[2]=='-','red','navy'
                            )
                     )
      )
    )
  })
  
  #Structural balance
  output$struct_blc_percent_pot_gdp <- renderValueBox({
    m <- valbox(country=input$country,code='GGSB_NPGDP')
    valueBox(
      #Paste the number and the unit
      paste0(m[1],m[3]),
      #Paste the other information concerning the number
      paste(m[4],m[5],m[6],m[7],sep = ' '),
      #Change the color according to the previous number
      color = ifelse(m[2]=='+','green',
                     ifelse(m[2]=='=','yellow',
                            ifelse(m[2]=='-','red','navy'
                            )
                     )
      )
    )
  })
  
  #National Debt
  #-----------------------------------------------------------------------------
  
  #Gross Debt
  output$grossdebt_percentgdp <- renderValueBox({
    m <- valbox(country=input$country,code='GGXWDG_NGDP')
    valueBox(
      #Paste the number and the unit
      paste0(m[1],m[3]),
      #Paste the other information concerning the number
      paste(m[4],m[5],m[6],m[7],sep = ' '),
      #Change the color according to the previous number
      color = ifelse(m[2]=='+','red',
                     ifelse(m[2]=='=','yellow',
                            ifelse(m[2]=='-','green','navy'
                            )
                     )
      )
    )
  })
  
  #Net Debt
  output$netdebt_percentgdp <- renderValueBox({
    m <- valbox(country=input$country,code='GGXWDN_NGDP')
    valueBox(
      #Paste the number and the unit
      paste0(m[1],m[3]),
      #Paste the other information concerning the number
      paste(m[4],m[5],m[6],m[7],sep = ' '),
      #Change the color according to the previous number
      color = ifelse(m[2]=='+','red',
                     ifelse(m[2]=='=','yellow',
                            ifelse(m[2]=='-','green','navy'
                            )
                     )
      )
    )
  })
  
  #International Trade
  #=============================================================================
  
  #Imports
  #-----------------------------------------------------------------------------
  
  #Volume of imports of goods and services
  output$vol_imports_gs <- renderValueBox({
    m <- valbox(country=input$country,code='TM_RPCH')
    valueBox(
      #Paste the number and the unit
      paste0(m[1],m[3]),
      #Paste the other information concerning the number
      paste(m[4],m[5],m[6],m[7],sep = ' '),
      #Change the color according to the previous number
      color = ifelse(m[2]=='+','green',
                     ifelse(m[2]=='=','yellow',
                            ifelse(m[2]=='-','red','navy'
                            )
                     )
      )
    )
  })
  
  #Volume of imports of goods
  output$vol_imports_g <- renderValueBox({
    m <- valbox(country=input$country,code='TMG_RPCH')
    valueBox(
      #Paste the number and the unit
      paste0(m[1],m[3]),
      #Paste the other information concerning the number
      paste(m[4],m[5],m[6],m[7],sep = ' '),
      #Change the color according to the previous number
      color = ifelse(m[2]=='+','green',
                     ifelse(m[2]=='=','yellow',
                            ifelse(m[2]=='-','red','navy'
                            )
                     )
      )
    )
  })
  
  #Exports
  #-----------------------------------------------------------------------------
  
  #Volume of exports of goods and services
  output$vol_exports_gs <- renderValueBox({
    m <- valbox(country=input$country,code='TX_RPCH')
    valueBox(
      #Paste the number and the unit
      paste0(m[1],m[3]),
      #Paste the other information concerning the number
      paste(m[4],m[5],m[6],m[7],sep = ' '),
      #Change the color according to the previous number
      color = ifelse(m[2]=='+','green',
                     ifelse(m[2]=='=','yellow',
                            ifelse(m[2]=='-','red','navy'
                            )
                     )
      )
    )
  })
  
  #Volume of exports of goods
  output$vol_exports_g <- renderValueBox({
    m <- valbox(country=input$country,code='TXG_RPCH')
    valueBox(
      #Paste the number and the unit
      paste0(m[1],m[3]),
      #Paste the other information concerning the number
      paste(m[4],m[5],m[6],m[7],sep = ' '),
      #Change the color according to the previous number
      color = ifelse(m[2]=='+','green',
                     ifelse(m[2]=='=','yellow',
                            ifelse(m[2]=='-','red','navy'
                            )
                     )
      )
    )
  })
  
  #Current Balance
  #-----------------------------------------------------------------------------
  
  #Current balance in percent of GDP
  output$current_blc_percentgdp <- renderValueBox({
    m <- valbox(country=input$country,code='BCA_NGDPD')
    valueBox(
      #Paste the number and the unit
      paste0(m[1],m[3]),
      #Paste the other information concerning the number
      paste(m[4],m[5],m[6],m[7],sep = ' '),
      #Change the color according to the previous number
      color = ifelse(m[2]=='+','green',
                     ifelse(m[2]=='=','yellow',
                            ifelse(m[2]=='-','red','navy'
                            )
                     )
      )
    )
  })
  
  #Current balance in dollars
  output$current_blc_dollars <- renderValueBox({
    m <- valbox(country=input$country,code='BCA')
    valueBox(
      #Paste the number and the unit
      paste0(m[1],m[3]),
      #Paste the other information concerning the number
      paste(m[4],m[5],m[6],m[7],sep = ' '),
      #Change the color according to the previous number
      color = ifelse(m[2]=='+','green',
                     ifelse(m[2]=='=','yellow',
                            ifelse(m[2]=='-','red','navy'
                            )
                     )
      )
    )
  })
  
  #=============================================================================
  # Graphics
  #=============================================================================
  
  #Evolution of the constant GDP (% change)
  #-----------------------------------------------------------------------------
  
  #Change the title of the box
  output$txt_cst_gdp_plot <- renderText({
    m <- valbox(country=input$country,code='NGDP_RPCH')
    paste(m[4],m[5],m[6],sep = ' ')
  })
  #Create the graph
  output$constant_gdp_plot <- renderPlot({
    df <- data.frame(data_chart(country=input$country,code='NGDP_RPCH'))
    ggplot(aes(x = years, y = values), data=df) +
      geom_line(size=2,color = 'darkblue') +
      labs(x = '',
           y = '') +
      theme_economist_white(gray_bg = FALSE)
  })
  
  #Evolution of the current GDP (in dollars)
  #-----------------------------------------------------------------------------
  
  #Change the title of the box
  output$txt_current_gdp_plot <- renderText({
    m <- valbox(country=input$country,code='NGDPD')
    paste(m[4],m[5],m[6],sep = ' ')
  })
  #Create the graph
  output$currentgdp_plot <- renderPlot({
    df <- data.frame(data_chart(country=input$country,code='NGDPD'))
    ggplot(aes(x = years, y = values), data=df) +
      geom_line(size=2,color = 'darkblue') +
      labs(x = '',
           y = '') +
      theme_economist_white(gray_bg = FALSE)
  })
  
  #Evolution of the current GDP per capita (in dollars)
  #-----------------------------------------------------------------------------
  
  #Change the title of the box
  output$txt_gdp_percapita_plot <- renderText({
    m <- valbox(country=input$country,code='NGDPDPC')
    paste(m[4],m[5],m[6],sep = ' ')
  })
  #Create the graph
  output$gdp_percapita_plot <- renderPlot({
    df <- data.frame(data_chart(country=input$country,code='NGDPDPC'))
    ggplot(aes(x = years, y = values), data=df) +
      geom_line(size=2,color = 'darkblue') +
      labs(x = '',
           y = '') +
      theme_economist_white(gray_bg = FALSE)
  })
  
  #Evolution of the output gap (in dollars)
  #-----------------------------------------------------------------------------
  
  #Change the title of the box
  output$txt_outputgap_plot <- renderText({
    m <- valbox(country=input$country,code='NGAP_NPGDP')
    paste(m[4],m[5],m[6],sep = ' ')
  })
  #Create the graph
  output$outputgap_plot <- renderPlot({
    df <- data.frame(data_chart(country=input$country,code='NGAP_NPGDP'))
    ggplot(aes(x = years, y = values), data=df) +
      geom_line(size=2,color = 'darkblue') +
      labs(x = '',
           y = '') +
      theme_economist_white(gray_bg = FALSE)
  })
  
  #Evolution of the CPI (in dollars)
  #-----------------------------------------------------------------------------
  
  #Change the title of the box
  output$txt_cpi_plot <- renderText({
    m <- valbox(country=input$country,code='PCPIPCH')
    paste(m[4],m[5],m[6],sep = ' ')
  })
  #Create the graph
  output$cpi_plot <- renderPlot({
    df <- data.frame(data_chart(country=input$country,code='PCPIPCH'))
    ggplot(aes(x = years, y = values), data=df) +
      geom_line(size=2,color = 'darkblue') +
      labs(x = '',
           y = '') +
      theme_economist_white(gray_bg = FALSE)
  })
  
  #Evolution of the GDP deflator (Index)
  #-----------------------------------------------------------------------------
  
  #Change the title of the box
  output$txt_gdp_deflator_plot <- renderText({
    m <- valbox(country=input$country,code='NGDP_D')
    paste(m[4],m[5],m[6],sep = ' ')
  })
  #Create the graph
  output$gdp_deflator_plot <- renderPlot({
    df <- data.frame(data_chart(country=input$country,code='NGDP_D'))
    ggplot(aes(x = years, y = values), data=df) +
      geom_line(size=2,color = 'darkblue') +
      labs(x = '',
           y = '') +
      theme_economist_white(gray_bg = FALSE)
  })
  
  #Evolution of the unemployment rate (% change)
  #-----------------------------------------------------------------------------
  
  #Change the title of the box
  output$txt_un_plot <- renderText({
    m <- valbox(country=input$country,code='LUR')
    paste(m[4],m[5],m[6],sep = ' ')
  })
  #Create the graph
  output$un_plot <- renderPlot({
    df <- data.frame(data_chart(country=input$country,code='LUR'))
    ggplot(aes(x = years, y = values), data=df) +
      geom_line(size=2,color = 'darkblue') +
      labs(x = '',
           y = '') +
      theme_economist_white(gray_bg = FALSE)
  })
  
  #Evolution of the employment (Persons)
  #-----------------------------------------------------------------------------
  
  #Change the title of the box
  output$txt_en_plot <- renderText({
    m <- valbox(country=input$country,code='LE')
    paste(m[4],m[5],m[6],sep = ' ')
  })
  #Create the graph
  output$en_plot <- renderPlot({
    df <- data.frame(data_chart(country=input$country,code='LE'))
    ggplot(aes(x = years, y = values), data=df) +
      geom_line(size=2,color = 'darkblue') +
      labs(x = '',
           y = '') +
      theme_economist_white(gray_bg = FALSE)
  })
  
  #Evolution of the investment (% of GDP)
  #-----------------------------------------------------------------------------
  
  #Change the title of the box
  output$txt_invest_plot <- renderText({
    m <- valbox(country=input$country,code='NID_NGDP')
    paste(m[4],m[5],m[6],sep = ' ')
  })
  #Create the graph
  output$invest_plot <- renderPlot({
    df <- data.frame(data_chart(country=input$country,code='NID_NGDP'))
    ggplot(aes(x = years, y = values), data=df) +
      geom_line(size=2,color = 'darkblue') +
      labs(x = '',
           y = '') +
      theme_economist_white(gray_bg = FALSE)
  })
  
  #Evolution of the Gross national saving (% of GDP)
  #-----------------------------------------------------------------------------
  
  #Change the title of the box
  output$txt_gns_plot <- renderText({
    m <- valbox(country=input$country,code='NGSD_NGDP')
    paste(m[4],m[5],m[6],sep = ' ')
  })
  #Create the graph
  output$gns_plot <- renderPlot({
    df <- data.frame(data_chart(country=input$country,code='NGSD_NGDP'))
    ggplot(aes(x = years, y = values), data=df) +
      geom_line(size=2,color = 'darkblue') +
      labs(x = '',
           y = '') +
      theme_economist_white(gray_bg = FALSE)
  })
  
  #Evolution of the Government Revenues (% of GDP)
  #-----------------------------------------------------------------------------
  
  #Change the title of the box
  output$txt_rev_plot <- renderText({
    m <- valbox(country=input$country,code='GGR_NGDP')
    paste(m[4],m[5],m[6],sep = ' ')
  })
  #Create the graph
  output$rev_plot <- renderPlot({
    df <- data.frame(data_chart(country=input$country,code='GGR_NGDP'))
    ggplot(aes(x = years, y = values), data=df) +
      geom_line(size=2,color = 'darkblue') +
      labs(x = '',
           y = '') +
      theme_economist_white(gray_bg = FALSE)
  })
  
  #Evolution of the Government expediture (% of GDP)
  #-----------------------------------------------------------------------------
  
  #Change the title of the box
  output$txt_exp_plot <- renderText({
    m <- valbox(country=input$country,code='GGX_NGDP')
    paste(m[4],m[5],m[6],sep = ' ')
  })
  #Create the graph
  output$exp_plot <- renderPlot({
    df <- data.frame(data_chart(country=input$country,code='GGX_NGDP'))
    ggplot(aes(x = years, y = values), data=df) +
      geom_line(size=2,color = 'darkblue') +
      labs(x = '',
           y = '') +
      theme_economist_white(gray_bg = FALSE)
  })
  
  #Net lending / borrowing (percent of GDP)
  #-----------------------------------------------------------------------------
  
  #Change the title of the box
  output$txt_lend_borrow_plot <- renderText({
    m <- valbox(country=input$country,code='GGXCNL_NGDP')
    paste(m[4],m[5],m[6],sep = ' ')
  })
  #Create the graph
  output$lend_borrow_plot <- renderPlot({
    df <- data.frame(data_chart(country=input$country,code='GGXCNL_NGDP'))
    ggplot(aes(x = years, y = values), data=df) +
      geom_line(size=2,color = 'darkblue') +
      labs(x = '',
           y = '') +
      theme_economist_white(gray_bg = FALSE)
  })
  
  #Primary Net lending / borrowing (percent of GDP)
  #-----------------------------------------------------------------------------
  
  #Change the title of the box
  output$txt_pri_lend_borrow_plot <- renderText({
    m <- valbox(country=input$country,code='GGXONLB_NGDP')
    paste(m[4],m[5],m[6],sep = ' ')
  })
  #Create the graph
  output$pri_lend_borrow_plot <- renderPlot({
    df <- data.frame(data_chart(country=input$country,code='GGXONLB_NGDP'))
    ggplot(aes(x = years, y = values), data=df) +
      geom_line(size=2,color = 'darkblue') +
      labs(x = '',
           y = '') +
      theme_economist_white(gray_bg = FALSE)
  })
  
  #Evolution of the structural balance (percent potential of GDP)
  #-----------------------------------------------------------------------------
  
  #Change the title of the box
  output$txt_struct_blc_plot <- renderText({
    m <- valbox(country=input$country,code='GGSB_NPGDP')
    paste(m[4],m[5],m[6],sep = ' ')
  })
  #Create the graph
  output$struct_blc_plot <- renderPlot({
    df <- data.frame(data_chart(country=input$country,code='GGSB_NPGDP'))
    ggplot(aes(x = years, y = values), data=df) +
      geom_line(size=2,color = 'darkblue') +
      labs(x = '',
           y = '') +
      theme_economist_white(gray_bg = FALSE)
  })
  
  #Evolution of the gross debt (% of GDP)
  #-----------------------------------------------------------------------------
  
  #Change the title of the box
  output$txt_gross_debt_plot <- renderText({
    m <- valbox(country=input$country,code='GGXWDG_NGDP')
    paste(m[4],m[5],m[6],sep = ' ')
  })
  #Create the graph
  output$gross_debt_plot <- renderPlot({
    df <- data.frame(data_chart(country=input$country,code='GGXWDG_NGDP'))
    ggplot(aes(x = years, y = values), data=df) +
      geom_line(size=2,color = 'darkblue') +
      labs(x = '',
           y = '') +
      theme_economist_white(gray_bg = FALSE)
  })
  
  #Evolution of the net debt (percent of GDP)
  #-----------------------------------------------------------------------------
  
  #Change the title of the box
  output$txt_net_debt_plot <- renderText({
    m <- valbox(country=input$country,code='GGXWDN_NGDP')
    paste(m[4],m[5],m[6],sep = ' ')
  })
  #Create the graph
  output$net_debt_plot <- renderPlot({
    df <- data.frame(data_chart(country=input$country,code='GGXWDN_NGDP'))
    ggplot(aes(x = years, y = values), data=df) +
      geom_line(size=2,color = 'darkblue') +
      labs(x = '',
           y = '') +
      theme_economist_white(gray_bg = FALSE)
  })
  
  #Evolution of the volume of imports of goods and services (Percent change)
  #-----------------------------------------------------------------------------
  
  #Change the title of the box
  output$txt_imports_gs_plot <- renderText({
    m <- valbox(country=input$country,code='TM_RPCH')
    paste(m[4],m[5],m[6],sep = ' ')
  })
  #Create the graph
  output$imports_gs_plot <- renderPlot({
    df <- data.frame(data_chart(country=input$country,code='TM_RPCH'))
    ggplot(aes(x = years, y = values), data=df) +
      geom_line(size=2,color = 'darkblue') +
      labs(x = '',
           y = '') +
      theme_economist_white(gray_bg = FALSE)
  })
  
  #Evolution of the volume of imports of goods (Percent change)
  #-----------------------------------------------------------------------------
  
  #Change the title of the box
  output$txt_imports_g_plot <- renderText({
    m <- valbox(country=input$country,code='TMG_RPCH')
    paste(m[4],m[5],m[6],sep = ' ')
  })
  #Create the graph
  output$imports_g_plot <- renderPlot({
    df <- data.frame(data_chart(country=input$country,code='TMG_RPCH'))
    ggplot(aes(x = years, y = values), data=df) +
      geom_line(size=2,color = 'darkblue') +
      labs(x = '',
           y = '') +
      theme_economist_white(gray_bg = FALSE)
  })
  
  #Evolution of the volume of exports of goods and services (Percent change)
  #-----------------------------------------------------------------------------
  
  #Change the title of the box
  output$txt_exports_gs_plot <- renderText({
    m <- valbox(country=input$country,code='TX_RPCH')
    paste(m[4],m[5],m[6],sep = ' ')
  })
  #Create the graph
  output$exports_gs_plot <- renderPlot({
    df <- data.frame(data_chart(country=input$country,code='TX_RPCH'))
    ggplot(aes(x = years, y = values), data=df) +
      geom_line(size=2,color = 'darkblue') +
      labs(x = '',
           y = '') +
      theme_economist_white(gray_bg = FALSE)
  })
  
  #Evolution of the volume of exports of goods (Percent change)
  #-----------------------------------------------------------------------------
  
  #Change the title of the box
  output$txt_exports_g_plot <- renderText({
    m <- valbox(country=input$country,code='TXG_RPCH')
    paste(m[4],m[5],m[6],sep = ' ')
  })
  #Create the graph
  output$exports_g_plot <- renderPlot({
    df <- data.frame(data_chart(country=input$country,code='TXG_RPCH'))
    ggplot(aes(x = years, y = values), data=df) +
      geom_line(size=2,color = 'darkblue') +
      labs(x = '',
           y = '') +
      theme_economist_white(gray_bg = FALSE)
  })
  
  #Current balance (Percent of GDP)
  #-----------------------------------------------------------------------------
  
  #Change the title of the box
  output$txt_current_blc_percentgdp_plot <- renderText({
    m <- valbox(country=input$country,code='BCA')
    paste(m[4],m[5],m[6],sep = ' ')
  })
  #Create the graph
  output$current_blc_percentgdp_plot <- renderPlot({
    df <- data.frame(data_chart(country=input$country,code='BCA'))
    ggplot(aes(x = years, y = values), data=df) +
      geom_line(size=2,color = 'darkblue') +
      labs(x = '',
           y = '') +
      theme_economist_white(gray_bg = FALSE)
  })
  
  #Current balance (in dollars)
  #-----------------------------------------------------------------------------
  
  #Change the title of the box
  output$txt_current_blc_dollars_plot <- renderText({
    m <- valbox(country=input$country,code='BCA_NGDPD')
    paste(m[4],m[5],m[6],sep = ' ')
  })
  #Create the graph
  output$current_blc_dollars_plot <- renderPlot({
    df <- data.frame(data_chart(country=input$country,code='BCA_NGDPD'))
    ggplot(aes(x = years, y = values), data=df) +
      geom_line(size=2,color = 'darkblue') +
      labs(x = '',
           y = '') +
      theme_economist_white(gray_bg = FALSE)
  })
}