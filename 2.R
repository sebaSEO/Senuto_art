#Do obiektu o nazwie id_widoku pobieramy ID widoków Google Analytics do których mamy dostep
my_acc <- ga_account_list()
id_widoku <- my_acc$viewId
