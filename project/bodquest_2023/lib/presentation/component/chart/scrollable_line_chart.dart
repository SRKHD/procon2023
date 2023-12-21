import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ScrollableLineChart<T> extends StatefulWidget {
  /// チャートに描画するデータのシリーズを指定します。
  final Iterable<T> dataSeries;

  /// データからチャート上のx座標を取得する関数を指定します。
  final double Function(T) fx;

  /// データからチャート上のy座標を取得する関数を指定します。
  final double Function(T) fy;

  /// データを文字列として出力するフォーマッタを指定します。
  final String Function(T)? dataFormatter;

  /// x座標の情報を文字列として出力するフォーマッタを指定します。
  final String Function(double)? xFormatter;

  /// 垂直方向のグリッドの表示間隔を指定します。Nullのとき、グリッドを表示しません。
  final double? verticalGridInterval;

  /// 初期状態のチャート表示範囲を指定します。
  final double? initialWindowWidth;

  /// 初期状態のチャート表示位置を指定します。
  final double? initialWindowCenter;

  /// チャート上のx座標の最小値を指定します。
  final double? minX;

  /// チャート上のx座標の最大値を指定します。
  final double? maxX;

  /// チャートの上部に設ける予約領域のサイズを指定します。
  final double marginTop;

  /// チャートの下部に設ける予約領域のサイズを指定します。
  final double marginBottom;

  /// スクロール可能なラインチャートを作成します。
  ///
  /// チャート上に表示するデータは、[dataSeries]として指定します。チャート上の座標は、
  /// [fx]および[fy]によって決定されます。例えば、下記サンプルはサイン関数を
  /// チャート上に表示します。
  ///
  /// ```dart
  /// ScrollableLineChart({
  ///   dataSeries: Iterable.generate(10).map((i) => 3.14 * i / 10),
  ///   fx: (d) => d,
  ///   fy: (d) => sin(d),
  /// })
  /// ```
  ///
  /// [minX]および[maxX]は、チャートとして表現するx座標の範囲を示します。この範囲は、
  /// [verticalGridInterval]で示されたグリッドで分割されます。
  ///
  /// [dataFormatter]および[xFormatter]は、それぞれデータおよびx座標を文字列に変換
  /// する任意の関数を指定します。[dataFormatter]の指定により、選択された座標の上部に
  /// その情報をポップアップ表示します。
  const ScrollableLineChart({
    required this.dataSeries,
    required this.fx,
    required this.fy,
    this.minX,
    this.maxX,
    this.verticalGridInterval,
    this.dataFormatter,
    this.xFormatter,
    this.initialWindowWidth,
    this.initialWindowCenter,
    this.marginTop = kMinInteractiveDimension / 2,
    this.marginBottom = kMinInteractiveDimension / 2,
  });

  @override
  State<ScrollableLineChart<T>> createState() => _ScrollableLineChartState<T>();
}

class _ScrollableLineChartState<T> extends State<ScrollableLineChart<T>> {
  late double _minX;
  late double _maxX;

  /// The scale factor of the window size limited in range [0.1, 1].
  num _windowScale = 1;

  /// The adjusted center of the window.
  late double _windowCenter;

  LineBarSpot? _selectedSpot;

  double get _windowWidth => (_maxX - _minX) / _windowScale;

  double get _verticalGridInterval {
    double standardInterval = widget.verticalGridInterval ?? 1;

    return max(1, (_windowWidth / 5 / standardInterval).ceil()) *
        standardInterval;
  }

  @override
  void initState() {
    setInitState();

    super.initState();
  }

  @override
  void didUpdateWidget(covariant ScrollableLineChart<T> oldWidget) {
    setInitState();

    super.didUpdateWidget(oldWidget);
  }

  void setInitState() {
    if (widget.dataSeries.isNotEmpty) {
      _minX =
          widget.minX ?? widget.dataSeries.map((d) => widget.fx(d)).reduce(min);
      _maxX =
          widget.maxX ?? widget.dataSeries.map((d) => widget.fx(d)).reduce(max);
    }

    _windowScale =
        ((_maxX - _minX) / (widget.initialWindowWidth ?? (_maxX - _minX)))
            .clamp(0.1, 1);

    _windowCenter = widget.initialWindowCenter ?? ((_minX + _maxX) / 2);
    _clampWindowCenter();
  }

  void _clampWindowCenter() {
    final currentHalfWidth = _windowWidth / 2;

    _windowCenter = _windowCenter.clamp(
      _minX + currentHalfWidth,
      _maxX - currentHalfWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onVerticalDragUpdate: (details) {
          setState(() {
            _windowScale *= pow(2, details.delta.dy / constraints.maxHeight);
            _windowScale = max(_windowScale, 1);
            _clampWindowCenter();
          });
        },
        onHorizontalDragUpdate: (details) {
          final scaleFactor = (_maxX - _minX) / constraints.maxWidth;
          setState(() {
            _windowCenter -= details.delta.dx * scaleFactor;
            _clampWindowCenter();
          });
        },
        child: LineChart(
          LineChartData(
            minX: max(_minX, _windowCenter - _windowWidth / 2),
            maxX: min(_maxX, _windowCenter + _windowWidth / 2),
            showingTooltipIndicators: [
              ShowingTooltipIndicators(
                  _selectedSpot == null ? [] : [_selectedSpot!])
            ],
            lineTouchData: LineTouchData(
              touchSpotThreshold: 20,
              handleBuiltInTouches: false,
              touchCallback: (e, res) {
                if (e is FlTapDownEvent) {
                  final target = res?.lineBarSpots?.firstOrNull;

                  if (target == null) return;

                  // Set or unset the selection.
                  setState(() {
                    if (target.spotIndex == _selectedSpot?.spotIndex) {
                      _selectedSpot = null;
                    } else {
                      _selectedSpot = target;
                    }
                  });
                }
              },
              getTouchedSpotIndicator: (data, indexes) {
                final painter = FlDotCirclePainter(
                  color: Theme.of(context).colorScheme.background,
                  radius: 6,
                  strokeWidth: 4,
                  strokeColor: Theme.of(context).colorScheme.primary,
                );

                final dotData = FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, data, i) => painter,
                );

                final indicatorData =
                    TouchedSpotIndicatorData(FlLine(strokeWidth: 0), dotData);

                return List.filled(indexes.length, indicatorData);
              },
              touchTooltipData: LineTouchTooltipData(
                fitInsideHorizontally: true,
                fitInsideVertically: true,
                tooltipBgColor: Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withAlpha(200),
                getTooltipItems: (spots) => [
                  ...spots.map(
                    (spot) {
                      if (widget.dataFormatter == null) {
                        return null;
                      }

                      return LineTooltipItem(
                          widget.dataFormatter!(
                              widget.dataSeries.elementAt(spot.spotIndex)),
                          TextStyle());
                    },
                  )
                ],
              ),
            ),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                showingIndicators:
                    _selectedSpot == null ? [] : [_selectedSpot!.spotIndex],
                spots: [
                  ...widget.dataSeries
                      .map((d) => FlSpot(widget.fx(d), widget.fy(d)))
                ],
                color: Theme.of(context).colorScheme.primary,
                barWidth: 4,
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.primary.withAlpha(0),
                    ],
                  ),
                ),
              ),
            ],
            gridData: FlGridData(
              drawHorizontalLine: false,
              drawVerticalLine: widget.verticalGridInterval != null,
              verticalInterval: _verticalGridInterval,
            ),
            titlesData: FlTitlesData(
              topTitles: AxisTitles(
                sideTitles: SideTitles(
                  reservedSize: widget.marginTop,
                  showTitles: true,
                  getTitlesWidget: (x, meta) => Text(""),
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  reservedSize: kMinInteractiveDimension / 2,
                  showTitles: true,
                  getTitlesWidget: (x, meta) => Text(""),
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  reservedSize: kMinInteractiveDimension / 2,
                  showTitles: true,
                  getTitlesWidget: (x, meta) => Text(""),
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  reservedSize: widget.marginBottom,
                  interval: _verticalGridInterval,
                  showTitles: widget.verticalGridInterval != null,
                  getTitlesWidget: (x, meta) {
                    // Except end points.
                    if (x == meta.min || x == meta.max) {
                      return Container();
                    }

                    return Text(widget.xFormatter?.call(x) ?? x.toString());
                  },
                ),
              ),
            ),
          ),
          duration: Duration(milliseconds: 0),
        ),
      ),
    );
  }
}
