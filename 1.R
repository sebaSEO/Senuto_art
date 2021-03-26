# Cały kod użyty w artykule

#Krok 1
packages <- c("searchConsoleR"," googleAnalyticsR")

#Krok 2
install.packages(setdiff(packages, rownames(installed.packages())))


#Krok 3
scr_auth()
