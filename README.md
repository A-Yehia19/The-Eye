# The Eye

A parental control application with a dual interface for parents to control
the content of the children is based on multiple categories to select from
to avoid any sensitive or bad content for kids.

## Change Log

| Version | Description                                                                                               |
|---------|-----------------------------------------------------------------------------------------------------------|
| 0.1     | Login page completed                                                                                      |
| 0.2     | Signup page (1/2) completed                                                                               |
| 0.3     | video page in progress                                                                                    |
| 0.4     | video page done & added themes                                                                            |
| 0.5     | video player done                                                                                         |
| 0.5.1   | firebase added                                                                                            |
| 0.5.2   | Profile page completed                                                                                    |
| 0.6     | finalize first prototype                                                                                  |
| 0.7     | Creator home page and upload page created                                                                 |
| 0.8     | payment page created                                                                                      |
| 0.8.1   | merged everything                                                                                         |
| 0.9     | updated UI for signup and login<br/> modified profiles list                                               |
| 0.10    | updated app theme                                                                                         |
| 0.10.1  | google and email authentication is done                                                                   |
| 0.10.2  | some modifications in pages                                                                               |
| 0.10.3  | videos home page new theme applied                                                                        |
| 0.10.4  | videos steam new theme applied & changes classes into named params                                        |
| 0.11    | Start Page added                                                                                          |
| 0.12.0  | onboarding page completed                                                                                 |
| 0.12.1  | splash screen completed                                                                                   |
| 0.12.2  | fixed some color issues                                                                                   |
| 0.12.3  | applied add comment button to videos                                                                      |
| 0.13    | Updated profiles page, added animated background <br/>updated dialog box                                  |
| 0.13.1  | Updated classes structure                                                                                 |
| 0.14.0  | parent home created                                                                                       |
| 0.14.1  | Reconstructed creator pages                                                                               |
| 0.14.2  | finished parent control pages and child watch                                                             |
| 0.14.3  | combined the whole project                                                                                |
| 0.14.4  | updated some buttons functions                                                                            |
| 0.14.5  | added popup dialogs in parent and child pages                                                             |
| 0.15    | make video home dynamic from database                                                                     |
| 0.15.1  | make video steam recommendations and data dynamic from database                                           |
| 0.15.2  | make video information dynamic and handled comments through firebase                                      |
| 0.16    | profiles bubbles became dynamic with firebase <br/>adds children dynamically                              |
| 0.16.1  | bug fixed where app always opens on profiles page                                                         |
| 0.16.2  | adds parents, creators and children to firebase using class factories                                     |
| 0.16.3  | the pop ups in the parents page update in firebase <br/>updated the signup method for parent and creator  |
| 0.17    | link project with amplify and handled uploading videos to storage                                         |
| 0.17.1  | added popup to view uploading progress and fixed video aspect ratio                                       |
| 0.18    | fixed videos upload from database <br/>placeholders from network <br/>reduce user retrieval from database |
| 0.18.1  | fixed Video Card info <br/>validation of PIN of user <br/> added video description                        |
| 0.18.2  | fixed Video info updates (likes, dislikes, view, fav) <br/>update child data (history, likes, dislikes)   |

## Authors

- Abdullah Yehia [GitHub](https://github.com/A-Yehia19)
- Maraim Ali [GitHub](https://github.com/mariam2001)

## Todo List

for the whole app
- [x] Connect to firebase

to debug
- [x] Sessions aren't saved correctly is always opens on profiles page the parent even if a creator is currently logged in.
- [ ] make Google authentication work with both creator and parent.
- [ ] the back button shouldn't pop when there are no other pages in stack.
- [ ] delete video data in case of uploading error.

- [x] Start Page
- [x] Creator home page
  - [x] Replace videos in the list with uploads 
- [x] Creator upload page
  - [x] Add functionality to the upload button using firebase.
  - [x] Upload video to AWS S3
- [ ] Sign up page
  - [x] updated UI
  - [x] connect to firebase
  - [ ] handle responsiveness
- [x] profile page
  - [x] updated UI
  - [x] update dialog box with validation.
  - [x] connect to firebase
  - [x] handle responsiveness
- [ ] Log in page
  - [x] updated UI
  - [x] connect to firebase
  - [ ] handle responsiveness
- [ ] parents page
  - [x] updated UI
  - [ ] connect to firebase
  - [x] handle responsiveness
- [x] child's page
  - [x] updated UI
  - [x] connect to firebase
  - [x] handle responsiveness
- [x] payment page
- [x] Videos pages
  - [x] updated UI
  - [x] connect to firebase
  - [x] handle responsiveness
  - [x] make the interactions with the video works (likes, favorites, history)
- [x] profiles list page
  - [x] update page UI
  - [x] update pop up UI
  - [x] validate the PIN


- Splash screen added
- command to update:

```bash
dart run flutter_native_splash:create --path=lib/splash_screen.yaml
```

- command to remove

```bash
dart run flutter_native_splash:remove --path=lib/splash_screen.yaml
```
