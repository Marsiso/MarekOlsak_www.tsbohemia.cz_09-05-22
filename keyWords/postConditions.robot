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

Cease following testcase evaluation when testcase fails
    [arguments]   ${status}
    IF   ${status} == ${False}
       Close web browser and clear cache
       Fatal Error   msg=Test suite's test case failed. Following evaluation will be terminated and browser will undergo cleanup and will be closed.
    END