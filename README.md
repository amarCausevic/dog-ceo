# dog-ceo
This repository has been created to show basic skills for developing quick ios application with knowledge for fetching and displaying data, data filter, data search, data display

# Dependencies used in the project
For managing dependencies I have used SPM I have imported two libraries:
* Alamofire (for async api calls)
* LoremSwiftum (for generating random santancies)

# Architectural approach
MVVM is a powerful architectural pattern that offers numerous benefits for modern application development:

Separation of concerns improves code organization.
Testability ensures better quality and fewer bugs.
Data binding enhances productivity and reduces boilerplate code.
Maintainability and scalability help applications evolve gracefully.
Adopting the MVVM pattern can significantly improve both the quality of your application and your development workflow, making it an ideal choice for many complex, data-driven applications.

# App setup
Once app is running first we are triggering endpoint "https://dog.ceo/api/breeds/list/all", here we will receive all information regarding breed and subtypes of that dog breed. List of the said dog information is displayed to the user. Once user clicks on list item, breed detail page will be displayed, endpoint that we hit is "https://dog.ceo/api/breed/<BREED_NAME>/images/random" to the user with random image for that breed and with breed "drescription". Also search bar has been implemented for user to quick search the breed that he/she is searching for. 

# App design
<img width="419" alt="image" src="https://github.com/user-attachments/assets/08dac6c2-8ec4-4139-af1b-674ced9079f3"> <img width="418" alt="image" src="https://github.com/user-attachments/assets/ac97b4bb-f165-48b4-8450-0deb161ded5f"> <img width="409" alt="image" src="https://github.com/user-attachments/assets/2a55aee5-dbda-4311-b5c1-fa766036ecae">


