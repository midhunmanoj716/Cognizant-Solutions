RESTful Country Service – Spring Boot using XML Configuration
This project demonstrates how to build a RESTful web service in Spring Boot using XML-based bean configuration to provide country details.

📦 Overview
App Name: country-rest

Base Package: com.cognizant.country_rest

Server Port: 8087 (used during testing)

Framework: Spring Boot 4.0.0-SNAPSHOT

Config Style: XML-based (country.xml)

Context Loader: ClassPathXmlApplicationContext

📁 Project Structure
css
<pre>
src/
 └── main/
     ├── java/
     │   └── com/cognizant/country_rest/
     │       ├── controller/CountryController.java
     │       ├── model/Country.java
     │       ├── service/CountryService.java
     │       └── CountryRestApplication.java
     └── resources/
         ├── application.properties
         └── country.xml
</pre>
🌐 Available APIs
1️⃣ GET /country
Fetches details for the country with code "IN" defined in the XML configuration.

Example: http://localhost:8087/country
Response:

json
{
  "code": "IN",
  "name": "India"
}
2️⃣ GET /countries/{code}
Returns a country by the provided code from the XML list (case-insensitive match).

Example: http://localhost:8087/countries/us
Response:

json

{
  "code": "US",
  "name": "United States"
}
🔧 XML Bean Setup (country.xml)
xml

<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
       http://www.springframework.org/schema/beans/spring-beans.xsd">

    <bean id="in" class="com.cognizant.country_rest.model.Country">
        <property name="code" value="IN"/>
        <property name="name" value="India"/>
    </bean>

    <bean id="countryList" class="java.util.ArrayList">
        <constructor-arg>
            <list>
                <bean class="com.cognizant.country_rest.model.Country">
                    <property name="code" value="IN"/>
                    <property name="name" value="India"/>
                </bean>
                <bean class="com.cognizant.country_rest.model.Country">
                    <property name="code" value="US"/>
                    <property name="name" value="United States"/>
                </bean>
                <bean class="com.cognizant.country_rest.model.Country">
                    <property name="code" value="CN"/>
                    <property name="name" value="China"/>
                </bean>
            </list>
        </constructor-arg>
    </bean>

</beans>
🧾 Key Controller Logic
java
// /country route
@RequestMapping("/country")
public Country getCountryIndia() {
    LOGGER.info("START - getCountryIndia()");
    ApplicationContext context = new ClassPathXmlApplicationContext("country.xml");
    Country country = (Country) context.getBean("in");
    LOGGER.info("END - getCountryIndia()");
    return country;
}

// /countries/{code} route
@GetMapping("/countries/{code}")
public Country getCountry(@PathVariable String code) {
    LOGGER.info("START - getCountry()");
    Country country = countryService.getCountry(code);
    LOGGER.info("END - getCountry()");
    return country;
}
⚙️ Working Mechanism
The /country endpoint directly fetches the "in" bean from XML.

The /countries/{code} endpoint retrieves a list of countries and filters based on the given code.

Since the controller uses @RestController, Spring automatically serializes the output to JSON using Jackson.

🚀 Run Instructions
Open the project in Eclipse or your preferred IDE.

Execute CountryRestApplication.java as a Java application.

Test the endpoints in a browser or API client:

http://localhost:8087/country

http://localhost:8087/countries/in

💡 Developer Pointers
✅ What happens in the controller?
/country: Initializes Spring context and retrieves the bean with ID "in".

/countries/{code}: Delegates to service to find matching country from the list.

✅ JSON Conversion?
Jackson is used internally by Spring Boot when returning objects from a @RestController.

✅ View HTTP Headers
Browser: F12 → Network → Select API call → View headers

Postman: After GET request, navigate to the Headers tab

⚠️ Notes
Ensure the port (e.g., 8087) matches the one in console output.

country.xml must be placed inside src/main/resources.

Service class should be marked with @Service and injected using @Autowired.

👨‍💻 Author
Midhun Manoj

