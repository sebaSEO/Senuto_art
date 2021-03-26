packages <- c(" googleAnalyticsR")


install.packages(setdiff(packages, rownames(installed.packages())))



#Do obiektu o nazwie id_widoku pobieramy ID widoków Google Analytics do których mamy dostep
my_acc <- ga_account_list()
id_widoku <- my_acc$viewId


#Pobieramy do obeiktu o nazwie ga_results1 dane dotyczące:

zakresu dat od 12 dni wstecz do wczoraj
liczby użytkowników i sesji
danych w podziale na dni

dane_GA <-google_analytics(viewId=id_widoku,
                               date_range = c("12daysAgo", "yesterday"),
                               metrics = c("users","newUsers"),
                               dimensions = "date")

