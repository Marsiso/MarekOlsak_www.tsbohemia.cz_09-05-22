*** Keywords ***
Close web browser and clear cache
    Delete all cookies
    Sleep                       2s
    Close all browsers

Clear cache
    Delete all cookies
    Sleep                       2s

Move log files
    [arguments]                 ${name}

    # Requires libraries OperatingSystem and DateTime
    ${date}=                    Get Current Date    result_format=datetime
    Move file                   ../log.html         ../logs/${date.year}_${date.month}_${date.day}_${date.hour}_${date.minute}_${name}_log.html
    Move file                   ../output.xml       ../logs/${date.year}_${date.month}_${date.day}_${date.hour}_${date.minute}_${name}_output.xml
    Move file                   ../report.html      ../logs/${date.year}_${date.month}_${date.day}_${date.hour}_${date.minute}_${name}_report.html