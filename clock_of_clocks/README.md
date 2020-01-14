# [![clock_of_clocks_logo][]][clock_of_clocks_website]

![clock_of_clocks_on_simulator][clock_of_clocks_on_simulator_link]

# Overview

> `clock_of_clocks` is a **clock face** project made with [Flutter](https://flutter.dev) for the [Flutter Clock Challenge][flutter_clock_challenge_website].

The project should be able to run on any **Flutter** supported platforms ( `iOS` , `Android` , `Web` , etc... ).\
Additionally, even though it was designed for the [Lenovo Smark Clock][lenovo_smart_clock_website] screen, it should adjust to most other screens.\
(But if it doesn't, feel free to file an issue 🤓).

## Main Features

* **Light** / **Dark** Themes.
* **12** / **24** Hour Modes.
* **(m)** Minute / **(h)** Hour / **(D)** Day / **(M)** Month - Progress.

## Install and Run

1. Clone project.

``` bash
git clone git@github.com:egorbelibov/clock_of_clocks.git
```

2. Make sure you **are on** and **have** the latest `stable` version of **Flutter** installed.

``` bash
flutter channel stable
flutter upgrade
```

3. Generate build folders for the platforms you want to run it.

``` bash
flutter create . 
```

4. Run it 😎.

``` bash
flutter run
```

5. Use sonic mode ⚡️ (**Optional**)

If you don't want to manually update your computer's time, in order to test the clock, revise the `state/clock_state.dart` -> `updateTime()` function to call `activateSonicMode()`.

## Digit Design

![clock_of_clocks_digits][clock_of_clocks_digits_link]

---

#### Designed & Developed with ❤️ by Egor Belibov.

---

[clock_of_clocks_logo]: https://github.com/egorbelibov/github_assets/blob/master/clock_of_clocks/images/clock_of_clocks_logo.png?raw=true
[clock_of_clocks_website]: https://clockofclocks.web.app

[flutter_clock_challenge_website]: https://flutter.dev/clock

[clock_of_clocks_on_simulator_link]: https://github.com/egorbelibov/github_assets/blob/master/clock_of_clocks/images/clock_of_clocks_on_simulator.png?raw=true

[lenovo_smart_clock_website]: https://www.lenovo.com/us/en/smart-clock

[clock_of_clocks_digits_link]: https://github.com/egorbelibov/github_assets/blob/master/clock_of_clocks/images/clock_of_clocks_digits.png?raw=true

