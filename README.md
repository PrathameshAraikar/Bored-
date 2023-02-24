# BORED??

## Overview

BORED?? is a simple iOS app that generates random activities for users who are feeling bored. It makes use of the Bored API (https://www.boredapi.com/) to fetch activity suggestions based on the number of participants specified by the user.

## Usage

- Launch the app.
- Use the stepper to select the number of participants for the activity suggestion.
- Tap on the "GO!!" button to generate a random activity suggestion.
- The app will display the generated activity and its type.

## Code Overview

### DataModel
The DataModel struct defines the structure of the data fetched from the Bored API.

### DownloadData
The DownloadData class is an ObservableObject that fetches data from the Bored API using URLSession. It stores the fetched data in an array of DataModel objects and publishes the array using the @Published property wrapper.

### FinalView
The FinalView struct defines the main view of the app. It contains a DownloadData instance, a stepper for selecting the number of participants, and a button for generating the activity suggestion. It also contains two subviews: TitleView and BodyView.

### TitleView
The TitleView struct defines a view for displaying the title of a section.

### BodyView
The BodyView struct defines a view for displaying the body text of a section.

## Credits
This app was created by Prathamesh Araikar. The app makes use of the Bored API (https://www.boredapi.com/) to fetch activity suggestions.
