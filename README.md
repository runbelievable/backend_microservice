## About Runbelievable Microservice 
* Runbelievable microservice is a RESTful API used for finding hikes in your local area! 
* The microservice consumes the Google geocode API and the Hiking Project API to search for a randomized hike in your location

## Endpoints & Use
- 'https://run-be-microservice.herokuapp.com/recommend-hikes?location=YOUR LOCATION HERE'
- Utilize query parameters to search by location 

## Installation 
- To install Runbeleivable miroservice on your local machine follow these steps in your terminal: 
1. get API keys from both [Hiking Project](https://www.hikingproject.com/data) and [Google GeoCode API](https://developers.google.com/maps/documentation/geocoding/intro) and save them.
2. ``
git clone git@github.com:runbelievable/backend_microservice.git
``

3. ``
bundle 
``

4. Add your private API keys to Google geocode API and the Hiking Project API to a new file, run 
``
touch .env
``

5. In you .env file, paste in your keys as the values to ENV varibles as shown below:

``
apiKey: "YOUR HIKING PROJECT API KEY"
``

``
GoogleKey: "YOUR GOOGLE GEOCODE API KEY"
``

6. Run RSPEC test sweet and test connection
``
bundle exec rspec 
``
7. You are Ready to Rock and Roll!!
