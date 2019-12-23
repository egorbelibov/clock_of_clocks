import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

import '../models/analog_clock_model.dart';
import '../models/clock_hand_model.dart';

/// Is responsible for initializing, updating and notifying
/// listening widgets about [analogClockData] changes.
class ClockState extends PropertyChangeNotifier<int> {
	final int amountOfClocks = 120;

	/// Holds the state of all the analog clocks
	final List<AnalogClockModel> analogClockData = [];

	ClockState() {
		initializeClockState();
	}

	/// Generate initial state data for [analogClockData].
	void initializeClockState() {
		for (var i = 0; i < amountOfClocks; i++) {
			analogClockData.add(
				AnalogClockModel(
					id: i,
					clockHands: [
						ClockHandModel(id: 0, angle: pi),
						ClockHandModel(id: 1, angle: pi / 2),
					],
				),
			);
		}
	}

	void updateSingleClock({
		@required int id,
		List<ClockHandModel> clockHands,
		bool notifyChanges = true,
	}) {
		assert(id != null);
		analogClockData[id] = AnalogClockModel(
			id: id,
			clockHands: clockHands,
		);
		notifyListeners(id);
	}

	void updateMultipleClocks({
		@required List<AnalogClockModel> clockData,
	}) {}

	void updateClockGroup({
		@required List<int> ids,
		List<ClockHandModel> clockHands,
		bool notifyChanges = true,
	}) {
		assert(ids != null);
	}
}
