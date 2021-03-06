
##### LIBRARIES & DATA #####
library(shiny)
library(shinythemes)
library(shinydashboard)
library(ggplot2)
library(plotly)
library(scales)
library(rhandsontable)
library(lubridate)
library(tidyverse)

censusdata = read_csv('finaldata.csv')
freddata = read_csv('saverate.csv')
##### NAV ####
navbarPage(theme = shinytheme("sandstone"), fluid = TRUE, 
           "BLOB",
           
####### HOME ###########
           tabPanel("Home", icon = icon("home"),
                    fluidPage(
                      
                      h3("Personal Savings Rate Over Time"),
                      
                      "To start, personal savings rate is defined as the percentage of 
                      disposable personal income, meaning the amount of money one has to 
                      spend and save after income taxes. Another way to think about personal savings rate
                      is as a ratio of personal savings to disposable personal income. The reason why this 
                      statistic is important is because the value can provide insight to consumer saving behavior.
                      Savings is an important and valuable behavior because it helps drive investments, which
                      contributes to productivity, especially in a free market. Thus, it is a good way to track
                      economic progress.The graph below details how this personal savings rate has changed month over month from 1959 until 2018.
                      Please note the values represent a percent in decimal format and are seasonally adjusted.",
                      
                        plotlyOutput("plot"),
                        verbatimTextOutput("event")

                        )
           ),
                               
####### ABOUT ###########
           tabPanel("About", icon = icon("info"),
                    tabsetPanel(
        ##### BLOB ######              
                      tabPanel("Blob", fluidPage(
                        
                        fluidRow(h4("A little bit about BLOB and me")),
                        
                        fluidRow(h5("The purpose of this application is to serve as a resource to anyone who is struggling to 
                           create a reasonable budget, understand saving and its importance, and to improve
                           overall financial literacy.")),
                        
                        fluidRow(h5("I decided to create a personal finance application because I have had friends who've asked me
                           to help them create a budget. Additionally,when looking at popular budgeting apps like Mint, I was not satisfied
                           with them because it was just a place to make a budget, not necessarily help you manage the money
                           you have now. For instance, I used to have this app called 'Level' which provided me insight to my 
                           own spending by telling me what I spend on and more importantly, how much I should spend every day and week and then
                           relate my spending to my 'save' goal for the month. Unfortunately, the app shutdown even after being bought by CapitalOne.
                           ")),
                        
                        fluidRow(h5("I called my application 'BLOB', because when my sister and I traveled to Japan,
                                    we found most of the pillows were stuffed with rice-like filling, so they were not soft.
                                    After a few sleepless nights and stiff necks, we decided to go look for an alternative and 
                                    we both found a solution in a kids store. There were these large long cute stuffed animals - I chose
                                    a blue dinosaur-like animal while my sister chose a cat. Growing up, we were always told everyone and everything
                                    deserves a name, so we had to think of a name. My sister chose 'Whiskers' for her cat while I chose to be
                                    less creative and named my stuffed animal, 'Blob' because it looked like a blue blob, despite having little legs.
                                    Blob saved me in times of need, in my case, stiff neck and sleepless nights, and so Blob can help you!")),
                        
                        fluidRow(h5("Budgeting can take a bit of time and typically requires a lot of planning and organization.
                           Moreover, it is unfortunate the concept of budgeting and money is not a popular topic even with families.
                           For instance, I was amazed when I graduated many of my friends never had a talk with their parents about money. 
                           For me, I have had conversations about it since I was 18 years old, granted the seriousness of the conversation
                           matured as I did. At 18, my relatives, particularly my Uncle Bob, would casually sit me down whenever they were visiting
                           and ask where I wanted to go to college, what I wanted to study and why, and how I would apply what I will have
                           learned in school to a job. As I grew up, every year, the conversation would evolve to include more details such as, what major would 
                           I consider, or how would I think I obtain my goals. The biggest leap was when I turned 21 because Uncle Bob formally sat me down
                           and asked, 'What does money do?' and he proceeded to explain the pros and cons of money, mainly driving the point of it is 
                           significantly harder to accumulate money than it is to spend it. Since then, the conversation got dubbed 'The 40-year Plan'
                           because I would be asked where I wante to be in 40 years and how I would get there. Of course being a perfectionist, I
                           would sometimes worry about not following my plan, so my relatives always made sure I understood the point of 
                           have 'The 40-year Plan' talk was to get me thinking of how to plan, not necessarily to follow the plan step for step because
                           there will be surprises and opinions can change."))
                      ) 
                               ),
        ###### COI ########
                      tabPanel("Cost of Living", fluidPage(
                        
                        fluidRow(h4("What does 'cost of living' mean?")),

                           fluidRow(   h5("Cost of living, at its most basic form, is the amount of income required to maintain
                           some level of lifestyle. On the other hand, the cost of living index is a tool to 
                           compare cities' costs of living, meaning if an individual were to move to another city,
                           how much more would he or she need to make to maintain the current lifestyle.
                           Unsurprisingly, cost of living is linked to wages since salaries are typically calculated
                           against expenses for many geographic regions.")),

                        
                      fluidRow(h4("Why is it important?")),
                              
                       fluidRow(      h5("While the government does not formally have a report for cost of living, there are ways to calculate an index. 
                           The first step would be to create a base and set it to 100, or a foundation state/country, which will serve as the 'master' comparison. 
                           This way, comparisons will be instuitive and easy to understand. For example, let's say New York City is the base city and I then find
                           Texas has a cost of living score of 80; I could then say, 'On average, it is 20% cheaper for me to live in Texas than 
                           it is for me to live in New York City.'")))
                      
                         ),
        
        #### 50/30/20 RULE ######
                      tabPanel("The 50/30/20 Rule",
                          fluidPage(
                        
                         fluidRow(h4("Overview")),


                        fluidRow(h5("The 50/30/20 rule is a guideline for spending and saving with 
                           50% allocated to fixed costs such as food, housing, utilities, loans etc., 
                           30% designated for spending such as shopping, hobbies, and dining out.
                           Finally, 20% represents savings. Harvard bankruptcy expert and U.S. Massachusetts Senator,
                           Elizabeth Warren, coined the 50/30/20 rule with her daughter Amelia Warren Tyagi to help
                           simplify the proces of budgeting.")),
                        
                        fluidRow(h4("Fixed Costs - 50%")), 
                        
                        fluidRow(h5("While fixed costs can be subjective and vague, items typically include: 
                           rent, mortgages, groceries (not items such as alcohol and candy), transportation such as subway card, 
                           insurance premiums, medical treatments, and minimum debt payments. For items such as groceries and transportation,
                           fixed costs are meant for necessities only; for example, Uber and cabs do not count for transportation in this category,
                           but a subway card, gas, and car loans do count because those items are basic means of transportation.")), 
                        
                        fluidRow(h4("Spending - 30%")), 
                        
                        fluidRow(h5("Under this category, all non-vital items and payments are considered 'wants.' This includes vacation,
                           shopping, dinner with friends, skincare products, massages, facials etc. Furthermore, it is worth noting
                           this category is what the calculator feature aims to help keep you on track by looking at your spending habits
                           and offering resources on how to stay on budget.")), 
                        
                        fluidRow(h4("Saving - 20%")), 
                        
                        fluidRow(h5("This last part is reserved for savings, and a good way to save is to immediately take 20% of your paycheck and put it away.
                           Saving is hard, but 20% is a good target rate; however, everyone's situation is unique, so sometimes adjustments are necessary."))
                        ))
           )),
                    

##### QUICK FACTS #######
           tabPanel("Quick Facts", icon = icon("globe"),
                      mainPanel(
                        frow1 <- fluidRow(
                          valueBoxOutput("value1")
                          ,valueBoxOutput("value2")
                          ,valueBoxOutput("value3")
                        ),
                        
                        tabsetPanel(
                          tabPanel("Graphs",
                                   frow2 <- fluidRow( 
                                    box(
                                       title = "Income ($)",
                                       status = "primary"
                                       ,solidHeader = TRUE 
                                       ,plotOutput("Income", height = "300px", width = "320px")
                                     ),
                                    box(
                                       title = "Education ($)"
                                       ,status = "primary"
                                       ,solidHeader = TRUE 
                                       ,plotOutput("Education", height = "300px", width = "320px")
                                     ),
                                    box(
                                      title = "Alcohol ($)"
                                      ,status = "primary"
                                      ,solidHeader = TRUE 
                                      ,plotOutput("alcohol", height = "300px", width = "320px")
                                    ),
                                    box(
                                      title = "Apparel ($)"
                                      ,status = "primary"
                                      ,solidHeader = TRUE 
                                      ,plotOutput("clothes", height = "300px", width = "320px")
                                    )
                                    
  
                                   ) #End frow2
                        ),
                        tabPanel("Data",
                                 fluidRow(
                                 DT::dataTableOutput("table", width = "200px"))
                        )
                      )
                      ) #End home tab
           ),




##### COI #########   
navbarMenu("Calculators", icon = icon("calculator"),
           
                      tabPanel("Cost of Living",
                               
                               sidebarLayout(
                                 sidebarPanel(
                               
                                   selectInput('from', 'I am moving from:', censusdata$State, selectize=FALSE),
                                   selectInput('to', 'I am moving to:', censusdata$State, selectize=FALSE),
                                   numericInput("income", "Current income:", 1)
                      
                                 ),
                                 
                                 mainPanel(
                                  
                                  fluidRow( h4("Comparison"),
                                   htmlOutput("bat"))
                                   ) #End Main Panel
                                 )
                               ),
                      
                      


           
###### My BLOB ####                      
                      tabPanel("My BLOB",
                          sidebarLayout(
                            sidebarPanel(
                              numericInput(inputId = "bees",
                                        label = "Income (monthly):",
                                        value = 30000),
                              
                              numericInput(inputId = "month",
                                          label = "Current Month:",
                                          value = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12))
                            ),
                          
                            mainPanel(
                              stats <- fluidRow(
                                valueBoxOutput("daily")
                                ,valueBoxOutput("weekly")
                                ,valueBoxOutput("monthly")
                            ),
                            tabsetPanel(
                                 tabPanel("Inputs",
                                           
                                          fluidPage(rHandsontableOutput('contents'),
                                            actionButton("saveBtn", "Save changes"))
                                          ),
                               
                                 tabPanel("Data Table",
                                         
                                            fluidPage(rHandsontableOutput('contentFinal'))
                                            
                                          ),
                               tabPanel("Analysis",
                                       fluidPage( 
                                        h4("Expenditure"),
                                        plotOutput('dashboard1')),
                                       fluidPage(
                                         h4("Savings"),
                                        plotOutput('dashboard2')))
                            

                     )
                     ) #End main panel
                          ) #End sidebar layout
                     )#End tab Panel Plan
           
           ), #End Calc

###### Resources ####
           tabPanel("Resources", icon = icon("book"),
                fluidPage(HTML(
                  paste(
                    h5("Managing your finances can be daunting and frustrating at times; however,
                       the blogs and websites below should help you keep on track and generate income on the side.
                       Remember, sometimes you have to 'break' from your plan, but the fact you're planning and managing your finances
                       is a step in the right direction."), "<br>",
                    
                    "1. ","<a href = 'https://www.thepennyhoarder.com/'>","<b>" ,"The Penny Hoarder","</b>" ,"</a>", 
                    " - This is a good site for beginners because the website provides many resources on how to save, 
                    plan, and think about personal finance.", "<br>",
                    
                    "<br>",
                    
                    "2. ", "<a href = 'https://www.moneyunder30.com/'>","<b>" , "Money Under 30", "</b>", "</a>",
                    " - For those more savy with your personal financial standing and planning abilities, I recommend this site because 
                    it provides more technical articles on credit cards, debt, and investing ideas and strategies.", "<br>",
                     
                    "<br>",
                    
                    "3. ", "<a href = 'https://www.getrichslowly.org/'>","<b>" , "Get Rich Slowly", "</b>", "</a>",
                    " - Despite the enticing name, the blog is quite good for beginners or 
                    for those who are not familiar with financial terms.", "<br>",
                    
                    "<br>",
                    
                    "4. ", "<a href = 'https://obliviousinvestor.com/'>","<b>" , "The Oblivious Investor", "</b>", "</a>",
                    " - Mike Piper is a CPA and an author of multiple finance books and his blog is focused on investing tips in 
                    addition to other financial/economic topics.", "<br>",
                    
                    "<br>",
                    
                    "5. ", "<a href = 'https://www.debtroundup.com/all-articles/'>","<b>" , "Debt Roundup", "</b>", "</a>",
                    " - This blog takes a particular focus on debt, so for those who have debt or worried about paying off loans,
                    this is a good blog to read.", "<br>",
                    
                    "<br>",
                    
                    "6. ", "<a href = 'https://moneysavingmom.com/'>","<b>" , "Money Saving Mom", "</b>", "</a>",
                    " - Great resource for families, planning for a family, and managing your family financially.
                    This blog also provides creative ideas to common family obstacle.", "<br>",
                    
                    "<br>",
                    
                    "7. ", "<a href = 'https://www.nerdwallet.com/'>","<b>" , "The Nerd Wallet", "</b>", "</a>",
                    " - A 'go-to' website for credit cards and consumer finance topics.", "<br>",
                    
                    "<br>",
                    
                    "8. ", "<a href = 'https://www.bankrate.com/personal-finance/'>","<b>" , "Bankrate", "</b>", "</a>",
                    " - This is a 'one-stop shop' website because it covers mortgages, home finance, personal finance,
                    banking, credit cards, and investing. There are also other features such as calculators and credit reports as well.", "<br>",
                    
                    "<br>",
                    
                    "9. ", "<a href = 'https://www.investopedia.com/'>","<b>" , "Investopedia", "</b>", "</a>",
                    " - This is a great website to learn about different financial topics/mechanicisms and to expand your financial
                    vocabulary. There are tutorials (free) and simulators to help further financial knowledge.", "<br>",
                    
                    "<br>",
                    
                    "10. ", "<a href = 'https://blog.mint.com/'>","<b>" , "Mint", "</b>", "</a>",
                    " - You might recognize this name from the app and you'd be correct! The company also
                    has a blog, which is a great feature to those who don't like the app for various reasons.", "<br>",
                    
                    "<br>"
                  )
                ))
           ),



##### Contact #####
           tabPanel("Contact", icon = icon("address-book"),
              fluidPage(HTML(
                paste(
                  h5("We always love to hear from you! We value your opinion and are always 
                      looking to improve or add new features based on what the public requests. 
                      Please find our contact information below."), "<br>",
                  h4("Contact Information"),
                  #Email
                 "<b>", "Email:","</b>","<b>", 
                 "<a href = 'mailto:celina.sprague2@gmail.com'>", 
                 "celina.sprague2@gmail.com","</b>","</a>",
                 #Phone
                 "<br>", "<b>", "Phone:","</b>", "(202)236-4552",
                 "<br>", "<b>", "LinkedIn:", "</b>","<b>", 
                 "<a href = 'https://www.linkedin.com/in/celinasprague/'>", 
                 "Click Here","</b>" ,"</a>"
                )
              ))
           )

)#End of UI

