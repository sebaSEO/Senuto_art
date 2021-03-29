#pobieramy informacje o kontach GA do których mamy dostep
my_acc <- ga_account_list()

#tworzymy obiket dane_GA zaiwerajacy nazwy i ID kont GA do których mamy dostep
dane_GA <- matrix(data = c(my_acc$viewId,my_acc$accountName),ncol = 2)

#parametr max o wartosci -1 pozwala pobrać pelne dane z GA
dane_ga <- google_analytics(viewId = id_widoku
                            , date_range = c("12daysAgo", "yesterday")
                            ,metrics = c("users", "newUsers")
                            ,dimensions = "date"
                            ,max = -1)

#przyklad pobrania danych dla dwóch zakresów czasowych

dane_ga_daty <- google_analytics(viewId = id_widoku
                                 , date_range = c("12daysAgo", "10daysAgo", "6daysAgo", "4daysAgo")
                                 ,metrics = c("users", "newUsers")
                                 ,dimensions = "date"
                                 ,max = -1
)


#stosujemy filtr (w tym przykadzie pobieramy dane dla dni i godzin w których nastapily sesje)

mf2 <- met_filter("sessions", "GREATER", 0)
my_filter_clause <- filter_clause_ga4(list(campaign_filter))

data_fetch <- google_analytics(id_widoku,date_range = c("10daysAgo","yesterday"),
                               metrics = "sessions",
                               dimensions = c("date","dateHour"),
                               dim_filters = my_filter_clause,
                               anti_sample = TRUE)

#pobieramy pelne info o wszystkich dostepnych (i niedostenych już) w GA filtrach i wymiarach

G_meta <- ga_meta()


# Tworzymy filtr dla odwiedzin tylko z Polski
d_filtr <- dim_filter(dimension = "country", operator = "EXACT",
                      expressions = "Poland")

#na podstawie filtra d_filtr tworzymy obiekt filtrujacy

d_filter_clause <- filter_clause_ga4(list(d_filtr))


#stosujemy obiekt filtrujacy pobierajacej dane z GA

filtr_PL <- google_analytics(id_widoku,date_range = c("2021-01-01","yesterday"),
                             metrics = "sessions",
                             dimensions =  "country",
                             dim_filters = d_filter_clause,
                             anti_sample = TRUE)
