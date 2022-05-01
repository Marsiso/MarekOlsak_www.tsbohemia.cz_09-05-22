*** Variables ***
# Registration form
${regFormCountriesCmbBoxXPath}   //select[@name='comxcouid']

# Localization
${currencySelectionXPath}   //select[@id='setcurid'][@name='setcurid']
${sortFilterSelectionXPath}   //div[@id='stilist_fltr_sort']/select[@class='orderselector']

# ComboBox for sorting catalog items
${sortFilterSelectionXPath}   //div[@id='stilist_fltr_sort']/select[@class='orderselector']
${sortPriceAscendingFilterValue}   sipprice
${sortPriceDescendingFilterValue}   sipprice_desc
${sortByNameAplhabeticallyAZFilterValue}   stiplname
${sortByNameAplhabeticallyZAFilterValue}   stiplname_desc
${sortByAgeFilterValue}   stic