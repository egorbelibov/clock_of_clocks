// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:clock_of_clocks/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:intl/intl.dart';

import 'containers/clock_mesh.dart';

class Clock extends StatefulWidget {
	final ClockModel model;

	const Clock(this.model);

	@override
	_ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
	var _now = DateTime.now();
	var _temperature = '';
	var _temperatureRange = '';
	var _condition = '';
	var _location = '';
	Timer _timer;

	@override
	void initState() {
		super.initState();
		widget.model.addListener(_updateModel);
		// Set the initial values.
		_updateTime();
		_updateModel();
	}

	@override
	void didUpdateWidget(Clock oldWidget) {
		super.didUpdateWidget(oldWidget);
		if (widget.model != oldWidget.model) {
			oldWidget.model.removeListener(_updateModel);
			widget.model.addListener(_updateModel);
		}
	}

	@override
	void dispose() {
		_timer?.cancel();
		widget.model.removeListener(_updateModel);
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		setPreferredOrientations();
		final time = DateFormat.Hms().format(DateTime.now());
		return Semantics.fromProperties(
			properties: SemanticsProperties(
				label: 'Digital clock with time $time',
				value: time,
			),
			child: Container(
				color: themeBasedColor(context, PaletteColor.backgroundColor),
				child: ClockMesh(),
			),
		);
	}

	void setPreferredOrientations() {
		// Set Preferred Orientations to Landscape
		SystemChrome.setPreferredOrientations([
			DeviceOrientation.landscapeLeft,
			DeviceOrientation.landscapeRight,
		]);
	}

	void _updateTime() {
		// setState(() {
		_now = DateTime.now();
		// Update once per second. Make sure to do it at the beginning of each
		// new second, so that the clock is accurate.
		_timer = Timer(
			Duration(seconds: 1) - Duration(milliseconds: _now.millisecond),
			_updateTime,
		);
		// });
	}

	void _updateModel() {
		setState(() {
			_temperature = widget.model.temperatureString;
			_temperatureRange = '(${widget.model.low} - ${widget.model.highString})';
			_condition = widget.model.weatherString;
			_location = widget.model.location;
		});
	}
}
